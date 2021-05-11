package chn.bhmc.dms.cmm.pay.service;

import java.util.List;

import chn.bhmc.dms.cmm.pay.vo.CouponDetailsVO;
/**
 * 
 * 优惠券明细查询
 * 
 * @author wushibin
 * @since 2019.12.9.
 * @version 1.0
 * @see
 */
public interface CouponDetailsService {
	
	public int selectCount(CouponDetailsVO couponDetailsVO) throws Exception;
	
	public List<CouponDetailsVO> selectInfoByParams(CouponDetailsVO couponDetailsVO) throws Exception;
	
	public void insertLog(CouponDetailsVO couponDetailsVO) throws Exception;
	
}
