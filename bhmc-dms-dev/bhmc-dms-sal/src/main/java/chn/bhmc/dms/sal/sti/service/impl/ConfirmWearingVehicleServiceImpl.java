package chn.bhmc.dms.sal.sti.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;
import chn.bhmc.dms.sal.orc.service.DlrOrderSearchService;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntVO;
import chn.bhmc.dms.sal.sti.service.ConfirmWearingVehicleService;
import chn.bhmc.dms.sal.sti.service.dao.ConfirmWearingVehicleDAO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehiclePopupVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSaveVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSearchVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ConfirmWearingVehicleServiceImpl
 * @Description : 완성차 입고확정
 * @author Bong
 * @since 2016. 3. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.14         Bong            최초 생성
 * </pre>
 */

@Service("confirmWearingVehicleService")
public class ConfirmWearingVehicleServiceImpl extends HService implements ConfirmWearingVehicleService, JxlsSupport{

    /**
     * 완성차 입고확정 DAO 선언
     */
    @Resource(name="confirmWearingVehicleDAO")
    ConfirmWearingVehicleDAO confirmWearingVehicleDAO;

    /**
     * 시승 차량 관리 서비스
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량정보
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * TODO 관리 서비스
     */
    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    // 新车到店提醒  贾明 2018-3-29 start
    @Resource(name="dlrOrderSearchService")
    DlrOrderSearchService dlrOrderSearchService;

    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;
    // 新车到店提醒  贾明 2018-3-29 end


    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<ConfirmWearingVehicleVO> selectConfirmWearingVehicleByCondition(ConfirmWearingVehicleSearchVO searchVO) throws Exception {
        return confirmWearingVehicleDAO.selectConfirmWearingVehicleByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectConfirmWearingVehicleByConditionCnt(ConfirmWearingVehicleSearchVO searchVO)  throws Exception {
        return confirmWearingVehicleDAO.selectConfirmWearingVehicleByConditionCnt(searchVO);
    }

    @Override
    public void updateConfirmWearingVehicle(ConfirmWearingVehicleVO vehicleVO, ConfirmWearingVehicleSaveVO saveVO) throws Exception {

        int contractNoCnt = confirmWearingVehicleDAO.selectContractCnt(vehicleVO.getVinNo());

        if(contractNoCnt > 0){
            throw processException("sal.err.contractSetVehicle");
        }

        //ConfirmWearingVehicleSaveVO obj;

        List<Map<String, Object>> camelList = new ArrayList<Map<String, Object>> ();

        Map<String, Object> message = null;
        int i = confirmWearingVehicleDAO.selectKmSeqSearch(LoginUtil.getDlrCd());

        //for(ConfirmWearingVehicleVO confirmWearingVehicleVO : obj.getUpdateList()){
            message    = new HashMap<String, Object>();
            message.put("KMTRDY", DateUtil.getDate("yyyyMMdd"));
            message.put("KMTRTM", DateUtil.getDate("HHmmss"));
            message.put("KMSEQ", lpad((i++)+"", "0", 6));
            if("60".equals(saveVO.getCarStatCd())){
                message.put("KMOPT", "I1");
            } else if("50".equals(saveVO.getCarStatCd())){
                message.put("KMOPT", "I2");
            } else{
                // {상태}을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.statNm", null, LocaleContextHolder.getLocale())});
            }
            message.put("KMDATE", DateUtil.getDate("yyyy-MM-dd"));
            message.put("KMDCDY", DateUtil.getDate("HH:mm:ss"));
            message.put("KMVIN", vehicleVO.getVinNo());
            message.put("KMUSER", LoginUtil.getDlrCd());
            camelList.add(message);
        //}

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL024");
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.addSendMessages(camelList);

        Data receiveData = camelClient.sendRequest();       // camel 호출

        if (!receiveData.getFooter().getIfResult().equals("Z")) {
            throw processException("sal.err.ifErrorMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }else{

            // 입고시, 해당 vin을 요청한 판매고문조회
            if("60".equals(saveVO.getCarStatCd())){
                ConfirmWearingVehicleSearchVO empSearchVO = new ConfirmWearingVehicleSearchVO();
                empSearchVO.setsVinNo(vehicleVO.getVinNo());
                empSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                String empNo = confirmWearingVehicleDAO.selectCarEmpNo(empSearchVO);
                if(StringUtils.isBlank(empNo)){
                    empNo = StringUtils.isBlank(vehicleVO.getRegUsrId())?LoginUtil.getUserId():vehicleVO.getRegUsrId();
                } //khskhs
                insertConfirmWearingVehicleTodo(empNo, vehicleVO.getVinNo());//khskhs
            }
        }

        if( saveVO.getPopupVO() != null){

            ConfirmWearingVehicleSearchVO searchVO = new ConfirmWearingVehicleSearchVO();
            searchVO.setsVinNo(vehicleVO.getVinNo());

            /*if( confirmWearingVehicleDAO.selectConfirmWearingVehiclePopup(searchVO).size() < 1 ){*/ //2017.06.04 재입고시에도 무조건 새로 평가결과 새로 입력한다로 변경
                String pattern = "yyyy-MM-dd HH:mm:ss";
                Date dlrEvlDt = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);

                saveVO.getPopupVO().setVinNo(vehicleVO.getVinNo());
                saveVO.getPopupVO().setRegUsrId(LoginUtil.getUserId());
                saveVO.getPopupVO().setUpdtUsrId(LoginUtil.getUserId());
                saveVO.getPopupVO().setDlrCd(LoginUtil.getDlrCd());
                saveVO.getPopupVO().setDlrEvalDt( dlrEvlDt );

                confirmWearingVehicleDAO.insertConfirmWearingVehicle(saveVO.getPopupVO());   // insert SA_0426T

                //프로시저 추가
                confirmWearingVehicleDAO.procDlrEvalResult(saveVO.getPopupVO());              // 딜러평가결과수신 IF
            /*}*/
        }

        vehicleVO.setUpdtUsrId(LoginUtil.getUserId());    //사용자
        vehicleVO.setCarStatCd(saveVO.getCarStatCd());    //입고 확정 및 확정 취소 값
        vehicleVO.setPrty(saveVO.getPrty());
        if(StringUtils.isEmpty(vehicleVO.getDlrCd())){
            vehicleVO.setDlrCd(LoginUtil.getDlrCd());
        }

        // 입고취소 : 일반차량을 시승차로 변경 후 차량을 입고 취소시.
        if("50".equals(saveVO.getCarStatCd())){
            ConfirmWearingVehicleSearchVO serchVO = new ConfirmWearingVehicleSearchVO();
            serchVO.setsDlrCd(vehicleVO.getDlrCd());
            serchVO.setsVinNo(vehicleVO.getVinNo());
            List<ConfirmWearingVehicleVO> list = confirmWearingVehicleDAO.selectConfirmWearingVehicleByCondition(serchVO);
            if(list != null && list.size() > 0){
                if("01".equals(list.get(0).getCmpCarDstinCd())){
                    TestDriveCarSearchVO tSearchVO = new TestDriveCarSearchVO();
                    tSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    tSearchVO.setsPltCd(LoginUtil.getPltCd());
                    tSearchVO.setsTdrvVinNo(list.get(0).getVinNo());
                    // crm에서 시승차 사용중인지 확인 후 삭제
                    if(!testDriveCarService.selectTdrvCarByKeyCnt(tSearchVO)){

                        // [예약] 된 [시승정보]가 있습니다.
                        throw processException("global.info.stInfo"
                                , new String[]{
                                        messageSource.getMessage("global.lbl.resv", null, LocaleContextHolder.getLocale())
                                        ,messageSource.getMessage("global.lbl.tdrvInfo", null, LocaleContextHolder.getLocale())
                                    }
                                );

                    }
                    testDriveCarService.deleteTestDriveCar(tSearchVO);
                }
            }
        }

        confirmWearingVehicleDAO.updateConfirmWearingVehicle(vehicleVO);    // update SA_0121T
        confirmWearingVehicleDAO.updateConfirmWearingVehicle2(vehicleVO);   // update SA_0416T

        /**
         * 시승차 (N7:주문유형) CRM 연동
         * 60 : 입고확정, 50 : 입고취소
         */
        if( "N7".equals(vehicleVO.getOrdTp()) ){
            if("60".equals(saveVO.getCarStatCd())){
                TestDriveCarVO tCarVO = new TestDriveCarVO();
                tCarVO.setDlrCd( LoginUtil.getDlrCd() );
                tCarVO.setPltCd( LoginUtil.getPltCd());
                tCarVO.setTdrvVinNo( vehicleVO.getVinNo() );
                tCarVO.setRegUsrId(LoginUtil.getUserId());
                tCarVO.setUseYn("Y");
                testDriveCarService.insertTdrvCar(tCarVO);
            }
            else if("50".equals(saveVO.getCarStatCd())){
                TestDriveCarSearchVO tSearchVO = new TestDriveCarSearchVO();
                tSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                tSearchVO.setsPltCd(LoginUtil.getPltCd());
                tSearchVO.setsTdrvVinNo(vehicleVO.getVinNo());

                if(!testDriveCarService.selectTdrvCarByKeyCnt(tSearchVO)){

                    // [예약] 된 [시승정보]가 있습니다.
                    throw processException("global.info.stInfo"
                            , new String[]{
                                    messageSource.getMessage("global.lbl.resv", null, LocaleContextHolder.getLocale())
                                    ,messageSource.getMessage("global.lbl.tdrvInfo", null, LocaleContextHolder.getLocale())
                                }
                            );
                }

                // crm에서 시승차 사용중인지 확인 후 삭제
                testDriveCarService.deleteTestDriveCar(tSearchVO);
            }
        }


        //프로시저 추가
        confirmWearingVehicleDAO.procDlrArrival(vehicleVO);                 // 딜러입고정보수신 IF
        confirmWearingVehicleDAO.procDlrArrival2(vehicleVO);                // 딜러인수보고수신 IF

        // 新车到店提醒  贾明 2018-3-29 start
        try{
            String ordNo = vehicleVO.getOrdNo();
            SumOrderCntSearchVO searchVO = new SumOrderCntSearchVO();
            searchVO.setsOrdSeq(ordNo);
            List<SumOrderCntVO> sumOrderCntList = dlrOrderSearchService.selectDlrOrderSearchsByCondition(searchVO);
            String saleRestId = "";
            String modelNm = "";//车种
            String carLineNm ="";//车款
            for(SumOrderCntVO suVO:sumOrderCntList){
            	saleRestId = suVO.getSaleRgstId();
            	modelNm =  suVO.getModelNm();
            	carLineNm = suVO.getCarlineNm();

            }
            if(null !=saleRestId ){
            	 List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
                 NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
                 targetVO.setUsrId(saleRestId);
                 targetVO.setUsrNm("");
                 targetVO.setMesgTmplTpList("P");
                 targetUsers.add(targetVO);
                 String sysCd = Constants.SYS_CD_DLR;
                 String alrtPolicyGrpId = "SER-0009";
                 String dlrCd = LoginUtil.getDlrCd();

                 NotificationMessageContext context = new NotificationMessageContext();
                 context.getVelocityContext().put("modelNm", modelNm);
                 context.getVelocityContext().put("carLineNm", carLineNm);
                 notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
            }
        }catch(Exception e){}
     // 新车到店提醒  贾明 2018-3-29 end


    }

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<ConfirmWearingVehiclePopupVO> selectConfirmWearingVehiclePopup(ConfirmWearingVehicleSearchVO searchVO) throws Exception {
        return confirmWearingVehicleDAO.selectConfirmWearingVehiclePopup(searchVO);
    }

    /**
     * 완성차 입고 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     */
    @Override
    public int retVehicleInfosByConditionCnt(ConfirmWearingVehicleSearchVO obj) throws Exception {
        ConfirmWearingVehicleSearchVO searchVO = new ConfirmWearingVehicleSearchVO();
        CarInfoSearchVO carSearchVO = new CarInfoSearchVO();
        List<CarInfoVO> carList = null;
        for(String code : obj.getBarcodeList()){
            carSearchVO.setBarCode(code);
            carList = carInfoService.selectBarcodeCarVinsByCondition(carSearchVO);
            if(carList != null && carList.size() > 0){
                for(CarInfoVO carVinVO : carList){
                    searchVO.getBarcodeList().add( carVinVO.getVinNo() );
                }
            }
        }

        if(searchVO.getBarcodeList().size() == 0){
            // msg : 바코드가 없습니다.
            //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("mob.lbl.barcode", null, LocaleContextHolder.getLocale())});
            throw processException("mob.sal.error.notDealerCar");
        }

        if(searchVO.getsDlrCd() == null || "".equals( searchVO.getsDlrCd() )){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return confirmWearingVehicleDAO.retVehicleInfosByConditionCnt(searchVO);
    }
    @Override
    public List<ConfirmWearingVehicleVO> retVehicleInfosByCondition(ConfirmWearingVehicleSearchVO objVO) throws Exception {
        ConfirmWearingVehicleSearchVO searchVO = new ConfirmWearingVehicleSearchVO();
        CarInfoSearchVO carSearchVO = new CarInfoSearchVO();
        List<CarInfoVO> carList = null;

        ArrayList<HashMap<String, String>> vinBarCodeList = new ArrayList<HashMap<String, String>>();
        HashMap<String, String> vinMap = null;

        for(String code : objVO.getBarcodeList()){

            carSearchVO.setBarCode(code);
            carList = carInfoService.selectBarcodeCarVinsByCondition(carSearchVO);
            if(carList != null && carList.size() > 0){
                for(CarInfoVO carVinVO : carList){
                    vinMap = new HashMap<String, String>();
                    vinMap.put(carVinVO.getVinNo(), code);              //  vin_no : 바코드

                    searchVO.getBarcodeList().add( carVinVO.getVinNo() );
                    vinBarCodeList.add(vinMap);
                }
            }

        }

        if(searchVO.getBarcodeList().size() == 0){
            // msg : 바코드가 없습니다.
            //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("mob.lbl.barcode", null, LocaleContextHolder.getLocale())});
            throw processException("mob.sal.error.notDealerCar");
        }

        if(searchVO.getsDlrCd() == null || "".equals( searchVO.getsDlrCd() )){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        List<ConfirmWearingVehicleVO> resultList = confirmWearingVehicleDAO.retVehicleInfosByCondition(searchVO);

        for(int i=0; i<resultList.size(); i++){
            String vinNo = resultList.get(i).getVinNo() != null ? resultList.get(i).getVinNo() : "";
            for(HashMap<String,String> obj : vinBarCodeList){
                if(obj.containsKey(vinNo)){
                    resultList.get(i).setBarcodeNo( (String)obj.get(vinNo) );
                }
            }
        }

        return resultList;
    }


    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ConfirmWearingVehicleSearchVO searchVO = new ConfirmWearingVehicleSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        if (params.get("sCarStatCd") != null && "60".equals(params.get("sCarStatCd")) ) {
            if (params.get("sGrDtStart") != null) {
                searchVO.setsGrDtStart(DateUtil.convertToDate((String)params.get("sGrDtStart")));
            }
            if (params.get("sGrDtEnd") != null) {
                searchVO.setsGrDtEnd(DateUtil.convertToDate((String)params.get("sGrDtEnd")));
            }
        }

        List<ConfirmWearingVehicleVO> list = selectConfirmWearingVehicleByCondition(searchVO);

        //주문유형 SAL138
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        HashMap<String, String> ordTpMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd)){
            ordTpMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }

        //자금유형구분
        HashMap<String, String> usedAmtTpMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL191", null, langCd)){
            usedAmtTpMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }

