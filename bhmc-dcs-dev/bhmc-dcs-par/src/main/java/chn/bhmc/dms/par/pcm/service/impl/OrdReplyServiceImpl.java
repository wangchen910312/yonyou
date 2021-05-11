package chn.bhmc.dms.par.pcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.ath.service.dao.UserDAO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.OrdReplyService;
import chn.bhmc.dms.par.pcm.service.dao.OrdAppealDAO;
import chn.bhmc.dms.par.pcm.service.dao.OrdReplyDAO;
import chn.bhmc.dms.par.pcm.vo.OrdAppealSearchVO;
import chn.bhmc.dms.par.pcm.vo.OrdAppealVO;
import chn.bhmc.dms.par.pcm.vo.OrdReplyVO;

@Service("ordReplyService")
public class OrdReplyServiceImpl extends HService implements OrdReplyService {
	@Resource(name = "ordReplyDAO")
	private OrdReplyDAO ordReplyDAO;

	@Resource(name = "userDAO")
	private UserDAO userDAO;

	@Resource(name = "ordAppealDAO")
	private OrdAppealDAO ordAppealDAO;

	@Override
	public int insertOrdReply(OrdReplyVO ordReplyVO) throws Exception {
		String replyLevel = ordReplyVO.getReplyLevel();// 1回复-采购科 0为库存管理科
		ordReplyVO.setRegUsrId(LoginUtil.getUserId());
		
		OrdAppealSearchVO ordAppealSearchVO = new OrdAppealSearchVO();
		ordAppealSearchVO.setQuestionNo(ordReplyVO.getQuestionNo());

		List<OrdAppealVO> appealList = ordAppealDAO.selectAppealByCondition(ordAppealSearchVO);
		String replyStatus = appealList.get(0).getReplyStatus();// 回复进度状态 0已提报即库存科处理中1采购科处理中 2已处理
		
		
		//  除历史单据，需校验回复级别和问题处理阶段是否一致
		if (!"1".equals(ordReplyVO.getHistoryFlg()) && !StringUtils.equals(replyLevel, replyStatus)) {
			throw processException("par.lbl.optAlready");
		}

		if(StringUtils.equals("1",replyLevel)){//采购回复--批量回复
			ordReplyDAO.insertOrdReplys(ordReplyVO);//批量插入回复记录
			ordAppealDAO.updateAppealByPartNo(ordReplyVO.getPartNo());//批量修改问题为已处理
		}else{
			ordReplyDAO.insertOrdReply(ordReplyVO);
			OrdAppealVO ordAppealVO = new OrdAppealVO();
			ordAppealVO.setQuestionNo(ordReplyVO.getQuestionNo());
			ordAppealVO.setStatus("1");// 单据状态(0已提报 1处理中 2完结)
			ordAppealVO.setReplyStatus(("0".equals(ordReplyVO.getOptTp())?"1":"2"));//状态变化：转办---1  解决---2
			ordAppealDAO.updateOrdAppeal(ordAppealVO);
		}

		return 1;
	}

}
