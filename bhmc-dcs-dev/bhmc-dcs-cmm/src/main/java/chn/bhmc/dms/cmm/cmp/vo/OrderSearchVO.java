package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.datatype.SearchVO;

public class OrderSearchVO extends SearchVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String checkMonth;
	private String dlrCd;
	private String dmsIpNm;
	private String dmsUseYn;
	private String aliveYn;
	private String checkResult;
	private String checkMessage;
	private String sql;
	
	public String getCheckMonth() {
		return checkMonth;
	}
	public void setCheckMonth(String checkMonth) {
		this.checkMonth = checkMonth;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getDmsIpNm() {
		return dmsIpNm;
	}
	public void setDmsIpNm(String dmsIpNm) {
		this.dmsIpNm = dmsIpNm;
	}
	public String getDmsUseYn() {
		return dmsUseYn;
	}
	public void setDmsUseYn(String dmsUseYn) {
		this.dmsUseYn = dmsUseYn;
	}
	public String getAliveYn() {
		return aliveYn;
	}
	public void setAliveYn(String aliveYn) {
		this.aliveYn = aliveYn;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getCheckResult() {
		return checkResult;
	}
	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}
	public String getCheckMessage() {
		return checkMessage;
	}
	public void setCheckMessage(String checkMessage) {
		this.checkMessage = checkMessage;
	}

}