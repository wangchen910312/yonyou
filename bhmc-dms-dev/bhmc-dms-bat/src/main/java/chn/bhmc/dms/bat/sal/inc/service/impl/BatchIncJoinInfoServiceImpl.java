package chn.bhmc.dms.bat.sal.inc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cmm.service.dao.BatDmsDataOutDAO;
import chn.bhmc.dms.bat.sal.inc.service.BatchIncJoinInfoService;
import chn.bhmc.dms.bat.sal.inc.service.dao.BatchIncJoinInfoDAO;
import chn.bhmc.dms.bat.sal.inc.vo.BatSysOwnerDlrVO;
import chn.bhmc.dms.bat.sal.inc.vo.BatchIncJoinInfoVO;
import chn.bhmc.dms.bat.sal.inc.vo.BatchIncProcessVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchIncJoinInfoServiceImpl
 * @Description : 보험-추적 배치
 * @author Kim Jin Suk
 * @since 2017. 2. 06.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 06.     Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("batchIncJoinInfoService")
public class BatchIncJoinInfoServiceImpl extends HService implements BatchIncJoinInfoService {

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="batchIncJoinInfoDAO")
    BatchIncJoinInfoDAO batchIncJoinInfoDAO;


    /**
     * DAO
     */
    @Resource(name="batDmsDataOutDAO")
    BatDmsDataOutDAO batDmsDataOutDAO;

    /**
     * 푸쉬알림 service
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    /**
     * TODO 관리 서비스
     */
    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    /**
     * 보험 고객추적 알림
     * @param serviceId
     * @throws Exception
     */
    @Override
    public void callIncJoinProcess() throws Exception{

        BatSysOwnerDlrVO dlrVO = selectOnlyDlrInfosearch();

        if(dlrVO != null){      // 단일딜러
            BatchIncProcessVO searchVO = new BatchIncProcessVO();
            searchVO.setsDlrCd(dlrVO.getDlrCd());
            searchVO.setsIncDay(dlrVO.getInsExpAlarmDay() != null ? Integer.parseInt(dlrVO.getInsExpAlarmDay()) : 0);

            List<BatchIncProcessVO> list = batchIncJoinInfoDAO.selectBatchIncProcessByCondition(searchVO);

            for(BatchIncProcessVO vo : list){
                incProcessToDOs(vo);   // to-do List
                incProcessAlarms(vo);  // web push
            }

        }
        else{                  // 멀티딜러

            List<BatSysOwnerDlrVO> dlrList = batchIncJoinInfoDAO.selectSysOwnerDlrByCondition(null, "Y");

            for(BatSysOwnerDlrVO multiVO : dlrList){
                BatchIncProcessVO searchVO = new BatchIncProcessVO();
                searchVO.setsDlrCd(multiVO.getDlrCd());
                searchVO.setsIncDay(multiVO.getInsExpAlarmDay() != null ? Integer.parseInt(multiVO.getInsExpAlarmDay()) : 0);

                List<BatchIncProcessVO> list = batchIncJoinInfoDAO.selectBatchIncProcessByCondition(searchVO);

                for(BatchIncProcessVO vo : list){
                    incProcessToDOs(vo);   // to-do List
                    incProcessAlarms(vo);  // web push
                }
            }

        }
    }

    // web push
    private void incProcessAlarms(BatchIncProcessVO vo) throws Exception{
        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
        targetVO.setUsrId(vo.getUpdtUsrId());
        targetVO.setUsrNm(vo.getUpdtUsrId());
        targetVO.setMesgTmplTpList("W");

        targetUsers.add(targetVO);
        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "SAL-0002";
        String dlrCd = vo.getDlrCd();

        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("incNo", vo.getIncNo());
        context.getVelocityContext().put("nextTraceDt", DateUtil.convertToDateTimeString(vo.getNextTraceDt()) );
        context.getVelocityContext().put("traceCont", vo.getTraceCont());

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }

    // to-do List
    private void incProcessToDOs(BatchIncProcessVO vo) throws Exception{

        //String todoMsg = messageSource.getMessage("crm.info.failSubmitTodo" , new String[]{custNm} , Locale.CHINA );

        TodoInfoVO todoInfoVO = new TodoInfoVO();
        todoInfoVO.setTodoPolicyId("TD-P-00006");   // SAL1403
        //todoInfoVO.setTodoDesc(todoMsg);
        todoInfoVO.setTodoDesc("["+vo.getIncNo()+"] "+vo.getTraceCont());
        todoInfoVO.setActionParams("incNo="+vo.getIncNo());
        todoInfoVO.setRegUsrId(vo.getUpdtUsrId());

        todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(vo.getUpdtUsrId()));

        todoInfoService.insertTodoInfo(todoInfoVO);

    }

    // 딜러정보 조회
    @Override
    public BatSysOwnerDlrVO selectOnlyDlrInfosearch() throws Exception{
        BatSysOwnerDlrVO dlrVO = null;

        List<BatSysOwnerDlrVO> dlrList = batchIncJoinInfoDAO.selectSysOwnerDlrByCondition("Y", null);
        if(dlrList != null && dlrList.size() > 0){
            dlrVO = dlrList.get(0);
        }

        return dlrVO;
    }

    /**
     * 보험 만료 알림
     * @param serviceId
     * @throws Exception
     */
    @Override
    public void callIncJoinExpire() throws Exception{

        BatSysOwnerDlrVO dlrVO = selectOnlyDlrInfosearch();

        if(dlrVO != null){      // 단일딜러
            BatchIncJoinInfoVO searchVO = new BatchIncJoinInfoVO();
            searchVO.setDlrCd(dlrVO.getDlrCd());
            searchVO.setIncDay(dlrVO.getInsExpAlarmDay() != null ? Integer.parseInt(dlrVO.getInsExpAlarmDay()) : 0);

            List<BatchIncJoinInfoVO> list = batchIncJoinInfoDAO.selectBatchIncExpireByCondition(searchVO);

            for(BatchIncJoinInfoVO vo : list){
                incExpireToDOs(vo);   // to-do List
                incExpireAlarms(vo);  // web push
            }

        }
        else{                  // 멀티딜러

            List<BatSysOwnerDlrVO> dlrList = batchIncJoinInfoDAO.selectSysOwnerDlrByCondition(null, "Y");

            for(BatSysOwnerDlrVO multiVO : dlrList){
                BatchIncJoinInfoVO searchVO = new BatchIncJoinInfoVO();
                searchVO.setDlrCd(multiVO.getDlrCd());
                searchVO.setIncDay(multiVO.getInsExpAlarmDay() != null ? Integer.parseInt(multiVO.getInsExpAlarmDay()) : 0);

                List<BatchIncJoinInfoVO> list = batchIncJoinInfoDAO.selectBatchIncExpireByCondition(searchVO);

                for(BatchIncJoinInfoVO vo : list){
                    incExpireToDOs(vo);   // to-do List
                    incExpireAlarms(vo);  // web push
                }
            }

        }
    }

    // 보험 만료 알람
    // web push
    private void incExpireAlarms(BatchIncJoinInfoVO vo) throws Exception{
        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
        targetVO.setUsrId(vo.getUpdtUsrId());
        targetVO.setUsrNm(vo.getUpdtUsrId());
        targetVO.setMesgTmplTpList("W");
        targetUsers.add(targetVO);
        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "SAL-0007";
        String dlrCd = vo.getDlrCd();

        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("incNo", vo.getIncNo());
        context.getVelocityContext().put("cnt", vo.getCnt());
        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }

    // to-do List
    private void incExpireToDOs(BatchIncJoinInfoVO vo) throws Exception{
        TodoInfoVO todoInfoVO = new TodoInfoVO();
        todoInfoVO.setTodoPolicyId("TD-P-01016");
        todoInfoVO.setTodoDesc("保险单号["+vo.getIncNo()+"]快要到期了:"+vo.getCnt()+"个");
        todoInfoVO.setActionParams("incNo="+vo.getIncNo());
        todoInfoVO.setRegUsrId(vo.getUpdtUsrId());

        todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(vo.getUpdtUsrId()));
        todoInfoService.insertTodoInfo(todoInfoVO);
    }

}
