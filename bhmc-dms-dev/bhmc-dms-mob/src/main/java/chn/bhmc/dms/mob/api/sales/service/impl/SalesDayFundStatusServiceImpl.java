package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.mob.api.sales.dao.SalesDayFundStatusDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesDayFundStatusService;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusIFVO;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusVO;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusViewVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DayFundStatusServiceImpl
 * @Description : 일자금현황
 * @author
 * @since 2016. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("SalesDayFundStatusService")
public class SalesDayFundStatusServiceImpl extends HService implements SalesDayFundStatusService {

    /**
     * 일자금현황 DAO 선언
     */
    @Resource(name="SalesDayFundStatusDAO")
    SalesDayFundStatusDAO SalesDayFundStatusDAO;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;


 

    /**
     * 일 자금현황 내역을 조회.
     */
    public DayFundStatusViewVO selectDayFundStatusByCondition(DayFundStatusSearchVO searchVO) throws Exception{

        Map<String, Object> message = new HashMap<String, Object>();

        message.put("DALO_DLR_CD", searchVO.getsDlrCd());
        message.put("DALO_DATE", searchVO.getsYyMmDd());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL052");           // service id
        camelClient.setSender(searchVO.getsDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        List<DayFundStatusIFVO> resultIFList = null;
        DayFundStatusViewVO result = new DayFundStatusViewVO();

        if (!receiveData.getFooter().getIfResult().equals("E")) {
            resultIFList = receiveData.readMessages(DayFundStatusIFVO.class);

            // 인터페이스 차량명칭 조회
            for( DayFundStatusIFVO ifVo : resultIFList){
                DayFundStatusSearchVO nSearchVO = new DayFundStatusSearchVO();
                nSearchVO.setsModelCd(ifVo.getDaloModelCd());
                nSearchVO.setsOcnCd(ifVo.getDaloOcnCd());
                nSearchVO.setsExtColorCd(ifVo.getDaloExcCd());
                nSearchVO.setsIntColorCd(ifVo.getDaloIncCd());
                nSearchVO.setsOrdTpCd(ifVo.getDaloOrdTp());

                DayFundStatusVO carInfoVO = SalesDayFundStatusDAO.selectCarNameInfoSearch(nSearchVO);
                ifVo.setCarlineCd(carInfoVO.getCarlineCd());
                ifVo.setCarlineNm(carInfoVO.getCarlineNm());
                ifVo.setModelCd(carInfoVO.getModelCd());
                ifVo.setModelNm(carInfoVO.getModelNm());
                ifVo.setOcnCd(carInfoVO.getOcnCd());
                ifVo.setOcnNm(carInfoVO.getOcnNm());
                ifVo.setExtColorCd(carInfoVO.getExtColorCd());
                ifVo.setExtColorNm(carInfoVO.getExtColorNm());
                ifVo.setIntColorCd(carInfoVO.getIntColorCd());
                ifVo.setIntColorNm(carInfoVO.getIntColorNm());
                ifVo.setOrdTpCd(carInfoVO.getOrdTpCd());
                ifVo.setOrdTpNm(carInfoVO.getOrdTpNm());

                if(ifVo.getDaloMsrp() < 0){
                    ifVo.setDaloMsrp(ifVo.getDaloMsrp()*-1);
                }

                ifVo.setOrdQty(1);
            }
            result.setData(resultIFList);
            result.setTotal(resultIFList.size());
        }else{
            //throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            result.setErrorMsg(receiveData.getFooter().getIfFailMsg());
        }

        return result;
    }

}
