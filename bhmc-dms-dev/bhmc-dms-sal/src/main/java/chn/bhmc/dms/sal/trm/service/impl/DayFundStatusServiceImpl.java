package chn.bhmc.dms.sal.trm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.*;

import org.apache.commons.lang3.*;
import org.jxls.common.*;
import org.springframework.context.i18n.*;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.sal.trm.service.DayFundStatusService;
import chn.bhmc.dms.sal.trm.service.dao.DayFundStatusDAO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusIFVO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusSearchVO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusVO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusViewVO;

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

@Service("dayFundStatusService")
public class DayFundStatusServiceImpl extends HService implements DayFundStatusService ,JxlsSupport{
 // ,JxlsSupport
    /**
     * 일자금현황 DAO 선언
     */
    @Resource(name="dayFundStatusDAO")
    DayFundStatusDAO dayFundStatusDAO;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;


    /**
     * 조회월의 마지막 일자를 구해옴
     */
    public int selectDayFundStatusLastDaySearch(DayFundStatusVO searchVO) throws Exception{
        return dayFundStatusDAO.selectDayFundStatusLastDaySearch(searchVO);
    }


    /**
     * 딜러자금현황의 일자 내역을 가져온다.
     */
    public List<DayFundStatusVO> selectDayFundStatusDaysByCondition(DayFundStatusVO searchVO) throws Exception{

        return dayFundStatusDAO.selectDayFundStatusDaysByCondition(searchVO);
    }

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

                DayFundStatusVO carInfoVO = dayFundStatusDAO.selectCarNameInfoSearch(nSearchVO);
                ifVo.setCarlineCd(carInfoVO.getCarlineCd());     // 차종코드
                ifVo.setCarlineNm(carInfoVO.getCarlineNm());   // 차종명
                ifVo.setModelCd(carInfoVO.getModelCd());
                ifVo.setModelNm(carInfoVO.getModelNm());   // 차관
                ifVo.setOcnCd(carInfoVO.getOcnCd());  // OCN
                ifVo.setOcnNm(carInfoVO.getOcnNm());  // OCN 명
                ifVo.setExtColorCd(carInfoVO.getExtColorCd());  // 외장색 코드
                ifVo.setExtColorNm(carInfoVO.getExtColorNm()); // 외장색 명
                ifVo.setIntColorCd(carInfoVO.getIntColorCd()); // 내장색 코드
                ifVo.setIntColorNm(carInfoVO.getIntColorNm());
                ifVo.setOrdTpCd(carInfoVO.getOrdTpCd());     // 오더 코드
                ifVo.setOrdTpNm(carInfoVO.getOrdTpNm());   // 오더명칭

                //liuxueying add  新增承兑汇票号展示 start
                Map<String,Object> map = dayFundStatusDAO.selectCarVinmBkwbSearch(ifVo.getDaloOrdNo(),searchVO.getsDlrCd());
                if(map != null){
                	ifVo.setVinmBkwb((String)map.get("VINMBKWB"));//承兑汇票号
                    ifVo.setVinNo((String)map.get("VINNO"));
                }
                //liuxueying add  新增承兑汇票号展示 end
                if(ifVo.getDaloMsrp() < 0){
                    ifVo.setDaloMsrp(ifVo.getDaloMsrp()*-1);      // 시장 지도가
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


    /**
     * 엑셀다운로드
     **/

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        DayFundStatusSearchVO searchVO = new DayFundStatusSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
         }

        DayFundStatusViewVO dayFundsStatusVo=  selectDayFundStatusByCondition(searchVO);  // 서브
        context.putVar("items", dayFundsStatusVo.getData());


    }

}
