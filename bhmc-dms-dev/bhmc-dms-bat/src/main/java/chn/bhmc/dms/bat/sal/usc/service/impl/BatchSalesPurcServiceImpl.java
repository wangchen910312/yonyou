package chn.bhmc.dms.bat.sal.usc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.sal.inc.service.dao.BatchIncJoinInfoDAO;
import chn.bhmc.dms.bat.sal.usc.service.BatchSalesPurcService;
import chn.bhmc.dms.bat.sal.usc.service.dao.BatchSalesPurcDAO;
import chn.bhmc.dms.bat.sal.usc.vo.BatchSalesPurcVO;
import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;
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
 * @ClassName   : BatchSalesUsedVehiclePurcServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Lee Seungmin     최초 생성
 * </pre>
 */


@Service("batchSalesPurcService")
public class BatchSalesPurcServiceImpl extends HService implements BatchSalesPurcService {

    @Resource(name="batchSalesPurcDAO")
    BatchSalesPurcDAO batchSalesPurcDAO;

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="batchIncJoinInfoDAO")
    BatchIncJoinInfoDAO batchIncJoinInfoDAO;

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

    @Autowired
	BatServiceCmmCamelService batServiceCmmCamelService;
    @Override
    public void selectUscTargetItem() throws Exception{

        List<BatchSalesPurcVO> list = batchSalesPurcDAO.selectUscTargetItemList();

        for(BatchSalesPurcVO vo : list){
            uscAmtRtnDtToDOs(vo);   // to-do List
            uscAmtRtnDtAlarms(vo);  // web push
        }

    }

    // web push
    private void uscAmtRtnDtAlarms(BatchSalesPurcVO vo) throws Exception{
        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();

        targetVO.setUsrId(vo.getRegUsrId());
        targetVO.setUsrNm(vo.getUpdtUsrId());
        targetVO.setMesgTmplTpList("W");
        targetUsers.add(targetVO);

        String sysCd = "D";
        String alrtPolicyGrpId = "SAL-0001";
        String dlrCd = vo.getDlrCd();

        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("vinNo", vo.getVinNo());
        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }


    // to-do List
    private void uscAmtRtnDtToDOs(BatchSalesPurcVO vo) throws Exception{

        TodoInfoVO todoInfoVO = new TodoInfoVO();
        todoInfoVO.setTodoPolicyId("TD-P-00009");

        todoInfoVO.setTodoDesc("二手车["+vo.getVinNo()+"]<br>已到销售预计回款日.");

        todoInfoVO.setRegUsrId("SYSTEM");
        todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(vo.getRegUsrId()));

        todoInfoService.insertTodoInfo(todoInfoVO);

    }
    /**
     * 二手车收购信息上报
     */
	@Override
	public void insertPurcInterfaceData() throws Exception {
		
		batchSalesPurcDAO.insertPurcInterfaceData();
		
		HashMap<String, Object> message = new HashMap<String, Object>();
		batServiceCmmCamelService.executeCamelClient(message, "SAL252");
	}
}
