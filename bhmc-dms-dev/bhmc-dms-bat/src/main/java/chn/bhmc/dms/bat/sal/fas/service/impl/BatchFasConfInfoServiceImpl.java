package chn.bhmc.dms.bat.sal.fas.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.fas.service.BatchFasConfInfoService;
import chn.bhmc.dms.bat.sal.fas.service.dao.BatchFasConfInfoDAO;
import chn.bhmc.dms.bat.sal.fas.vo.BatchFasConfInfoVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchFasConfInfoServiceImpl
 * @Description : 강제출고심사완료알림-승인
 * @author Lee Seungmin
 * @since 2017. 2. 06.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 16.     Lee Seungmin           최초 생성
 * </pre>
 */

@Service("batchFasConfInfoService")
public class BatchFasConfInfoServiceImpl extends HService implements BatchFasConfInfoService {

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="batchFasConfInfoDAO")
    BatchFasConfInfoDAO batchFasConfInfoDAO;

    /**
     * 푸쉬알림 service
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    /**
     * 투두 관리 서비스
     */
    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    /**
     * 강제출고심사완료알림-승인
     * @param serviceId
     * @throws Exception
     */
    @Override
    public void callAlarmProcess(String flag) throws Exception{

        List<BatchFasConfInfoVO> list = batchFasConfInfoDAO.selectFasConfTargetItemList(flag);

        for(BatchFasConfInfoVO vo : list){
            vo.setCallTp(flag);
            //fasConfInfoAlarms(vo);  // web push
            fasConfInfoToDOs(vo);   // to-do List
        }

        batchFasConfInfoDAO.updateFasConfTarget(flag);
    }

    // web push
    @SuppressWarnings("unused")
    private void fasConfInfoAlarms(BatchFasConfInfoVO vo) throws Exception{
        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
        targetVO.setDlrCd(vo.getDlrCd());
        targetVO.setUsrId(vo.getRegUsrId());
        targetVO.setUsrNm(vo.getRegUsrNm());
        targetVO.setMesgTmplTpList("W");
        targetUsers.add(targetVO);

        String alrtPolicyGrpId = "";

        if(vo.getCallTp().equals("Y")){
            alrtPolicyGrpId = "SAL-0003";
        }else{
            alrtPolicyGrpId = "SAL-0004";
        }

        String sysCd = "D";

        String dlrCd = vo.getDlrCd();

        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("vinNo", vo.getVinNo());


        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }

    // to-do List
    private void fasConfInfoToDOs(BatchFasConfInfoVO vo) throws Exception{

        TodoInfoVO todoInfoVO = new TodoInfoVO();

        if(vo.getCallTp().equals("Y")){
            todoInfoVO.setTodoPolicyId("TD-P-00007");
//            todoInfoVO.setTodoDesc("整车销售出库"+"["+vo.getVinNo()+"]"+"异常申请审批通过");
            todoInfoVO.setTodoDesc("["+vo.getVinNo()+"]"+"异常审批通过");
        }else{
            todoInfoVO.setTodoPolicyId("TD-P-00008");
//            todoInfoVO.setTodoDesc("整车销售出库"+"["+vo.getVinNo()+"]"+"异常申请审批拒绝");
            todoInfoVO.setTodoDesc("["+vo.getVinNo()+"]"+"异常审批通过");
        }

        todoInfoVO.setActionParams("sContractNo="+vo.getContractNo());
        todoInfoVO.setRegUsrId(vo.getRegUsrId());
        todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(vo.getRegUsrId()));
        todoInfoService.insertTodoInfo(todoInfoVO);



    }
}
