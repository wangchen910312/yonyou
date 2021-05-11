package chn.bhmc.dms.bat.sal.cdz.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReceiveSaleVehicleVO.java
 * @Description : 北理工销售接口
 * @author lyy
 * @since 2019. 5. 7.
 * @version 1.0
 * @see
 */

public class SalesVehicleMonitorVO extends SearchVO{

	private static final long serialVersionUID = 3244037395135397878L;

	private String vin;       //车辆vin
    private String sellTime;       //销售时间
    private String sellCity;       //购车城市
    private String dealerCode;       //经销商代码
    private String dealerName;       //经销商名称
    private String carLicense;       //车牌号
    private String carLicenseColor;       //车牌的颜色
    private String saveCity;       //存放城市
    private String saveAddress;       //存放地址
    private String driveLicenseno;       //机动车行驶证编号
    private String licenseRegisterDate;       //行驶证注册日期
    private String licenseGrantDate;       //行驶证发放日期
    private String customerType;       //客户类型1：个人2：公司
    private String privateOwnerName;       //个人车主名字,客户类型为公司时该项为null
    private String privateOwnerIdentity;       //个人车主证件号,客户类型为公司时该项为null
    private String privateOwnerPhone;       //个人车主联系电话,客户类型为公司时该项为null
    private String privateOwnerAddress;       //个人车主联系地址,客户类型为公司时该项为null
    private String unitName;       //公司客户名称，客户类型为个人车主时该项为null
    private String vehUseFor;       //公司客户对该车用途（1：公交客车2：通勤客车3：旅游客车4：公路客车5：公务乘用车6：出租乘用车7：租赁乘用车），客户类型为个人车主时该项为null
    private String organizationCode;       //公司客户统一社会信用码，客户类型为个人车主时该项为null
    private String legalPersonName;       //公司法人姓名，客户类型为个人车主时该项为null
    private String legalPersonPhone;       //公司法人手机号，客户类型为个人车主时该项为null
    private String legalPersonAddress;       //公司法人联系地址，客户类型为个人车主时该项为null
    private String limit;             //单次发送条数
    private String ifresult;             //接口传输结果
    private String iffailmsg;             //接口报错日志
    
	public String getVin() {
		return vin;
	}
	public void setVin(String vin) {
		this.vin = vin;
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
	public String getDealerCode() {
		return dealerCode;
	}
	public void setDealerCode(String dealerCode) {
		this.dealerCode = dealerCode;
	}
	public String getDealerName() {
		return dealerName;
	}
	public void setDealerName(String dealerName) {
		this.dealerName = dealerName;
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
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public String getIfresult() {
		return ifresult;
	}
	public void setIfresult(String ifresult) {
		this.ifresult = ifresult;
	}
	public String getIffailmsg() {
		return iffailmsg;
	}
	public void setIffailmsg(String iffailmsg) {
		this.iffailmsg = iffailmsg;
	}

}
