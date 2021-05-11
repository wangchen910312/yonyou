package chn.bhmc.dms.sal.rcp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class SalesVhclCbinRcitAppScanSearchVO extends SearchVO{

	private String appReceiptId;
	
	private String receiptNo;
	
	private String receiptCd;
	
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sReceiptStDt;
	
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sReceiptEdDt;
	
	private String sumAmt;
	
	private String certFst;
	
	private String receiptInResource;
	
	private String receiptResource;
	
	private String regUsrId;
	
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date regDt;
	
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sScanStDt;
	
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sScanEdDt;
	
	private String receiptStatus;

	public String getAppReceiptId() {
		return appReceiptId;
	}

	public void setAppReceiptId(String appReceiptId) {
		this.appReceiptId = appReceiptId;
	}

	public String getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}

	public String getReceiptCd() {
		return receiptCd;
	}

	public void setReceiptCd(String receiptCd) {
		this.receiptCd = receiptCd;
	}

	

	public Date getsReceiptStDt() {
		return sReceiptStDt;
	}

	public void setsReceiptStDt(Date sReceiptStDt) {
		this.sReceiptStDt = sReceiptStDt;
	}

	public Date getsReceiptEdDt() {
		return sReceiptEdDt;
	}

	public void setsReceiptEdDt(Date sReceiptEdDt) {
		this.sReceiptEdDt = sReceiptEdDt;
	}

	public Date getScanStDt() {
		return sScanStDt;
	}

	public void setScanStDt(Date sScanStDt) {
		this.sScanStDt = sScanStDt;
	}

	public Date getScanEdDt() {
		return sScanEdDt;
	}

	public void setScanEdDt(Date sScanEdDt) {
		this.sScanEdDt = sScanEdDt;
	}

	public String getSumAmt() {
		return sumAmt;
	}

	public void setSumAmt(String sumAmt) {
		this.sumAmt = sumAmt;
	}

	public String getCertFst() {
		return certFst;
	}

	public void setCertFst(String certFst) {
		this.certFst = certFst;
	}

	public String getReceiptInResource() {
		return receiptInResource;
	}

	public void setReceiptInResource(String receiptInResource) {
		this.receiptInResource = receiptInResource;
	}

	public String getReceiptResource() {
		return receiptResource;
	}

	public void setReceiptResource(String receiptResource) {
		this.receiptResource = receiptResource;
	}

	public String getRegUsrId() {
		return regUsrId;
	}

	public void setRegUsrId(String regUsrId) {
		this.regUsrId = regUsrId;
	}

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public String getReceiptStatus() {
		return receiptStatus;
	}

	public void setReceiptStatus(String receiptStatus) {
		this.receiptStatus = receiptStatus;
	}
	
	
	

}
