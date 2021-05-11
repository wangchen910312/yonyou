package chn.bhmc.dms.bat.sal.cr.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.sal.cr.service.BatchCrConRemService;
import chn.bhmc.dms.bat.sal.cr.service.dao.BatchCrConRemDAO;
import chn.bhmc.dms.bat.sal.cr.vo.BatchCrConRemVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.core.Constants;

@Service("batchCrConRemService")
public class BatchCrConRemServiceImpl extends HService implements BatchCrConRemService {

	/**
    * 
    */
	@Resource(name = "batchCrConRemDAO")
	BatchCrConRemDAO batchCrConRemDAO;

	/**
     * 
     */
	@Resource(name = "notificationMessageService")
	NotificationMessageService notificationMessageService;

	/**
     * 
     */
	@Resource(name = "todoInfoService")
	TodoInfoService todoInfoService;

	@Override
	public void insertMessRem() throws Exception {

		List<BatchCrConRemVO> list = batchCrConRemDAO.selectCrConDataList();
		for (BatchCrConRemVO vo : list) {
			crConfInfoAlarms(vo);
		}

	}
	
    /**
     * p
     * @param vo
     * @throws Exception
     */
	private void crConfInfoAlarms(BatchCrConRemVO vo) throws Exception {

		List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
		NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
		targetVO.setUsrId(vo.getSaleEmpNo());
		targetVO.setUsrNm(vo.getSaleEmpNm());
		targetVO.setMesgTmplTpList("P");
		targetUsers.add(targetVO);
		String sysCd = Constants.SYS_CD_DLR;
		String alrtPolicyGrpId = "SER-0010";
		String dlrCd = vo.getDlrCd();
		NotificationMessageContext context = new NotificationMessageContext();
		context.getVelocityContext().put("carlineNm", vo.getCarlineNm());//车种
		context.getVelocityContext().put("fscNm", vo.getFscNm());//车款
		context.getVelocityContext().put("vinNo", vo.getVinNo());//车辆识别码
		context.getVelocityContext().put("contractNo", vo.getContractNo());//合同号码
		
		notificationMessageService.sendNotificationMessage(sysCd,
				alrtPolicyGrpId, dlrCd, context, targetUsers);
	}

}
