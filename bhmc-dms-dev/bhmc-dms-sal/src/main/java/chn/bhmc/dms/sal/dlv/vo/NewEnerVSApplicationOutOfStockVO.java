package chn.bhmc.dms.sal.dlv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 
 * @author hasee
 *
 */

public class NewEnerVSApplicationOutOfStockVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String vinNo;
	private String licensePlate;
	private String vehTypeName;
	private String saleTime;
	private String saleArea;
	private String ownerName;
	private String idnum;
	private String epname;
	private String epaddress;
	private String epcode;
	private String ifresult;
	
	private String iffailmsg;
	private String createdate;
	private String updatedate;
	private String contractCustNo;
	
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date ifRegDt;
	private String batId;
	
	
	
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
	public String getLicensePlate() {
		return licensePlate;
	}
	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}
	public String getVehTypeName() {
		return vehTypeName;
	}
	public void setVehTypeName(String vehTypeName) {
		this.vehTypeName = vehTypeName;
	}
	public String getSaleTime() {
		return saleTime;
	}
	public void setSaleTime(String saleTime) {
		this.saleTime = saleTime;
	}
	public String getSaleArea() {
		return saleArea;
	}
	public void setSaleArea(String saleArea) {
		this.saleArea = saleArea;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getIdnum() {
		return idnum;
	}
	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}
	public String getEpname() {
		return epname;
	}
	public void setEpname(String epname) {
		this.epname = epname;
	}
	public String getEpaddress() {
		return epaddress;
	}
	public void setEpaddress(String epaddress) {
		this.epaddress = epaddress;
	}
	public String getEpcode() {
		return epcode;
	}
	public void setEpcode(String epcode) {
		this.epcode = epcode;
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
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getBatId() {
		return batId;
	}
	public void setBatId(String batId) {
		this.batId = batId;
	}
	public Date getIfRegDt() {
		return ifRegDt;
	}
	public void setIfRegDt(Date ifRegDt) {
		this.ifRegDt = ifRegDt;
	}
	
	
	
	

}
