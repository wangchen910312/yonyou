package chn.bhmc.dms.bat.sal.rcp.vo;


import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

public class BatchInvImgOutInfoVo extends BaseSaveVO<Object> {
	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 4061096081594814296L;

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
	 * 删除发票图片
	 */
	private String delImg;
	
	/**
	 * 图片路径
	 */
	private String imgPath;
	
	
	
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

	public String getDelImg() {
		return delImg;
	}

	public void setDelImg(String delImg) {
		this.delImg = delImg;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	
	

}
