package chn.bhmc.dms.bat.ser.rcv.service;

public interface PaymentCompleteService {
	
	/**
	 * 查询聚合订单id自动完成付款业务
	 * @throws Exception
	 */
	public void finish() throws Exception;

}
