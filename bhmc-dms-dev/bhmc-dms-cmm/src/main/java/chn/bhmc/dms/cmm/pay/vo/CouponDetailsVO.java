package chn.bhmc.dms.cmm.pay.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 聚合支付优惠券明细查询 wushibin 20191209
 */
public class CouponDetailsVO extends BaseSearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1475079008300889501L;

	// 优惠卷卡号
	private String couponCode;

	// 卡卷名称
	private String couponName;

	// 状态
	private String couponState;

	// 平台交易流水号
	private String tradeId;

	// 单据号(根据对应的原始单据显示合同号或工单号，如果没有对应合同号，则为空)---》维修委托单号
	private String roDocNo;

	// 结算单号
	private String calcDocNo;

	// 收款单号
	private String paymentNo;

	// 有效期开始日期
	private String effectiveDate;

	// 有效期结束日期
	private String expiryDate;

	// 卡卷类型
	private String couponType;

	// 优惠卷渠道
	private String couponChannelCode;

	// 优惠卷面值
	private String couponAmount;

	// 实际抵扣金额
	private String payAmount;

	// 卡卷领取时间
	private String cardVolumeCollectionTime;

	// 优惠券使用时间
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date couponUsageTime;

	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date couponUsageTimeStartStr; // 优惠券使用时间起
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date couponUsageTimeEndStr; // 优惠券使用时间止

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date createDt;// 创建日期

	private String note1;

	private String note2;

	private String note3;

	private String note4;

	private String note5;

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponState() {
		return couponState;
	}

	public void setCouponState(String couponState) {
		this.couponState = couponState;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getRoDocNo() {
		return roDocNo;
	}

	public void setRoDocNo(String roDocNo) {
		this.roDocNo = roDocNo;
	}

	public String getCalcDocNo() {
		return calcDocNo;
	}

	public void setCalcDocNo(String calcDocNo) {
		this.calcDocNo = calcDocNo;
	}

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getCouponType() {
		return couponType;
	}

	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}

	public String getCouponChannelCode() {
		return couponChannelCode;
	}

	public void setCouponChannelCode(String couponChannelCode) {
		this.couponChannelCode = couponChannelCode;
	}

	public String getCouponAmount() {
		return couponAmount;
	}

	public void setCouponAmount(String couponAmount) {
		this.couponAmount = couponAmount;
	}

	public String getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(String payAmount) {
		this.payAmount = payAmount;
	}

	public String getCardVolumeCollectionTime() {
		return cardVolumeCollectionTime;
	}

	public void setCardVolumeCollectionTime(String cardVolumeCollectionTime) {
		this.cardVolumeCollectionTime = cardVolumeCollectionTime;
	}

	public Date getCouponUsageTime() {
		return couponUsageTime;
	}

	public void setCouponUsageTime(Date couponUsageTime) {
		this.couponUsageTime = couponUsageTime;
	}

	public Date getCouponUsageTimeStartStr() {
		return couponUsageTimeStartStr;
	}

	public void setCouponUsageTimeStartStr(Date couponUsageTimeStartStr) {
		this.couponUsageTimeStartStr = couponUsageTimeStartStr;
	}

	public Date getCouponUsageTimeEndStr() {
		return couponUsageTimeEndStr;
	}

	public void setCouponUsageTimeEndStr(Date couponUsageTimeEndStr) {
		this.couponUsageTimeEndStr = couponUsageTimeEndStr;
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

	public String getNote4() {
		return note4;
	}

	public void setNote4(String note4) {
		this.note4 = note4;
	}

	public String getNote5() {
		return note5;
	}

	public void setNote5(String note5) {
		this.note5 = note5;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
	
}
