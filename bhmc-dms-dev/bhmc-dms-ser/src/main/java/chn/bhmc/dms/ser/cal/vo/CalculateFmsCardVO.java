package chn.bhmc.dms.ser.cal.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

public class CalculateFmsCardVO extends BaseVO{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7013126728352970218L;
	/**
	 * 卡券编号
	 */
	private String lanBinCardNo;
	/**
	 * 店代码
	 */
	private String dlrCd;
	/**
	 * vin_no
	 */
	private String vinNo;
	/**
	 * 维修委托单号
	 */
	private String roDocNo;
	/**
	 * 是否核销
	 */
	private String couponWrite;
	/**
	 * 服务结算单
	 */
	private String calcDocNo;
	
	
	
	public String getCalcDocNo() {
		return calcDocNo;
	}
	public void setCalcDocNo(String calcDocNo) {
		this.calcDocNo = calcDocNo;
	}
	public String getCouponWrite() {
		return couponWrite;
	}
	public void setCouponWrite(String couponWrite) {
		this.couponWrite = couponWrite;
	}
	public String getLanBinCardNo() {
		return lanBinCardNo;
	}
	public void setLanBinCardNo(String lanBinCardNo) {
		this.lanBinCardNo = lanBinCardNo;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getVinNo() {
		return vinNo;
	}
	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	public String getRoDocNo() {
		return roDocNo;
	}
	public void setRoDocNo(String roDocNo) {
		this.roDocNo = roDocNo;
	}
	
	
	
	

}
