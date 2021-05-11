package chn.bhmc.dms.sal.stm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.stm.service.CorporateAvailabilityService;
import chn.bhmc.dms.sal.stm.service.dao.CorporateAvailabilityDAO;
import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilityIFVO;
import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilitySearchVO;
import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilityVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CorporateAvailabilityServiceImpl
 * @Description : 법인재고현황 Impl
 * @author Kim Jin Suk
 * @since 2016. 8. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 16.    Kim Jin Suk                최초 생성
 * </pre>
 */

@Service("corporateAvailabilityService")
public class CorporateAvailabilityServiceImpl extends HService implements CorporateAvailabilityService{
    //private Logger log = LoggerFactory.getLogger(Activator.class);

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 법인재고현황 DAO 선언
     */
    @Resource(name="corporateAvailabilityDAO")
    CorporateAvailabilityDAO corporateAvailabilityDAO;

    /**
     * 법인재고현황 내역을 조회한다.
     */
    @Override
    public List<CorporateAvailabilityVO> selectCorporateAvailabilityByCondition(CorporateAvailabilitySearchVO searchVO) throws Exception {

        Map<String, Object> message = new HashMap<String, Object>();

        message.put("STCK_CARL_CD", searchVO.getsCarlineCd());
        message.put("STCK_MODEL_CD", searchVO.getsModelCd());
        message.put("STCK_OCN_CD", searchVO.getsOcnCd());
        message.put("STCK_EXC_CD", searchVO.getsExtColorCd());
        message.put("STCK_INC_CD", searchVO.getsIntColorCd());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL051");
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        List<CorporateAvailabilityIFVO> results = null;
        List<CorporateAvailabilityVO> rList = null;

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            results = receiveData.readMessages(CorporateAvailabilityIFVO.class);

            rList = new ArrayList<CorporateAvailabilityVO>();
            CorporateAvailabilityVO resultVO = null;        // 결과VO
            CorporateAvailabilityVO sVO = null;

            for(int i=0; i<results.size(); i++){
                resultVO = new CorporateAvailabilityVO();
                resultVO.setCarlineCd(results.get(i).getStckCarlCd());
                resultVO.setModelCd(results.get(i).getStckModelCd());
                resultVO.setOcnCd(results.get(i).getStckOcnCd());
                resultVO.setExtColorCd(results.get(i).getStckExtCd());
                resultVO.setIntColorCd(results.get(i).getStckIncCd());
                resultVO.setLgOrt(results.get(i).getStckLocCd());
                resultVO.setKwmeng(results.get(i).getStckLocQty());
                resultVO.setUnit(results.get(i).getStckUnit());

                sVO = corporateAvailabilityDAO.selectCorporateAvailabilityCarNmSearch(resultVO);
                resultVO.setCarlineNm(sVO.getCarlineNm());
                resultVO.setModelNm(sVO.getModelNm());
                resultVO.setOcnNm(sVO.getOcnNm());
                resultVO.setExtColorNm(sVO.getExtColorNm());
                resultVO.setIntColorNm(sVO.getIntColorNm());
                resultVO.setMsPrc(sVO.getMsPrc());
                resultVO.setOrdGradeCd(sVO.getOrdGradeCd());
                resultVO.setFscpRegGrade(sVO.getFscpRegGrade());

                rList.add(resultVO);
            }

        } else {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }

        return rList;

    }

}
