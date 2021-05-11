package chn.bhmc.dms.bat.ser.rcv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.bat.ser.rcv.vo.PayCalculateSearchVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayCalculateVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PaymentCompleteVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayRepairOrderVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayServiceReceiveDetailVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayServiceReceiveSearchVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayServiceReceiveVO;

@Mapper("paymentCompleteDAO")
public interface PaymentCompleteDAO {

	public List<PaymentCompleteVO> selectByParams(PaymentCompleteVO paymentCompleteVO) throws Exception;

	public List<PaymentCompleteVO> selectDetail(PaymentCompleteVO paymentCompleteVO) throws Exception;

	public PayCalculateVO selectCalculateByKey(PayCalculateSearchVO searchVO) throws Exception;

	public List<PayServiceReceiveDetailVO> selectServiceReceiveDetailsByCondition(PayServiceReceiveSearchVO searchVO)
			throws Exception;

	public void updateServiceReceiveDetail(PayServiceReceiveDetailVO obj) throws Exception;

	public PayServiceReceiveDetailVO selectServiceReceiveConfimByKey(PayServiceReceiveSearchVO searchVO) throws Exception;

	public void insertServiceReceiveHistory(PayServiceReceiveDetailVO obj) throws Exception;

	public int updateServiceReceive(PayServiceReceiveVO serviceReceiveVO) throws Exception;
	
	public int updateRepairOrder(PayRepairOrderVO repairOrderVO) throws Exception;
	
	//20191213 add by wushibin
	public List<PaymentCompleteVO> selectInfoByTradeId(PaymentCompleteVO paymentCompleteVO) throws Exception;
	
}
