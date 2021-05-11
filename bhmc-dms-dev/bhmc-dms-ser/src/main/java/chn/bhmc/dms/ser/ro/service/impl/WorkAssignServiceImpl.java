package chn.bhmc.dms.ser.ro.service.impl;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.ro.service.dao.WorkProcessDAO;

import chn.bhmc.dms.ser.ro.vo.*;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkAssignService;
import chn.bhmc.dms.ser.ro.service.dao.WorkAssignDAO;

/**
 * <pre>
 * 작업배정 구현 서비스
 * </pre>
 *
 * @ClassName   : WorkAssignServiceImpl.java
 * @Description : 작업배정 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("workAssignService")
public class WorkAssignServiceImpl extends HService implements WorkAssignService {

    /**
    * 작업배정 DAO
    */
   @Resource(name="workAssignDAO")
   WorkAssignDAO workAssignDAO;

   /**
    * 작업진도관리 DAO
    */
   @Resource(name="workProcessDAO")
   WorkProcessDAO workProcessDAO;

   /**
    * RO 수정 service
    */
   @Resource(name="repairOrderService")
   RepairOrderService repairOrderService;

   /**
    * RO접수 공임 DAO
    */
   @Resource(name="serviceLaborService")
   ServiceLaborService serviceLaborService;

   /**
    * 푸쉬알림 service
    */
   @Autowired
   NotificationMessageService notificationMessageService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


   /**
    * 조회 조건에 해당하는 작업배정 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
    * @return 조회 목록
    */
   @Override
   public List<WorkAssignVO> selectWorkAssignByCondition(WorkAssignSearchVO searchVO) throws Exception {
       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       return workAssignDAO.selectWorkAssignByCondition(searchVO);
   }

   /**
    * 배정 작업 체크 로직 정보
    * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
    * @return 조회 목록
    */
   public WorkAssignVO selectWorkAssignChkStatByKey(WorkAssignSearchVO searchVO) throws Exception{

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       return workAssignDAO.selectWorkAssignChkStatByKey(searchVO);

   }

   /**
    * 조회 조건에 해당하는 작업배정 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
    * @return
    */
   @Override
   public int selectWorkAssignByConditionCnt(WorkAssignSearchVO searchVO) throws Exception {
       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       return workAssignDAO.selectWorkAssignByConditionCnt(searchVO);
   }

    /**
     * 작업배정 정보를 등록한다.
     * @param workAssignVO - 등록할 정보가 담긴 WorkAssignVO
     * @return 등록된 목록수
     */
   @Override
   public int insertWorkAssign(WorkAssignVO workAssignVO) throws Exception {

        workAssignVO.setDlrCd(LoginUtil.getDlrCd());
        workAssignVO.setRegUsrId(LoginUtil.getUserId());
        workAssignVO.setUpdtUsrId(LoginUtil.getUserId());
        return workAssignDAO.insertWorkAssign(workAssignVO);
   }

    /**
     * 작업배정 정보리스트를 등록한다.
     * @param workAssignVO - 등록할 정보가 담긴 WorkAssignVO
     * @return 등록된 목록수
     */
    @Override
    public int insertWorkAssigns(List<WorkAssignVO> workAssignListVO) throws Exception {

        CommonCodeVO commonCodeVO = commonCodeService.selectCommonCodeByService("SER068", "default");

        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(new Date().getTime());

        //삭제후 저장
        for(WorkAssignVO workAssignVO: workAssignListVO){
            workAssignDAO.deleteWorkAssign(workAssignVO);
            if(commonCodeVO != null && StringUtil.nullConvert(commonCodeVO.getCmmCd()).equals("Y")){// 자동시작 : Y
                workAssignVO.setWrkStartDt(calendar.getTime());
                workAssignVO.setWrkStatCd("02");

                // 배정 완료후 자동 수리 시작인경우 작업진도 이력(SE_0330HT)에 데이터 저장 - 20171129
                // SEQ설정
                WorkProcessSearchVO processSearchVO = new WorkProcessSearchVO();
                processSearchVO.setsDlrCd(workAssignVO.getDlrCd());
                processSearchVO.setsRoDocNo(workAssignVO.getRoDocNo());
                //processSearchVO.setsRpirCd(workAssignVO.getRpirCd());
                processSearchVO.setsLineNo(workAssignVO.getLineNo());

                List<WorkProcessVO> list = workProcessDAO.selectWorkProcessByCondition(processSearchVO);
                int seq = list.size()+1;

                // 작업진도 저장
                WorkProcessVO workProcessVO = new WorkProcessVO();
                workProcessVO.setDlrCd(workAssignVO.getDlrCd());
                workProcessVO.setRoDocNo(workAssignVO.getRoDocNo());
                workProcessVO.setLineNo(workAssignVO.getLineNo());
                workProcessVO.setSeq(seq);
                workProcessVO.setBayNo(workAssignVO.getBayNo());
                workProcessVO.setRpirTp(workAssignVO.getRpirTp());
                workProcessVO.setRpirCd(workAssignVO.getRpirCd());
                workProcessVO.setRpirNm(workAssignVO.getRpirNm());
                workProcessVO.setRpirDstinCd(workAssignVO.getRpirDstinCd());
                workProcessVO.setWrkStatCd("02");
                workProcessVO.setQtTestCd(workAssignVO.getQtTestCd());
                workProcessVO.setRealTecId(workAssignVO.getRealTecId());
                workProcessVO.setRealTecNm(workAssignVO.getRealTecNm());
                workProcessVO.setWrkStartDt(calendar.getTime());
                workProcessVO.setWrkEndDt(null);
                workProcessVO.setPlanHm(workAssignVO.getPlanHm());
                workProcessVO.setRegUsrId(LoginUtil.getUserId());
                workProcessVO.setUpdtUsrId(LoginUtil.getUserId());

                workProcessDAO.insertWorkProcess(workProcessVO);

            }
            insertWorkAssign(workAssignVO);
        }

        //RO테이블 상태/배정자 업데이트
        RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
        repairOrderSearchVO.setsDlrCd(workAssignListVO.get(0).getDlrCd());
        repairOrderSearchVO.setsRoDocNo(workAssignListVO.get(0).getRoDocNo());
        RepairOrderVO repairOrderVO = repairOrderService.selectRepairOrderWorkByKey(repairOrderSearchVO);

        WorkAssignSearchVO workAssignSearchVO = new WorkAssignSearchVO();
        workAssignSearchVO.setsDlrCd(workAssignListVO.get(0).getDlrCd());
        workAssignSearchVO.setsRoDocNo(workAssignListVO.get(0).getRoDocNo());
        workAssignSearchVO.setsAllcConfStatCd("03"); //배정완료상태
        workAssignSearchVO.setsWrkConfStatCd("05");  //진도완료상태

        WorkAssignVO workAssignVO = selectWorkAssignChkStatByKey(workAssignSearchVO);


        if(workAssignVO.getAllocYn().equals("Y")){ //배정완료
            repairOrderVO.setAllocStatCd("03");
            if(commonCodeVO != null && StringUtil.nullConvert(commonCodeVO.getCmmCd()).equals("Y")){ // 자동시작 : Y
                repairOrderVO.setWrkStatCd("02"); //수리시작
            } else {
                repairOrderVO.setWrkStatCd("01"); //수리대기
            }
        }else{ //부분배정
            repairOrderVO.setAllocStatCd("02");
            if(commonCodeVO != null && StringUtil.nullConvert(commonCodeVO.getCmmCd()).equals("Y")){
                repairOrderVO.setWrkStatCd("02"); //수리시작
            } else {
                repairOrderVO.setWrkStatCd("01"); //수리대기
            }
        }

        repairOrderVO.setRoStatCd("02");
        repairOrderVO.setSaId(workAssignListVO.get(0).getSaId());
        repairOrderVO.setSaNm(workAssignListVO.get(0).getSaNm());
        repairOrderVO.setBayNo(workAssignListVO.get(0).getBayNo());
        repairOrderVO.setTecId(workAssignListVO.get(0).getRealTecId());
        repairOrderVO.setTecNm(workAssignListVO.get(0).getRealTecNm());
        repairOrderVO.setPaintColorCd(workAssignListVO.get(0).getPaintColorCd());
        repairOrderVO.setCarColorCd(workAssignListVO.get(0).getCarColorCd());
        repairOrderVO.setPaintTp(workAssignListVO.get(0).getPaintTp());
        repairOrderVO.setExpcDlDt(workAssignListVO.get(0).getExpcDlDt());
        repairOrderService.updateRepairOrder(repairOrderVO);

        // 정비항목 배정공임 업데이트
        if(workAssignListVO.get(0).getAllocHm() != workAssignListVO.get(0).getDstbHm()) {
            ServiceLaborVO serviceLaborVO = new ServiceLaborVO();
            serviceLaborVO.setDlrCd(workAssignListVO.get(0).getDlrCd());
            serviceLaborVO.setDocNo(workAssignListVO.get(0).getRoDocNo());
            serviceLaborVO.setDstbHm(workAssignListVO.get(0).getAllocHm());
            serviceLaborVO.setLbrCd(workAssignListVO.get(0).getRpirCd());
            serviceLaborService.updateDstbHm(serviceLaborVO);
        }


        if(workAssignListVO.get(0).getExpcDlDt() != null && !repairOrderVO.getExpcDlDt().equals(workAssignListVO.get(0).getExpcDlDt())) {
            List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
            NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
            targetVO.setUsrId(workAssignListVO.get(0).getSaId());
            targetVO.setUsrNm(workAssignListVO.get(0).getSaNm());
            targetVO.setMesgTmplTpList("W,S");

            targetUsers.add(targetVO);
            String sysCd = Constants.SYS_CD_DLR;
            String alrtPolicyGrpId = "SER-0002";
            String dlrCd = LoginUtil.getDlrCd();

            NotificationMessageContext context = new NotificationMessageContext();
            notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);

            repairOrderVO.setChgExpcDlDt(workAssignListVO.get(0).getExpcDlDt());
        }
        return 1;
    }

   /**
    * 작업배정 정보를 취소한다.
    * @param workAssignVO - 수정할 정보가 담긴 WorkAssignVO
    * @return 수정된 목록수
    */
   public int cancelWorkAssign(List<WorkAssignVO> workAssignListVO) throws Exception {

       String dlrCd = LoginUtil.getDlrCd();
       //RO테이블 상태/배정자 업데이트
       RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
       repairOrderSearchVO.setsDlrCd(dlrCd);
       repairOrderSearchVO.setsRoDocNo(workAssignListVO.get(0).getRoDocNo());

       RepairOrderVO repairOrderVO = repairOrderService.selectRepairOrderWorkByKey(repairOrderSearchVO);

       WorkAssignSearchVO workAssignSearchVO = new WorkAssignSearchVO();
       workAssignSearchVO.setsDlrCd(dlrCd);
       workAssignSearchVO.setsRoDocNo(workAssignListVO.get(0).getRoDocNo());
       workAssignSearchVO.setsCancelChkYn("Y");
       workAssignSearchVO.setsWrkConfStatCd("01"); //진도 취소 가능 여부

       int lbrCdCnt=0;
       StringBuffer lbrSb = new StringBuffer("");
       for(WorkAssignVO workAssignVO : workAssignListVO){
           if(lbrCdCnt == 0 ) {
              lbrSb.append(workAssignVO.getRpirCd());
          }else {
              lbrSb.append(",");
              lbrSb.append(workAssignVO.getRpirCd());
          }
           lbrCdCnt++;
       }
       workAssignSearchVO.setsRpipGrpCd(lbrSb.toString());

       WorkAssignVO workAssignVO = selectWorkAssignChkStatByKey(workAssignSearchVO);

       if(StringUtils.defaultString(workAssignVO.getWrkYn(), "").equals("N")){
           CommonCodeVO codeVO = commonCodeService.selectCommonCodeByKey("SER050", repairOrderVO.getWrkStatCd());
           String[] lblList = new String[3];
           lblList[0] = repairOrderVO.getRoDocNo();
           lblList[1] = messageSource.getMessage("par.lbl.cancel", null, LocaleContextHolder.getLocale());
           lblList[2] = codeVO.getCmmCdNm();
           throw processException("ser.info.impos", lblList);
       }

       // 정비항목 배정공임 재업데이트
       /*
        *  for(WorkAssignVO vo : workAssignListVO){
               ServiceLaborVO serviceLaborVO = new ServiceLaborVO();
               serviceLaborVO.setDlrCd(vo.getDlrCd());
               serviceLaborVO.setDocNo(vo.getRoDocNo());
               serviceLaborVO.setDstbHm(vo.getDstbHm());
               serviceLaborVO.setLbrCd(vo.getRpirCd());
               serviceLaborService.updateDstbHmBack(serviceLaborVO);
           }
       */

       for(WorkAssignVO vo : workAssignListVO){
           workAssignDAO.deleteWorkAssign(vo);
       }

       WorkAssignSearchVO searchVO = new WorkAssignSearchVO();
       searchVO.setsDlrCd(dlrCd);
       searchVO.setsRoDocNo(workAssignListVO.get(0).getRoDocNo());
       searchVO.setsAllocYn("Y");
       int assignedWorkCnt = workAssignDAO.selectWorkAssignByConditionCnt(searchVO);

       if(assignedWorkCnt == 0){
           repairOrderVO.setAllocStatCd("01");
           repairOrderVO.setRoStatCd("01");
       } else {
           repairOrderVO.setAllocStatCd("02");
           repairOrderVO.setRoStatCd("02");
       }

       repairOrderService.updateRepairOrder(repairOrderVO);

       return 1;
   }

    /**
     * 작업배정 정보를 수정한다.
     * @param workAssignVO - 수정할 정보가 담긴 WorkAssignVO
     * @return 수정된 목록수
     */
    @Override
    public int updateWorkAssign(WorkAssignVO workAssignVO) throws Exception {
        workAssignVO.setDlrCd(LoginUtil.getDlrCd());
        workAssignVO.setUpdtUsrId(LoginUtil.getUserId());

        return workAssignDAO.updateWorkAssign(workAssignVO);
    }

    @Override
    public int deleteWorkAssign(WorkAssignVO vo) throws Exception {
        workAssignDAO.deleteWorkAssign(vo);

        return 1;
    }



   /**
    * 조회 조건에 해당하는 작업배정 키정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
    * @return 조회 목록
    */
   @Override
   public WorkAssignVO selectWorkAssignByKey(WorkAssignSearchVO searchVO) throws Exception {
       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       return workAssignDAO.selectWorkAssignByKey(searchVO);
   }

   /**
     * 임률관리 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiWorkAssigns(BaseSaveVO<WorkAssignVO> obj) throws Exception {
       insertWorkAssigns(obj.getInsertList());

   }

}
