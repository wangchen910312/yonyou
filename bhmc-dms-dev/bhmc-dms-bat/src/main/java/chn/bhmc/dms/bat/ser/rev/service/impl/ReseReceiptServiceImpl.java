package chn.bhmc.dms.bat.ser.rev.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import chn.bhmc.dms.bat.ser.rev.service.ReseReceiptService;
import chn.bhmc.dms.bat.ser.rev.service.dao.ReseReceiptDAO;
import chn.bhmc.dms.bat.ser.rev.vo.ReseReceiptVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.core.Constants;
import able.com.service.HService;

@Service("reseReceiptService")
public class ReseReceiptServiceImpl extends HService implements ReseReceiptService {
	
	@Resource(name = "reseReceiptDAO")
	ReseReceiptDAO reseReceiptDAO;

	@Resource(name = "notificationMessageService")
	NotificationMessageService notificationMessageService;

	@Override
	public void insertReservationReceipt() throws Exception {
		List<ReseReceiptVO> list = reseReceiptDAO.selectReservationReceiptList();
		for(ReseReceiptVO vo:list ){
			sendNotificationMessage(vo);
		}

	}
	
	private void sendNotificationMessage(ReseReceiptVO vo) throws Exception {
		List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
		NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
		targetVO.setUsrId(vo.getSaId());
		targetVO.setUsrNm(vo.getSaNm());
		targetVO.setMesgTmplTpList("P");
		targetUsers.add(targetVO);
		String sysCd = Constants.SYS_CD_DLR;
		String alrtPolicyGrpId = "SER-0012";
		String dlrCd = vo.getDlrCd();
		NotificationMessageContext context = new NotificationMessageContext();
		context.getVelocityContext().put("serResvStartDt", vo.getSerResvStartDt());//维修预约时间
		context.getVelocityContext().put("driverNm", vo.getDriverNm());//
		context.getVelocityContext().put("resvDocNo", vo.getResvDocNo());//维修预约号
		context.getVelocityContext().put("carRegNo", vo.getCarRegNo());//车牌号码
		notificationMessageService.sendNotificationMessage(sysCd,
				alrtPolicyGrpId, dlrCd, context, targetUsers);
	}

}
