package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.datatype.SearchVO;

public class NumberContrastVO extends SearchVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int rnum;
	private String dlrCd;
	private String month;
	private int sapNoAllot;
	private int sapAllot;
	private int dcsNoAllot;
	private int dcsAllot;
	private int dmsNoAllot;
	private int dmsAllot;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getSapNoAllot() {
		return sapNoAllot;
	}
	public void setSapNoAllot(int sapNoAllot) {
		this.sapNoAllot = sapNoAllot;
	}
	public int getSapAllot() {
		return sapAllot;
	}
	public void setSapAllot(int sapAllot) {
		this.sapAllot = sapAllot;
	}
	public int getDcsNoAllot() {
		return dcsNoAllot;
	}
	public void setDcsNoAllot(int dcsNoAllot) {
		this.dcsNoAllot = dcsNoAllot;
	}
	public int getDcsAllot() {
		return dcsAllot;
	}
	public void setDcsAllot(int dcsAllot) {
		this.dcsAllot = dcsAllot;
	}
	public int getDmsNoAllot() {
		return dmsNoAllot;
	}
	public void setDmsNoAllot(int dmsNoAllot) {
		this.dmsNoAllot = dmsNoAllot;
	}
	public int getDmsAllot() {
		return dmsAllot;
	}
	public void setDmsAllot(int dmsAllot) {
		this.dmsAllot = dmsAllot;
	}
	
	

}