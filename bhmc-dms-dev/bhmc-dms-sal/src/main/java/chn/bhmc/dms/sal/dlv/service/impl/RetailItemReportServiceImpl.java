package chn.bhmc.dms.sal.dlv.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.dlv.service.RetailItemReportService;
import chn.bhmc.dms.sal.dlv.service.dao.RetailItemReportDAO;
import chn.bhmc.dms.sal.dlv.vo.RetailItemReportSearchVO;
import chn.bhmc.dms.sal.dlv.vo.RetailItemReportVO;

/**
 * <pre>
 * 소매 명세 레포트
 * </pre>
 *
 * @ClassName   : RetailItemReportServiceImpl.java
 * @Description : 소매 명세 레포트
 * @author chibeom.song
 * @since 2016. 10. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.25.    chibeom.song     최초 생성
 * </pre>
 */
@Service("retailItemReportService")
public class RetailItemReportServiceImpl extends HService implements RetailItemReportService, JxlsSupport{

    /**
     * 소매 명세 레포트 DAO 선언
     */
    @Resource(name="retailItemReportDAO")
    RetailItemReportDAO retailItemReportDAO;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 조회 조건에 해당하는 소매 명세 레포트결과를 조회한다.
     */
    @Override
    public List<RetailItemReportVO> selectRetailItemReportByCondition(RetailItemReportSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<RetailItemReportVO> resultList = retailItemReportDAO.selectRetailItemReportByCondition(searchVO);

        //TODO[이승민] SAL174 인터페이스 개선필요 : 일괄전송 및 일괄 수신방식으로 변경 필요
        try{
/*            for (RetailItemReportVO eVO : resultList) {
                Map<String, Object> message = new HashMap<String, Object>();

                message.put("X2FVIN", eVO.getVinNo());
                //message.put("X2FVIN", "LBECFAHB0FZ276669");
                message.put("X2DELR", LoginUtil.getDlrCd());

                CamelClient camelClient = camelClientFactory.createCamelClient();
                camelClient.setIfId("SAL174");           // service id
                camelClient.setSender(LoginUtil.getDlrCd());
                camelClient.addSendMessage(message);

                Data receiveData = camelClient.sendRequest();

                List<RetailItemReportIfVO> resultIFList = null;

                if (receiveData.getFooter().getIfResult().equals("1")) {
                    resultIFList = receiveData.readMessages(RetailItemReportIfVO.class);

                    for(RetailItemReportIfVO ifVO : resultIFList){
                        if(!ifVO.getSpmon().equals("000000")){
                            eVO.setIncentiveMonth(ifVO.getSpmon().substring(0,4)+"-"+ifVO.getSpmon().substring(4,6));
                        }
                    }
                }
            }*/
        }catch(Exception e){
            log.error(e.getMessage(), e);
        }

        return resultList;
    }

    /**
     * 조회 조건에 해당하는 소매 명세 레포트결과 총 갯수를 조회한다.
     */
    @Override
    public int selectRetailItemReportByConditionCnt(RetailItemReportSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return retailItemReportDAO.selectRetailItemReportByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 소매 명세 레포트결과를 조회한다.
     */
    @Override
    public List<RetailItemReportVO> selectRetailItemLastReportByCondition(RetailItemReportSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<RetailItemReportVO> resultList = retailItemReportDAO.selectRetailItemLastReportByCondition(searchVO);
/*
        for (RetailItemReportVO eVO : resultList) {
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("X2FVIN", eVO.getVinNo());
            //message.put("X2FVIN", "LBECFAHB0FZ276669");
            message.put("X2DELR", LoginUtil.getDlrCd());

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("SAL174");           // service id
            camelClient.setSender(LoginUtil.getDlrCd());
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();

            List<RetailItemReportIfVO> resultIFList = null;

            if (receiveData.getFooter().getIfResult().equals("1")) {
                resultIFList = receiveData.readMessages(RetailItemReportIfVO.class);

                for(RetailItemReportIfVO ifVO : resultIFList){
                    if(!ifVO.getSpmon().equals("000000")){
                        eVO.setIncentiveMonth(ifVO.getSpmon().substring(0,4)+"-"+ifVO.getSpmon().substring(4,6));
                    }
                }
            }
        }*/

        return resultList;
    }

    /**
     * 조회 조건에 해당하는 소매 명세 레포트결과 총 갯수를 조회한다.
     */
    @Override
    public int selectRetailItemLastReportByConditionCnt(RetailItemReportSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return retailItemReportDAO.selectRetailItemLastReportByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 소매 명세 레포트결과를 조회한다.
     */
    @Override
    public List<RetailItemReportVO> selectRetailItemReportDetailCondition(RetailItemReportSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return retailItemReportDAO.selectRetailItemReportDetailCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 소매 명세 레포트결과 총 갯수를 조회한다.
     */
    @Override
    public int selectRetailItemReportDetailConditionCnt(RetailItemReportSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return retailItemReportDAO.selectRetailItemReportDetailConditionCnt(searchVO);
    }

    /**
     * 엑셀다운로드
     **/
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        RetailItemReportSearchVO searchVO = new RetailItemReportSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        //searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        if (StringUtils.isNotEmpty((String)params.get("sStartDt"))) {
            searchVO.setsStartDt(DateUtil.convertToDate((String)params.get("sStartDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sEndDt"))) {
            searchVO.setsEndDt(DateUtil.convertToDate((String)params.get("sEndDt")));
        }
        List<RetailItemReportVO> list = null;
        if(searchVO.getsRadioTp().equals("H")){
            list = selectRetailItemReportByCondition(searchVO);
        }else{
            list = selectRetailItemLastReportByCondition(searchVO);
        }
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        HashMap<String, String> optMap = new HashMap<String, String>();
        HashMap<String, String> ordTpMap = new HashMap<String, String>();
        HashMap<String, String> srchTpMap = new HashMap<String, String>();
        //是否COM020
        HashMap<String, String> ynMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd)){
            ynMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL187", null, langCd)){
            optMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd)){
            ordTpMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL214", null, langCd)){
            srchTpMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        for(RetailItemReportVO vo : list){
            vo.setKmopt(optMap.get(vo.getKmopt()));
            vo.setOrdTp(ordTpMap.get(vo.getOrdTp()));
            vo.setControlTp(srchTpMap.get(vo.getControlTp()));
            vo.setVinmRepayYn(ynMap.get(vo.getVinmRepayYn()));    //是否还款
        }
        context.putVar("items", list);
    }

}