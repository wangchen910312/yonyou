package chn.bhmc.dms.par.pcm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.ath.service.dao.UserDAO;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.OrdAppealService;
import chn.bhmc.dms.par.pcm.service.dao.OrdAppealDAO;
import chn.bhmc.dms.par.pcm.service.dao.OrdReplyDAO;
import chn.bhmc.dms.par.pcm.vo.OrdAppealSearchVO;
import chn.bhmc.dms.par.pcm.vo.OrdAppealVO;
import chn.bhmc.dms.par.pcm.vo.OrdReplyVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("ordAppealService")
public class OrdAppealServiceImpl extends HService implements OrdAppealService {

	@Resource(name = "ordAppealDAO")
	private OrdAppealDAO ordAppealDAO;
	@Resource(name = "ordReplyDAO")
	private OrdReplyDAO ordReplyDAO;
	@Autowired
	EaiClient eaiClient;

	@Resource(name = "userDAO")
	private UserDAO userDAO;
	
    @Resource(name="ordAppealIdgenService")
    EgovIdGnrService ordAppealIdgenService;
	//提报申诉
	@Override
	public int insertOrdAppeal(OrdAppealVO ordAppealVO) throws Exception {
		boolean bmpFlg = false;// bmp账号
		// 校验是否存在申诉记录
		int existCount = ordAppealDAO.selectAppealCnt(ordAppealVO);
		if (existCount > 0) {
			throw processException("par.lbl.optAlready");
		}
		UserSearchVO userSearchVO = new UserSearchVO();
		userSearchVO.setsUsrId(LoginUtil.getUserId());
		List<UserVO> userlist = userDAO.selectUsersByTskCdAndUsrId(userSearchVO);
		if (userlist != null && userlist.size() > 0) {
			bmpFlg = StringUtils.equals("BMP", userlist.get(0).getDeptCd());
		}

		/* 非BMP区域经理提报，系统后台检索全国各仓库库存(除新疆库)，库存是“Ｙ”的则提示区域经理**仓库有库存，可协调调拨处理 */
		if (!bmpFlg) {
			Map<String, Object> message = new HashMap<String, Object>();
			message.put("IVR_PNO", ordAppealVO.getPartNo());
			CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
					.addMessage(message).ifId("PTS002").company("H")
					.sender("DCS").receiver("AMOS").build()
					.buildCommDMSDoc();

			try{
				CommDMSDoc commDMSDoc = eaiClient.sendRequest(reqCommDMSDoc);
				String value = commDMSDoc.getBody().getValue().getMESSAGE().getValue();
				if (value.indexOf("PD1") != -1 // 北京（顺义）
						|| value.indexOf("PD2") != -1// 上海
						|| value.indexOf("PD3") != -1// 广州
						|| value.indexOf("PD4") != -1// 成都
						|| value.indexOf("PD5") != -1// 沈阳
						|| value.indexOf("PD6") != -1// 西安
						|| value.indexOf("PD7") != -1// 武汉
						|| value.indexOf("PD8") != -1) {// 深圳
					throw processException("par.info.stockForBo");
				}
			} catch (JobExecutionException e) {
				    //仓库无数据继续执行一下操作
			}
		}

		OrdReplyVO ordReplyVO = ordReplyDAO.selectAutoReply(ordAppealVO.getPartNo());
		ordAppealVO.setReplyStatus(ordReplyVO != null ? "2": (bmpFlg ? "1" : "0"));// 已处理
		ordAppealVO.setRegUsrId(LoginUtil.getUserId());
		ordAppealVO.setQuestionNo(ordAppealIdgenService.getNextStringId());
		ordAppealDAO.insertOrdAppeal(ordAppealVO);
		
		if (ordReplyVO != null) {
			ordReplyVO.setQuestionNo(ordAppealVO.getQuestionNo());
			ordReplyDAO.insertOrdReply(ordReplyVO);
		}
	  
	    //由于接口调用时间过长，防止此段时间出现重复提交，再次校验
	    OrdAppealVO ordAppealVOParam = new OrdAppealVO();
	    ordAppealVOParam.setBmpOrdNo(ordAppealVO.getBmpOrdNo());
	    ordAppealVOParam.setOrdLine(ordAppealVO.getOrdLine());
	    ordAppealVOParam.setPartNo(ordAppealVO.getPartNo());
	    ordAppealVOParam.setDlrCd(ordAppealVO.getDlrCd());
	    existCount = ordAppealDAO.selectAppealCnt(ordAppealVOParam);
	    if (existCount > 1) {
		  throw processException("par.lbl.optAlready");
	    }
		return 1;
	}

	@Override
	public List<OrdAppealVO> selectDealList(OrdAppealSearchVO ordAppealVO)
			throws Exception {

		return ordAppealDAO.selectDealList(ordAppealVO);
	}

	@Override
	public int selectDealListCnt(OrdAppealSearchVO ordAppealVO)
			throws Exception {
		return ordAppealDAO.selectDealListCnt(ordAppealVO);
	}

	/**
	 * 查询是否可以催单
	 */
	@Override
	public boolean selectIsRemain(OrdAppealSearchVO ordAppealVO)
			throws Exception {
		List<OrdAppealVO> list = ordAppealDAO.selectAppealByCondition(ordAppealVO);
		if (list != null && list.size() > 0) {
			if (StringUtils.equals(list.get(0).getReplyStatus(), "2"))
				return true;
		}
		return false;
	}

	/**
	 * 催单流程要重置问题为提报中，只有流程完事了库存科，采购科，已经点击了解决才能催单。
	 */
	@Override
	public int insertOrdRemind(OrdAppealVO ordAppealVO) throws Exception {
		OrdAppealSearchVO searchVO = new OrdAppealSearchVO();
		boolean bmpFlg = false;// bmp账号
		String appealNo = ordAppealVO.getQuestionNo();//操作的申诉编号
		String appealRegUsrId = ordAppealVO.getRegUsrId();//申诉时提交人
		
		//申诉单据进行中不能进行催单
		searchVO.setQuestionNo(appealNo);
		boolean flg = selectIsRemain(searchVO);
		if (!flg)
			throw processException("par.lbl.in progress");
		
		//插入催单记录
		String questionNo = ordAppealIdgenService.getNextStringId();
		ordAppealVO.setQuestionNo(questionNo);
		ordAppealVO.setRegUsrId(LoginUtil.getUserId());
		ordAppealVO.setRelateNo(appealNo);
		ordAppealDAO.insertOrdAppeal(ordAppealVO);
		
		//申诉提交人员是否为bmp人员，作为回退状态层级判断依据
		UserSearchVO userSearchVO = new UserSearchVO();
		userSearchVO.setsUsrId(appealRegUsrId);
		List<UserVO> userlist = userDAO.selectUsersByTskCdAndUsrId(userSearchVO);
		if (userlist != null && userlist.size() > 0) {
			bmpFlg = StringUtils.equals("BMP", userlist.get(0).getDeptCd());
		}
		
		//修改申诉单的提报状态为初始提报状态
		OrdAppealVO vo = new OrdAppealVO();
		vo.setQuestionNo(appealNo);
		vo.setReplyStatus(bmpFlg ? "1" : "0");
		ordAppealDAO.updateOrdAppeal(vo);
		return 1;
	}

}
