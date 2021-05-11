package chn.bhmc.dms.ser.ro.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkAssignService;
import chn.bhmc.dms.ser.ro.service.WorkPauseService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;
import chn.bhmc.dms.ser.ro.service.dao.WorkAssignDAO;
import chn.bhmc.dms.ser.ro.service.dao.WorkProcessDAO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.ro.vo.VedioChannelApplyVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignVO;
import chn.bhmc.dms.ser.ro.vo.WorkPauseVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSaveVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessVO;

/**
 * <pre>
 * 작업진도관리 구현 서비스
 * </pre>
 *
 * @ClassName : WorkProcessServiceImpl.java
 * @Description : 작업진도관리 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("workProcessService")
public class WorkProcessServiceImpl extends HService implements
		WorkProcessService {

	/**
	 * 작업진도관리 DAO
	 */
	@Resource(name = "workProcessDAO")
	WorkProcessDAO workProcessDAO;

	/**
    * 작업배정 DAO
    */
   @Resource(name="workAssignDAO")
   WorkAssignDAO workAssignDAO;
	   
	/**
	 * RO 수정 service
	 */
	@Resource(name = "repairOrderService")
	RepairOrderService repairOrderService;

	/**
	 * 배정 service
	 */
	@Resource(name = "workAssignService")
	WorkAssignService workAssignService;

	/**
	 * 작업중지 service
	 */
	@Resource(name = "workPauseService")
	WorkPauseService workPauseService;

	@Resource(name = "notificationMessageService")
	NotificationMessageService notificationMessageService;

	/**
	 * To-Do service
	 */
	@Resource(name = "todoInfoService")
	TodoInfoService todoInfoService;

	@Resource(name = "commonCodeService")
	CommonCodeService commonCodeService;

	@Resource(name = "issueReqService")
	IssueReqService issueReqService;

   /**
    * 고객요구사항 및 고장설명
    */
   @Autowired
   ServiceCommonService serviceCommonService;
	   
	/**
	 * 조회 조건에 해당하는 작업진도관리 정보를 조회한다.
	 * 
	 * @param searchVO
	 *            - 조회 조건을 포함하는 WorkProcessSearchVO
	 * @return 조회 목록
	 */
	@Override
	public List<WorkProcessVO> selectWorkProcessByCondition(
			WorkProcessSearchVO searchVO) throws Exception {
		if (StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")) {
			searchVO.setsDlrCd(LoginUtil.getDlrCd());
		}
		return workProcessDAO.selectWorkProcessByCondition(searchVO);
	}

	/**
	 * 조회 조건에 해당하는 작업진도관리 총 갯수를 조회한다.
	 * 
	 * @param searchVO
	 *            - 조회 조건을 포함하는 WorkProcessSearchVO
	 * @return
	 */
	@Override
	public int selectWorkProcessByConditionCnt(WorkProcessSearchVO searchVO)
			throws Exception {
		if (StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")) {
			searchVO.setsDlrCd(LoginUtil.getDlrCd());
		}
		return workProcessDAO.selectWorkProcessByConditionCnt(searchVO);
	}

	/**
	 * 정비 중지 관련 수정
	 * 
	 * @param searchVO
	 *            - 조회 조건을 포함하는 WorkProcessSearchVO
	 * @return
	 */
	public void updatePauseWorkProcess(WorkProcessSaveVO saveVO)
			throws Exception {

		List<WorkPauseVO> workPauseListVO = saveVO.getWorkPauseListVO();
		List<WorkProcessVO> workProcessListVO = saveVO.getWorkProcessListVO();

		// 작업중지 정보 업데이트
		if (workPauseListVO.size() > 0) {
			workPauseService.insertWorkPauses(workPauseListVO);
		}

		// 정비진도 프로세스
		insertWorkProcesss(workProcessListVO);
	}

	/**
	 * 작업진도관리 정보를 등록한다.
	 * 
	 * @param workProcessVO
	 *            - 등록할 정보가 담긴 WorkProcessVO
	 * @return 등록된 목록수
	 */
	@Override
	public String insertWorkProcess(WorkProcessVO workProcessVO)
			throws Exception {

		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(new Date().getTime());

		String roStatCd = "";
		// 페인트및작업관리
		if (StringUtils.defaultString(workProcessVO.getType(), "").equals("01")
				|| StringUtils.defaultString(workProcessVO.getType(), "")
						.equals("04")) {

			// RO테이블
			RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
			repairOrderSearchVO.setsDlrCd(workProcessVO.getDlrCd());
			repairOrderSearchVO.setsRoDocNo(workProcessVO.getRoDocNo());

			RepairOrderVO repairOrderVO = repairOrderService
					.selectRepairOrderWorkByKey(repairOrderSearchVO);

			if (StringUtil.nullConvert(repairOrderVO.getAllocStatCd()).equals(
					"01")) {
				throw processException("ser.info.notStartWorkProc");
			}

			// SEQ설정
			WorkProcessSearchVO processSearchVO = new WorkProcessSearchVO();
			processSearchVO.setsDlrCd(workProcessVO.getDlrCd());
			processSearchVO.setsRoDocNo(workProcessVO.getRoDocNo());
			// processSearchVO.setsRpirCd(workProcessVO.getRpirCd());
			processSearchVO.setsLineNo(workProcessVO.getLineNo());

			List<WorkProcessVO> list = workProcessDAO
					.selectWorkProcessByCondition(processSearchVO);
			int seq = list.size() + 1;

			// 작업진도 저장
			workProcessVO.setRegUsrId(LoginUtil.getUserId());
			workProcessVO.setUpdtUsrId(LoginUtil.getUserId());
			workProcessVO.setSeq(seq);
			workProcessVO.setWrkStartDt(calendar.getTime());
			if (StringUtils.defaultString(workProcessVO.getType(), "").equals(
					"01")) {
				workProcessVO.setPaintStatCd(workProcessVO.getWrkStatCd());
			}
			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("05")) {
				workProcessVO.setWrkEndDt(calendar.getTime());
			} else if (workProcessVO.getWrkStatCd().equals("01")) {
				workProcessVO.setWrkEndDt(null);
				workProcessVO.setWrkStartDt(null);
			}

			workProcessDAO.insertWorkProcess(workProcessVO);

			// 전 작업 종료일자 업데이트
			WorkProcessVO vo = new WorkProcessVO();
			vo.setDlrCd(workProcessVO.getDlrCd());
			vo.setRoDocNo(workProcessVO.getRoDocNo());
			vo.setRpirCd(workProcessVO.getRpirCd());
			vo.setUpdtUsrId(LoginUtil.getUserId());
			vo.setSeq(list.size());
			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("01")) {
				vo.setWrkEndDt(null);
			} else {
				vo.setWrkEndDt(calendar.getTime());
			}

			workProcessDAO.updateWorkProcess(vo);

			// 배정테이블 업테이트
			WorkAssignVO workAssignVO = new WorkAssignVO();
			workAssignVO.setDlrCd(workProcessVO.getDlrCd());
			workAssignVO.setRoDocNo(workProcessVO.getRoDocNo());
			workAssignVO.setRpirCd(workProcessVO.getRpirCd());

			String pauseCauCd = !(StringUtil.nullConvert(workProcessVO
					.getPauseCauCd()).equals("")) ? workProcessVO
					.getPauseCauCd() : "";
			String pauseCauRmk = !(StringUtil.nullConvert(workProcessVO
					.getPauseCauRmk()).equals("")) ? workProcessVO
					.getPauseCauRmk() : "";

			workAssignVO.setPauseCauCd(pauseCauCd);
			workAssignVO.setPauseCauRmk(pauseCauRmk);

			if (StringUtils.defaultString(workProcessVO.getType(), "").equals(
					"04")) {
				workAssignVO.setWrkStatCd(workProcessVO.getWrkStatCd());
			}
			// 배정테이블 페인트상태 업데이트
			if (StringUtils.defaultString(workProcessVO.getType(), "").equals(
					"01")) {
				workAssignVO.setPaintStatCd(workProcessVO.getWrkStatCd());
			}

			// 배정테이블 시작일자 업데이트
			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("02")) {
				repairOrderVO.setWrkStatCd("02");
				workAssignVO.setWrkStartDt(calendar.getTime());
				repairOrderService.updateRepairOrder(repairOrderVO);
			}

			// 배정테이블 종료일자 업데이트
			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("05")) {
				workAssignVO.setWrkEndDt(calendar.getTime());
			}

			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("01")) {
				workAssignVO.setWrkStartDt(null);
				workAssignVO.setWrkEndDt(null);
			}

			// 작업재개 업데이트
			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("04")) {

				if (workProcessVO.getChgExpcDlDt() != null) {
					List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
					NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
					targetVO.setUsrId(repairOrderVO.getSaId());
					targetVO.setUsrNm(repairOrderVO.getSaNm());
					targetVO.setMesgTmplTpList("W");

					targetUsers.add(targetVO);
					String sysCd = Constants.SYS_CD_DLR;
					String alrtPolicyGrpId = "SER-0002";
					String dlrCd = LoginUtil.getDlrCd();

					NotificationMessageContext context = new NotificationMessageContext();

					notificationMessageService.sendNotificationMessage(sysCd,
							alrtPolicyGrpId, dlrCd, context, targetUsers);
				}

				workAssignVO.setWrkEndDt(workProcessVO.getWrkEndDt());
				workAssignVO.setPauseCauCd("");
				workAssignVO.setPauseCauRmk("");

				repairOrderVO.setWrkStatCd("02");
				repairOrderVO.setChgExpcDlDt(workProcessVO.getChgExpcDlDt());
				repairOrderService.updateRepairOrder(repairOrderVO);
			}
			workAssignService.updateWorkAssign(workAssignVO);
			// RO테이블 작업시작일자 업데이트
			if (repairOrderVO.getRoStartDt() == null) {
				repairOrderService.updateRepairOrder(repairOrderVO);
			}

			// RO테이블 페이트상태 업데이트
			if (StringUtils.defaultString(workProcessVO.getType(), "").equals(
					"01")) {
				repairOrderVO.setPaintStatCd(workProcessVO.getWrkStatCd());
				repairOrderService.updateRepairOrder(repairOrderVO);
			}

			WorkAssignSearchVO workAssignSearchVO = new WorkAssignSearchVO();
			workAssignSearchVO.setsDlrCd(workProcessVO.getDlrCd());
			workAssignSearchVO.setsRoDocNo(workProcessVO.getRoDocNo());
			workAssignSearchVO.setsWrkConfStatCd("05"); // 진도완료상태

			WorkAssignVO workVO = workAssignService
					.selectWorkAssignChkStatByKey(workAssignSearchVO);

			// 작업중지시 RO 헤더 상태 업데이트
			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("03")) {

				repairOrderVO.setWrkStatCd("03");
				repairOrderVO.setChgExpcDlDt(workProcessVO.getChgExpcDlDt());
				repairOrderService.updateRepairOrder(repairOrderVO);

				try {

					String todoMsg = "";

					TodoInfoVO todoInfoVO = new TodoInfoVO();
					todoMsg = messageSource.getMessage(
							"ser.lbl.roWrkProcStopped",
							new String[] { workProcessVO.getRoDocNo() },
							Locale.CHINA);

					todoInfoVO.setTodoPolicyId("TD-P-00010");
					todoInfoVO.setTodoDesc(todoMsg);
					todoInfoVO.setActionParams("roDocNo="
							+ workProcessVO.getRoDocNo() + "&infoType=RO");
					todoInfoVO.setRegUsrId("SYSTEM");
					todoInfoVO.getAppendUsers().add(
							new TodoInfoAppendUserVO(repairOrderVO.getSaId()));

					todoInfoService.insertTodoInfo(todoInfoVO);
				} catch (Exception e) {
					throw new BizException(e.getMessage());
				}
			}

			// 전부 작업 정비완료상태지 판단 전부 완료면 RO테이블 공정완료상태로 업데이트
			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("05")) {

				IssueReqVO issueReqVO = issueReqService.selectIssueReqByKey(
						workProcessVO.getDlrCd(), "",
						workProcessVO.getRoDocNo(), "RO");

				if (issueReqVO != null) {
					// 부품차용상태가 02, 06일경우 작업완료할수 없음
					if (StringUtils.defaultString(issueReqVO.getBorrowStatCd(),
							"").equals("02")
							|| StringUtils.defaultString(
									issueReqVO.getBorrowStatCd(), "").equals(
									"06")) {
						CommonCodeVO codeVO = commonCodeService
								.selectCommonCodeByKey("PAR305",
										issueReqVO.getBorrowStatCd());
						String[] lblList = new String[3];
						lblList[0] = repairOrderVO.getRoDocNo();
						lblList[1] = messageSource.getMessage("ser.btn.lbrEnd",
								null, LocaleContextHolder.getLocale());
						lblList[2] = codeVO.getCmmCdNm();
						throw processException("ser.info.doNotWrkProc", lblList);
					}
				}

				if (StringUtils.defaultString(workVO.getWrkYn(), "")
						.equals("Y")) {

					if (StringUtil.nullConvert(repairOrderVO.getQtTestMthCd())
							.equals("02")
							&& StringUtil.nullConvert(
									repairOrderVO.getCarWashTp()).equals("04")) {
						repairOrderVO.setDlStatCd("01");
					} else if (StringUtil.nullConvert(
							repairOrderVO.getQtTestMthCd()).equals("02")
							&& !StringUtil.nullConvert(
									repairOrderVO.getCarWashTp()).equals("04")) {
						repairOrderVO.setDlStatCd("01");
					} else if (StringUtil.nullConvert(
							repairOrderVO.getQtTestMthCd()).equals("01")) {
						repairOrderVO.setQtTestStatCd("Q5");
					}
					repairOrderVO.setWrkStatCd("05"); // 진행상태
					repairOrderService.updateRepairOrder(repairOrderVO);
				}
			}

			// 작업취소시 RO업데이트
			if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
					.equals("01")) {

				if (!StringUtil.isEmpty(repairOrderVO.getQtTestStatCd())
						&& !(StringUtil.nullConvert(repairOrderVO
								.getQtTestStatCd())).equals("Q5")) {
					CommonCodeVO codeVO = commonCodeService
							.selectCommonCodeByKey("SER052",
									repairOrderVO.getQtTestStatCd());
					String[] lblList = new String[3];
					lblList[0] = repairOrderVO.getRoDocNo();
					lblList[1] = messageSource.getMessage("par.lbl.cancel",
							null, LocaleContextHolder.getLocale());
					lblList[2] = codeVO.getCmmCdNm();
					throw processException("ser.info.impos", lblList);
				}

				if (StringUtil.nullConvert(repairOrderVO.getRoStatCd()).equals(
						"03")
						|| StringUtil.nullConvert(repairOrderVO.getRoStatCd())
								.equals("04")
						|| StringUtil.nullConvert(repairOrderVO.getRoStatCd())
								.equals("05")
						|| StringUtil.nullConvert(repairOrderVO.getRoStatCd())
								.equals("00")) {
					CommonCodeVO codeVO = commonCodeService
							.selectCommonCodeByKey("SER030",
									repairOrderVO.getRoStatCd());
					String[] lblList = new String[3];
					lblList[0] = repairOrderVO.getRoDocNo();
					lblList[1] = messageSource.getMessage("par.lbl.cancel",
							null, LocaleContextHolder.getLocale());
					lblList[2] = codeVO.getCmmCdNm();
					throw processException("ser.info.impos", lblList);
				}

				workAssignVO.setWrkStatCd(workProcessVO.getWrkStatCd());
				workAssignVO.setWrkStartDt(null);
				workAssignVO.setWrkEndDt(null);

				workAssignService.updateWorkAssign(workAssignVO);
				repairOrderVO.setWrkStatCd("01"); // 진행상태
				repairOrderService.updateRepairOrder(repairOrderVO);
			}
			roStatCd = repairOrderVO.getRoStatCd();
			// 세차및품질관리
		} else {
			// 세차관리
			if (StringUtils.defaultString(workProcessVO.getType(), "").equals(
					"03")) {

				// RO테이블
				RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
				repairOrderSearchVO.setsRoGrpNo(workProcessVO.getRoGrpNo());
				repairOrderSearchVO.setsDlrCd(workProcessVO.getDlrCd());

				List<RepairOrderVO> repairOrderList = repairOrderService
						.selectRepairOrderByCondition(repairOrderSearchVO);
				RepairOrderVO repairOrderVO = new RepairOrderVO();
				repairOrderVO.setCarWashStatCd(workProcessVO.getWrkStatCd());
				Calendar cal = Calendar.getInstance();

				if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
						.equals("W2")) { // 세차완료
					repairOrderVO.setCarWashEndDt(calendar.getTime());
					repairOrderVO.setDlStatCd("01");
				} else if (StringUtils.defaultString(
						workProcessVO.getWrkStatCd(), "").equals("W1")) { // 세차시작
					repairOrderVO.setCarWashStartDt(calendar.getTime());
					// 서비스 예약종료일자가 null일 경우 시작일자+30분
					cal.setTime(calendar.getTime());
					cal.add(Calendar.MINUTE, 30);
					repairOrderVO.setExpcDlDt(cal.getTime());
					repairOrderVO.setCarWashPrsnCd(workProcessVO
							.getCarWashPrsnCd());
					repairOrderVO.setCarWashPrsnNm(workProcessVO
							.getCarWashPrsnNm());
				} else if (StringUtils.defaultString(
						workProcessVO.getWrkStatCd(), "").equals("W3")) { // 세차취소
					for (RepairOrderVO roVO : repairOrderList) {
						if (StringUtil.nullConvert(roVO.getDlStatCd()).equals(
								"02")) {
							CommonCodeVO codeVO = commonCodeService
									.selectCommonCodeByKey("SER057",
											roVO.getDlStatCd());
							String[] lblList = new String[3];
							lblList[0] = repairOrderVO.getRoDocNo();
							lblList[1] = messageSource.getMessage(
									"par.lbl.cancel", null,
									LocaleContextHolder.getLocale());
							lblList[2] = codeVO.getCmmCdNm();
							throw processException("ser.info.impos", lblList);
						}

						if (StringUtils.defaultString(roVO.getRoStatCd(), "")
								.equals("03")
								|| StringUtils.defaultString(
										roVO.getRoStatCd(), "").equals("04")
								|| StringUtils.defaultString(
										roVO.getRoStatCd(), "").equals("05")) {
							CommonCodeVO codeVO = commonCodeService
									.selectCommonCodeByKey("SER030",
											roVO.getRoStatCd());
							String[] lblList = new String[3];
							lblList[0] = repairOrderVO.getRoDocNo();
							lblList[1] = messageSource.getMessage(
									"par.lbl.cancel", null,
									LocaleContextHolder.getLocale());
							lblList[2] = codeVO.getCmmCdNm();
							throw processException("ser.info.impos", lblList);
						}
						roStatCd = roVO.getRoStatCd();
					}
					repairOrderVO.setCarWashCancDt(calendar.getTime());
					repairOrderVO.setCarWashCancPrsnCd(LoginUtil.getUserId());
					repairOrderVO.setCarWashCancPrsnNm(LoginUtil.getUserNm());
					repairOrderVO.setCarWashCancReasonCd(workProcessVO
							.getCarWashCancReasonCd());
					repairOrderVO.setCarWashCancReasonCont(workProcessVO
							.getCarWashCancReasonCont());
					repairOrderVO.setCarWashStartDt(null);
					repairOrderVO.setCarWashEndDt(null);
				} else if (StringUtils.defaultString(
						workProcessVO.getWrkStatCd(), "").equals("W4")) { // 세차대기
					// repairOrderVO.setCarWashCancDt(calendar.getTime());
				}
				repairOrderVO.setRoGrpNo(workProcessVO.getRoGrpNo());
				repairOrderService.updateRepairOrder(repairOrderVO);
				// 품질관리
			} else if (StringUtils.defaultString(workProcessVO.getType(), "")
					.equals("02")) {

				// RO테이블
				RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
				repairOrderSearchVO.setsDlrCd(workProcessVO.getDlrCd());
				repairOrderSearchVO.setsRoDocNo(workProcessVO.getRoDocNo());

				RepairOrderVO repairOrderVO = repairOrderService
						.selectRepairOrderWorkByKey(repairOrderSearchVO);

				if (StringUtil.nullConvert(repairOrderVO.getRoStatCd()).equals(
						"03")
						|| StringUtil.nullConvert(repairOrderVO.getRoStatCd())
								.equals("04")
						|| StringUtil.nullConvert(repairOrderVO.getRoStatCd())
								.equals("05")) {
					CommonCodeVO codeVO = commonCodeService
							.selectCommonCodeByKey("SER030",
									repairOrderVO.getRoStatCd());
					String[] lblList = new String[3];
					lblList[0] = repairOrderVO.getRoDocNo();
					lblList[1] = messageSource.getMessage("par.lbl.cancel",
							null, LocaleContextHolder.getLocale());
					lblList[2] = codeVO.getCmmCdNm();
					throw processException("ser.info.impos", lblList);
				}

				WorkAssignVO workAssignVO = new WorkAssignVO();
				workAssignVO.setDlrCd(workProcessVO.getDlrCd());
				workAssignVO.setRoDocNo(workProcessVO.getRoDocNo());
				workAssignVO.setRpirCd(workProcessVO.getRpirCd());
				workAssignVO.setQtTestStatCd(workProcessVO.getWrkStatCd());
				workAssignVO.setRwrkStatCd(workProcessVO.getRwrkStatCd());
				workAssignVO.setRwrkCd(workProcessVO.getRwrkCd());
				workAssignVO.setRwrkDt(workProcessVO.getRwrkDt());
				workAssignVO.setRwrkerId(workProcessVO.getRwrkerId());
				workAssignVO.setRwrkerNm(workProcessVO.getRwrkerNm());
				workAssignVO.setRwrkRemark(workProcessVO.getRwrkRemark());

				if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
						.equals("Q2")) { // 품질검사완료
					workAssignVO.setQtTestEndDt(calendar.getTime());
				} else if (StringUtils.defaultString(
						workProcessVO.getWrkStatCd(), "").equals("Q1")) { // 품질검사시작
					workAssignVO.setQtTestStartDt(calendar.getTime());
					workAssignVO.setQtTestPrsnCd(workProcessVO
							.getQtTestPrsnCd());
					workAssignVO.setQtTestPrsnNm(workProcessVO
							.getQtTestPrsnNm());
				} else if (StringUtils.defaultString(
						workProcessVO.getWrkStatCd(), "").equals("Q5")) { // 품질검사대기
					workAssignVO.setQtTestEndDt(null);
					workAssignVO.setQtTestStartDt(null);
					workAssignVO.setQtTestPrsnCd(null);
					workAssignVO.setQtTestPrsnNm(null);
					if (StringUtil.nullConvert(workAssignVO.getRwrkStatCd())
							.equals("Y")) { // 리워크
						workAssignVO.setRwrkCd(null);
						workAssignVO.setRwrkDt(null);
						workAssignVO.setRwrkerId(null);
						workAssignVO.setRwrkerNm(null);
						workAssignVO.setRwrkRemark(null);
					}
				}

				workAssignService.updateWorkAssign(workAssignVO);

				if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "")
						.equals("Q2")) { // 품질검사완료

					WorkAssignSearchVO workAssignSearchVO = new WorkAssignSearchVO();
					workAssignSearchVO.setsDlrCd(workProcessVO.getDlrCd());
					workAssignSearchVO.setsRoDocNo(workProcessVO.getRoDocNo());
					workAssignSearchVO.setsQtTestConfStatCd("Q2"); // 품질검사완료상태

					WorkAssignVO workVO = workAssignService
							.selectWorkAssignChkStatByKey(workAssignSearchVO);

					if (StringUtil.nullConvert(workVO.getQtTestYn())
							.equals("Y")) {
						repairOrderVO.setQtTestEndDt(calendar.getTime());
						repairOrderVO.setDlStatCd("01");
						repairOrderVO.setQtTestStatCd("Q2");
					}
				} else if (StringUtils.defaultString(
						workProcessVO.getWrkStatCd(), "").equals("Q1")) { // 품질검사시작
					if (StringUtil.nullConvert(repairOrderVO.getQtTestStatCd())
							.equals("Q5")) {
						repairOrderVO.setQtTestStartDt(calendar.getTime());
						repairOrderVO.setQtTestStatCd("Q1");
					}
				} else if (StringUtils.defaultString(
						workProcessVO.getWrkStatCd(), "").equals("Q5")) { // 품질검사대기

					WorkAssignSearchVO workAssignSearchVO = new WorkAssignSearchVO();
					workAssignSearchVO.setsDlrCd(workProcessVO.getDlrCd());
					workAssignSearchVO.setsRoDocNo(workProcessVO.getRoDocNo());
					workAssignSearchVO.setsQtTestConfStatCd("Q5"); // 품질검사완료상태

					WorkAssignVO workVO = workAssignService
							.selectWorkAssignChkStatByKey(workAssignSearchVO);

					if (StringUtil.nullConvert(workVO.getQtTestYn())
							.equals("Y")) {
						repairOrderVO.setQtTestEndDt(null);
						repairOrderVO.setQtTestStartDt(null);
						repairOrderVO.setQtTestStatCd("Q5");
					}
				}

				repairOrderService.updateRepairOrder(repairOrderVO);
				roStatCd = repairOrderVO.getRoStatCd();
			}

		}
		// 维修进度中，点点击 维修完成 时，通知服务顾问 贾明 2018-3-28 15:11:16 start

		if (StringUtils.defaultString(workProcessVO.getWrkStatCd(), "").equals(
				"05")) {
			RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
			repairOrderSearchVO.setsRoGrpNo(workProcessVO.getRoGrpNo());
			repairOrderSearchVO.setsDlrCd(workProcessVO.getDlrCd());

			List<RepairOrderVO> repairOrderList = repairOrderService
					.selectRepairOrderByCondition(repairOrderSearchVO);
			//String wrkStatNm = "";
			String wrkStatCd = "";
			String regUsrNm = "";
			String regUsrId = "";
			String driverNm = "";
			String carRegNo = "";
			String roDocNo = "";
			for (RepairOrderVO roVO : repairOrderList) {
				//wrkStatNm = roVO.getWrkStatNm();
				wrkStatCd = roVO.getWrkStatCd();
				regUsrNm = roVO.getRegUsrNm();
				regUsrId = roVO.getRegUsrId();
				carRegNo = roVO.getCarRegNo();
				driverNm = roVO.getDriverNm();
				roDocNo = roVO.getRoDocNo();

				if (null != wrkStatCd) {
					if (wrkStatCd.equals("05")) {
						List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
						NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
						targetVO.setUsrId(regUsrId);
						targetVO.setUsrNm(regUsrNm);
						targetVO.setMesgTmplTpList("P");

						targetUsers.add(targetVO);
						String sysCd = Constants.SYS_CD_DLR;
						String alrtPolicyGrpId = "SER-0008";
						String dlrCd = LoginUtil.getDlrCd();

						NotificationMessageContext context = new NotificationMessageContext();
						context.getVelocityContext().put("driverNm", driverNm);
						context.getVelocityContext().put("carRegNo", carRegNo);
						context.getVelocityContext().put("roDocNo", roDocNo);
						notificationMessageService.sendNotificationMessage(
								sysCd, alrtPolicyGrpId, dlrCd, context,
								targetUsers);
					}
				}

			}
			//维修进度中，点击 维修完成时，并判断所有项目均完成时向粉丝平台发送关闭影像通知 2020-4-1 15:11:16 start
			//try { 此处try-catch会报错Transaction rolled back because it has been marked as rollback-only
				RepairOrderSearchVO param = new RepairOrderSearchVO();
				param.setsDlrCd(workProcessVO.getDlrCd());
				param.setsRoDocNo(workProcessVO.getRoDocNo());
				RepairOrderVO checkRepairOrderVO = repairOrderService.selectRepairOrderWorkByKey(param);
				if(StringUtils.equals(checkRepairOrderVO.getWrkStatCd(),"05")){
					/*List<WorkAssignVO> list = new ArrayList<WorkAssignVO>();
					WorkAssignSearchVO searchWorkAssignVO = new WorkAssignSearchVO();
					searchWorkAssignVO.setsDlrCd(workProcessVO.getDlrCd());
					searchWorkAssignVO.setsRoDocNo(workProcessVO.getRoDocNo());
					searchWorkAssignVO.setsRpipCd(workProcessVO.getRpirCd());
					list = workAssignDAO.selectWorkAssignByCondition(searchWorkAssignVO);
		            if(null != list && list.size() > 0){*/
		            	  //WorkAssignVO workAssignVO = (WorkAssignVO)list.get(0);
					       VedioChannelApplyVO vedioChannelApplyVO = new VedioChannelApplyVO();
					       vedioChannelApplyVO.setDlrCd(checkRepairOrderVO.getDlrCd());
					       vedioChannelApplyVO.setRoDocNo(checkRepairOrderVO.getRoDocNo());
					       //查询是否有申请成功的记录
					       int count =workAssignDAO.selectFlagExistChannelApply(vedioChannelApplyVO);
		            	   if(count > 0){
		            			Map<String, Object> message = new HashMap<String, Object>();
		            			message.put("vin", checkRepairOrderVO.getVinNo());
		            			message.put("dealer_id", checkRepairOrderVO.getDlrCd());
		            			message.put("order_id", checkRepairOrderVO.getRoDocNo());
//		            		message.put("video_channel", channelVO.getChannelNo());//不需要通道号
		            			serviceCommonService.executeCamelClent(message, "SER125");
		            		}
		            /*}*/
				}
	       // } catch (Exception e) {
	           // System.out.println("向粉丝发送关闭视频请求出现异常！" + e);
	           // e.printStackTrace();
	        //}
			//维修进度中，点点击 维修完成时，向粉丝平台发送关闭影像通知 2020-4-1 15:11:16 end
		
		}
		// 维修进度中，点点击 维修完成 时，通知服务顾问 贾明 2018-3-28 15:11:16 end

		return roStatCd;
	}

	/**
	 * 작업진도관리 정보리스트를 등록한다.
	 * 
	 * @param workProcessVO
	 *            - 등록할 정보가 담긴 WorkProcessVO
	 * @return 등록된 목록수
	 */
	@Override
	public int insertWorkProcesss(List<WorkProcessVO> list) throws Exception {
		for (WorkProcessVO vo : list) {
			insertWorkProcess(vo);
		}
		return 1;
	}

	/**
	 * 작업진도관리 정보를 수정한다.
	 * 
	 * @param workProcessVO
	 *            - 수정할 정보가 담긴 WorkProcessVO
	 * @return 수정된 목록수
	 */
	@Override
	public int updateWorkProcess(WorkProcessVO workProcessVO) throws Exception {
		workProcessVO.setUpdtUsrId(LoginUtil.getUserId());
		return workProcessDAO.updateWorkProcess(workProcessVO);
	}

	/**
	 * 작업진도관리 정보를 삭제한다.
	 * 
	 * @param workProcessVO
	 *            - 삭제할 정보가 담긴 WorkProcessVO
	 * @return 삭제된 목록수
	 */
	@Override
	public int deleteWorkProcesss(List<WorkProcessVO> list) throws Exception {
		for (WorkProcessVO vo : list) {
			workProcessDAO.deleteWorkProcess(vo);
		}
		return 1;
	}

	/**
	 * 조회 조건에 해당하는 작업진도관리 키정보를 조회한다.
	 * 
	 * @param searchVO
	 *            - 조회 조건을 포함하는 WorkProcessSearchVO
	 * @return 조회 목록
	 */
	@Override
	public WorkProcessVO selectWorkProcessByKey(WorkProcessSearchVO searchVO)
			throws Exception {
		if (StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")) {
			searchVO.setsDlrCd(LoginUtil.getDlrCd());
		}
		return workProcessDAO.selectWorkProcessByKey(searchVO);
	}

	/**
	 * 조회 조건에 해당하는 진도보드 리스트를 조회한다.
	 * 
	 * @param searchVO
	 *            - 조회 조건을 포함하는 WorkProcessSearchVO
	 * @return 조회 목록
	 */
	@Override
	public List<RepairOrderVO> selectWorkProcessBoardListByCondition(
			WorkProcessSearchVO searchVO) throws Exception {
		if (StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")) {
			searchVO.setsDlrCd(LoginUtil.getDlrCd());
		}
		return workProcessDAO.selectWorkProcessBoardListByCondition(searchVO);
	}

	/**
	 * 리워크 정보를 등록한다.
	 * 
	 * @param workProcessVO
	 *            - 수정할 정보가 담긴 WorkProcessVO
	 * @return 수정된 목록수
	 */
	@Override
	public int insertRework(WorkProcessVO workProcessVO) throws Exception {
		workProcessVO.setUpdtUsrId(LoginUtil.getUserId());
		workProcessDAO.updateWorkProcess(workProcessVO);

		// 리워크 업데이트
		RepairOrderVO roVO = new RepairOrderVO();
		roVO.setRoDocNo(workProcessVO.getRoDocNo());
		return 1;
	}

	/**
	 * 수리조작기록 정보를 조회한다.
	 * 
	 * @param searchVO
	 *            - 조회 조건을 포함하는 WorkProcessSearchVO
	 * @return 조회 목록
	 */
	@Override
	public List<WorkProcessVO> selectRepairHistory(WorkProcessSearchVO searchVO)
			throws Exception {
		if (StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")) {
			searchVO.setsDlrCd(LoginUtil.getDlrCd());
		}
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
		return workProcessDAO.selectRepairHistory(searchVO);
	}

	@Override
	public String selectFlagForExistChanel(String bayNo) throws Exception {
		return workAssignDAO.selectFlagForExistChanel(bayNo);
	}

	/**
	 * 服务进度看版 贾明 2020-6-28
	 */
	@Override
	public List<RepairOrderVO> selectServiceProgressListByCondition(
			WorkProcessSearchVO searchVO) throws Exception {
		   if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
	           searchVO.setsDlrCd(LoginUtil.getDlrCd());
	       }
	       return workProcessDAO.selectServiceProgressListByCondition(searchVO);
	}
}
