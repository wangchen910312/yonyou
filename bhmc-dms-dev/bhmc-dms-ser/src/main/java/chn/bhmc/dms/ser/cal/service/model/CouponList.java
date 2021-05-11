package chn.bhmc.dms.ser.cal.service.model;

import java.io.Serializable;

public class CouponList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3161832402047997220L;
	
	private String couponAmount;// 优惠券面值

	private String couponChannelCode;// 优惠券渠道

	private String couponCode;// 卡券编码

	private String couponName;// 卡券编码

	private String couponState;// 卡券状态

	private String couponType;// 卡券类型

	private String useBeginDate;// 有效期开始日期

	private String useEndDate;// 有效期结束日期

	private String receiveTime;// 卡券领取时间

	public String getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(String receiveTime) {
		this.receiveTime = receiveTime;
	}

	public String getCouponAmount() {
		return couponAmount;
	}

	public void setCouponAmount(String couponAmount) {
		this.couponAmount = couponAmount;
	}

	public String getCouponChannelCode() {
		return couponChannelCode;
	}

	public void setCouponChannelCode(String couponChannelCode) {
		this.couponChannelCode = couponChannelCode;
	}

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

	public String getCouponType() {
		return couponType;
	}

	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}

	public String getUseBeginDate() {
		return useBeginDate;
	}

	public void setUseBeginDate(String useBeginDate) {
		this.useBeginDate = useBeginDate;
	}

	public String getUseEndDate() {
		return useEndDate;
	}

	public void setUseEndDate(String useEndDate) {
		this.useEndDate = useEndDate;
	}
	
	
}
