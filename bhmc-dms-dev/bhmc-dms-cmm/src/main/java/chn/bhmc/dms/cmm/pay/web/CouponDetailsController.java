package chn.bhmc.dms.cmm.pay.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.pay.service.CouponDetailsService;
import chn.bhmc.dms.cmm.pay.vo.CouponDetailsVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 优惠券明细查询
 *
 * @author wushibin
 * @since 2019.12.9
 * @version 1.0
 * @see
 */

@Controller
@RequestMapping(value = "/cmm/coupon")
public class CouponDetailsController extends HController{
	
	@Resource(name="couponDetailsService")
    CouponDetailsService couponDetailsService;

	
	 //优惠券明细查询 jsp地址
    @RequestMapping(value = "/selectCouponMain.do", method = RequestMethod.GET)
    public String selectCouponMain(Model model) throws Exception {
        return "/ser/cal/coupon/selectCouponMain";
    }
    
    
    
    /**
	 * 优惠券明细查询 
	 * 
	 * @param commercialInsuranceVO
	 * @return
	 */
	@RequestMapping(value = "/selectCouponDetails.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectCouponDetails(@RequestBody CouponDetailsVO couponDetailsVO) throws Exception {
		SearchResult result = new SearchResult();
		result.setTotal(couponDetailsService.selectCount(couponDetailsVO));
		if(result.getTotal() != 0){
            result.setData(couponDetailsService.selectInfoByParams(couponDetailsVO));
        }
		return result;
	}
}
