package chn.bhmc.dms.ser.ro.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 交车检查前对维修派工和维修进度的校验
 * 2019.12.12
 * @author tianjx
 *
 */
public class RepairCheckSearchVO extends SearchVO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4002981746243330809L;

	/**
	 * 经销商代码
	 */
	private String dirCd;
	
	/**
	 * 维修委托单号
	 */
	private String roDocNo;
	
	/**
	 * 工作状态代码
	 */
	private String wrkStatCd;
	
	/**
	 * 品质检查状态编码
	 */
	private String qtTestStatCd;
	
	/**
	 * 派工状态编码
	 */
	private String allocStatCd;

	
	public String getDirCd() {
		return dirCd;
	}

	public void setDirCd(String dirCd) {
		this.dirCd = dirCd;
	}

	public String getRoDocNo() {
		return roDocNo;
	}

	public void setRoDocNo(String roDocNo) {
		this.roDocNo = roDocNo;
	}

	public String getWrkStatCd() {
		return wrkStatCd;
	}

	public void setWrkStatCd(String wrkStatCd) {
		this.wrkStatCd = wrkStatCd;
	}

	public String getQtTestStatCd() {
		return qtTestStatCd;
	}

	public void setQtTestStatCd(String qtTestStatCd) {
		this.qtTestStatCd = qtTestStatCd;
	}

	public String getAllocStatCd() {
		return allocStatCd;
	}

	public void setAllocStatCd(String allocStatCd) {
		this.allocStatCd = allocStatCd;
	}

	@Override
	public String toString() {
		return "RepairCheckSearchVO [dirCd=" + dirCd + ", roDocNo=" + roDocNo + ", wrkStatCd=" + wrkStatCd
				+ ", qtTestStatCd=" + qtTestStatCd + ", allocStatCd=" + allocStatCd + "]";
	}
	
	
	
	
	
	

}
