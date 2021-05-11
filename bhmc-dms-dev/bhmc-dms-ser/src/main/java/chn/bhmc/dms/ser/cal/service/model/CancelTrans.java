package chn.bhmc.dms.ser.cal.service.model;

/*
* 退款
* 2019-07-02
* */

import java.io.Serializable;

public class CancelTrans implements Serializable {

	// 服务平台订单id String(10) 非空 生成二维码产生的id
	private String tradeId;

	// 经销商代码类型 String(10) 非空 常量10081001(销售) 10081002(售后)
	private String dealerType;

	// 经销商代码 String(20) 非空 经销商服务代码 eg:ASA
	private String dealerCode;

	// 品牌代码 String(20) 非空
	private String groupCode;

	// 退款金额 String(30) 非空 金额不可大于原定单金额
	private String orderAmount;

	// 退款说明 String(10) 可空
	private String orderNote;

	// 备注信息 String(100) 可空
	private String remark;

	// 退款人 String(50) 可空
	private String refundPerson;

	// 渠道号 String(10) 非空 常量121 (服务平台分配的渠道编号)
	private String channel;

	// 签名 String(100) 非空 参数Md5加密生成的签名，见1.1.2
	private String sign;

	// 发生时间 Long 非空 取值：new Date().getTime() eg: 1432710115000
	private Long occurtime;

	private String dlrcd;

	public String getDlrcd() {
		return dlrcd;
	}

	public void setDlrcd(String dlrcd) {
		this.dlrcd = dlrcd;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getDealerType() {
		return dealerType;
	}

	public void setDealerType(String dealerType) {
		this.dealerType = dealerType;
	}

	public String getDealerCode() {
		return dealerCode;
	}

	public void setDealerCode(String dealerCode) {
		this.dealerCode = dealerCode;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderNote() {
		return orderNote;
	}

	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRefundPerson() {
		return refundPerson;
	}

	public void setRefundPerson(String refundPerson) {
		this.refundPerson = refundPerson;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public Long getOccurtime() {
		return occurtime;
	}

	public void setOccurtime(Long occurtime) {
		this.occurtime = occurtime;
	}
}
