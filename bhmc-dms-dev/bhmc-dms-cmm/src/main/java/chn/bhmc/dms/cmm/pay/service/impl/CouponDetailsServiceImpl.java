package chn.bhmc.dms.cmm.pay.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.cmm.pay.service.CouponDetailsService;
import chn.bhmc.dms.cmm.pay.service.dao.CouponDetailsDAO;
import chn.bhmc.dms.cmm.pay.vo.CouponDetailsVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;

@Service("couponDetailsService")
public class CouponDetailsServiceImpl extends HService implements CouponDetailsService, JxlsSupport{
	
	
	@Resource(name = "couponDetailsDAO")
	CouponDetailsDAO couponDetailsDAO;

	@Override
	public int selectCount(CouponDetailsVO couponDetailsVO) throws Exception {
		// TODO Auto-generated method stub
		return couponDetailsDAO.selectCount(couponDetailsVO);
	}

	@Override
	public List<CouponDetailsVO> selectInfoByParams(CouponDetailsVO couponDetailsVO) throws Exception {
		// TODO Auto-generated method stub
		return couponDetailsDAO.selectInfoByParams(couponDetailsVO);
	}

	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		// TODO Auto-generated method stub
		CouponDetailsVO couponDetailsVO = new CouponDetailsVO();
		if (!StringUtils.isBlank(params.get("couponUsageTimeStartStr").toString())) {
			String  couponUsageTimeStartStr= params.get("couponUsageTimeStartStr").toString();
			Date date = DateUtil.convertToDate(couponUsageTimeStartStr);
			couponDetailsVO.setCouponUsageTimeStartStr(date);
		}
		if (!StringUtils.isBlank(params.get("couponUsageTimeEndStr").toString())) {
			String couponUsageTimeEndStr = params.get("couponUsageTimeEndStr").toString();
			Date date = DateUtil.convertToDate(couponUsageTimeEndStr);
			couponDetailsVO.setCouponUsageTimeEndStr(date);
		}
		ObjectUtil.convertMapToObject(params, couponDetailsVO, "beanName", "templateFile", "fileName");
		List<CouponDetailsVO> selectInfoByParams = couponDetailsDAO
				.selectInfoByParams(couponDetailsVO);
		context.putVar("items", selectInfoByParams);
	}

	@Override
	public void insertLog(CouponDetailsVO couponDetailsVO) throws Exception {
		// TODO Auto-generated method stub
		couponDetailsDAO.insertLog(couponDetailsVO);
	}

}
