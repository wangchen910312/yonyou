package chn.bhmc.dms.sal.dlv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 
 * @ClassName: NewEnergyVSApplicationVO 
 * @Description: TODO
 * @author: huyuansen
 * @date: 2019年4月3日 下午2:06:54
 */

public class NewEnergyVSApplicationVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    private String dlrCd;     //经销商代码
    private String dlrCdStr; //经销商姓名
    private String applicationNo;    //补贴申请编号 
    private String custNm;     //车主姓名
    private String hpNo;       //车主联系电话
    private String mathDocTp ;  //证件类型 
    private String ssnCrnNo;    //证件号码
    private String purcMngNm;  //单位联系人姓名
    
    
    private String addrDetlCont;  //详细地址
    private String officeNm;    //单位名称 
    private String regNo;       //统一社会信用代码
    private String pername;     //购车人姓名
    private String perphon;     //购车人联系电话
    private String officeAds;   //购车单位详细地址
    private String ownRgstNm;   //单位法人代表姓名 
    private String ownRgstTelNo; //法人代表联系电话
    private String modelCd; //车型代号
    private String vinNo; //车架号
    private String wehicleUse; //车辆用途
    private String carRegNo; //车牌号
    private String carRegColor; //车牌颜色
    private String makerCd; //品牌型号
    private String drivePermitNo; //行驶证号码
    private String carRegCity; //上牌城市
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date drivLicenseDt; //行驶证注册日期
    private String purcPayNo; //购置税完税凭证号
    private String insurNo;  //交强险保险单号
    private String carRegiNo;  //机动车登记证号
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carRegiDt;  //车辆初次登记日期
    private String invoCo;  //发票代码
    private String invoNo;  //发票号码
    private String invoMn;  //发票金额
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invoDt;  //开票日期
    private String encl;  //附件
    private String remarek;  //备注
    private String reason;  //原因
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applDt;  //申请日期
    
    private String statusNo;//状态
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date auditDt;  //审核日期
    private String carBuyArea;  //购车领域
    private String headFileDocId; //附件id
    private String newEnterFileNo; //附件号码
    private String custTp; //客户类型
    private String wehicleUseStr; //车辆用途star
    private String carBuyAreaStr; //购车领域star
    private String statusNoStr;//状态
    private String carRegColorStr; //车牌颜色star
    private String mathDocTpStr;//证件类型star
    private String humanPropertyType; //产权人类型
    private String addressChargingCar; //充电桩地址
    private String drivLicenseDtStr; //行驶证注册日期star
    private String carRegiDtStr; //车辆初次登记日期
    private String invoDtStr;//开票日期
    private String approveCd; //提报标识
    private String humanPropertyTypeStr; //产权人类型star
    private String ifresult;//传输状态
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ifRegDt;//排序时间
    private String modelCdStr; //车型代号star
    private String custCd; //客户信息详情ID   
    private String applDtStr; //申请日期star
    private String auditDtStr; //审核日期star
    private int rnums; //行号
    private String sungNm;//上牌城市 省
    private String cityNm;//上牌城市 市
    private String distNm;//上牌城市 区
    
    //CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 EIGHT_FIELDS 八大领域 WH_EIGHT_FIELDS 是否是 八大领域
    private String eightFields;  //八大领域
    private String eightFieldz;  //八大领域 中文
    private String whEightFields; //是否是 八大领域 Y 是 ，N 否
    private String whEightFieldz; //是否是 八大领域  中文
    
    
	
	
	
	public String getSungNm() {
		return sungNm;
	}
	public void setSungNm(String sungNm) {
		this.sungNm = sungNm;
	}
	public String getCityNm() {
		return cityNm;
	}
	public void setCityNm(String cityNm) {
		this.cityNm = cityNm;
	}
	public String getDistNm() {
		return distNm;
	}
	public void setDistNm(String distNm) {
		this.distNm = distNm;
	}
	public String getDlrCdStr() {
		return dlrCdStr;
	}
	public void setDlrCdStr(String dlrCdStr) {
		this.dlrCdStr = dlrCdStr;
	}
	public int getRnums() {
		return rnums;
	}
	public void setRnums(int rnums) {
		this.rnums = rnums;
	}
	public String getPurcMngNm() {
		return purcMngNm;
	}
	public void setPurcMngNm(String purcMngNm) {
		this.purcMngNm = purcMngNm;
	}
	public String getApplDtStr() {
		return applDtStr;
	}
	public void setApplDtStr(String applDtStr) {
		this.applDtStr = applDtStr;
	}
	public String getAuditDtStr() {
		return auditDtStr;
	}
	public void setAuditDtStr(String auditDtStr) {
		this.auditDtStr = auditDtStr;
	}
	public String getCustCd() {
		return custCd;
	}
	public void setCustCd(String custCd) {
		this.custCd = custCd;
	}
	public String getModelCdStr() {
		return modelCdStr;
	}
	public void setModelCdStr(String modelCdStr) {
		this.modelCdStr = modelCdStr;
	}
	public Date getIfRegDt() {
		return ifRegDt;
	}
	public void setIfRegDt(Date ifRegDt) {
		this.ifRegDt = ifRegDt;
	}
	public String getIfresult() {
		return ifresult;
	}
	public void setIfresult(String ifresult) {
		this.ifresult = ifresult;
	}
	public String getHumanPropertyTypeStr() {
		return humanPropertyTypeStr;
	}
	public void setHumanPropertyTypeStr(String humanPropertyTypeStr) {
		this.humanPropertyTypeStr = humanPropertyTypeStr;
	}
	public String getApproveCd() {
		return approveCd;
	}
	public void setApproveCd(String approveCd) {
		this.approveCd = approveCd;
	}
	public String getCarRegiDtStr() {
		return carRegiDtStr;
	}
	public void setCarRegiDtStr(String carRegiDtStr) {
		this.carRegiDtStr = carRegiDtStr;
	}
	public String getInvoDtStr() {
		return invoDtStr;
	}
	public void setInvoDtStr(String invoDtStr) {
		this.invoDtStr = invoDtStr;
	}
	public String getDrivLicenseDtStr() {
		return drivLicenseDtStr;
	}
	public void setDrivLicenseDtStr(String drivLicenseDtStr) {
		this.drivLicenseDtStr = drivLicenseDtStr;
	}
	public String getAddressChargingCar() {
		return addressChargingCar;
	}
	public void setAddressChargingCar(String addressChargingCar) {
		this.addressChargingCar = addressChargingCar;
	}
	public String getHumanPropertyType() {
		return humanPropertyType;
	}
	public void setHumanPropertyType(String humanPropertyType) {
		this.humanPropertyType = humanPropertyType;
	}
	public String getMathDocTpStr() {
		return mathDocTpStr;
	}
	public void setMathDocTpStr(String mathDocTpStr) {
		this.mathDocTpStr = mathDocTpStr;
	}
	public String getCarRegColorStr() {
		return carRegColorStr;
	}
	public void setCarRegColorStr(String carRegColorStr) {
		this.carRegColorStr = carRegColorStr;
	}
	
	public String getWehicleUseStr() {
		return wehicleUseStr;
	}
	public void setWehicleUseStr(String wehicleUseStr) {
		this.wehicleUseStr = wehicleUseStr;
	}
	public String getCarBuyAreaStr() {
		return carBuyAreaStr;
	}
	public void setCarBuyAreaStr(String carBuyAreaStr) {
		this.carBuyAreaStr = carBuyAreaStr;
	}
	public String getStatusNoStr() {
		return statusNoStr;
	}
	public void setStatusNoStr(String statusNoStr) {
		this.statusNoStr = statusNoStr;
	}
	public String getCustTp() {
		return custTp;
	}
	public void setCustTp(String custTp) {
		this.custTp = custTp;
	}
	public String getNewEnterFileNo() {
		return newEnterFileNo;
	}
	public void setNewEnterFileNo(String newEnterFileNo) {
		this.newEnterFileNo = newEnterFileNo;
	}
	public String getHeadFileDocId() {
		return headFileDocId;
	}
	public void setHeadFileDocId(String headFileDocId) {
		this.headFileDocId = headFileDocId;
	}
	public String getPername() {
		return pername;
	}
	public void setPername(String pername) {
		this.pername = pername;
	}
	public String getPerphon() {
		return perphon;
	}
	public void setPerphon(String perphon) {
		this.perphon = perphon;
	}
	public String getCarBuyArea() {
		return carBuyArea;
	}
	public void setCarBuyArea(String carBuyArea) {
		this.carBuyArea = carBuyArea;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public String getCustNm() {
		return custNm;
	}
	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}
	public String getHpNo() {
		return hpNo;
	}
	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}
	public String getMathDocTp() {
		return mathDocTp;
	}
	public void setMathDocTp(String mathDocTp) {
		this.mathDocTp = mathDocTp;
	}
	
	public String getSsnCrnNo() {
		return ssnCrnNo;
	}
	public void setSsnCrnNo(String ssnCrnNo) {
		this.ssnCrnNo = ssnCrnNo;
	}
	public String getAddrDetlCont() {
		return addrDetlCont;
	}
	public void setAddrDetlCont(String addrDetlCont) {
		this.addrDetlCont = addrDetlCont;
	}
	public String getOfficeNm() {
		return officeNm;
	}
	public void setOfficeNm(String officeNm) {
		this.officeNm = officeNm;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getOfficeAds() {
		return officeAds;
	}
	public void setOfficeAds(String officeAds) {
		this.officeAds = officeAds;
	}
	public String getOwnRgstNm() {
		return ownRgstNm;
	}
	public void setOwnRgstNm(String ownRgstNm) {
		this.ownRgstNm = ownRgstNm;
	}
	
	public String getOwnRgstTelNo() {
		return ownRgstTelNo;
	}
	public void setOwnRgstTelNo(String ownRgstTelNo) {
		this.ownRgstTelNo = ownRgstTelNo;
	}
	public String getModelCd() {
		return modelCd;
	}
	public void setModelCd(String modelCd) {
		this.modelCd = modelCd;
	}
	public String getVinNo() {
		return vinNo;
	}
	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	public String getWehicleUse() {
		return wehicleUse;
	}
	public void setWehicleUse(String wehicleUse) {
		this.wehicleUse = wehicleUse;
	}
	public String getCarRegNo() {
		return carRegNo;
	}
	public void setCarRegNo(String carRegNo) {
		this.carRegNo = carRegNo;
	}
	public String getCarRegColor() {
		return carRegColor;
	}
	public void setCarRegColor(String carRegColor) {
		this.carRegColor = carRegColor;
	}
	public String getMakerCd() {
		return makerCd;
	}
	public void setMakerCd(String makerCd) {
		this.makerCd = makerCd;
	}
	public String getDrivePermitNo() {
		return drivePermitNo;
	}
	public void setDrivePermitNo(String drivePermitNo) {
		this.drivePermitNo = drivePermitNo;
	}
	public String getCarRegCity() {
		return carRegCity;
	}
	public void setCarRegCity(String carRegCity) {
		this.carRegCity = carRegCity;
	}
	public Date getDrivLicenseDt() {
		return drivLicenseDt;
	}
	public void setDrivLicenseDt(Date drivLicenseDt) {
		this.drivLicenseDt = drivLicenseDt;
	}
	public String getPurcPayNo() {
		return purcPayNo;
	}
	public void setPurcPayNo(String purcPayNo) {
		this.purcPayNo = purcPayNo;
	}
	public String getInsurNo() {
		return insurNo;
	}
	public void setInsurNo(String insurNo) {
		this.insurNo = insurNo;
	}
	public String getCarRegiNo() {
		return carRegiNo;
	}
	public void setCarRegiNo(String carRegiNo) {
		this.carRegiNo = carRegiNo;
	}
	public Date getCarRegiDt() {
		return carRegiDt;
	}
	public void setCarRegiDt(Date carRegiDt) {
		this.carRegiDt = carRegiDt;
	}
	public String getInvoCo() {
		return invoCo;
	}
	public void setInvoCo(String invoCo) {
		this.invoCo = invoCo;
	}
	public String getInvoNo() {
		return invoNo;
	}
	public void setInvoNo(String invoNo) {
		this.invoNo = invoNo;
	}
	public String getInvoMn() {
		return invoMn;
	}
	public void setInvoMn(String invoMn) {
		this.invoMn = invoMn;
	}
	public Date getInvoDt() {
		return invoDt;
	}
	public void setInvoDt(Date invoDt) {
		this.invoDt = invoDt;
	}
	public String getEncl() {
		return encl;
	}
	public void setEncl(String encl) {
		this.encl = encl;
	}
	public String getRemarek() {
		return remarek;
	}
	public void setRemarek(String remarek) {
		this.remarek = remarek;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getApplDt() {
		return applDt;
	}
	public void setApplDt(Date applDt) {
		this.applDt = applDt;
	}
	public String getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(String statusNo) {
		this.statusNo = statusNo;
	}
	public Date getAuditDt() {
		return auditDt;
	}
	public void setAuditDt(Date auditDt) {
		this.auditDt = auditDt;
	}
	public String getEightFields() {
		return eightFields;
	}
	public void setEightFields(String eightFields) {
		this.eightFields = eightFields;
	}
	public String getEightFieldz() {
		return eightFieldz;
	}
	public void setEightFieldz(String eightFieldz) {
		this.eightFieldz = eightFieldz;
	}
	public String getWhEightFields() {
		return whEightFields;
	}
	public void setWhEightFields(String whEightFields) {
		this.whEightFields = whEightFields;
	}
	public String getWhEightFieldz() {
		return whEightFieldz;
	}
	public void setWhEightFieldz(String whEightFieldz) {
		this.whEightFieldz = whEightFieldz;
	}
    
    
    
   




}
