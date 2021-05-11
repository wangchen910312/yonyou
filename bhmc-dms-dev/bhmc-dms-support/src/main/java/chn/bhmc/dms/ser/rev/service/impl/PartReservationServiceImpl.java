package chn.bhmc.dms.ser.rev.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.rev.service.PartReservationService;
import chn.bhmc.dms.ser.rev.service.dao.PartReservationDAO;
import chn.bhmc.dms.ser.rev.vo.PartReservationSaveVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationSearchVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationServiceImpl.java
 * @Description : 부품예약 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 5. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("partReservationService")
public class PartReservationServiceImpl extends HService implements PartReservationService, JxlsSupport  {

    /**
     * 예약접수 DAO
     */
    @Resource(name="partReservationDAO")
    PartReservationDAO partReservationDAO;

    /**
     * 부품공통 Service
     */
    @Resource(name="servicePartService")
    ServicePartService servicePartService;

    @Resource(name="parResvDocNoIdGenService")
    TableIdGenService parResvDocNoIdGenService;

    @Resource(name="serviceCommonService")
    ServiceCommonService serviceCommonService;

    /**
     * 메세지 알림 서비스
     */
    @Autowired
    NotificationMessageService notificationMessageService;

    /**
     * 부품요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectPartReservationByConditionCnt(PartReservationSearchVO searchVO) throws Exception {

        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return partReservationDAO.selectPartReservationByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<PartReservationVO> selectPartReservationByCondition(PartReservationSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<PartReservationVO> resvList = partReservationDAO.selectPartReservationByCondition(searchVO);

        return resvList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String multiPartReservation(PartReservationSaveVO partReservationSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        PartReservationVO resvVO = partReservationSaveVO.getPartReservationVO();
        String parResvDocNo = resvVO.getParResvDocNo();


        if(!StringUtil.isEmpty(parResvDocNo)) {
            resvVO.setUpdtUsrId(userId);
            partReservationDAO.updatePartReservation(resvVO);
        } else {
            /**
             * 예약번호(키생성)
             */
            parResvDocNo = parResvDocNoIdGenService.getNextStringId();

