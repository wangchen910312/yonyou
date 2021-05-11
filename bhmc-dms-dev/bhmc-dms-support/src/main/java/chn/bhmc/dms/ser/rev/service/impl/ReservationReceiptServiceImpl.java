package chn.bhmc.dms.ser.rev.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sms.service.SmsMessageIfService;
import chn.bhmc.dms.cmm.sms.vo.SmsMessageIfVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.rev.service.dao.ReservationReceiptDAO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSaveVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO;
import chn.bhmc.dms.ser.svi.service.BayCalendarService;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.vo.BayCalendarSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayCalendarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayManageServiceImpl.java
 * @Description : Bay관리 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("reservationReceiptService")
public class ReservationReceiptServiceImpl extends HService implements ReservationReceiptService, JxlsSupport {

    /**
     * 예약접수 DAO
     */
    @Resource(name="reservationReceiptDAO")
    ReservationReceiptDAO reservationReceiptDAO;

    /**
     * Bay캘린더 Service
     */
    @Resource(name="bayCalendarService")
    BayCalendarService bayCalendarService;

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

    @Resource(name="resvDocNoIdgenService")
    TableIdGenService resvDocNoIdgenService;

    @Resource(name="roGrpNoIdGenService")
    TableIdGenService roGrpNoIdGenService;

    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     * 메세지 알림 서비스
     */
    @Autowired
    NotificationMessageService notificationMessageService;

    /**
     * 유저 서비스
     */
    @Autowired
    UserService userService;

