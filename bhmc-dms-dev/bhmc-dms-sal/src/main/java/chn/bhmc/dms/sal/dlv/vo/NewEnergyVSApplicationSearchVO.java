package chn.bhmc.dms.sal.dlv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 
 * @ClassName: NewEnergyVSApplicationSearchVO 
 * @Description: TODO
 * @author: huyuansen
 * @date: 2019年4月3日 下午1:44:49
 */

public class NewEnergyVSApplicationSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sDlrCd; 
    private String custNm;   // 车主姓名
    private String hpNo;     //车主联系电话
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applStartDt;  //申请开始日期
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applEndDt;  //申请结束日期
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invoStartDt;   //开票开始日期
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invoEndDt;   //开票结束日期
    private String carPurHumType;  //购车人类型
    private String statusNo; //状态
    private String sApplicationNo; //申请编号
    private String custTp; //客户类型
    private String sLangCd;//语言类型
    private String vinNo;//车架号
    private String carReturn; //退车
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applDt;  //申请日期
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date auditDt;  //审核日期
    
    
    
    
   	public String getCarReturn() {
   		return carReturn;
   	}
   	public void setCarReturn(String carReturn) {
   		this.carReturn = carReturn;
   	}
    
	public Date getApplDt() {
		return applDt;
	}
	public void setApplDt(Date applDt) {
		this.applDt = applDt;
	}
	public Date getAuditDt() {
		return auditDt;
	}
	public void setAuditDt(Date auditDt) {
		this.auditDt = auditDt;
	}
	public String getVinNo() {
		return vinNo;
	}
	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	public String getsLangCd() {
		return sLangCd;
	}
	public void setsLangCd(String sLangCd) {
		this.sLangCd = sLangCd;
	}
	public String getCustTp() {
		return custTp;
	}
	public void setCustTp(String custTp) {
		this.custTp = custTp;
	}
	public Date getApplStartDt() {
		return applStartDt;
	}
	public void setApplStartDt(Date applStartDt) {
		this.applStartDt = applStartDt;
	}
	public Date getApplEndDt() {
		return applEndDt;
	}
	public void setApplEndDt(Date applEndDt) {
		this.applEndDt = applEndDt;
	}
	public Date getInvoStartDt() {
		return invoStartDt;
	}
	public void setInvoStartDt(Date invoStartDt) {
		this.invoStartDt = invoStartDt;
	}
	public Date getInvoEndDt() {
		return invoEndDt;
	}
	public void setInvoEndDt(Date invoEndDt) {
		this.invoEndDt = invoEndDt;
	}
	public String getsApplicationNo() {
		return sApplicationNo;
	}
	public void setsApplicationNo(String sApplicationNo) {
		this.sApplicationNo = sApplicationNo;
	}
	public String getsDlrCd() {
		return sDlrCd;
	}
	public void setsDlrCd(String sDlrCd) {
		this.sDlrCd = sDlrCd;
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
	public String getCarPurHumType() {
		return carPurHumType;
	}
	public void setCarPurHumType(String carPurHumType) {
		this.carPurHumType = carPurHumType;
	}
	public String getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(String statusNo) {
		this.statusNo = statusNo;
	}
    
}
