package chn.bhmc.dms.sal.com.vo;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class CommercialInsuranceVO extends BaseSearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//区别哪个页面调用保险查询的字段
	private String mesgTxt;
	
	private String sVinNo;// VIN

	private String zfnewsub;

	private String licenseNo; // 车牌号

	private String licenseType; // 车牌类型

	// VIN （ U车商api中车架号）
	private String frameNo;

	// 保单号
	private String policyNo;

	// 保险公司代码
	private String icCode;

	// 保险公司名称
	private String icName;

	// 险种（根据友钣喷提供转义）
	private String code;

	// 保险开始日期
	private String startDate;

	// 保险结束日期
	private String endDate;

	// 车主
	private String owner;

	// 手机
	private String phone;

	private String carRegNo;// 表车牌号
	
	//2019-07-31  add start
	private String vinNo;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date insuranceStartDate;//保险开始日期
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date insuranceEndDate;//保险结束日期
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date synchronizationDate;//同步日期
	private String note1;//保险金额
	private String note2;//保费
	private String note3;//类型 1是判断数据2是续保数据
	private String note4;//车主
	private String note5;//手机号
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date startDateStartStr; //开始日期起
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date startDateEndStr; //开始日期止
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date synchronizationDtStartStr;//同步日期起
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date synchronizationDtEndStr;//同步日期止
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date endDateStartStr;//保险结束日期起
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date endDateEndStr;//保险结束日期止
	//2019-07-31  add end
	
	// 店代码
	private String dlrCd;

	
	public String getMesgTxt() {
		return mesgTxt;
	}

	public void setMesgTxt(String mesgTxt) {
		this.mesgTxt = mesgTxt;
	}

	public String getsVinNo() {
		return sVinNo;
	}

	public void setsVinNo(String sVinNo) {
		this.sVinNo = sVinNo;
	}

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	
	public String getCarRegNo() {
		return carRegNo;
	}

	public void setCarRegNo(String carRegNo) {
		this.carRegNo = carRegNo;
	}

	public String getZfnewsub() {
		return zfnewsub;
	}

	public void setZfnewsub(String zfnewsub) {
		this.zfnewsub = zfnewsub;
	}

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getLicenseType() {
		return licenseType;
	}

	public void setLicenseType(String licenseType) {
		this.licenseType = licenseType;
	}

	public String getFrameNo() {
		return frameNo;
	}

	public void setFrameNo(String frameNo) {
		this.frameNo = frameNo;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	public String getIcCode() {
		return icCode;
	}

	public void setIcCode(String icCode) {
		this.icCode = icCode;
	}

	public String getIcName() {
		return icName;
	}

	public void setIcName(String icName) {
		this.icName = icName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	

	public Date getInsuranceEndDate() {
		return insuranceEndDate;
	}

	public void setInsuranceEndDate(Date insuranceEndDate) {
		this.insuranceEndDate = insuranceEndDate;
	}

	public Date getInsuranceStartDate() {
		return insuranceStartDate;
	}

	public void setInsuranceStartDate(Date insuranceStartDate) {
		this.insuranceStartDate = insuranceStartDate;
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



	
	
	public Date getStartDateStartStr() {
		return startDateStartStr;
	}

	public void setStartDateStartStr(Date startDateStartStr) {
		this.startDateStartStr = startDateStartStr;
	}

	public Date getStartDateEndStr() {
		return startDateEndStr;
	}

	public void setStartDateEndStr(Date startDateEndStr) {
		this.startDateEndStr = startDateEndStr;
	}

	public Date getSynchronizationDtStartStr() {
		return synchronizationDtStartStr;
	}

	public void setSynchronizationDtStartStr(Date synchronizationDtStartStr) {
		this.synchronizationDtStartStr = synchronizationDtStartStr;
	}

	public Date getSynchronizationDtEndStr() {
		return synchronizationDtEndStr;
	}

	public void setSynchronizationDtEndStr(Date synchronizationDtEndStr) {
		this.synchronizationDtEndStr = synchronizationDtEndStr;
	}

	public Date getEndDateStartStr() {
		return endDateStartStr;
	}

	public void setEndDateStartStr(Date endDateStartStr) {
		this.endDateStartStr = endDateStartStr;
	}

	public Date getEndDateEndStr() {
		return endDateEndStr;
	}

	public void setEndDateEndStr(Date endDateEndStr) {
		this.endDateEndStr = endDateEndStr;
	}

	public Date getSynchronizationDate() {
		return synchronizationDate;
	}

	public void setSynchronizationDate(Date synchronizationDate) {
		this.synchronizationDate = synchronizationDate;
	}

	@Override
	public String toString() {
		return "CommercialInsuranceVO [zfnewsub=" + zfnewsub + ", licenseNo=" + licenseNo + ", licenseType="
				+ licenseType + ", frameNo=" + frameNo + ", policyNo=" + policyNo + ", icCode=" + icCode + ", icName="
				+ icName + ", code=" + code + ", startDate=" + startDate + ", endDate=" + endDate + ", owner=" + owner
				+ ", phone=" + phone + ", carRegNo=" + carRegNo + ", vinNo=" + vinNo + "]";
	}

	

}
