package chn.bhmc.dms.cmm.pay.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;

@Mapper("aggregatePaymentLogDAO")
public interface AggregatePaymentLogDAO {

	 public int insertLog(AggregatePaymentLogVO aggregatePaymentLogVO) throws Exception;

	 public List<AggregatePaymentLogVO> selectAggregatePaymentLog(AggregatePaymentLogVO aggregatePaymentLogVO);
	
}