        //하치장 SAL211
        HashMap<String, String> carDumpCdMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL211", null, langCd)){
            carDumpCdMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }

        //차량상태 SAL001
        HashMap<String, String> carStatMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd)){
            carStatMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }

        for(ConfirmWearingVehicleVO vo : list){
            vo.setOrdTpNm(ordTpMap.get(vo.getOrdTp()));
            vo.setUsedAmtTpNm(usedAmtTpMap.get(vo.getUsedAmtTp()));
            vo.setCarDumpNm(carDumpCdMap.get(vo.getCarDumpCd()));
            vo.setCarStatNm(carStatMap.get(vo.getCarStatCd()));
        }

        context.putVar("items", list);
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
     * TODO를 등록한다.
     */
    public void insertConfirmWearingVehicleTodo(String userId, String vinNo) throws Exception {
        try {
            String todoMsg = messageSource.getMessage("sal.lbl.carComplete" , null , Locale.CHINA );
            TodoInfoVO todoInfoVO = new TodoInfoVO();
            todoInfoVO.setTodoPolicyId("TD-P-00011");   // CRM0201
            todoInfoVO.setTodoDesc("["+vinNo+"]"+todoMsg);
            //todoInfoVO.setActionParams("");
            todoInfoVO.setActionParams("leadStatCd=04");
            todoInfoVO.setRegUsrId(LoginUtil.getUserId());
            todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(userId));
            todoInfoService.insertTodoInfo(todoInfoVO);

        } catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }
}
