package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.datatype.SearchVO;

public class TmpDcsOrderCheckVO extends SearchVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String checkMonth;
	private String dlrCd;
	private String dmsIpNm;
	private String dmsUseYn;
	private String aliveYn;
	private int erpOrderNotmatch;
	private int erpOrderMatch;
	private int dcsOrderNotmatch;
	private int dcsOrderMatch;
	private int notmatch_diff;
	private int matchDiff;
	private int totalDiff;
	
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
	public int getDcsOrderNotmatch() {
		return dcsOrderNotmatch;
	}
	public void setDcsOrderNotmatch(int dcsOrderNotmatch) {
		this.dcsOrderNotmatch = dcsOrderNotmatch;
	}
	public int getDcsOrderMatch() {
		return dcsOrderMatch;
	}
	public void setDcsOrderMatch(int dcsOrderMatch) {
		this.dcsOrderMatch = dcsOrderMatch;
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
	
	
}