package chn.bhmc.dms.cmm.pay.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.pay.service.AggregatePaymentLogService;
import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;
import chn.bhmc.dms.core.datatype.SearchResult;

@Controller
@RequestMapping(value = "/cmm/pay")
public class AggregatePaymentLogController  extends HController{
	
	@Resource(name="aggregatePaymentLogService")
    AggregatePaymentLogService aggregatePaymentLogService;
	
	@RequestMapping(value = "/selectAggregatePaymentLog.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectAggregatePaymentLog(@RequestBody AggregatePaymentLogVO aggregatePaymentLogVO) throws Exception {
		SearchResult result = new SearchResult();
		List<AggregatePaymentLogVO> selectInfoByCarRegNo = aggregatePaymentLogService.selectAggregatePaymentLog(aggregatePaymentLogVO);
		if (selectInfoByCarRegNo==null) {
			result.setTotal(0);
		}else {
			result.setTotal(selectInfoByCarRegNo.size());
		}
		if(result.getTotal() != 0){
            result.setData(selectInfoByCarRegNo);
        }
		return result;
	}

}
