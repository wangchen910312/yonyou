package chn.bhmc.dms.ser.ro.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.cmm.service.dao.ServicePartDAO;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.LbrSuggestVO;
import chn.bhmc.dms.ser.cmm.vo.RepairOrderIfVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.dao.*;
import chn.bhmc.dms.ser.ro.vo.RepairCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSaveVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.ro.vo.SpecialVO;
import chn.bhmc.dms.ser.svi.service.BayCalendarService;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderServiceImpl.java
 * @Description : RO ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("repairOrderService")
public class RepairOrderServiceImpl extends HService implements RepairOrderService, JxlsSupport {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="servicePartDAO")
    ServicePartDAO servicePartDAO;

    /**
     * 예약접수 DAO
     */
    @Resource(name="repairOrderDAO")
    RepairOrderDAO repairOrderDAO;

    /**
     * 배정(품질검사)상태 DAO
     */
    @Resource(name="workAssignStatDAO")
    WorkAssignStatDAO workAssignStatDAO;

    /**
     * Bay캘린더 Service
     */
    @Resource(name="bayCalendarService")
    BayCalendarService bayCalendarService;

    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     * 부품공통 Service
     */
    @Resource(name="servicePartService")
    ServicePartService servicePartService;

    /**
     * 공임공통 Service
     */
    @Resource(name="serviceLaborService")
    ServiceLaborService serviceLaborService;

    @Resource(name="roDocNoIdGenService")
    TableIdGenService roDocNoIdGenService;

    @Resource(name="roGrpNoIdGenService")
    TableIdGenService roGrpNoIdGenService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 차량마스터 서비스
     */
    @Autowired
    VehicleMasterService vehicleMasterService;

    /**
    *
    */
   @Autowired
   VehOfCustInfoService vehOfCustInfoService;

   @Autowired
   ReservationReceiptService reservationReceiptService;

   @Resource(name="commonCodeService")
   CommonCodeService commonCodeService;

   /**
    * 메세지 알림 서비스
    */
   @Autowired
   NotificationMessageService notificationMessageService;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectRepairOrderByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return repairOrderDAO.selectRepairOrderByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectRepairOrderByCondition(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        List<RepairOrderVO> resvList = repairOrderDAO.selectRepairOrderByCondition(searchVO);


        return resvList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectRepairOrderListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return repairOrderDAO.selectRepairOrderListByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectRepairOrderListByCondition(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<RepairOrderVO> resvList = repairOrderDAO.selectRepairOrderListByCondition(searchVO);


        return resvList;
    }

    /**
     * 조회 조건에 해당하는 RO 정보 현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderInfoListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception{


        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return repairOrderDAO.selectRepairOrderInfoListByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 RO정보 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderInfoListByCondition(RepairOrderSearchVO searchVO) throws Exception{


        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<RepairOrderVO> resvList = repairOrderDAO.selectRepairOrderInfoListByCondition(searchVO);


        return resvList;

    }

    /*
     * {@inheritDoc}
     */
    public List<RepairOrderVO> selectRepairOrdersHistory(RepairOrderSearchVO searchVO) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String pattern = dateFormat + " HH:mm:ss";

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        List<RepairOrderVO> roList = new ArrayList<RepairOrderVO>();
        List<RepairOrderIfVO> roIfList = new ArrayList<RepairOrderIfVO>();

        if(searchVO.getsSearchGubun().equals("MD")){

            roList = repairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);

        } else if(searchVO.getsSearchGubun().equals("OD")){
            //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("VIN_NO", searchVO.getsVinNo());
            message.put("RO_START_DT", DateUtil.getDate(searchVO.getsRoFromDt(),pattern));
            message.put("RO_END_DT", DateUtil.getDate(searchVO.getsRoToDt(),pattern));
            message.put("RO_DOC_NO", searchVO.getsRoDocNo());
            message.put("LBR_NM", searchVO.getsLbrNm());
            message.put("CAR_REG_NO", searchVO.getsCarRegNo());
            message.put("DRIVER_NM", searchVO.getsDriverNm());
            message.put("RO_TP", searchVO.getsRoTp());
            message.put("ITEM_NM", searchVO.getsItemNm());

            Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER055");

            if (receiveData.getFooter().getIfResult().equals("Z")) {
                roIfList = receiveData.readMessages(RepairOrderIfVO.class);
                RepairOrderVO roVO = new RepairOrderVO();

                for(int i = 0 ; i <  roIfList.size() ; i++){
                    roVO = new RepairOrderVO();

                    if(!roIfList.get(i).getDlrCd().equals(LoginUtil.getDlrCd())){
                        roVO.setDlrCd(roIfList.get(i).getDlrCd());
                        roVO.setRoDocNo(roIfList.get(i).getRoDocNo());
                        roVO.setRoTpNm(roIfList.get(i).getRoTpNm());
                        roVO.setVinNo(roIfList.get(i).getVinNo());
                        roVO.setCarRegNo(roIfList.get(i).getCarRegNo());
                        roVO.setCarOwnerId(roIfList.get(i).getCarOwnerId());
                        roVO.setCarOwnerNm(roIfList.get(i).getCarOwnerNm());
                        roVO.setDriverId(roIfList.get(i).getDriverId());
                        roVO.setDriverNm(roIfList.get(i).getDriverNm());
                        roVO.setRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getRunDistVal(), "0")));
                        roVO.setLastRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getLastRunDistVal(), "0")));
                        roVO.setBaseRoNo(roIfList.get(i).getBaseRoNo());
                        roVO.setRoStatCd(roIfList.get(i).getRoStatCd());
                        roVO.setRoStatNm(roIfList.get(i).getRoStatNm());
                        roVO.setRoDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoDt() ,pattern));
                        roVO.setRoGrpNo(roIfList.get(i).getRoGrpNo());
                        roVO.setRoStartDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoStartDt() ,pattern));
                        roVO.setRoEndDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoEndDt() ,pattern));
                        roVO.setCarlineNm(roIfList.get(i).getCarlineNm());
                        roVO.setModelNm(roIfList.get(i).getModelNm());
                        roVO.setRegUsrNm(roIfList.get(i).getRegUsrNm());
                        roVO.setUpdtDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoUpdtDt(),pattern));
                        roVO.setCalcDocNo(roIfList.get(i).getCalcDocNo());
                        roVO.setCalcRegDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcRegDt()));
                        roVO.setPaymYnNm(roIfList.get(i).getPaymYnNm());
                        roVO.setCalcCompUsrNm(roIfList.get(i).getCalcCompUsrNm());
                        roVO.setRoPrintDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoPrintDt()));
                        roVO.setCalcPrsnNm(roIfList.get(i).getCalcPrsnNm());
                        roVO.setCalcDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcDt()));
                        roVO.setSearchGubun("OD");

                        roList.add(roVO);
                    }
                }

            } else {
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }
        } else if(searchVO.getsSearchGubun().equals("AD")) {

            Date realRoFromDt = searchVO.getsRoFromDt();
            Date realRoToDt = searchVO.getsRoFromDt();

            Date today = new Date();
            String strDate = DateUtil.convertToDateTimeString(today);
            searchVO.setsRoFromDt(DateUtil.convertToDate(strDate, dateFormat));
            searchVO.setsRoToDt(DateUtil.convertToDate(strDate, dateFormat));

            roList = repairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);

            //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("VIN_NO", searchVO.getsVinNo());
            message.put("RO_START_DT", DateUtil.getDate(realRoFromDt,pattern));
            message.put("RO_END_DT", DateUtil.getDate(realRoToDt,pattern));
            message.put("RO_DOC_NO", searchVO.getsRoDocNo());
            message.put("LBR_NM", searchVO.getsLbrNm());
            message.put("CAR_REG_NO", searchVO.getsCarRegNo());
            message.put("DRIVER_NM", searchVO.getsDriverNm());
            message.put("RO_TP", searchVO.getsRoTp());
            message.put("ITEM_NM", searchVO.getsItemNm());

            Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER055");

            if (receiveData.getFooter().getIfResult().equals("Z")) {
                roIfList = receiveData.readMessages(RepairOrderIfVO.class);
                RepairOrderVO roVO = new RepairOrderVO();

                for(int i = 0 ; i <  roIfList.size() ; i++){
                    roVO = new RepairOrderVO();

                    roVO.setDlrCd(roIfList.get(i).getDlrCd());
                    roVO.setRoDocNo(roIfList.get(i).getRoDocNo());
                    roVO.setRoTpNm(roIfList.get(i).getRoTpNm());
                    roVO.setVinNo(roIfList.get(i).getVinNo());
                    roVO.setCarRegNo(roIfList.get(i).getCarRegNo());
                    roVO.setCarOwnerId(roIfList.get(i).getCarOwnerId());
                    roVO.setCarOwnerNm(roIfList.get(i).getCarOwnerNm());
                    roVO.setDriverId(roIfList.get(i).getDriverId());
                    roVO.setDriverNm(roIfList.get(i).getDriverNm());
                    roVO.setRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getRunDistVal(), "0")));
                    roVO.setLastRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getLastRunDistVal(), "0")));
                    roVO.setBaseRoNo(roIfList.get(i).getBaseRoNo());
                    roVO.setRoStatCd(roIfList.get(i).getRoStatCd());
                    roVO.setRoStatNm(roIfList.get(i).getRoStatNm());
                    roVO.setRoDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoDt(), pattern));
                    roVO.setRoGrpNo(roIfList.get(i).getRoGrpNo());
                    roVO.setRoStartDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoStartDt(), pattern));
                    roVO.setRoEndDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoEndDt(), pattern));
                    roVO.setCarlineNm(roIfList.get(i).getCarlineNm());
                    roVO.setModelNm(roIfList.get(i).getModelNm());
                    roVO.setRegUsrNm(roIfList.get(i).getRegUsrNm());
                    roVO.setUpdtDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoUpdtDt(),pattern));
                    roVO.setCalcDocNo(roIfList.get(i).getCalcDocNo());
                    roVO.setCalcRegDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcRegDt()));
                    roVO.setPaymYnNm(roIfList.get(i).getPaymYnNm());
                    roVO.setCalcCompUsrNm(roIfList.get(i).getCalcCompUsrNm());
                    roVO.setRoPrintDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoPrintDt()));
                    roVO.setCalcPrsnNm(roIfList.get(i).getCalcPrsnNm());
                    roVO.setCalcDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcDt()));
                    if(!roIfList.get(i).getDlrCd().equals(LoginUtil.getDlrCd())){
                        roVO.setSearchGubun("OD");
                    }
                    roList.add(roVO);
                }
            } else {
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }

        }

        return roList;
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public String multiRepairOrder(RepairOrderSaveVO repairOrderSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        RepairOrderVO roVO = repairOrderSaveVO.getRepairOrderVO();
        String roDocNo = StringUtils.defaultString(roVO.getRoDocNo(), "");
        String roGrpNo = roVO.getRoGrpNo();
        String pastRoTp = "";
        roVO.setDlrCd(dlrCd);
        int rodocCnt = 0;
      
        //是否需要发送app校验保修索赔 start
        String custConfirmYn = repairOrderSaveVO.getCustConfirmYn();
        if(null != custConfirmYn && !"".equals(custConfirmYn)) {
        	roVO.setCustConfirmYn(custConfirmYn);
        }else {
        	roVO.setCustConfirmYn("N");
        }
        //是否需要发送app校验保修索赔 end
        if(!StringUtil.isEmpty(roDocNo)) {
            roVO.setUpdtUsrId(userId);
            RepairOrderSearchVO searchVO = new RepairOrderSearchVO();
            searchVO.setsDlrCd(dlrCd);
            searchVO.setsRoDocNo(roDocNo);
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

            RepairOrderVO repairOrderVO = repairOrderDAO.selectRepairOrderByKey(searchVO);
            pastRoTp = repairOrderVO.getRoTp();

            roVO.setRoStatCd(repairOrderVO.getRoStatCd());
            roVO.setAllocStatCd(repairOrderVO.getAllocStatCd());
            roVO.setItemReqStatCd(repairOrderVO.getItemReqStatCd());

            if(!repairOrderVO.getRoStatCd().equals("01") && !repairOrderVO.getRoStatCd().equals("02")){
                CommonCodeVO codeVO = commonCodeService.selectCommonCodeByKey("SER030", repairOrderVO.getRoStatCd());
                String[] lblList = new String[3];
                lblList[0] = repairOrderVO.getRoDocNo();
                lblList[1] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[2] = codeVO.getCmmCdNm();
                throw processException("ser.info.impos", lblList);
            }

            TabInfoSearchVO laborSearchVO = new TabInfoSearchVO();
            laborSearchVO.setsDlrCd(dlrCd);
            laborSearchVO.setsDocNo(roDocNo);
            laborSearchVO.setsPreFixId(roVO.getPreFixId());

            int lbrCdCnt=0;
            StringBuffer lbrSb = new StringBuffer("");
            for(ServiceLaborVO laborVO : repairOrderSaveVO.getServiceLaborListVO()){
                if(lbrCdCnt == 0 ) {
                   lbrSb.append(laborVO.getLbrCd());
               }else {
                   lbrSb.append(",");
                   lbrSb.append(laborVO.getLbrCd());
               }
                lbrCdCnt++;
            }

            laborSearchVO.setsLbrCd(lbrSb.toString());
            List<ServiceLaborVO> ServiceLaborListVO = serviceLaborService.selectRoChkWorkStatByCondition(laborSearchVO);

            if(!repairOrderVO.getRoStatCd().equals("01")){

                if(ServiceLaborListVO.size() > 0) {
                    // 공임이 추가됐을 경우
                    for(ServiceLaborVO laborVO : repairOrderSaveVO.getServiceLaborListVO()){

                        if(StringUtils.defaultString(repairOrderVO.getQtTestMthCd(), "").equals("01")){
                            if(!(StringUtils.defaultString(repairOrderVO.getQtTestStatCd(), "")).equals("Q5") && !StringUtil.isEmpty(repairOrderVO.getQtTestStatCd())){
                                CommonCodeVO codeVO = commonCodeService.selectCommonCodeByKey("SER052", repairOrderVO.getQtTestStatCd());
                                String[] lblList = new String[3];
                                lblList[0] = repairOrderVO.getRoDocNo();
                                lblList[1] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                                lblList[2] = codeVO.getCmmCdNm();
                                throw processException("ser.info.impos", lblList);
                            }
                        }

                        if(StringUtil.isEmpty(laborVO.getAllocStatCd())){
                            if(repairOrderVO.getRoStatCd().equals("03")){//정산대기
                                CommonCodeVO codeVO = commonCodeService.selectCommonCodeByKey("SER030", repairOrderVO.getRoStatCd());
                                String[] lblList = new String[3];
                                lblList[0] = repairOrderVO.getRoDocNo();
                                lblList[1] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                                lblList[2] = codeVO.getCmmCdNm();
                                throw processException("ser.info.impos", lblList);
                            }

                            roVO.setAllocStatCd("02"); //부분배정

                        } else {

                            //공임 삭제시 작업 진도 및 배분 상태 비교 (진도 (wrkStatCd): 02 , 05 삭제 불가)
                            for(ServiceLaborVO serviceLaborVO : ServiceLaborListVO){
                                if(!StringUtil.isEmpty(serviceLaborVO.getAllocStatCd())){
                                    // 정비 진도 시작 , 완료 : 공임 삭제 불가
                                    if(StringUtils.defaultString(serviceLaborVO.getWrkStatCd(), "").equals("02") || StringUtils.defaultString(serviceLaborVO.getWrkStatCd(), "").equals("05")){
                                         String[] msgList = new String[1];
                                         msgList[0] = serviceLaborVO.getLbrCd();
                                         throw processException("ser.info.notDelLbrCd", msgList);
                                    }else{
                                        serviceLaborService.deleteLaborWorkAssign(serviceLaborVO);
                                        //serviceLaborService.deleteLaborWorkProcess(serviceLaborVO);
                                    }
                                }
                            }

                            String allocStatCd = "03"; // 배정완료
                            if(StringUtils.defaultString(laborVO.getAllocStatCd(), "").equals("02")){
                                allocStatCd = "02";
                                break;
                            }
                            roVO.setAllocStatCd(allocStatCd);
                            roVO.setWrkStatCd(repairOrderVO.getWrkStatCd());
                            roVO.setQtTestStatCd(repairOrderVO.getQtTestStatCd());
                        }
                    }

                    // 작업진도 상태(작업취소후 공임 삭제시 상태값이 변경되지 않아서 추가)
                    String wrkStatCd = "05";    // 05:정비완료, 01:정비대기
                    for(ServiceLaborVO laborVO : repairOrderSaveVO.getServiceLaborListVO()){
                        if(!StringUtils.defaultString(laborVO.getWrkStatCd(), "").equals("05")){
                            wrkStatCd = "01";
                            break;
                        }
                    }
                    roVO.setWrkStatCd(wrkStatCd);
                    roVO.setRoStatCd(repairOrderVO.getRoStatCd());
                }
            }

            //세차 불필요가 아닌경우 세차 대기 상태로.
            if(!StringUtil.nullConvert(repairOrderVO.getCarWashTp()).equals("04")){
                if(StringUtil.isEmpty(repairOrderVO.getCarWashStatCd())){
                    roVO.setCarWashStatCd("W4");
                }
            }

            //품질검사 변경시
            if(!StringUtil.nullConvert(repairOrderVO.getQtTestMthCd()).equals(StringUtil.nullConvert(roVO.getQtTestMthCd()))){
                //품질검사 시작시 변경불가
                if(StringUtil.nullConvert(repairOrderVO.getWrkStatCd()).equals("05")
                        && !StringUtil.nullConvert(repairOrderVO.getQtTestStatCd()).equals("Q5")
                        && !StringUtil.isEmpty(repairOrderVO.getQtTestStatCd())){
                    CommonCodeVO codeVO = commonCodeService.selectCommonCodeByKey("SER052", repairOrderVO.getQtTestStatCd());
                    String[] lblList = new String[3];
                    lblList[0] = repairOrderVO.getRoDocNo();
                    lblList[1] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                    lblList[2] = codeVO.getCmmCdNm();
                    throw processException("ser.info.impos", lblList);
                }

                //QtTestMthCd   01:품질검사, 02:테크니션검사
                if(StringUtil.nullConvert(repairOrderVO.getQtTestMthCd()).equals("01")){//품질->테크니션
                    roVO.setQtTestStatCd("");
                    workAssignStatDAO.updateWorkAssign(roVO);
                    if(StringUtil.isEmpty(repairOrderVO.getDlStatCd())){
                        roVO.setDlStatCd("01");
                    }
                }else{//테크니션->품질
                    if(StringUtil.nullConvert(repairOrderVO.getWrkStatCd()).equals("05")){
                        roVO.setQtTestStatCd("Q5");
                        workAssignStatDAO.updateWorkAssign(roVO);
                    }
                }
            }
          //20200731 updateby tjx 确认工单后关联预约单可将预约单状态改为"完成" start

            if(!StringUtil.isEmpty(roVO.getResvDocNo())){
                //20201029 update by TJX 维修委托验证是否存在预约单 start
            	//查询预约单状态
            	String resvStatCd = repairOrderDAO.selectResvDocNoInfoByKey(roVO);
            	//存在则判断是否是确认状态CM_0304T SER011;
            	if(!StringUtils.defaultIfEmpty(repairOrderVO.getResvDocNo(),"").equals(roVO.getResvDocNo()) && !"O".equals(resvStatCd)) {
            		throw processException("ser.err.resvStatCd");
            	}
                //20201029 update by TJX 维修委托验证是否存在预约单 end
            	
                ReservationReceiptVO reservationReceiptVO = new ReservationReceiptVO();
                reservationReceiptVO.setResvStatCd("F");
                reservationReceiptVO.setResvDocNo(roVO.getResvDocNo());
                reservationReceiptVO.setDlrCd(dlrCd);
                reservationReceiptService.updateReservationReceipt(reservationReceiptVO);
                
                //20201111 update by TJX 将修改前关联的预约单号状态调整为"预约确认"
                if(null != repairOrderVO.getResvDocNo()) {
                	if(!repairOrderVO.getResvDocNo().equals(roVO.getResvDocNo())) {
                	repairOrderDAO.updateResvDocNoInfoByKey(repairOrderVO);
                	}
                }
            }
          //20200731 updateby tjx 确认工单后关联预约单可将预约单状态改为"完成" end
            
            repairOrderDAO.updateRepairOrder(roVO);

        } else {
        	//20201029 update by TJX 维修委托验证是否存在预约单 start
            if(!StringUtil.isEmpty(roVO.getResvDocNo())) {
            	//存在一条或多条关联了预约单的工单,再开的工单不能关联预约单
        		rodocCnt = repairOrderDAO.selectRodocInfoCnt(roVO);
        		if(rodocCnt != 0) {
        			roVO.setResvDocNo("");
        		}
	        	//查询预约单状态
	        	String resvStatCd = repairOrderDAO.selectResvDocNoInfoByKey(roVO);
	        	//存在则判断是否是确认状态CM_0304T SER011;
	        	if(!"O".equals(resvStatCd) && rodocCnt == 0) {
	        		throw processException("ser.err.resvStatCd");
	        	}
            	
            }
            //20201029 update by TJX 维修委托验证是否存在预约单 end

            // RO 번호 생성
            if(StringUtil.isEmpty(roGrpNo)){
                /**
                 * RO그룹번호(키생성)
                 */
                roGrpNo = roGrpNoIdGenService.getNextStringId();
            }

            roDocNo = roDocNoIdGenService.getNextStringId();

            roVO.setRegUsrId(userId);
            roVO.setUpdtUsrId(userId);
            roVO.setSaId(userId);
            roVO.setSaNm(LoginUtil.getUserNm());
            roVO.setRoDocNo(roDocNo);
            roVO.setRoGrpNo(roGrpNo);

            //세차 불필요가 아닌경우 세차 대기 상태로.
            if(!StringUtil.nullConvert(roVO.getCarWashTp()).equals("04")){
                roVO.setCarWashStatCd("W4");
            }

            //처음수리여부 판단
            int firstRoCnt = repairOrderDAO.selectFirstRoYnCnt(roVO);

            if(firstRoCnt > 0){
                roVO.setFirstRoYn("N");
            } else {
                roVO.setFirstRoYn("Y");
            }

            repairOrderDAO.insertRepairOrder(roVO);

            //사전점검 상태 업데이트
            if(!StringUtil.isEmpty(roVO.getDiagDocNo())){
                roVO.setDiagStatCd("O");
                repairOrderDAO.updatePreCheckStat(roVO);
            }
            //예약  상태 업데이트
            if(!StringUtil.isEmpty(roVO.getResvDocNo())){
                ReservationReceiptVO reservationReceiptVO = new ReservationReceiptVO();
                reservationReceiptVO.setResvStatCd("F");
                reservationReceiptVO.setResvDocNo(roVO.getResvDocNo());
                reservationReceiptVO.setDlrCd(dlrCd);
                reservationReceiptService.updateReservationReceipt(reservationReceiptVO);
            }
        }

        ServiceCmmVO serviceCmmVO = new ServiceCmmVO();
        serviceCmmVO.setPreFixId(roVO.getPreFixId());
        serviceCmmVO.setDocNo(roVO.getRoDocNo());
        serviceCmmVO.setDriverId(roVO.getDriverId());
        serviceCmmVO.setDriverNm(roVO.getDriverNm());
        serviceCmmVO.setVinNo(roVO.getVinNo());
        serviceCmmVO.setCarRegNo(roVO.getCarRegNo());
        serviceCmmVO.setSaId(roVO.getSaId());
        serviceCmmVO.setResvDocNo(roVO.getResvDocNo());
        serviceCmmVO.setPartReqType("RO");
        serviceCmmVO.setParReqStatCd(roVO.getItemReqStatCd() == null ? "01" : roVO.getItemReqStatCd());
        serviceCmmVO.setReadyStatCd("02");
        serviceCmmVO.setRoTp(roVO.getRoTp());
        serviceCmmVO.setPastRoTp(pastRoTp);
        serviceCmmVO.setPdiYn(roVO.getPdiYn());
        serviceCmmVO.setRoStatCd(roVO.getRoStatCd());

        // 부품 추가/수정/삭제
        servicePartService.multiServicePart(repairOrderSaveVO.getServicePartListVO(), serviceCmmVO, true);

        // 공임 추가/수정/삭제
        serviceLaborService.multiServiceLabor(repairOrderSaveVO.getServiceLaborListVO(), serviceCmmVO);

        List<CustDemandVO> custDemandList = repairOrderSaveVO.getCustDemandListVO();
        TrobleDescVO trobleDescVO = repairOrderSaveVO.getTrobleDescVO();
        List<EtcIssueVO> etcIssueList = repairOrderSaveVO.getEtcIssueListVO();
        List<LbrSuggestVO> lbrSuggestList = repairOrderSaveVO.getLbrSuggestListVO();

        //고객요구사항 추가/수정/삭제
        serviceCommonService.multiCustDemand(custDemandList, roDocNo, "RO");
        //고장서술 추가/수정/삭제
        serviceCommonService.multiTrobleDesc(trobleDescVO, roDocNo);
        //기타사항 추가/수정/삭제
        serviceCommonService.multiEtcIssue(etcIssueList, roDocNo, "RO");
        //수리건의 추가/삭제
        serviceCommonService.multiLbrSuggest(lbrSuggestList, roDocNo, "RO");

        return roDocNo;
    }

    /*
     * {@inheritDoc}
     */
    public RepairOrderVO selectRepairOrderByKey(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return repairOrderDAO.selectRepairOrderByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    public RepairOrderVO selectRepairOrderWorkByKey(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return repairOrderDAO.selectRepairOrderWorkByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    public RepairOrderVO selectRepairOrderInfoByKey(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectRepairOrderInfoByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String updateRepairOrder(RepairOrderVO repairOrderVO) throws Exception {

        if(StringUtil.nullConvert(repairOrderVO.getRoStatCd()).equals("06")){
            RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
            repairOrderSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            repairOrderSearchVO.setsRoDocNo(repairOrderVO.getRoDocNo());
            repairOrderSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

            RepairOrderVO roVO = repairOrderDAO.selectRepairOrderByKey(repairOrderSearchVO);

            TabInfoSearchVO searchVO = new TabInfoSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsPreFixId("RO");
            searchVO.setsDocNo(repairOrderVO.getRoDocNo());

            List<ServicePartVO> servicePartListVO = servicePartDAO.selectServicePartsByCondition(searchVO);
            for(ServicePartVO servicePartVO : servicePartListVO){
                if(!servicePartVO.getItemReqStatCd().equals("01")){
                    throw processException("ser.info.alreadyPartExt");
                }
            }

            if(StringUtil.nullConvert(roVO.getAllocStatCd()).equals("02") || StringUtil.nullConvert(roVO.getAllocStatCd()).equals("03")){
                CommonCodeVO codeVO = commonCodeService.selectCommonCodeByKey("SER030", "02");
                String[] lblList = new String[3];
                lblList[0] = repairOrderVO.getRoDocNo();
                lblList[1] = messageSource.getMessage("par.lbl.cancel", null, LocaleContextHolder.getLocale());
                lblList[2] = codeVO.getCmmCdNm();
                throw processException("ser.info.impos", lblList);
            }

            if(StringUtil.nullConvert(roVO.getGoodwillYn()).equals("Y")){
                if(!StringUtil.nullConvert(roVO.getRoStatCd()).equals("01")){
                    throw processException("ser.info.notAllocCanCel");
                }
            }

            //사전점검 상태 업데이트
            if(!StringUtil.isEmpty(roVO.getDiagDocNo())){
                roVO.setDiagStatCd("O");
                repairOrderDAO.updatePreCheckStat(roVO);
            }

            //예약  상태 업데이트
            if(!StringUtil.isEmpty(roVO.getResvDocNo())){
                ReservationReceiptVO reservationReceiptVO = new ReservationReceiptVO();
                reservationReceiptVO.setResvStatCd("O");
                reservationReceiptVO.setResvDocNo(roVO.getResvDocNo());
                reservationReceiptVO.setDlrCd(LoginUtil.getDlrCd());
                reservationReceiptService.updateReservationReceipt(reservationReceiptVO);
            }

            //처음수리여부 판단
            int firstRoCnt = repairOrderDAO.selectFirstRoYnCnt(roVO);
            if(firstRoCnt > 0){
                repairOrderVO.setFirstRoYn("N");
            }

        }

        // 인쇄시 인쇄 날짜 업데이트
        if(StringUtil.nullConvert(repairOrderVO.getPrintYn()).equals("Y")){
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(new Date().getTime());
            repairOrderVO.setRoPrintDt(calendar.getTime());
        }

        repairOrderVO.setUpdtUsrId(LoginUtil.getUserId());
        repairOrderVO.setDlrCd(LoginUtil.getDlrCd());
        repairOrderDAO.updateRepairOrder(repairOrderVO);

        return repairOrderVO.getRoDocNo();
    }

    /**
     * 인도체크
     */
    @Override
    public String updateDelivery(RepairOrderVO repairOrderVO)throws Exception{

        RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
        repairOrderSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        repairOrderSearchVO.setsRoDocNo(repairOrderVO.getRoDocNo());
        repairOrderSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        RepairOrderVO roVO = repairOrderDAO.selectRepairOrderByKey(repairOrderSearchVO);
        
      //需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认   取消交车时，清空se_0300t 表 cust_confirm_cd 01APP确认 02系统确认 空未确认 字段值 JiaMing 2021-3-31 start  
        //取消交车时 如果getCustConfirmCd 信息为 01 ，cust_confirm_cd字段 置空
        //APP确认过的维修委托单，从交车确认反流程后清空委托单的APP确认标识
        if(StringUtil.nullConvert(repairOrderVO.getRoStatCd()).equals("02")){
            if(StringUtil.nullConvert(roVO.getCustConfirmCd()).equals("01")){
                updateCustConfirmCd(roVO);
                
                //CANCEL_YN 取消交车操作逻辑增加：
                //把当前的DMS申请，是否经销商取消字段（字段稍后惠新智能），置为是，这条申请作废。经销商再次交车确认后，可以重新做申请。
                //DMS在做工单和特殊申请关联的时候，只关联唯一有效的那条申请。同时插入一条申请的取消接口记录 
                //交车取消时，更改 SE_1162T  CANCEL_YN 为 Y 并把 DCS 做相应更改
                updateCancelYn(roVO);
             }
        }
        //需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认   取消交车时，清空se_0300t 表 cust_confirm_cd 01APP确认 02系统确认 空未确认 字段值 JiaMing 2021-3-31 end  
        
        
      //20191211 tianjx 交车检查前派工校验 ----   start
        List<RepairCheckSearchVO> repairCheckList = selectRepairCheckByCondition(repairOrderSearchVO);
        Integer size = repairCheckList.size();
        if(size > 0) {
	        for(int i = 0 ; i < size ; i++) {
	        	if(!"05".equals(repairCheckList.get(i).getWrkStatCd()) || !"03".equals(repairCheckList.get(i).getAllocStatCd())) {
	        		String[] wrkStatChkMsg = new String[1];
	        		wrkStatChkMsg[0] = messageSource.getMessage("ser.lbl.unfinished", null, LocaleContextHolder.getLocale());
	                throw processException("ser.lbl.entrust",wrkStatChkMsg);
	        	}
	        	
	        }
        } 
        //交车检查前派工校验  ----end
        
        //정비진도상태 체크
        if(!StringUtils.defaultString(roVO.getWrkStatCd(),"").equals("05")){
            String[] wrkStatChkMsg = new String[1];
            wrkStatChkMsg[0] = messageSource.getMessage("ser.lbl.processWorkStat", null, LocaleContextHolder.getLocale());
            throw processException("global.info.confirmMsgParam", wrkStatChkMsg);
        }
        
        //取消结算不能是结算SER030   结算确认,结算完成,服务收款
        if(!StringUtil.isEmpty(repairOrderVO.getCancelType())){

            if(roVO.getRoStatCd().equals("04") || roVO.getRoStatCd().equals("00") || roVO.getRoStatCd().equals("05")){
                CommonCodeVO codeVO = commonCodeService.selectCommonCodeByKey("SER030", roVO.getRoStatCd());
                String[] lblList = new String[3];
                lblList[0] = repairOrderVO.getRoDocNo();
                lblList[1] = messageSource.getMessage("par.lbl.cancel", null, LocaleContextHolder.getLocale());
                lblList[2] = codeVO.getCmmCdNm();
                throw processException("ser.info.impos", lblList);
            }

            repairOrderVO.setDlChkDt(null);
            repairOrderVO.setDlChkPrsnCd("");
            repairOrderVO.setDlChkPrsnNm("");
            if(StringUtil.nullConvert(repairOrderVO.getCancelType()).equals("02")){
                deleteDelivery(repairOrderVO);
            }
            

            
            //정비항목 배정공임 재업데이트
            /*
             * TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
               tabInfoSearchVO.setsDlrCd(roVO.getDlrCd());
               tabInfoSearchVO.setsDocNo(roVO.getRoDocNo());
               tabInfoSearchVO.setsPreFixId("RO");
               List<ServiceLaborVO> serviceLaborListVO = serviceLaborService.selectServiceLaborsByCondition(tabInfoSearchVO);
               for(ServiceLaborVO vo : serviceLaborListVO){
                   serviceLaborService.updateDstbHmBack(vo);
               }
            */

        } else {

            //품질검사상태 체크
            if(roVO.getQtTestMthCd().equals("01") && !StringUtils.defaultString(roVO.getQtTestStatCd(),"").equals("Q2")){
                String[] qtTestMsg = new String[1];
                qtTestMsg[0] = messageSource.getMessage("ser.lbl.qtTest", null, LocaleContextHolder.getLocale());
                throw processException("global.info.required.preprocess", qtTestMsg);
            }

            TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
            tabInfoSearchVO.setsDocNo(repairOrderVO.getRoDocNo());
            tabInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            tabInfoSearchVO.setsPreFixId("RO");
            boolean result = servicePartService.partGiQtyCheck(tabInfoSearchVO);

            if(!result){
                throw processException("ser.info.giQtyPartNotExist");
            }

            //인도 체크 시
            updateVehicleMaster(repairOrderVO);
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(new Date().getTime());
            repairOrderVO.setDlChkDt(calendar.getTime());
        }

        repairOrderVO.setUpdtUsrId(LoginUtil.getUserId());
        repairOrderVO.setDlrCd(LoginUtil.getDlrCd());
        repairOrderDAO.updateRepairOrder(repairOrderVO);

        return repairOrderVO.getRoDocNo();
    }
    
    

	

	/**
     * 20191212
     * 交车检查维修派工/维修进度校验
     */
    public List<RepairCheckSearchVO> selectRepairCheckByCondition(RepairOrderSearchVO repairOrderSearchVO){
    	return repairOrderDAO.selectRepairCheckByCondition(repairOrderSearchVO);
    }
    /**
     *
     * 차량 마스터 주행거리 수정
     *
     * @throws Exception
     */
    public void updateVehicleMaster(RepairOrderVO repairOrderVO)throws Exception{

        /** 차량마스터 update
         *  VehicleMasterVO   -->  VehicleMasterSaveVO 바뀜.   09.29 kim yewon
         * **/
        VehicleMasterSaveVO masterSaveVO = new VehicleMasterSaveVO();
        VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

        vehicleMasterVO.setCarId(repairOrderVO.getCarId());
        vehicleMasterVO.setCarRunDistVal( String.valueOf(repairOrderVO.getGiRunDistVal()) );
        vehicleMasterVO.setUpdtUsrId(LoginUtil.getUserId());

        masterSaveVO.setOpFlag("JC");//标识交车操作
        masterSaveVO.setVehicleMasterVO(vehicleMasterVO);
        vehicleMasterService.saveVehicleMasterMain(masterSaveVO);


        //DCS 프로시져 호출
        VehOfCustInfoVO vehOfCustInfoVO = new VehOfCustInfoVO();
        vehOfCustInfoVO.setCarId(repairOrderVO.getCarId());
        vehOfCustInfoService.vinMasterChangeCall(vehOfCustInfoVO);



    }
    /*
     * {@inheritDoc}
     */
    @Override
    public String selectRepairOrderCheckByKey(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectRepairOrderCheckByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectPreRepairOrderByCondition(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectPreRepairOrderByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectWorkProcessKanban(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectWorkProcessKanban(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectPaintKanban(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectPaintKanban(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectCarWashKanban(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectCarWashKanban(searchVO);
    }

    /**
     * 인도현황 보드  칸반 RO 정보를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectDeliveryKanban(RepairOrderSearchVO searchVO)throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectDeliveryKanban(searchVO);
    }

    /**
     * 인도현황 보드  칸반 RO 컬럼 정보를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectDeliveryKanbanRowsByCondition(RepairOrderSearchVO searchVO)throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectDeliveryKanbanRowsByCondition(searchVO);
    }

    /**
     *
     * 인도 체크 화면에서 RO 취소시 작업배분 데이터 삭제
     *
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public int deleteDelivery(RepairOrderVO repairOrderVO)throws Exception{

        if(StringUtil.nullConvert(repairOrderVO.getDlrCd()).equals("") ){
            repairOrderVO.setDlrCd(LoginUtil.getDlrCd());
        }
        return repairOrderDAO.deleteDelivery(repairOrderVO);

    }
    
    /**
     * 需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认   取消交车时，清空se_0300t 表 cust_confirm_cd 01APP确认 02系统确认 空未确认 字段值 JiaMing 2021-3-31
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public int updateCustConfirmCd(RepairOrderVO repairOrderVO)throws Exception{
    	if(StringUtil.nullConvert(repairOrderVO.getDlrCd()).equals("") ){
            repairOrderVO.setDlrCd(LoginUtil.getDlrCd());
        }
    	return repairOrderDAO.updateCustConfirmCd(repairOrderVO);
    }
    
    /**
     * 需求 327 交车确认时提醒客户要在APP端进行确认，服务结算时校验是否已收到APP的确认   取消交车时，更改SE_1162T 表 CANCEL_YN 字段为 Y JiaMing 2021-4-7
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public void updateCancelYn(RepairOrderVO repairOrderVO)throws Exception {
    	SpecialVO resultSpecialRequestVo = repairOrderDAO.selectSpecialInfo(repairOrderVO);
    	if(null != resultSpecialRequestVo){
    	  if(!StringUtils.isBlank(resultSpecialRequestVo.getReqNo())){
    		repairOrderDAO.updateCancelYn(resultSpecialRequestVo);
    		try{
	            //Camel InterFace Header Info SER140 发送信息
	            Map<String, Object> message = new HashMap<String, Object>();

	            message.put("REQ_NO", resultSpecialRequestVo.getReqNo()); //申请编号
	            message.put("DLR_CD",resultSpecialRequestVo.getDlrCd());//店代码
	            message.put("CAR_REG_NO",resultSpecialRequestVo.getCarRegNo());//车架号
	            message.put("VIN_NO",resultSpecialRequestVo.getVinNo());//vin
	            message.put("RO_DOC_NO", resultSpecialRequestVo.getRoDocNo());//工单号
	            message.put("RO_DT", DateUtil.convertToDateTimeString(resultSpecialRequestVo.getRoDt()));//
	            message.put("RO_TP", resultSpecialRequestVo.getRoTp());
	            message.put("CAR_OWNER_ID", resultSpecialRequestVo.getCarOwnerId());
	            message.put("CAR_OWNER_NM", resultSpecialRequestVo.getCarOwnerNm());
	            message.put("DRIVER_ID", resultSpecialRequestVo.getDriverId());
	            message.put("DRIVER_NM", resultSpecialRequestVo.getDriverNm());// getscanRcptPubDtDateUtil.convertToDateTimeString(obj.getReceiptIssDt())
	            message.put("DRIVER_HP_NO", resultSpecialRequestVo.getDriverHpNo());
	            message.put("FILE_DOC_NO", resultSpecialRequestVo.getFileDocNo());
	            message.put("REQ_STAT_CD", resultSpecialRequestVo.getReqStatCd());
	            message.put("REQ_REASON_TP", resultSpecialRequestVo.getReqReasonTp());
	            message.put("REQ_REASON_DESC", resultSpecialRequestVo.getReqReasonDesc());
	            message.put("APPROVE_DESC", resultSpecialRequestVo.getApproveDesc());
	            message.put("REQ_USR_ID", resultSpecialRequestVo.getReqUsrId());
	            message.put("REQ_DT", DateUtil.convertToDateTimeString(resultSpecialRequestVo.getReqDt()));
	            message.put("APPROVE_USR_ID", resultSpecialRequestVo.getApproveUsrId());
	            message.put("APPROVE_USR_NM",  resultSpecialRequestVo.getApproveUsrNm());
	            message.put("REG_USR_ID",  resultSpecialRequestVo.getRegUsrId());
	            message.put("REG_DT",  DateUtil.convertToDateTimeString(resultSpecialRequestVo.getRegDt()));
	            message.put("REQ_TSK_NM",  resultSpecialRequestVo.getReqTskNm());
	            message.put("REQ_HP_NO",  resultSpecialRequestVo.getReqHpNo());
	            message.put("UPDT_USR_ID", resultSpecialRequestVo.getUpdtUserId() );
	            message.put("UPDT_DT",  DateUtil.convertToDateTimeString(resultSpecialRequestVo.getUpdtDt()));
	            message.put("RO_UPDT_DT",  DateUtil.convertToDateTimeString(resultSpecialRequestVo.getRoUpdtDt()));
	            message.put("REQ_USR_NM",  resultSpecialRequestVo.getReqUsrNm());
	            //REQ_STAT_CD 单据状态  “00”保存 “01”提报 “02”通过“03”拒绝 “04”驳回  驳回可以再次提报，拒绝就不能了。
	            message.put("IS_INUP","U");//增加个标识，Y代表 新增加的上传的  N 代表修改时上传的N  U 代表 更改 CANCEL_YN 为 Y
	            //salesCommonCamelService.executeCamelClent(message,"SAL170");
				 serviceCommonService.executeCamelClent(message,"SER140");
	       }catch(Exception e){
	           log.error(e.getMessage(),e);
	           try {
				 throw e;
			  } catch (Exception e1) {
				e1.printStackTrace();
			  }
	       }
		
    	 }
    	}
		
	}

     
    /**
     * 조회 조건에 해당하는 RO진도 현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectRepairOrderProcessByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return repairOrderDAO.selectRepairOrderProcessByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 RO진도 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderProcessByCondition(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectRepairOrderProcessByCondition(searchVO);
    }

        /**
     * 조회 조건에 해당하는 RO히스토리를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectRepairOrderHistoryByCondition(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 세차 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectCarWashListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectCarWashListByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 세차를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectCarWashListByCondition(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectCarWashListByCondition(searchVO);
    }


    /**
     * 조회 조건에 해당하는 공임이력 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectLbrHistListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectLbrHistListByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임이력을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectLbrHistListByCondition(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectLbrHistListByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고객의견 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectCustDmndHistListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectCustDmndHistListByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고객의견을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectCustDmndHistListByCondition(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectCustDmndHistListByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 기타사항 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectEtcHistListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectEtcHistListByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 기타사항을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectEtcHistListByCondition(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectEtcHistListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        RepairOrderSearchVO searchVO = new RepairOrderSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<RepairOrderVO> list = null;
        String sListType = (String)params.get("sListType");

        if(StringUtil.nullConvert(sListType).equals("RS")){
            if(!StringUtils.isBlank(params.get("sExpcDlToDt").toString())){
                String sExpcDlToDt = params.get("sExpcDlToDt").toString();
                Date dExpcDlToDt = DateUtil.convertToDate(sExpcDlToDt);
                searchVO.setsExpcDlToDt(dExpcDlToDt);
            }
            if(!StringUtils.isBlank(params.get("sExpcDlFromDt").toString())){
                String sExpcDlFromDt = params.get("sExpcDlFromDt").toString();
                Date dExpcDlFromDt = DateUtil.convertToDate(sExpcDlFromDt);
                searchVO.setsExpcDlFromDt(dExpcDlFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            if(!StringUtils.isBlank(params.get("sRoTpList").toString())){
                String[] result = params.get("sRoTpList").toString().split(",");
                List<String> sRoTpList = new ArrayList<String>();
                for(int i=0;i<result.length;i++){
                    sRoTpList.add(i, result[i]);
                }
                searchVO.setsRoTpList(sRoTpList);
            }
            if(!StringUtils.isBlank(params.get("sCustSaleFromDt").toString())){
                String sCustSaleFromDt = params.get("sCustSaleFromDt").toString();
                Date dCustSaleFromDt = DateUtil.convertToDate(sCustSaleFromDt);
                searchVO.setsCustSaleFromDt(dCustSaleFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCustSaleToDt").toString())){
                String sCustSaleToDt = params.get("sCustSaleToDt").toString();
                Date dCustSaleToDt = DateUtil.convertToDate(sCustSaleToDt);
                searchVO.setsCustSaleToDt(dCustSaleToDt);
            }
            if(!StringUtils.isBlank(params.get("sPayEndFromDt").toString())){
                String sPayEndFromDt = params.get("sPayEndFromDt").toString();
                Date dPayEndFromDt = DateUtil.convertToDate(sPayEndFromDt);
                searchVO.setsPayEndFromDt(dPayEndFromDt);
            }
            if(!StringUtils.isBlank(params.get("sPayEndToDt").toString())){
                String sPayEndToDt = params.get("sPayEndToDt").toString();
                Date dPayEndToDt = DateUtil.convertToDate(sPayEndToDt);
                searchVO.setsPayEndToDt(dPayEndToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectRepairOrderListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("LH")){

            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            if(!StringUtils.isBlank(params.get("sCalcFromDt").toString())){
                String sCalcFromDt = params.get("sCalcFromDt").toString();
                Date dCalcFromDt = DateUtil.convertToDate(sCalcFromDt);
                searchVO.setsCalcFromDt(dCalcFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCalcToDt").toString())){
                String sCalcToDt = params.get("sCalcToDt").toString();
                Date dCalcToDt = DateUtil.convertToDate(sCalcToDt);
                searchVO.setsCalcToDt(dCalcToDt);
            }
            if(!StringUtils.isBlank(params.get("sPayFromDt").toString())){
                String sPayFromDt = params.get("sPayFromDt").toString();
                Date dPayFromDt = DateUtil.convertToDate(sPayFromDt);
                searchVO.setsPayFromDt(dPayFromDt);
            }
            if(!StringUtils.isBlank(params.get("sPayToDt").toString())){
                String sPayToDt = params.get("sPayToDt").toString();
                Date dPayToDt = DateUtil.convertToDate(sPayToDt);
                searchVO.setsPayToDt(dPayToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectLbrHistListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("CH")){

            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectCustDmndHistListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("EH")){

            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectEtcHistListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("RH")){

            String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
            String pattern = dateFormat + " HH:mm:ss";

            List<RepairOrderIfVO> roIfList = new ArrayList<RepairOrderIfVO>();

            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectRepairOrderHistoryByCondition(searchVO);

            if(searchVO.getsSearchGubun().equals("MD")){

                list = repairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);

            } else if(searchVO.getsSearchGubun().equals("OD")){
                //Carmel InterFace Header Info
                Map<String, Object> message = new HashMap<String, Object>();

                message.put("VIN_NO", searchVO.getsVinNo());
                message.put("RO_START_DT", DateUtil.getDate(searchVO.getsRoFromDt(),pattern));
                message.put("RO_END_DT", DateUtil.getDate(searchVO.getsRoToDt(),pattern));
                message.put("RO_DOC_NO", searchVO.getsRoDocNo());
                message.put("LBR_NM", searchVO.getsLbrNm());
                message.put("CAR_REG_NO", searchVO.getsCarRegNo());
                message.put("DRIVER_NM", searchVO.getsDriverNm());
                message.put("RO_TP", searchVO.getsRoTp());
                message.put("ITEM_NM", searchVO.getsItemNm());

                Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER055");

                if (receiveData.getFooter().getIfResult().equals("Z")) {
                    roIfList = receiveData.readMessages(RepairOrderIfVO.class);
                    RepairOrderVO roVO = new RepairOrderVO();

                    for(int i = 0 ; i <  roIfList.size() ; i++){
                        roVO = new RepairOrderVO();

                        if(!roIfList.get(i).getDlrCd().equals(LoginUtil.getDlrCd())){
                            roVO.setDlrCd(roIfList.get(i).getDlrCd());
                            roVO.setRoDocNo(roIfList.get(i).getRoDocNo());
                            roVO.setRoTpNm(roIfList.get(i).getRoTpNm());
                            roVO.setVinNo(roIfList.get(i).getVinNo());
                            roVO.setCarRegNo(roIfList.get(i).getCarRegNo());
                            roVO.setCarOwnerId(roIfList.get(i).getCarOwnerId());
                            roVO.setCarOwnerNm(roIfList.get(i).getCarOwnerNm());
                            roVO.setDriverId(roIfList.get(i).getDriverId());
                            roVO.setDriverNm(roIfList.get(i).getDriverNm());
                            roVO.setRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getRunDistVal(), "0")));
                            roVO.setLastRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getLastRunDistVal(), "0")));
                            roVO.setBaseRoNo(roIfList.get(i).getBaseRoNo());
                            roVO.setRoStatCd(roIfList.get(i).getRoStatCd());
                            roVO.setRoStatNm(roIfList.get(i).getRoStatNm());
                            roVO.setRoDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoDt() ,pattern));
                            roVO.setRoGrpNo(roIfList.get(i).getRoGrpNo());
                            roVO.setRoStartDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoStartDt() ,pattern));
                            roVO.setRoEndDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoEndDt() ,pattern));
                            roVO.setCarlineNm(roIfList.get(i).getCarlineNm());
                            roVO.setModelNm(roIfList.get(i).getModelNm());
                            roVO.setRegUsrNm(roIfList.get(i).getRegUsrNm());
                            roVO.setUpdtDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoUpdtDt(),pattern));
                            roVO.setCalcDocNo(roIfList.get(i).getCalcDocNo());
                            roVO.setCalcRegDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcRegDt()));
                            roVO.setPaymYnNm(roIfList.get(i).getPaymYnNm());
                            roVO.setCalcCompUsrNm(roIfList.get(i).getCalcCompUsrNm());
                            roVO.setRoPrintDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoPrintDt()));
                            roVO.setCalcPrsnNm(roIfList.get(i).getCalcPrsnNm());
                            roVO.setCalcDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcDt()));
                            roVO.setSearchGubun("OD");

                            list.add(roVO);
                        }
                    }

                } else {
                    throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
                }
            } else if(searchVO.getsSearchGubun().equals("AD")) {

                Date realRoFromDt = searchVO.getsRoFromDt();
                Date realRoToDt = searchVO.getsRoFromDt();

                Date today = new Date();
                String strDate = DateUtil.convertToDateTimeString(today);
                searchVO.setsRoFromDt(DateUtil.convertToDate(strDate, dateFormat));
                searchVO.setsRoToDt(DateUtil.convertToDate(strDate, dateFormat));

                list = repairOrderDAO.selectRepairOrderHistoryByCondition(searchVO);

                //Carmel InterFace Header Info
                Map<String, Object> message = new HashMap<String, Object>();

                message.put("VIN_NO", searchVO.getsVinNo());
                message.put("RO_START_DT", DateUtil.getDate(realRoFromDt,pattern));
                message.put("RO_END_DT", DateUtil.getDate(realRoToDt,pattern));
                message.put("RO_DOC_NO", searchVO.getsRoDocNo());
                message.put("LBR_NM", searchVO.getsLbrNm());
                message.put("CAR_REG_NO", searchVO.getsCarRegNo());
                message.put("DRIVER_NM", searchVO.getsDriverNm());
                message.put("RO_TP", searchVO.getsRoTp());
                message.put("ITEM_NM", searchVO.getsItemNm());

                Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER055");

                if (receiveData.getFooter().getIfResult().equals("Z")) {
                    roIfList = receiveData.readMessages(RepairOrderIfVO.class);
                    RepairOrderVO roVO = new RepairOrderVO();

                    for(int i = 0 ; i <  roIfList.size() ; i++){
                        roVO = new RepairOrderVO();

                        roVO.setDlrCd(roIfList.get(i).getDlrCd());
                        roVO.setRoDocNo(roIfList.get(i).getRoDocNo());
                        roVO.setRoTpNm(roIfList.get(i).getRoTpNm());
                        roVO.setVinNo(roIfList.get(i).getVinNo());
                        roVO.setCarRegNo(roIfList.get(i).getCarRegNo());
                        roVO.setCarOwnerId(roIfList.get(i).getCarOwnerId());
                        roVO.setCarOwnerNm(roIfList.get(i).getCarOwnerNm());
                        roVO.setDriverId(roIfList.get(i).getDriverId());
                        roVO.setDriverNm(roIfList.get(i).getDriverNm());
                        roVO.setRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getRunDistVal(), "0")));
                        roVO.setLastRunDistVal(Integer.parseInt(StringUtils.defaultIfEmpty(roIfList.get(i).getLastRunDistVal(), "0")));
                        roVO.setBaseRoNo(roIfList.get(i).getBaseRoNo());
                        roVO.setRoStatCd(roIfList.get(i).getRoStatCd());
                        roVO.setRoStatNm(roIfList.get(i).getRoStatNm());
                        roVO.setRoDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoDt(), pattern));
                        roVO.setRoGrpNo(roIfList.get(i).getRoGrpNo());
                        roVO.setRoStartDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoStartDt(), pattern));
                        roVO.setRoEndDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoEndDt(), pattern));
                        roVO.setCarlineNm(roIfList.get(i).getCarlineNm());
                        roVO.setModelNm(roIfList.get(i).getModelNm());
                        roVO.setRegUsrNm(roIfList.get(i).getRegUsrNm());
                        roVO.setUpdtDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoUpdtDt(),pattern));
                        roVO.setCalcDocNo(roIfList.get(i).getCalcDocNo());
                        roVO.setCalcRegDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcRegDt()));
                        roVO.setPaymYnNm(roIfList.get(i).getPaymYnNm());
                        roVO.setCalcCompUsrNm(roIfList.get(i).getCalcCompUsrNm());
                        roVO.setRoPrintDt(DateUtil.convertToTimestamp(roIfList.get(i).getRoPrintDt()));
                        roVO.setCalcPrsnNm(roIfList.get(i).getCalcPrsnNm());
                        roVO.setCalcDt(DateUtil.convertToTimestamp(roIfList.get(i).getCalcDt()));
                        if(!roIfList.get(i).getDlrCd().equals(LoginUtil.getDlrCd())){
                            roVO.setSearchGubun("OD");
                        }
                        list.add(roVO);
                    }
                } else {
                    throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
                }
            }
        } else if (StringUtil.nullConvert(sListType).equals("AL") ||    // 배정
                   StringUtil.nullConvert(sListType).equals("QT") ||    // 품질검사
                   StringUtil.nullConvert(sListType).equals("WRK")){    // 정비진도
            if(!StringUtils.isBlank(params.get("sExpcDlToDt").toString())){
                String sExpcDlToDt = params.get("sExpcDlToDt").toString();
                Date dExpcDlToDt = DateUtil.convertToDate(sExpcDlToDt);
                searchVO.setsExpcDlToDt(dExpcDlToDt);
            }
            if(!StringUtils.isBlank(params.get("sExpcDlFromDt").toString())){
                String sExpcDlFromDt = params.get("sExpcDlFromDt").toString();
                Date dExpcDlFromDt = DateUtil.convertToDate(sExpcDlFromDt);
                searchVO.setsExpcDlFromDt(dExpcDlFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
            list = selectRepairOrderByCondition(searchVO);
        } else if (StringUtil.nullConvert(sListType).equals("WP")){         // 정비진도현황
             if(!StringUtils.isBlank(params.get("sExpcDlToDt").toString())){
                 String sExpcDlToDt = params.get("sExpcDlToDt").toString();
                 Date dExpcDlToDt = DateUtil.convertToDate(sExpcDlToDt);
                 searchVO.setsExpcDlToDt(dExpcDlToDt);
             }
             if(!StringUtils.isBlank(params.get("sExpcDlFromDt").toString())){
                 String sExpcDlFromDt = params.get("sExpcDlFromDt").toString();
                 Date dExpcDlFromDt = DateUtil.convertToDate(sExpcDlFromDt);
                 searchVO.setsExpcDlFromDt(dExpcDlFromDt);
             }
             if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                 String sRoFromDt = params.get("sRoFromDt").toString();
                 Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                 searchVO.setsRoFromDt(dRoFromDt);
             }
             if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                 String sRoToDt = params.get("sRoToDt").toString();
                 Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                 searchVO.setsRoToDt(dRoToDt);
             }

             if(!StringUtils.isBlank(params.get("sAssignFromDt").toString())){
                 String sAssignFromDt = params.get("sAssignFromDt").toString();
                 Date dAssignFromDt = DateUtil.convertToDate(sAssignFromDt);
                 searchVO.setsAssignFromDt(dAssignFromDt);
             }
             if(!StringUtils.isBlank(params.get("sAssignToDt").toString())){
                 String sAssignToDt = params.get("sAssignToDt").toString();
                 Date dAssignToDt = DateUtil.convertToDate(sAssignToDt);
                 searchVO.setsAssignToDt(dAssignToDt);
             }

             if(!StringUtils.isBlank(params.get("sWorkFromDt").toString())){
                 String sWorkFromDt = params.get("sWorkFromDt").toString();
                 Date dWorkFromDt = DateUtil.convertToDate(sWorkFromDt);
                 searchVO.setsWorkFromDt(dWorkFromDt);
             }
             if(!StringUtils.isBlank(params.get("sWorkToDt").toString())){
                 String sWorkToDt = params.get("sWorkToDt").toString();
                 Date dWorkToDt = DateUtil.convertToDate(sWorkToDt);
                 searchVO.setsWorkToDt(dWorkToDt);
             }

             if(!StringUtils.isBlank(params.get("sQtTestFromDt").toString())){
                 String sQtTestFromDt = params.get("sQtTestFromDt").toString();
                 Date dQtTestFromDt = DateUtil.convertToDate(sQtTestFromDt);
                 searchVO.setsQtTestFromDt(dQtTestFromDt);
             }
             if(!StringUtils.isBlank(params.get("sQtTestToDt").toString())){
                 String sQtTestToDt = params.get("sQtTestToDt").toString();
                 Date dQtTestToDt = DateUtil.convertToDate(sQtTestToDt);
                 searchVO.setsQtTestToDt(dQtTestToDt);
             }

             if(!StringUtils.isBlank(params.get("sDlChkFromDt").toString())){
                 String sDlChkFromDt = params.get("sDlChkFromDt").toString();
                 Date dDlChkFromDt = DateUtil.convertToDate(sDlChkFromDt);
                 searchVO.setsDlChkFromDt(dDlChkFromDt);
             }
             if(!StringUtils.isBlank(params.get("sDlChkToDt").toString())){
                 String sDlChkToDt = params.get("sDlChkToDt").toString();
                 Date dDlChkToDt = DateUtil.convertToDate(sDlChkToDt);
                 searchVO.setsDlChkToDt(dDlChkToDt);
             }
             searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
             searchVO.setsDlrCd(LoginUtil.getDlrCd());
             ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
             list = selectRepairOrderInfoListByCondition(searchVO);
         } else {
            if(!StringUtils.isBlank(params.get("sPreChkFromDt").toString())){
                String sPreChkFromDt = params.get("sPreChkFromDt").toString();
                Date dPreChkFromDt = DateUtil.convertToDate(sPreChkFromDt);
                searchVO.setsPreChkFromDt(dPreChkFromDt);
            }
            if(!StringUtils.isBlank(params.get("sPreChkToDt").toString())){
                String sPreChkToDt = params.get("sPreChkToDt").toString();
                Date dPreChkToDt = DateUtil.convertToDate(sPreChkToDt);
                searchVO.setsPreChkToDt(dPreChkToDt);
            }
            if(!StringUtils.isBlank(params.get("sCarWashStartFromDt").toString())){
                String sCarWashStartFromDt = params.get("sCarWashStartFromDt").toString();
                Date dCarWashStartFromDt = DateUtil.convertToDate(sCarWashStartFromDt);
                searchVO.setsCarWashStartFromDt(dCarWashStartFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCarWashStartToDt").toString())){
                String sCarWashStartToDt = params.get("sCarWashStartToDt").toString();
                Date dCarWashStartToDt = DateUtil.convertToDate(sCarWashStartToDt);
                searchVO.setsCarWashStartToDt(dCarWashStartToDt);
            }
            if(!StringUtils.isBlank(params.get("sCarWashEndFromDt").toString())){
                String sCarWashEndFromDt = params.get("sCarWashEndFromDt").toString();
                Date dCarWashEndFromDt = DateUtil.convertToDate(sCarWashEndFromDt);
                searchVO.setsCarWashEndFromDt(dCarWashEndFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCarWashEndToDt").toString())){
                String sCarWashEndToDt = params.get("sCarWashEndToDt").toString();
                Date dCarWashEndToDt = DateUtil.convertToDate(sCarWashEndToDt);
                searchVO.setsCarWashEndToDt(dCarWashEndToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());

            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectCarWashListByCondition(searchVO);
        }
        context.putVar("items", list);
    }

    /**
     * RO변경알람,SMS
     * @param repairOrderVO - 수정할 정보가 담긴 RepairOrderVO
     * @return
     */
    public void roChangeAlramCall(RepairOrderVO repairOrderVO) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();

        // RO수정
        updateRepairOrder(repairOrderVO);

        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();

        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
        targetVO.setUsrId(repairOrderVO.getCarOwnerId());
        targetVO.setUsrNm(repairOrderVO.getCarOwnerNm());
        targetVO.setMesgTmplTpList("S");
        targetVO.setHpNo(repairOrderVO.getDriverHpNo());
        targetUsers.add(targetVO);

        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "SER-0002";

        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("carRegNo", repairOrderVO.getCarRegNo());
        context.getVelocityContext().put("roDocNo", repairOrderVO.getRoDocNo());
        context.getVelocityContext().put("custNo", repairOrderVO.getCarOwnerId());
        context.getVelocityContext().put("saNm", repairOrderVO.getSaNm());

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }
    
    /**
     * 2020.09.25
     * 查看DMS登陆用户是否有维修委托权限,没有则不能从维修委托查询页面跳转
     * TJX
     */
	@Override
	public int selectUsrServicePower(String userId)  throws Exception{
		int viewCount = repairOrderDAO.selectUsrServicePowerByCondition(userId);
		if(viewCount == 0) {
			throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.permission", null, LocaleContextHolder.getLocale())});
    	}
		return  viewCount;
		 
	}

   
	
}