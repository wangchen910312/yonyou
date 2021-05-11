package chn.bhmc.dms.ser.cal.service.model;

import java.io.Serializable;

/*
* Pos下单
* 2019-07-02
* 结算单选择支付方式为“聚合支付”调用该接口   收款管理输入金额
* */
public class RequestPayJson implements Serializable {

	// 渠道号 String(10) 非空 常量(服务平台分配的渠道编号)
	private String channel;

	// 发生时间 Long 非空 new Date().getTime() eg: 1432710115000
	private Long occurtime;

	// 签名 String(100) 非空 参数Md5加密生成的签名
	private String sign;

	// 付款流水号 String(50) 非空 渠道号_品牌代码_经销商代码_流水号（建议单据类型+单据号）
	private String paySeq;

	// 经销商代码类型 String(10) 非空 常量10081001(销售) 10081002(售后)
	private String dealerType;

	// 经销商代码 String(20) 非空 经销商服务代码 eg:ASA
	private String dealerCode;

	// 消息来源 String(10) 非空 常量10091001（经销商DMS）
	private String msgSrc;

	// 品牌代码 String(20) 非空
	private String groupCode;

	// 来源单据类型 String(10) 可空 DMS预约进场业务 非空，常量 10101001（DMS 维修保养预约单）10101002（DMS 维修工单）
	private String billType;

	// 来源单据编号 String(20) 可空 DMS预约进场业务，DMS预约进场维修的预约单号
	private String billCode;

	// 金额 String(30) 非空 操作金额(元，最低单位分)
	private String amount;

	// 下单人 String(10) 可空 王五
	private String operator;

	// 车主姓名 String（10） 非空
	private String motormasterName;

	// 车牌号 String(20) 非空
	private String plateNumber;

	// 是否生成二维码 String（10） 可空 0.否 1.是
	private String isQrcode;
	
	private String dlrcd;

	public String getDlrcd() {
		return dlrcd;
	}

	public void setDlrcd(String dlrcd) {
		this.dlrcd = dlrcd;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public Long getOccurtime() {
		return occurtime;
	}

	public void setOccurtime(Long occurtime) {
		this.occurtime = occurtime;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getPaySeq() {
		return paySeq;
	}

	public void setPaySeq(String paySeq) {
		this.paySeq = paySeq;
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

	public String getMsgSrc() {
		return msgSrc;
	}

	public void setMsgSrc(String msgSrc) {
		this.msgSrc = msgSrc;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getBillType() {
		return billType;
	}

	public void setBillType(String billType) {
		this.billType = billType;
	}

	public String getBillCode() {
		return billCode;
	}

	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getMotormasterName() {
		return motormasterName;
	}

	public void setMotormasterName(String motormasterName) {
		this.motormasterName = motormasterName;
	}

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public String getIsQrcode() {
		return isQrcode;
	}

	public void setIsQrcode(String isQrcode) {
		this.isQrcode = isQrcode;
	}

	@Override
	public String toString() {
		return "RequestPayJson{" + "channel='" + channel + '\'' + ", occurtime=" + occurtime + ", sign='" + sign + '\''
				+ ", paySeq='" + paySeq + '\'' + ", dealerType='" + dealerType + '\'' + ", dealerCode='" + dealerCode
				+ '\'' + ", msgSrc='" + msgSrc + '\'' + ", groupCode='" + groupCode + '\'' + ", billType='" + billType
				+ '\'' + ", billCode='" + billCode + '\'' + ", amount='" + amount + '\'' + ", operator='" + operator
				+ '\'' + ", motormasterName='" + motormasterName + '\'' + ", plateNumber='" + plateNumber + '\''
				+ ", isQrcode='" + isQrcode + '\'' + '}';
	}
}
