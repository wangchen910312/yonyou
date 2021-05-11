package chn.bhmc.dms.bat.sal.rcp.vo;


import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

public class BatchInvImgInfoVo extends BaseSaveVO<Object> {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3902105823955155036L;

	/**
	 * 经销商id
	 */
	private String dlrCd;
	
	/**
	 * vin_no
	 */
	private String vinNo;
	
	/**
	 * 发票号
	 */
	private String receiptNo;
	
	/**
	 * 发票图片信息
	 */
	private byte[] receiptImg;
	
	/**
	 * 上传时间
	 */
	private Date regDt;
	
	/**
	 * 年
	 */
	private String regYear;
	
	/**
	 * 月
	 */
	private String regMonth;
	
	/**
	 * 日
	 */
	private String regDay;
	
	/**
	 * 删除发票图片
	 */
	private String delImg;
	
	
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

	public String getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}

	public byte[] getReceiptImg() {
		return receiptImg;
	}

	public void setReceiptImg(byte[] receiptImg) {
		this.receiptImg = receiptImg;
	}
	
	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public String getRegYear() {
		return regYear;
	}

	public void setRegYear(String regYear) {
		this.regYear = regYear;
	}

	public String getRegMonth() {
		return regMonth;
	}

	public void setRegMonth(String regMonth) {
		this.regMonth = regMonth;
	}

	public String getRegDay() {
		return regDay;
	}

	public void setRegDay(String regDay) {
		this.regDay = regDay;
	}

	public String getDelImg() {
		return delImg;
	}

	public void setDelImg(String delImg) {
		this.delImg = delImg;
	}
	
	
	

}
