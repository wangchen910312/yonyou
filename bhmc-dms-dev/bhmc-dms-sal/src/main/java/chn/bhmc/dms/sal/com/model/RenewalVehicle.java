package chn.bhmc.dms.sal.com.model;

public class RenewalVehicle {
	
	// owner 车主 String
	private String owner;
	
	// licenseNo 车牌号 String
	private String licenseNo;
	
	// frameNo 车架号 String
	private String frameNo;
	
	// engineNo 发动机号 String
	private String engineNo;
	
	// enrollDate 初登日期 String
	private String enrollDate;
	
	// vehicleName 品牌型号 String
	private String vehicleName;
	
	// seatCount 座位数 String
	private String seatCount;
	
	// vehicleNature 使用性质 String
	private String vehicleNature;
	
	// vehicleDataId 车型 id String
	private String vehicleDataId;
	
	// model 续保选定车型 RenewalVehicleModel
	private RenewalVehicleModel model ;

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	public String getFrameNo() {
		return frameNo;
	}

	public void setFrameNo(String frameNo) {
		this.frameNo = frameNo;
	}

	public String getEngineNo() {
		return engineNo;
	}

	public void setEngineNo(String engineNo) {
		this.engineNo = engineNo;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getVehicleName() {
		return vehicleName;
	}

	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}

	public String getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(String seatCount) {
		this.seatCount = seatCount;
	}

	public String getVehicleNature() {
		return vehicleNature;
	}

	public void setVehicleNature(String vehicleNature) {
		this.vehicleNature = vehicleNature;
	}

	public String getVehicleDataId() {
		return vehicleDataId;
	}

	public void setVehicleDataId(String vehicleDataId) {
		this.vehicleDataId = vehicleDataId;
	}

	public RenewalVehicleModel getModel() {
		return model;
	}

	public void setModel(RenewalVehicleModel model) {
		this.model = model;
	}

	@Override
	public String toString() {
		return "RenewalVehicle [owner=" + owner + ", licenseNo=" + licenseNo + ", frameNo=" + frameNo + ", engineNo="
				+ engineNo + ", enrollDate=" + enrollDate + ", vehicleName=" + vehicleName + ", seatCount=" + seatCount
				+ ", vehicleNature=" + vehicleNature + ", vehicleDataId=" + vehicleDataId + ", model=" + model + "]";
	}
	
	
}
