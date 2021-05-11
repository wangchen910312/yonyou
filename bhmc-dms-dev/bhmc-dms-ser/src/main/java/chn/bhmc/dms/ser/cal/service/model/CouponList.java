package chn.bhmc.dms.ser.cal.service.model;

import java.io.Serializable;

public class CouponList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3161832402047997220L;
	
	private String couponAmount;// �Ż�ȯ��ֵ

	private String couponChannelCode;// �Ż�ȯ����

	private String couponCode;// ��ȯ����

	private String couponName;// ��ȯ����

	private String couponState;// ��ȯ״̬

	private String couponType;// ��ȯ����

	private String useBeginDate;// ��Ч�ڿ�ʼ����

	private String useEndDate;// ��Ч�ڽ�������

	private String receiveTime;// ��ȯ��ȡʱ��

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
