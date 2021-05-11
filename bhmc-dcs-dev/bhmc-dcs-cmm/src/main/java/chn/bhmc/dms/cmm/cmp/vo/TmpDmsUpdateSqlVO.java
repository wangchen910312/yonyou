package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;
import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

public class TmpDmsUpdateSqlVO extends SearchVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String checkMonth;
	private String dlrCd;
	private String dmsIpNm;
	private String dmsUseYn;
	private String aliveYn;
	private Date updateDt;
	private String updateResult;
	private String updateMessage;
	private String updateDtStr;
	
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
	public Date getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(Date updateDt) {
		this.updateDt = updateDt;
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
	public String getUpdateDtStr() {
		return updateDtStr;
	}
	public void setUpdateDtStr(String updateDtStr) {
		this.updateDtStr = updateDtStr;
	}
	
}