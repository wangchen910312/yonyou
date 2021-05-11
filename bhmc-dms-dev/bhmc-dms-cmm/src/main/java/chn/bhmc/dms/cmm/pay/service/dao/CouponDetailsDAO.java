package chn.bhmc.dms.cmm.pay.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.cmm.pay.vo.CouponDetailsVO;

@Mapper("couponDetailsDAO")
public interface CouponDetailsDAO {

	public int selectCount(CouponDetailsVO couponDetailsVO) throws Exception;

	public List<CouponDetailsVO> selectInfoByParams(CouponDetailsVO couponDetailsVO) throws Exception;

	public int insertLog(CouponDetailsVO couponDetailsVO) throws Exception;

}
