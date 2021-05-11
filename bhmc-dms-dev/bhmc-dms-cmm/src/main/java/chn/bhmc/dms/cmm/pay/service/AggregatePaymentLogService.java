package chn.bhmc.dms.cmm.pay.service;

import java.util.List;

import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;

public interface AggregatePaymentLogService {
	
	public void insertLog(AggregatePaymentLogVO aggregatePaymentLogVO) throws Exception;
	
	public List<AggregatePaymentLogVO> selectAggregatePaymentLog(AggregatePaymentLogVO aggregatePaymentLogVO) throws Exception;
	
}
