package chn.bhmc.dms.sal.com.model;

import java.util.List;

public class RenewalBiz {

	// policyNo 保单号 String
	private String policyNo;
	
	// passedYears 险种过去年份 int
	private Integer passedYears;
	
	// startDate 保单开始日期 String
	private String startDate;
	
	// endDate 保单结束日期 String
	private String endDate;
	
	// startTime 保单开始时间 String
	private String startTime;
	
	// endTime 保单结束时间 String
	private String endTime;
	
	// icCode 保险公司代码 String
	private String icCode;
	
	// icName 保险公司名称 String
	private String icName;
	
	// selectionList 险种信息列表 List<RenewalBizSelection>
	List<RenewalBizSelection> selectionList;

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	public Integer getPassedYears() {
		return passedYears;
	}

	public void setPassedYears(Integer passedYears) {
		this.passedYears = passedYears;
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

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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

	public List<RenewalBizSelection> getSelectionList() {
		return selectionList;
	}

	public void setSelectionList(List<RenewalBizSelection> selectionList) {
		this.selectionList = selectionList;
	}

	@Override
	public String toString() {
		return "RenewalBiz [policyNo=" + policyNo + ", passedYears=" + passedYears + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", startTime=" + startTime + ", endTime=" + endTime + ", icCode=" + icCode
				+ ", icName=" + icName + ", selectionList=" + selectionList + "]";
	}
	
	
	
}
