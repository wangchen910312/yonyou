package chn.bhmc.dms.mob.api.sales.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class SalesInvoiceVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1730555467329493689L;
	
	/**
	 * 店代码
	 */
	private String dlrCd;
	
	/**
	 * 发票主键
	 */
	private String appReceiptId;// APP_RECEIPT_ID
	
	/**
	 * RECEIPT_NO 发票号码
	 */
	
	private String receiptNo;
	
	/**
	 * RECEIPT_CD 发票代码
	 */
	private String receiptCd;
	
	
	/**
	 * RECEIPT_ISS_DT 开票日期
	 */
	 @JsonDeserialize(using=JsonDateDeserializer.class)
	 private  Date              receiptIssDt;
	 
	 /**
	  * 开票日期 string
	  */
	 private String receiptIssDtStr;
	 
	 /**
	  * SUM_AMT 开票金额
	  */
	 private double sumAmt;
	 
	 /**
	  * CERT_FST 验证状态（01.通过、02.未通过、03.待验证、04.不存在
	  */
	private String certFst;
	
	 /**
	  * RECEIPT_RESOURCE  发票来源（01.本店开票、02.他店开票、03.二网开票）
	  */
	private String receiptResource;
	
	/**
	 * RECEIPT_IN_RESOURCE 发票录入来源（01.DMS发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码）
	 */
	private String receiptInResource;
	
    /**
     * RECEIPT_STATUS 发票状态（01.正常、02.作废、03.红冲）
     */
	private String receiptStatus;
	
	/**
	 * SCAN_DT 扫码日期
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private  Date scanDt;
	
	/**
	 *  扫码日期Str
	 */
	private  String scanDtStr;
	
	/**
	 * REG_DT创建日期
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private  Date regDt;
	
	
	
	/**
	 * 创建人 REG_USR_ID
	 */
	private String regUsrId;

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

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

	public Date getReceiptIssDt() {
		return receiptIssDt;
	}

	public void setReceiptIssDt(Date receiptIssDt) {
		this.receiptIssDt = receiptIssDt;
	}

	public double getSumAmt() {
		return sumAmt;
	}

	public void setSumAmt(double sumAmt) {
		this.sumAmt = sumAmt;
	}

	public String getCertFst() {
		return certFst;
	}

	public void setCertFst(String certFst) {
		this.certFst = certFst;
	}

	public String getReceiptResource() {
		return receiptResource;
	}

	public void setReceiptResource(String receiptResource) {
		this.receiptResource = receiptResource;
	}

	public String getReceiptInResource() {
		return receiptInResource;
	}

	public void setReceiptInResource(String receiptInResource) {
		this.receiptInResource = receiptInResource;
	}

	public String getReceiptStatus() {
		return receiptStatus;
	}

	public void setReceiptStatus(String receiptStatus) {
		this.receiptStatus = receiptStatus;
	}

	public Date getScanDt() {
		return scanDt;
	}

	public void setScanDt(Date scanDt) {
		this.scanDt = scanDt;
	}

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public String getRegUsrId() {
		return regUsrId;
	}

	public void setRegUsrId(String regUsrId) {
		this.regUsrId = regUsrId;
	}

	public String getReceiptIssDtStr() {
		return receiptIssDtStr;
	}

	public void setReceiptIssDtStr(String receiptIssDtStr) {
		this.receiptIssDtStr = receiptIssDtStr;
	}

	public String getScanDtStr() {
		return scanDtStr;
	}

	public void setScanDtStr(String scanDtStr) {
		this.scanDtStr = scanDtStr;
	}
	
	
	
	
	
	 
}
