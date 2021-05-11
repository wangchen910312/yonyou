package chn.bhmc.dms.bat.sal.rcp.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

public class BatchVehicleReceiptVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8031508805481118187L;

	private String carId;
	
	private String dlrCd;
	
	private String bindingCarYn;
	
	private String bindingReceiptFlag;
	
	private String temp4;
	
	private String grteStartDt;
	
	private String receiptIssDt;
	
	private String carlineCd;
	
	private String carRegNo;
	
	private String vinNo;

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getBindingCarYn() {
		return bindingCarYn;
	}

	public void setBindingCarYn(String bindingCarYn) {
		this.bindingCarYn = bindingCarYn;
	}

	public String getBindingReceiptFlag() {
		return bindingReceiptFlag;
	}

	public void setBindingReceiptFlag(String bindingReceiptFlag) {
		this.bindingReceiptFlag = bindingReceiptFlag;
	}

	public String getTemp4() {
		return temp4;
	}

	public void setTemp4(String temp4) {
		this.temp4 = temp4;
	}

	public String getGrteStartDt() {
		return grteStartDt;
	}

	public void setGrteStartDt(String grteStartDt) {
		this.grteStartDt = grteStartDt;
	}

	public String getReceiptIssDt() {
		return receiptIssDt;
	}

	public void setReceiptIssDt(String receiptIssDt) {
		this.receiptIssDt = receiptIssDt;
	}

	public String getCarlineCd() {
		return carlineCd;
	}

	public void setCarlineCd(String carlineCd) {
		this.carlineCd = carlineCd;
	}

	public String getCarRegNo() {
		return carRegNo;
	}

	public void setCarRegNo(String carRegNo) {
		this.carRegNo = carRegNo;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	
	
	
}
