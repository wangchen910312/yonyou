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

public class ReceiveSaleVehicleVO extends SearchVO{

   
	/**
	 *
	 */
	private static final long serialVersionUID = 3244037395135397878L;
	
	//字段
    private String vinNo;       //车辆vin
    private String licensePlate;               //车牌
    private String vehTypeName;               //车辆用途名称 公务乘用车-111805 私人乘用车-111808
    private String saleTime;             //销售日期（非必填）2018-01-01
    private String saleArea;                 //省-市-区，即“销售地区”
    private String ownerName;         //所有人姓名（个人）
    private String idnum;           //所有人身份证号
    private String epname;             //企业名称
    private String epaddress;                 //企业地址
    private String epcode;             //企业统一信用代码
    private String limit;             //单次发送条数
    private String ifresult;             //接口传输结果
    private String iffailmsg;             //接口报错日志

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

	public static long getSerialversionuid() {
		return serialVersionUID;
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