            resvVO.setRegUsrId(userId);
            resvVO.setParResvDocNo(parResvDocNo);
            resvVO.setDlrCd(dlrCd);
            partReservationDAO.insertPartReservation(resvVO);
        }

        ServiceCmmVO serviceCmmVO = new ServiceCmmVO();
        serviceCmmVO.setPreFixId(resvVO.getPreFixId());
        serviceCmmVO.setDocNo(resvVO.getParResvDocNo());
        serviceCmmVO.setDriverId(resvVO.getDriverId());
        serviceCmmVO.setDriverNm(resvVO.getDriverNm());
        serviceCmmVO.setVinNo(resvVO.getVinNo());
        serviceCmmVO.setCarRegNo(resvVO.getCarRegNo());
        //serviceCmmVO.setSaId(resvVO.getSaId());
        serviceCmmVO.setResvDocNo(resvVO.getParResvDocNo());
        serviceCmmVO.setPartReqType("SP");
        serviceCmmVO.setParReqStatCd("01");
        serviceCmmVO.setReadyStatCd("01");

        // 부품 추가/수정/삭제
        servicePartService.multiServicePart(partReservationSaveVO.getServicePartListVO(), serviceCmmVO, true);

        List<CustDemandVO> custDemandList = partReservationSaveVO.getCustDemandListVO();
        List<EtcIssueVO> etcIssueList = partReservationSaveVO.getEtcIssueListVO();

        //고객요구사항 추가/수정/삭제
        serviceCommonService.multiCustDemand(custDemandList, parResvDocNo, resvVO.getPreFixId());

        //기타사항 추가/수정/삭제
        serviceCommonService.multiEtcIssue(etcIssueList, parResvDocNo, resvVO.getPreFixId());

        return parResvDocNo;
    }

    /**
     *
     * 고객요구사항 저장
     *
     * @param custDemandList
     * @param estDocNo
     * @throws Exception
     */
    public void multiCustDemand( List<CustDemandVO> custDemandList,String resvDocNo  )throws Exception{

        serviceCommonService.multiCustDemand(custDemandList, resvDocNo, "PRE");

    }

    public void updatePartReservation(PartReservationVO partReservationVO) throws Exception {
        String userId = LoginUtil.getUserId();
        partReservationVO.setUpdtUsrId(userId);
        partReservationDAO.updatePartReservation(partReservationVO);

        //예약 부품예류취소 기능.
        if("C".equals(partReservationVO.getParResvStatCd())){
            //부품예류취소 실행.
            issueReqDetailService.cancelIssueResvReadyDetails(partReservationVO);
            //요청부품 준비취소 실행.
            issueReqDetailService.cancelIssueResvReadyStatus(partReservationVO);
        }

    }

    /*
     * {@inheritDoc}
     */
    public PartReservationVO selectPartReservationByKey(PartReservationSearchVO searchVO) throws Exception {
        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return partReservationDAO.selectPartReservationByKey(searchVO);
    }

    /**
     * 부품예약등록시 알람,SMS
     * @param obj - 수정할 정보가 담긴 ReservationReceiptVO
     * @return 등록된 목록수
     */
    public void partArrivalAlramCall(PartReservationVO resvVO) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();
        String itemsNm = "";

        TabInfoSearchVO searchVO = new TabInfoSearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsPreFixId("PRE");
        searchVO.setsDocNo(resvVO.getParResvDocNo());
        List<ServicePartVO> partList = servicePartService.selectServicePartsByCondition(searchVO);

        for(ServicePartVO partVO : partList){
            itemsNm += partVO.getItemNm() + ",";
        }

        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();

        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
        targetVO.setUsrId(resvVO.getCarOwnerId());
        targetVO.setUsrNm(resvVO.getCarOwnerNm());
        targetVO.setMesgTmplTpList("S");
        targetVO.setHpNo(resvVO.getDriverHpNo());
        targetUsers.add(targetVO);

        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "SER-0003";

        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("carRegNo", resvVO.getCarRegNo());
        context.getVelocityContext().put("resvDocNo", resvVO.getParResvDocNo());
        context.getVelocityContext().put("custNo", resvVO.getCarOwnerId());
        context.getVelocityContext().put("itemsNm", itemsNm);

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);

        // 부품예약알람시간 update
        PartReservationVO partReservationVO = new PartReservationVO();
        String userId = LoginUtil.getUserId();
        partReservationVO.setUpdtUsrId(userId);
        partReservationVO.setAlarmYn("Y");
        partReservationVO.setParResvDocNo(resvVO.getParResvDocNo());
        partReservationDAO.updatePartReservation(partReservationVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String completePartReservation(PartReservationVO partReservationVO) throws Exception {
        String userId = LoginUtil.getUserId();
        String parResvDocNo = partReservationVO.getParResvDocNo();

        PartReservationSearchVO searchVO = new PartReservationSearchVO();
        searchVO.setsParResvDocNo(parResvDocNo);
        PartReservationVO checkVO = partReservationDAO.selectPartReservationByKey(searchVO);

        if(checkVO.getParResvStatCd().equals("R")){
            PartReservationVO sendVO = new PartReservationVO();
            sendVO.setParResvDocNo(parResvDocNo);
            sendVO.setPreAmt(partReservationVO.getPreAmt());
            sendVO.setParResvStatCd("F");
            sendVO.setUpdtUsrId(userId);
            partReservationDAO.updatePartReservation(sendVO);
        }else{
            throw processException("par.info.checkStatus");
        }

        return parResvDocNo;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        PartReservationSearchVO searchVO = new PartReservationSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if(!StringUtils.isBlank(params.get("sParResvStartDt").toString())){
            String sSerResvStartFromDt = params.get("sParResvStartDt").toString();
            Date dSerResvStartFromDt = DateUtil.convertToDate(sSerResvStartFromDt);
            searchVO.setsParResvStartDt(dSerResvStartFromDt);
        }
        if(!StringUtils.isBlank(params.get("sParResvEndDt").toString())){
            String sSerResvStartToDt = params.get("sParResvEndDt").toString();
            Date dSerResvStartToDt = DateUtil.convertToDate(sSerResvStartToDt);
            searchVO.setsParResvEndDt(dSerResvStartToDt);
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<PartReservationVO> list = selectPartReservationByCondition(searchVO);
        context.putVar("items", list);

    }
}