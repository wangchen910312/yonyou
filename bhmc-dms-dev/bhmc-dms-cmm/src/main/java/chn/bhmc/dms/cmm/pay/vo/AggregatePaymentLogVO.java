package chn.bhmc.dms.cmm.pay.vo;

import java.util.Date;

public class AggregatePaymentLogVO {

	private String triggerPage;//触发页面
	
	private String tradeId;//订单id
	
	private String amount;//金额
	
	private Date createDt;//创建时间

	private String status;//状态 （0是pos下单初始，1取消支付，2支付完成，3退款）
	
	private String businessNumber;//业务编号
	
	private String note1;//特殊原因导致的多下单取消标识
	
	private String note2;
	
	private String note3;
	
	private String code;//0是无需取消订单，1是需取消订单
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTriggerPage() {
		return triggerPage;
	}

	public void setTriggerPage(String triggerPage) {
		this.triggerPage = triggerPage;
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

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBusinessNumber() {
		return businessNumber;
	}

	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}

	public String getNote1() {
		return note1;
	}

	public void setNote1(String note1) {
		this.note1 = note1;
	}

	public String getNote2() {
		return note2;
	}

	public void setNote2(String note2) {
		this.note2 = note2;
	}

	public String getNote3() {
		return note3;
	}

	public void setNote3(String note3) {
		this.note3 = note3;
	}
	
	
	
	
}
