package chn.bhmc.dms.sal.dlv.vo;


import chn.bhmc.dms.core.datatype.BaseVO;



/**
 * 
 * @ClassName:  NewEnVSApplicationVehicleNetworkingSystemVo   
 * @Description:TODO(新能源车辆出库数据VO)   
 * @author: huyuansen 
 * @date:   2019年6月5日 下午2:07:33   
 *      
 *
 */
public class NewEnVSApplicationVehicleNetworkingSystemVo extends BaseVO {

	
	private static final long serialVersionUID = 1L;
	private String vinNo;
	private String sellTime; //销售时间
	private String sellCity; //购车城市
	private String dealerName; //经销商名称
	private String dlrCd;  //特约店（经销商）代码
	private String carLicense; //车牌
	private String carLicenseColor; //车牌颜色(1：渐变绿2：蓝色3：黄色4：白色5：黄绿双拼色6：黑色)
	private String saveCity; //存放城市
	private String saveAddress; //存放地址
	private String driveLicenseno; //机动车行驶证编号
	private String licenseRegisterDate; //行驶证注册日期 
	
	private String licenseGrantDate; //行驶证发放日期
	private String customerType; //客户类型1：个人2：公司
	private String privateOwnerName; //个人车主名字,客户类型为公司时该项为null
	private String privateOwnerIdentity; //个人车主证件号,客户类型为公司时该项为null
	private String privateOwnerPhone; //个人车主联系电话,客户类型为公司时该项为null
	private String privateOwnerAddress; //个人车主联系地址,客户类型为公司时该项为null
	private String unitName; //公司客户名称，客户类型为个人车主时该项为null
	private String vehUseFor; //公司客户对该车用途
	private String organizationCode; //公司客户统一社会信用码，客户类型为个人车主时该项为null
	private String legalPersonName; //公司法人姓名，客户类型为个人车主时该项为null
	private String legalPersonPhone; //公司法人手机号，客户类型为个人车主时该项为null
	private String legalPersonAddress; //公司法人联系地址，客户类型为个人车主时该项为null
	private String ifresult;
	private String ifRegDt;
	private String contractCustNo;
	
	
	
	public String getContractCustNo() {
		return contractCustNo;
	}
	public void setContractCustNo(String contractCustNo) {
		this.contractCustNo = contractCustNo;
	}
	public String getVinNo() {
		return vinNo;
	}
	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	public String getSellTime() {
		return sellTime;
	}
	public void setSellTime(String sellTime) {
		this.sellTime = sellTime;
	}
	public String getSellCity() {
		return sellCity;
	}
	public void setSellCity(String sellCity) {
		this.sellCity = sellCity;
	}
	public String getDealerName() {
		return dealerName;
	}
	public void setDealerName(String dealerName) {
		this.dealerName = dealerName;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getCarLicense() {
		return carLicense;
	}
	public void setCarLicense(String carLicense) {
		this.carLicense = carLicense;
	}
	public String getCarLicenseColor() {
		return carLicenseColor;
	}
	public void setCarLicenseColor(String carLicenseColor) {
		this.carLicenseColor = carLicenseColor;
	}
	public String getSaveCity() {
		return saveCity;
	}
	public void setSaveCity(String saveCity) {
		this.saveCity = saveCity;
	}
	public String getSaveAddress() {
		return saveAddress;
	}
	public void setSaveAddress(String saveAddress) {
		this.saveAddress = saveAddress;
	}
	public String getDriveLicenseno() {
		return driveLicenseno;
	}
	public void setDriveLicenseno(String driveLicenseno) {
		this.driveLicenseno = driveLicenseno;
	}
	public String getLicenseRegisterDate() {
		return licenseRegisterDate;
	}
	public void setLicenseRegisterDate(String licenseRegisterDate) {
		this.licenseRegisterDate = licenseRegisterDate;
	}
	public String getLicenseGrantDate() {
		return licenseGrantDate;
	}
	public void setLicenseGrantDate(String licenseGrantDate) {
		this.licenseGrantDate = licenseGrantDate;
	}
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	public String getPrivateOwnerName() {
		return privateOwnerName;
	}
	public void setPrivateOwnerName(String privateOwnerName) {
		this.privateOwnerName = privateOwnerName;
	}
	public String getPrivateOwnerIdentity() {
		return privateOwnerIdentity;
	}
	public void setPrivateOwnerIdentity(String privateOwnerIdentity) {
		this.privateOwnerIdentity = privateOwnerIdentity;
	}
	public String getPrivateOwnerPhone() {
		return privateOwnerPhone;
	}
	public void setPrivateOwnerPhone(String privateOwnerPhone) {
		this.privateOwnerPhone = privateOwnerPhone;
	}
	public String getPrivateOwnerAddress() {
		return privateOwnerAddress;
	}
	public void setPrivateOwnerAddress(String privateOwnerAddress) {
		this.privateOwnerAddress = privateOwnerAddress;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getVehUseFor() {
		return vehUseFor;
	}
	public void setVehUseFor(String vehUseFor) {
		this.vehUseFor = vehUseFor;
	}
	public String getOrganizationCode() {
		return organizationCode;
	}
	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}
	public String getLegalPersonName() {
		return legalPersonName;
	}
	public void setLegalPersonName(String legalPersonName) {
		this.legalPersonName = legalPersonName;
	}
	public String getLegalPersonPhone() {
		return legalPersonPhone;
	}
	public void setLegalPersonPhone(String legalPersonPhone) {
		this.legalPersonPhone = legalPersonPhone;
	}
	public String getLegalPersonAddress() {
		return legalPersonAddress;
	}
	public void setLegalPersonAddress(String legalPersonAddress) {
		this.legalPersonAddress = legalPersonAddress;
	}
	public String getIfresult() {
		return ifresult;
	}
	public void setIfresult(String ifresult) {
		this.ifresult = ifresult;
	}
	
	public String getIfRegDt() {
		return ifRegDt;
	}
	public void setIfRegDt(String ifRegDt) {
		this.ifRegDt = ifRegDt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	

	
	
	
	

}
