package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.datatype.SearchVO;

public class TmpDmsOrderCheckVO extends SearchVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String checkMonth;
	private String dlrCd;
	private String dmsIpNm;
	private String dmsUseYn;
	private String aliveYn;
	private int erpOrderNotmatch;
	private int erpOrderMatch;
	private int dmsOrderNotmatch;
	private int dmsOrderMatch;
	private int notmatch_diff;
	private int matchDiff;
	private int totalDiff;
	private String checkResult;
	private String checkMessage;
	private String updateResult;
	private String updateMessage;
	
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
	public int getErpOrderNotmatch() {
		return erpOrderNotmatch;
	}
	public void setErpOrderNotmatch(int erpOrderNotmatch) {
		this.erpOrderNotmatch = erpOrderNotmatch;
	}
	public int getErpOrderMatch() {
		return erpOrderMatch;
	}
	public void setErpOrderMatch(int erpOrderMatch) {
		this.erpOrderMatch = erpOrderMatch;
	}
	public int getDmsOrderNotmatch() {
		return dmsOrderNotmatch;
	}
	public void setDmsOrderNotmatch(int dmsOrderNotmatch) {
		this.dmsOrderNotmatch = dmsOrderNotmatch;
	}
	public int getDmsOrderMatch() {
		return dmsOrderMatch;
	}
	public void setDmsOrderMatch(int dmsOrderMatch) {
		this.dmsOrderMatch = dmsOrderMatch;
	}
	public int getNotmatch_diff() {
		return notmatch_diff;
	}
	public void setNotmatch_diff(int notmatch_diff) {
		this.notmatch_diff = notmatch_diff;
	}
	public int getMatchDiff() {
		return matchDiff;
	}
	public void setMatchDiff(int matchDiff) {
		this.matchDiff = matchDiff;
	}
	public int getTotalDiff() {
		return totalDiff;
	}
	public void setTotalDiff(int totalDiff) {
		this.totalDiff = totalDiff;
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
	public String getUpdateResult() {
		return updateResult;
	}
	public void setUpdateResult(String updateResult) {
		this.updateResult = updateResult;
	}
	public String getUpdateMessage() {
		return updateMessage;
	}
	public void setUpdateMessage(String updateMessage) {
		this.updateMessage = updateMessage;
	}
	
}