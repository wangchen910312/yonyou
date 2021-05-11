package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinHistorySupportService;
import chn.bhmc.dms.crm.dmm.service.dao.BlueMembershipJoinHistorySupportDAO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinHistoryServiceImpl.java
 * @Description : 블루멤버십 인증 히스토리
 * @author Lee In Moon
 * @since 2016.09.28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.28.     Lee In Moon     최초 생성
 * </pre>
 */

@Service("blueMembershipJoinHistorySupportService")
public class BlueMembershipJoinHistorySupportServiceImpl extends HService implements BlueMembershipJoinHistorySupportService, JxlsSupport{

    /**
     * 블루멤버십 인증 히스토리 DAO
     */
    @Resource(name="blueMembershipJoinHistorySupportDAO")
    BlueMembershipJoinHistorySupportDAO blueMembershipJoinHistorySupportDAO;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectsByConditionCnt(chn.bhmc.dms.crm.dmm.service.BlueMembershipSearchVO)
     */
    @Override
    public int selectBlueMembershipJoinHistorysByConditionCnt(BlueMembershipJoinSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipJoinHistorySupportDAO.selectBlueMembershipJoinHistorysByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectMembershipsByCondition(chn.bhmc.dms.crm.dmm.service.BlueMembershipSearchVO)
     */
    @Override
    public List<BlueMembershipJoinVO> selectBlueMembershipJoinHistorysByCondition(BlueMembershipJoinSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipJoinHistorySupportDAO.selectBlueMembershipJoinHistorysByCondition(searchVO);
    }
    
    /**
     *  CRM_蓝缤入会管理_缴费获取积分记录 新增Excel 下载  贾明 2018-10-22
     */
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		BlueMembershipJoinSearchVO  searchVO = new BlueMembershipJoinSearchVO();
		ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
		if(!StringUtils.isBlank(params.get("sStartDt").toString())){
			 String sStartDt = params.get("sStartDt").toString();
	         Date dStartDt = DateUtil.convertToDate(sStartDt);
	         searchVO.setsStartDt(dStartDt);
		}
		
		if(!StringUtils.isBlank(params.get("sEndDt").toString())){
			 String sEndDt = params.get("sEndDt").toString();
	         Date dEndDt = DateUtil.convertToDate(sEndDt);
	         searchVO.setsEndDt(dEndDt);
		}
	   List<BlueMembershipJoinVO>	list = selectBlueMembershipJoinHistorysByCondition(searchVO);
	   context.putVar("items", list);
	}


}
