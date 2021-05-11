package chn.bhmc.dms.bat.sal.dlv.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.dlv.service.BatchDlvConfInfoService;
import chn.bhmc.dms.bat.sal.dlv.service.dao.BatchDlvConfInfoDAO;
import chn.bhmc.dms.bat.sal.dlv.vo.BatchDlvConfInfoVO;
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
 * @ClassName   : BatchDlvConfInfoServiceImpl
 * @Description : 이월소매취소심사완료알림
 * @author Lee Seungmin
 * @since 2017. 3. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 12.     Lee Seungmin           최초 생성
 * </pre>
 */

@Service("batchDlvConfInfoService")
public class BatchDlvConfInfoServiceImpl extends HService implements BatchDlvConfInfoService {

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="batchDlvConfInfoDAO")
    BatchDlvConfInfoDAO batchDlvConfInfoDAO;

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
     * 이월소매취소심사완료알림
     * @param serviceId
     * @throws Exception
     */
    @Override
    public void callAlarmProcess(String flag) throws Exception{

        List<BatchDlvConfInfoVO> list = batchDlvConfInfoDAO.selectDlvConfTargetItemList(flag);

        for(BatchDlvConfInfoVO vo : list){
            vo.setCallTp(flag);
            dlvConfInfoAlarms(vo);  // web push
            dlvConfInfoToDOs(vo);   // to-do List
        }

        batchDlvConfInfoDAO.updateDlvConfTarget(flag);

    }

    // web push
    private void dlvConfInfoAlarms(BatchDlvConfInfoVO vo) throws Exception{
        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
        targetVO.setUsrId(vo.getRegUsrId());
        targetVO.setUsrNm(vo.getRegUsrId());
        targetVO.setMesgTmplTpList("W");
        targetUsers.add(targetVO);

        String alrtPolicyGrpId = "";

        if(vo.getCallTp().equals("Y")){
            alrtPolicyGrpId = "SAL-0005";
        }else{
            alrtPolicyGrpId = "SAL-0006";
        }

        String sysCd = "D";
        String dlrCd = vo.getDlrCd();

        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("contractNo", vo.getContractNo());

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }

    // to-do List
    private void dlvConfInfoToDOs(BatchDlvConfInfoVO vo) throws Exception{

        TodoInfoVO todoInfoVO = new TodoInfoVO();

        if(vo.getCallTp().equals("Y")){
            todoInfoVO.setTodoPolicyId("TD-P-00012");
            todoInfoVO.setTodoDesc("계약번호"+"["+vo.getContractNo()+"] "+"이월소매취소가 승인되었습니다.");
        }else{
            todoInfoVO.setTodoPolicyId("TD-P-00013");
            todoInfoVO.setTodoDesc("계약번호"+"["+vo.getContractNo()+"] "+"이월소매취소가 불승인되었습니다.");
        }

        todoInfoVO.setRegUsrId("SYSTEM");
        todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(vo.getRegUsrId()));

        todoInfoService.insertTodoInfo(todoInfoVO);

    }
}
