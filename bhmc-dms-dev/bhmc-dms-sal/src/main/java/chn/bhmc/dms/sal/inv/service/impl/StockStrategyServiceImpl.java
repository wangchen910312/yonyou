package chn.bhmc.dms.sal.inv.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.dlv.service.dao.ContDeliveryMngDAO;
import chn.bhmc.dms.sal.dlv.service.dao.DeliveryMngDAO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliveryVO;
import chn.bhmc.dms.sal.inv.service.StockStrategyService;
import chn.bhmc.dms.sal.inv.service.dao.StockStrategyDAO;
import chn.bhmc.dms.sal.inv.vo.StockStrategySearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStrategyVO;

/**
 * @ClassName   : StockStrategyServiceImpl
 * @Description : 전략출고관리
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.11.24          최초 생성
 * </pre>
 */

@Service("stockStrategyService")
public class StockStrategyServiceImpl extends HService implements StockStrategyService, JxlsSupport{

    /**
     * 전략출고관리 DAO 선언
     */
    @Resource(name="stockStrategyDAO")
    StockStrategyDAO stockStrategyDAO;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 출고처리 서비스
     */
    @Resource(name="contDeliveryMngDAO")
    ContDeliveryMngDAO contDeliveryMngDAO;

    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="deliveryMngDAO")
    DeliveryMngDAO deliveryMngDAO;

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStrategySearchVO
     * @return
     */
    @Override
    public int selectStockStrategysByConditionCnt(StockStrategySearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return stockStrategyDAO.selectStockStrategysByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStrategySearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockStrategyVO> selectStockStrategysByCondition(StockStrategySearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return stockStrategyDAO.selectStockStrategysByCondition(searchVO);
    }

    /**
     * 전략출고 취소
     **/
    @Override
    public int cancelStockStrategy(BaseSaveVO<StockStrategyVO> saveVO) throws Exception{

        // 전략출고취소 마감확인
        DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();
        deadLineVO.setsCtrlGrpCd("Y");                      // 소매(전략출고취소 포함)
        deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());     // 딜러코드
        deadLineVO.setsCtrlTargCd("Y01");                   // 소매처리(전략출고취소 포함)
        if(deadlineCtrlMngService.selectOneShotCheck(deadLineVO) > 0){
            // [전략출고취소]는 마감되었습니다.
            //throw processException("sal.info.deadLineCheckMsg", new String[]{messageSource.getMessage("sal.btn.stockStrategyCancel", null, LocaleContextHolder.getLocale())});
            throw processException("sal.info.strategyCheckMsg");
        }

        for(StockStrategyVO updateVO : saveVO.getUpdateList()){
            updateVO.setRegUsrId( LoginUtil.getUserId() );
            updateVO.setUpdtUsrId( LoginUtil.getUserId() );
            if(StringUtils.isEmpty(updateVO.getDlrCd())){
                updateVO.setDlrCd(LoginUtil.getDlrCd());
                updateVO.setDlrNm(LoginUtil.getDlrNm());
            }

            updateVO.setStrYn("N");
            stockStrategyDAO.updateCarStrStat(updateVO);
            updateVO.setCaancReson("战略终端取消");     // 전략출고 취소사유
            updateVO.setStrStat("D");   // 전략출고 취소
            stockStrategyDAO.cancelStockStrategy(updateVO);

            // interface 프로시져 호출
            callStockStrategyCncl(updateVO);
        }

        return 1;
    }

    // DMS -> DCS 전략재고 취소신청
    private boolean callStockStrategyCncl(StockStrategyVO updateVO) throws Exception{

        ContDeliveryVO contDeliveryVO = new ContDeliveryVO();

        contDeliveryVO.setDlrCd(updateVO.getDlrCd());
        contDeliveryVO.setVinNo(updateVO.getVinNo());
        contDeliveryVO.setContractNo(updateVO.getContractNo());

        Map<String, Object> message = new HashMap<String, Object>();

        String dlvSltVal = updateVO.getOrdTp();
        String deliveryRetlTp = "";
        String deliveryCnclType = "";

        message.put("KMTRDY", DateUtil.getDate("yyyy-MM-dd"));
        message.put("KMTRTM", DateUtil.getDate("HH:mm:ss"));

        //차량입출고이력저장 및 인터페이스seq채번
        contDeliveryVO.setKmopt("J4");
        contDeliveryMngDAO.insertVehicleHist0301(contDeliveryVO);

        message.put("KMSEQ", lpad(contDeliveryVO.getKmseq()+"", "0", 6));
        message.put("KMOPT", "J4");
        message.put("KMSTDY", DateUtil.getDate("yyyy-MM-dd"));
        message.put("KMDCDY", DateUtil.getDate("HH:mm:ss"));

        /*주문타입으로 취소유형 셋팅*/
        if(dlvSltVal.equals("AD")){
            deliveryCnclType ="CA";
        }else if(dlvSltVal.equals("N1")){
            deliveryCnclType ="CC";
        }else if(dlvSltVal.equals("C6")||dlvSltVal.equals("C9")||dlvSltVal.equals("N4")||dlvSltVal.equals("C2")||dlvSltVal.equals("C8")){
            deliveryCnclType ="CF";
        }else if(dlvSltVal.equals("N3")||dlvSltVal.equals("NB")||dlvSltVal.equals("C7")||dlvSltVal.equals("N2")){
            deliveryCnclType ="CG";
        }else if(dlvSltVal.equals("AS")){
            deliveryCnclType ="CD";
        }else{
            deliveryCnclType ="CE";
        }

        message.put("KMCNCD", deliveryCnclType);
        message.put("KMVIN",  contDeliveryVO.getVinNo());
        message.put("KMDELR", LoginUtil.getDlrCd());
        message.put("KMCTCD", ""); //2급딜러코드
        message.put("KMRGNO", ""); //판매사원ID(필수)

        //승상구분가져오기
        String CarDstinCd = contDeliveryMngDAO.selectCarDstinCdCondition(contDeliveryVO);
        message.put("KMOTIT", CarDstinCd);
        message.put("KMCONT", ""); //계약번호(필수)
        message.put("KMSTDY2",""); //보증수리시작일

        /*주문타입으로 판매유형 셋팅*/
        if(dlvSltVal.equals("AD")||dlvSltVal.equals("AS")||dlvSltVal.equals("N1")||dlvSltVal.equals("N8")||dlvSltVal.equals("N9")){
            deliveryRetlTp = "P1";
        }else if(dlvSltVal.equals("C1")){
            deliveryRetlTp = "D1";
        }else if(dlvSltVal.equals("N5")||dlvSltVal.equals("NS")){
            deliveryRetlTp = "D2";
        }else if(dlvSltVal.equals("N7")){
            deliveryRetlTp = "D3";
        }else if(dlvSltVal.equals("C3")||dlvSltVal.equals("N6")){
            deliveryRetlTp = "D4";
        }else if(dlvSltVal.equals("C4")){
            deliveryRetlTp = "F1";
        }else if(dlvSltVal.equals("C6")||dlvSltVal.equals("C9")||dlvSltVal.equals("N3")||dlvSltVal.equals("NB")){
            deliveryRetlTp = "F2";
        }else if(dlvSltVal.equals("N4")){
            deliveryRetlTp = "F4";
        }else if(dlvSltVal.equals("C2")||dlvSltVal.equals("C7")||dlvSltVal.equals("C8")||dlvSltVal.equals("N2")){
            deliveryRetlTp = "F5";
        }else {
            deliveryRetlTp = "F1";
        }

        message.put("KMPROP", deliveryRetlTp);
        message.put("KMUSER", LoginUtil.getUserId());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL025");
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        if (receiveData.getFooter().getIfResult().equals("E")) {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }

        return true;
    }

    /**
     * LPAD 구현
     */
    private String lpad(String val, String pad, int length){
        if(val != null && val.length() > 0){
            while(val.length() < length){
                val = pad + val;
            }
        }
        return val;
    }
    
    /**
     * 출고관리 - 전략출고상태만 관리. (출고전용) 
     */
    public int stockStrategyStr(StockStrategyVO saveVO) throws Exception{
        return stockStrategyDAO.cancelStockStrategy(saveVO);
    }
    
    /**
     * 엑셀다운로드
     **/
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        StockStrategySearchVO searchVO = new StockStrategySearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        if (StringUtils.isNotEmpty((String)params.get("sStrAskStartDt"))) {
            searchVO.setsStrAskStartDt(DateUtil.convertToDate((String)params.get("sStrAskStartDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sStrAskEndDt"))) {
            searchVO.setsStrAskEndDt(DateUtil.convertToDate((String)params.get("sStrAskEndDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sStrConfirmStartDt"))) {
            searchVO.setsStrConfirmStartDt(DateUtil.convertToDate((String)params.get("sStrConfirmStartDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sStrConfirmEndDt"))) {
            searchVO.setsStrConfirmEndDt(DateUtil.convertToDate((String)params.get("sStrConfirmEndDt")));
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<StockStrategyVO> list = selectStockStrategysByCondition(searchVO);

        context.putVar("items", list);
    }
}