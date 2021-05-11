package chn.bhmc.dms.cmm.pay.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.pay.service.AggregatePaymentLogService;
import chn.bhmc.dms.cmm.pay.service.dao.AggregatePaymentLogDAO;
import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;

@Service("aggregatePaymentLogService")
public class AggregatePaymentLogServiceImpl extends HService implements AggregatePaymentLogService{

	@Resource(name = "aggregatePaymentLogDAO")
	AggregatePaymentLogDAO aggregatePaymentLogDAO;
	
	@Override
	public void insertLog(AggregatePaymentLogVO aggregatePaymentLogVO) throws Exception {
		// TODO Auto-generated method stub
		aggregatePaymentLogDAO.insertLog(aggregatePaymentLogVO);
	}

	@Override
	public List<AggregatePaymentLogVO> selectAggregatePaymentLog(AggregatePaymentLogVO aggregatePaymentLogVO) throws Exception {
		List<AggregatePaymentLogVO> selectAggregatePaymentLog = aggregatePaymentLogDAO.selectAggregatePaymentLog(aggregatePaymentLogVO);
		List<AggregatePaymentLogVO> aggregatePaymentLogVOs = new ArrayList<>();
		AggregatePaymentLogVO aggregatePaymentLogVO2 = new AggregatePaymentLogVO();
		if (selectAggregatePaymentLog.size()>0) {
			//最新的数据状态是否是下单状态0
			if (selectAggregatePaymentLog.get(0).getStatus().equals("0")) {
				//需要取消因为打开聚合窗口然后直接关闭浏览器导致订单重复下单
				aggregatePaymentLogVO2.setCode("1");
				aggregatePaymentLogVO2.setTriggerPage(selectAggregatePaymentLog.get(0).getTriggerPage());
				aggregatePaymentLogVO2.setTradeId(selectAggregatePaymentLog.get(0).getTradeId());
				aggregatePaymentLogVO2.setAmount(selectAggregatePaymentLog.get(0).getAmount());
				aggregatePaymentLogVO2.setBusinessNumber(selectAggregatePaymentLog.get(0).getBusinessNumber());
			}else {
				aggregatePaymentLogVO2.setCode("0");//状态为1/2/3不需要取消订单
			}
		}else {
			//没有聚合支付日志，不需要取消订单
			aggregatePaymentLogVO2.setCode("0");
		}
		aggregatePaymentLogVOs.add(aggregatePaymentLogVO2);
		return aggregatePaymentLogVOs;
	}

}
