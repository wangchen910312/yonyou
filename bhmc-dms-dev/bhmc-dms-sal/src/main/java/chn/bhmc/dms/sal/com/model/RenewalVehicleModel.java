package chn.bhmc.dms.sal.com.model;

public class RenewalVehicleModel {
	
	// vehicleDataId 车型ID String
	private String vehicleDataId;
	
	// vehicleName 品牌型号 String
	private String vehicleName;
	
	// autoModelCode 车型代码 String
	private String autoModelCode;
	
	// exhaust 排量 String
	private String exhaust;
	
	// seatCount 座位数 String
	private String seatCount;
	
	// purchasePrice 新车购置价 String
	private String purchasePrice;
	
	// text 投保车型 String
	private String text;
	
	// remark 备注 String
	private String remark;
	
	// marketDate 制造年月 String
	private String marketDate;
	
	// display 保险公司展示名称 String
	private String display;

	public String getVehicleDataId() {
		return vehicleDataId;
	}

	public void setVehicleDataId(String vehicleDataId) {
		this.vehicleDataId = vehicleDataId;
	}

	public String getVehicleName() {
		return vehicleName;
	}

	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}

	public String getAutoModelCode() {
		return autoModelCode;
	}

	public void setAutoModelCode(String autoModelCode) {
		this.autoModelCode = autoModelCode;
	}

	public String getExhaust() {
		return exhaust;
	}

	public void setExhaust(String exhaust) {
		this.exhaust = exhaust;
	}

	public String getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(String seatCount) {
		this.seatCount = seatCount;
	}

	public String getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(String purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getMarketDate() {
		return marketDate;
	}

	public void setMarketDate(String marketDate) {
		this.marketDate = marketDate;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	@Override
	public String toString() {
		return "RenewalVehicleModel [vehicleDataId=" + vehicleDataId + ", vehicleName=" + vehicleName
				+ ", autoModelCode=" + autoModelCode + ", exhaust=" + exhaust + ", seatCount=" + seatCount
				+ ", purchasePrice=" + purchasePrice + ", text=" + text + ", remark=" + remark + ", marketDate="
				+ marketDate + ", display=" + display + "]";
	}
	
}
