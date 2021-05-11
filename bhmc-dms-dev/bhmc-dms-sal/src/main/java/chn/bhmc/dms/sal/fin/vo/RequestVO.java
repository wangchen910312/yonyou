package chn.bhmc.dms.sal.fin.vo;

import java.io.Serializable;

public class RequestVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 294663715581591298L;

	private String businessNumber;// 业务编号

	private String triggerPage;// 触发页面
	
	private String note1;//特殊原因导致的多下单取消标识

	// 订单
	private String tradeId;

	// 金额 String(30) 非空 操作金额(元，最低单位分)
	private String amount;

	// 是否生成二维码 String（10） 可空 0.否 1.是
	private String isQrcode;
	
	
	

	public String getNote1() {
		return note1;
	}

	public void setNote1(String note1) {
		this.note1 = note1;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getIsQrcode() {
		return isQrcode;
	}

	public void setIsQrcode(String isQrcode) {
		this.isQrcode = isQrcode;
	}

	public String getBusinessNumber() {
		return businessNumber;
	}

	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}

	public String getTriggerPage() {
		return triggerPage;
	}

	public void setTriggerPage(String triggerPage) {
		this.triggerPage = triggerPage;
	}

	
	
}