    /**
     * 서비스운영 마스터 서비스
     */
    @Autowired
    ServiceSettingService serviceSettingService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="smsMessageIfService")
    SmsMessageIfService smsMessageIfService;

    /**
     * 부품요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectReservationReceiptByConditionCnt(ReservationReceiptSearchVO searchVO) throws Exception {
       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }

        return reservationReceiptDAO.selectReservationReceiptByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<ReservationReceiptVO> selectReservationReceiptByCondition(ReservationReceiptSearchVO searchVO) throws Exception {

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        List<ReservationReceiptVO> resvList = reservationReceiptDAO.selectReservationReceiptByCondition(searchVO);

        if(StringUtil.nullConvert(searchVO.getsListType()).equals("02")){
            BayCalendarSearchVO calSearchVO = new BayCalendarSearchVO();
            calSearchVO.setsDlrCd(searchVO.getsDlrCd());



            List<BayCalendarVO> bayCalList = bayCalendarService.selectBayCalendarMainsByCondition(calSearchVO);

            for(BayCalendarVO calVO : bayCalList) {
                ReservationReceiptVO resvVO = new ReservationReceiptVO();
                resvVO.setSerResvStartDt(calVO.getExcpStartDt());
                resvVO.setSerResvEndDt(calVO.getExcpEndDt());
                resvVO.setBayNo(calVO.getBayNo());
                resvVO.setCarRegNo(calVO.getBayNm());
                resvVO.setNoResvTp("02");
                resvVO.setResvDocNo("예약불가");

                resvList.add(resvVO);
            }
        }


        return resvList;
    }


    /**
     * 조회 조건에 해당하는 칸반보드 예약접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public List<ReservationReceiptVO> selectKanbanReservationByCondition(ReservationReceiptSearchVO searchVO)throws Exception{

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        List<ReservationReceiptVO> resvList = reservationReceiptDAO.selectKanbanReservationByCondition(searchVO);

        if(StringUtil.nullConvert(searchVO.getsListType()).equals("02")){
            BayCalendarSearchVO calSearchVO = new BayCalendarSearchVO();
            calSearchVO.setsDlrCd(searchVO.getsDlrCd());

            List<BayCalendarVO> bayCalList = bayCalendarService.selectBayCalendarMainsByCondition(calSearchVO);

            for(BayCalendarVO calVO : bayCalList) {
                ReservationReceiptVO resvVO = new ReservationReceiptVO();
                resvVO.setSerResvStartDt(calVO.getExcpStartDt());
                resvVO.setSerResvEndDt(calVO.getExcpEndDt());
                resvVO.setBayNo(calVO.getBayNo());
                resvVO.setCarRegNo(calVO.getBayNm());
                resvVO.setNoResvTp("02");
                resvVO.setResvDocNo("예약불가");

                resvList.add(resvVO);
            }
        }


        return resvList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectReservationReceiptListByConditionCnt(ReservationReceiptSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return reservationReceiptDAO.selectReservationReceiptListByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<ReservationReceiptVO> selectReservationReceiptListByCondition(ReservationReceiptSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<ReservationReceiptVO> resvList = reservationReceiptDAO.selectReservationReceiptListByCondition(searchVO);

        return resvList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String multiReservationReceipt(ReservationReceiptSaveVO reservationReceiptSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        ReservationReceiptVO resvVO = reservationReceiptSaveVO.getReservationReceiptVO();
        String resvDocNo = resvVO.getResvDocNo();
        Date resvEndDt = resvVO.getSerResvEndDt();
        Date resvStartDt = resvVO.getSerResvStartDt();
        String resvStatCd = resvVO.getResvStatCd();
        ReservationReceiptVO oldVO = new ReservationReceiptVO();
        if(resvEndDt == null) {
            // 서비스셋팅정보
            /*ServiceSettingSearchVO serSetSearchVO = new ServiceSettingSearchVO();
            ServiceSettingVO serSetVO = serviceSettingService.selectServiceSettingByKey(serSetSearchVO);

            int resvMin = 0;

            if(StringUtil.nullConvert(serSetVO.getResvIvalCd()).equals("01")) {
                resvMin = 15;
            } else if(StringUtil.nullConvert(serSetVO.getResvIvalCd()).equals("02")) {
                resvMin = 30;
            } else if(StringUtil.nullConvert(serSetVO.getResvIvalCd()).equals("03")) {
                resvMin = 60;
            } else {
                resvMin = 30;
            }*/

            Calendar cal = Calendar.getInstance();
            cal.setTime(resvStartDt);
            cal.add(Calendar.MINUTE, 30);
            resvVO.setSerResvEndDt(cal.getTime());
        }

        if(("I").equals(resvStatCd)){
            /**
             * RO그룹번호(키생성)
             */
            String roGrpNo = roGrpNoIdGenService.getNextStringId();

            resvVO.setRoGrpNo(roGrpNo);
        }

        if(!StringUtil.isEmpty(resvDocNo)) {
            resvVO.setUpdtUsrId(userId);

            if(StringUtil.nullConvert(resvVO.getDlrCd()).equals("") ){
                resvVO.setDlrCd(dlrCd);
            }
            /*------------liuxueying add start-------------*/
            oldVO = reservationReceiptDAO.selectReservationReceiptByNo(resvDocNo);
            if(StringUtils.equals("03",oldVO.getResvTp())){
            	//记录第一次预约确认时间resv_dt
            	if(oldVO.getResvDt() == null){
            		resvVO.setRegUsrId(userId);
            		reservationReceiptDAO.updateReservationResvDtByNo(resvVO);
            	}
            	oldVO = reservationReceiptDAO.selectReservationReceiptByNo(resvDocNo);
            	//fms下单数据状态变化插入SE_0100IS_DCSFMS接口表
            	if( !StringUtils.equals(oldVO.getResvStatCd(),resvStatCd)){
            		resvVO.setResvContacts(resvVO.getDriverNm());
            		resvVO.setResvPhone(resvVO.getDriverHpNo());
            		resvVO.setRegDt(oldVO.getRegDt());
            		resvVO.setResvDt(oldVO.getResvDt());
            		resvVO.setOptDt(oldVO.getResvDt());
            		if(StringUtils.isEmpty(resvVO.getVinNo())){
            			 throw processException("ser.info.notResvVinNO");
            		}
	            	reservationReceiptDAO.insertReservationReceiptIS(resvVO);
            	}
            	
            }
            /*------------liuxueying add end--------------*/
            reservationReceiptDAO.updateReservationReceipt(resvVO);
        } else {

            resvDocNo = resvDocNoIdgenService.getNextStringId();
            resvVO.setResvDocNo(resvDocNo);

            insertReservationReceipt(resvVO);
            //reservationReceiptDAO.insertReservationReceipt(reservationReceiptSaveVO.getReservationReceiptVO());
        }

        ServiceCmmVO serviceCmmVO = new ServiceCmmVO();
        serviceCmmVO.setPreFixId(resvVO.getPreFixId());
        serviceCmmVO.setDocNo(resvVO.getResvDocNo());
        serviceCmmVO.setDriverId(resvVO.getDriverId());
        serviceCmmVO.setDriverNm(resvVO.getDriverNm());
        serviceCmmVO.setVinNo(resvVO.getVinNo());
        serviceCmmVO.setCarRegNo(resvVO.getCarRegNo());
        serviceCmmVO.setSaId(resvVO.getSaId());
        serviceCmmVO.setResvDocNo(resvVO.getResvDocNo());
        serviceCmmVO.setPartReqType("SR");
        serviceCmmVO.setParReqStatCd("01");
        serviceCmmVO.setReadyStatCd("01");

        // 부품 추가/수정/삭제
        servicePartService.multiServicePart(reservationReceiptSaveVO.getServicePartListVO(), serviceCmmVO, true);

        // 공임 추가/수정/삭제
        serviceLaborService.multiServiceLabor(reservationReceiptSaveVO.getServiceLaborListVO(), serviceCmmVO);

        List<CustDemandVO> custDemandList = reservationReceiptSaveVO.getCustDemandListVO();
        TrobleDescVO trobleDescVO = reservationReceiptSaveVO.getTrobleDescVO();
        List<EtcIssueVO> etcIssueList = reservationReceiptSaveVO.getEtcIssueListVO();

        //고객요구사항 추가/수정/삭제
        serviceCommonService.multiCustDemand(custDemandList, resvDocNo, resvVO.getPreFixId());
        //고장서술 추가/수정/삭제
        serviceCommonService.multiTrobleDesc(trobleDescVO, resvDocNo);
        //기타사항 추가/수정/삭제
        serviceCommonService.multiEtcIssue(etcIssueList, resvDocNo, resvVO.getPreFixId());

        
        return resvDocNo;
    }

    public void updateReservationReceipt(ReservationReceiptVO reservationReceiptVO) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        reservationReceiptVO.setDlrCd(dlrCd);
        reservationReceiptVO.setUpdtUsrId(userId);
        ReservationReceiptVO oldVO = reservationReceiptDAO.selectReservationReceiptByNo(reservationReceiptVO.getResvDocNo());
        reservationReceiptDAO.updateReservationReceipt(reservationReceiptVO);

        //예약 부품예류취소 기능.
        if("C".equals(reservationReceiptVO.getResvStatCd())){
            //부품예류취소 실행.
            issueReqDetailService.cancelIssueResvReadyDetails(reservationReceiptVO);
            //요청부품 준비취소 실행.
            issueReqDetailService.cancelIssueResvReadyStatus(reservationReceiptVO);
        }
        //fms下单的预约单数据状态变化插入SE_0100IS_DCSFMS接口表
        ReservationReceiptVO vo = reservationReceiptDAO.selectReservationReceiptByNo(reservationReceiptVO.getResvDocNo());
    	if(StringUtils.isNotEmpty(vo.getFmsId()) && (!StringUtils.equals(vo.getResvStatCd(),oldVO.getResvStatCd()))){
    		if(StringUtils.isEmpty(reservationReceiptVO.getVinNo())){//
    			if("C".equals(reservationReceiptVO.getResvStatCd()) && vo.getResvDt() == null){
    				vo.setResvDt(vo.getUpdtDt());//取消状态的预约单响应时间为取消时间
    			}
    			
    			vo.setResvStatCd(reservationReceiptVO.getResvStatCd());
    			vo.setResvContacts(vo.getDriverNm());
    			vo.setResvPhone(vo.getDriverHpNo());
    			vo.setOptDt(vo.getUpdtDt());
    			reservationReceiptDAO.insertReservationReceiptIS(vo);
    		}/*else{
    			reservationReceiptVO.setResvContacts(oldVO.getDriverNm());
    			reservationReceiptVO.setResvPhone(oldVO.getDriverHpNo());
    			reservationReceiptVO.setRegDt(oldVO.getRegDt());
    			reservationReceiptVO.setResvDt(oldVO.getResvDt());
    			reservationReceiptVO.setOptDt(oldVO.getUpdtDt());
    			reservationReceiptDAO.insertReservationReceiptIS(reservationReceiptVO);
    		}*/
    	}
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public String insertReservationReceipt(ReservationReceiptVO reservationReceiptVO) throws Exception {

        /**
         * 예약번호(키생성)
        */
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        reservationReceiptVO.setRegUsrId(userId);
        reservationReceiptVO.setDlrCd(dlrCd);

        reservationReceiptDAO.insertReservationReceipt(reservationReceiptVO);

        return reservationReceiptVO.getResvDocNo();
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateReservationReceiptByVinNo(ReservationReceiptVO reservationReceiptVO) throws Exception {

         reservationReceiptDAO.updateReservationReceiptByVinNo(reservationReceiptVO);

    }

    /*
     * {@inheritDoc}
     */
    public ReservationReceiptVO selectReservationReceiptByKey(ReservationReceiptSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return reservationReceiptDAO.selectReservationReceiptByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    public ReservationReceiptVO selectReservationReceiptByStats(ReservationReceiptSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return reservationReceiptDAO.selectReservationReceiptByStats(searchVO);
    }

    /**
     * 예약등록시 알람,SMS
     * @param obj - 수정할 정보가 담긴 ReservationReceiptVO
     * @return 등록된 목록수
     */
    public void resvRegAlramCall(List<ReservationReceiptVO> resvList) throws Exception {

        List<NotificationTargetUserVO> targetUsers = null;
        NotificationTargetUserVO targetVO = null;
        String dlrCd = LoginUtil.getDlrCd();
        String loginUsrId = LoginUtil.getUserId();
        String loginUsrNm = LoginUtil.getUserNm();

        for(ReservationReceiptVO resvVO : resvList){
            if(StringUtil.isEmpty(resvVO.getResvSerAlramCd())){ // 예약완성

                ReservationReceiptVO resvCompVO = new ReservationReceiptVO();
                resvCompVO.setResvDocNo(resvVO.getResvDocNo());
                resvCompVO.setDlrCd(dlrCd);
                resvCompVO.setUpdtUsrId(loginUsrId);
                resvCompVO.setResvStatCd(resvVO.getResvStatCd());
                reservationReceiptDAO.updateReservationReceipt(resvCompVO);

            } else {    // 알람시간, 알람자 입력

                ReservationReceiptVO alramVO = new ReservationReceiptVO();
                alramVO.setResvSerAlramCd(resvVO.getResvSerAlramCd());
                alramVO.setResvAlramUsrId(loginUsrId);
                alramVO.setResvAlramUsrNm(loginUsrNm);
                alramVO.setResvDocNo(resvVO.getResvDocNo());
                alramVO.setDlrCd(dlrCd);
                alramVO.setUpdtUsrId(loginUsrId);
                reservationReceiptDAO.updateReservationReceipt(alramVO);

                targetUsers = new ArrayList<NotificationTargetUserVO>();
                targetVO = new NotificationTargetUserVO();
                targetVO.setUsrId(resvVO.getCarOwnerId());
                targetVO.setUsrNm(resvVO.getCarOwnerNm());
                targetVO.setHpNo(resvVO.getDriverHpNo());
                targetVO.setMesgTmplTpList("S");
                targetUsers.add(targetVO);

                String sysCd = Constants.SYS_CD_DLR;
                String alrtPolicyGrpId = "SER-0005";
                String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

                NotificationMessageContext context = new NotificationMessageContext();
                context.getVelocityContext().put("carRegNo", resvVO.getCarRegNo());
                context.getVelocityContext().put("resvDocNo", resvVO.getResvDocNo());
                context.getVelocityContext().put("saNm", StringUtil.isNullToString(resvVO.getSaNm()));
                context.getVelocityContext().put("resvDt", DateUtil.convertToString(resvVO.getSerResvStartDt(), dateFormat + " HH:mm"));
                context.getVelocityContext().put("custNo", resvVO.getCarOwnerId());

                notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);

                if(StringUtil.nullConvert(resvVO.getResvSerAlramCd()).equals("A")){
                    List<SmsMessageIfVO> smsMessageList = new ArrayList<SmsMessageIfVO>();

                    SmsMessageIfVO smsMessageIfVO  = new SmsMessageIfVO();
                    smsMessageIfVO.setDlrCd(dlrCd);
                    smsMessageIfVO.setRegUsrId(loginUsrId);
                    smsMessageIfVO.setAppDstinCd(SmsMessageIfService.APP_DSTN_CD_SERVICE_RESERVATION);
                    smsMessageIfVO.setAppSeq(resvVO.getResvDocNo());
                    smsMessageIfVO.setCustNo(resvVO.getCarOwnerId());
                    smsMessageList.add(smsMessageIfVO);
                    smsMessageIfService.updateSmsMessageCancIF(smsMessageList);

                    Date resvDate = DateUtil.convertToDate(DateUtil.convertToString(DateUtils.addDays(resvVO.getSerResvStartDt(), -1), dateFormat) + " 18:00", dateFormat + " HH:mm");
                    context.setResvDt(DateUtil.convertToString(resvDate, "yyyyMMddHHmm"));
                    context.setAppSeq(resvVO.getResvDocNo());
                    context.setCustNo(resvVO.getCarOwnerId());
                    notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);

                    alrtPolicyGrpId = "SER-0006";
                    context.setResvDt(DateUtil.convertToString(DateUtils.addHours(resvVO.getSerResvStartDt(), -1), "yyyyMMddHHmm"));
                    context.setAppSeq(resvVO.getResvDocNo());
                    context.setCustNo(resvVO.getCarOwnerId());
                    notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
                }
            }
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ReservationReceiptSearchVO searchVO = new ReservationReceiptSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if(!StringUtils.isBlank(params.get("sResvFromDt").toString())){
            String sResvFromDt = params.get("sResvFromDt").toString();
            Date dResvFromDt = DateUtil.convertToDate(sResvFromDt);
            searchVO.setsResvFromDt(dResvFromDt);
        }
        if(!StringUtils.isBlank(params.get("sResvToDt").toString())){
            String sResvToDt = params.get("sResvToDt").toString();
            Date dResvToDt = DateUtil.convertToDate(sResvToDt);
            searchVO.setsResvToDt(dResvToDt);
        }
        if(!StringUtils.isBlank(params.get("sSerResvStartFromDt").toString())){
            String sSerResvStartFromDt = params.get("sSerResvStartFromDt").toString();
            Date dSerResvStartFromDt = DateUtil.convertToDate(sSerResvStartFromDt);
            searchVO.setsSerResvStartFromDt(dSerResvStartFromDt);
        }
        if(!StringUtils.isBlank(params.get("sSerResvStartToDt").toString())){
            String sSerResvStartToDt = params.get("sSerResvStartToDt").toString();
            Date dSerResvStartToDt = DateUtil.convertToDate(sSerResvStartToDt);
            searchVO.setsSerResvStartToDt(dSerResvStartToDt);
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<ReservationReceiptVO> list = selectReservationReceiptListByCondition(searchVO);
        context.putVar("items", list);

    }
}