package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

public class ClaimInvoiceExcelVO {
	/**
	 * 经销商id
	 */
	private String dlrCd;
	
	/**
	 * 经销商名字
	 */
	private String dlrNm;
	/**
	 * 索赔结算单信息
	 */
	private String invcNo;
    /**
     * 开票状态 01：未开票  02：已开票 03：已退票
     */
    private String receiptTp;

    /**
     * 收票日期
     */
    private Date recipDt;
    /**
     * 退票日期
     */
    private Date failDt;
    
    /**
     * 结算报表年月
     */
    private Date invcDt;
    
    /**
     * 结算金额
     */
    private double invcClaimTotAmt;
    
    /**
     * 确认金额
     */
    private double confirmTotAmt; 
    
    /**
     * 扣减金额
     */
    private double ddctTotAmt;

    /**
     * 快递单号
     */
    private String trsfNo;
    
    /**
     * 快递公司
     */
    private String expsCmpNm;
    

    /**
     * 快递状态   01：未邮寄 02：已邮寄 03：车厂接收  04：退票接收  05：未接收 
     */
    private String trsfTp;

    /**
     * 退票原因  01:金额错误 02: 税号错误 03: 税率错误 04: 没盖章 05: 发票破损 06: 三包凭证错误 07:其他
     */
    private String failMsg;
    
    /**
     * 退票备注
     */
    private String failRemark;


    /**
     * 寄件人
     */
    private String senderNm;
    
    /**
     * 寄件人联系电话
     */
    private String senderTelno;
    
    /**
     * 寄件人地址
     */
    private String senderAddr;
    
    /**
     * 发票代码
     */
    private String receiptCd;
    
    /**
     * 发票抬头
     */
    private String buyNm;
    
    /**
     * 纳税人识别号
     */
    private String taxpayerIdCd;
    
    /**
     * 发票金额
     */
    private int sumAmt;
    
    /**
     * 发票日期
     */
    private Date receiptIssDt;
    
    /**
     * 备注
     */
    private String remark;

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getDlrNm() {
		return dlrNm;
	}

	public void setDlrNm(String dlrNm) {
		this.dlrNm = dlrNm;
	}

	public String getInvcNo() {
		return invcNo;
	}

	public void setInvcNo(String invcNo) {
		this.invcNo = invcNo;
	}

	public String getReceiptTp() {
		return receiptTp;
	}

	public void setReceiptTp(String receiptTp) {
		this.receiptTp = receiptTp;
	}

	public Date getRecipDt() {
		return recipDt;
	}

	public void setRecipDt(Date recipDt) {
		this.recipDt = recipDt;
	}

	public Date getFailDt() {
		return failDt;
	}

	public void setFailDt(Date failDt) {
		this.failDt = failDt;
	}

	public Date getInvcDt() {
		return invcDt;
	}

	public void setInvcDt(Date invcDt) {
		this.invcDt = invcDt;
	}

	public double getInvcClaimTotAmt() {
		return invcClaimTotAmt;
	}

	public void setInvcClaimTotAmt(double invcClaimTotAmt) {
		this.invcClaimTotAmt = invcClaimTotAmt;
	}

	public double getConfirmTotAmt() {
		return confirmTotAmt;
	}

	public void setConfirmTotAmt(double confirmTotAmt) {
		this.confirmTotAmt = confirmTotAmt;
	}

	public double getDdctTotAmt() {
		return ddctTotAmt;
	}

	public void setDdctTotAmt(double ddctTotAmt) {
		this.ddctTotAmt = ddctTotAmt;
	}

	public String getTrsfNo() {
		return trsfNo;
	}

	public void setTrsfNo(String trsfNo) {
		this.trsfNo = trsfNo;
	}

	public String getExpsCmpNm() {
		return expsCmpNm;
	}

	public void setExpsCmpNm(String expsCmpNm) {
		this.expsCmpNm = expsCmpNm;
	}

	public String getTrsfTp() {
		return trsfTp;
	}

	public void setTrsfTp(String trsfTp) {
		this.trsfTp = trsfTp;
	}

	public String getFailMsg() {
		return failMsg;
	}

	public void setFailMsg(String failMsg) {
		this.failMsg = failMsg;
	}

	public String getFailRemark() {
		return failRemark;
	}

	public void setFailRemark(String failRemark) {
		this.failRemark = failRemark;
	}

	public String getSenderNm() {
		return senderNm;
	}

	public void setSenderNm(String senderNm) {
		this.senderNm = senderNm;
	}

	public String getSenderTelno() {
		return senderTelno;
	}

	public void setSenderTelno(String senderTelno) {
		this.senderTelno = senderTelno;
	}

	public String getSenderAddr() {
		return senderAddr;
	}

	public void setSenderAddr(String senderAddr) {
		this.senderAddr = senderAddr;
	}

	public String getReceiptCd() {
		return receiptCd;
	}

	public void setReceiptCd(String receiptCd) {
		this.receiptCd = receiptCd;
	}

	public String getBuyNm() {
		return buyNm;
	}

	public void setBuyNm(String buyNm) {
		this.buyNm = buyNm;
	}

	public String getTaxpayerIdCd() {
		return taxpayerIdCd;
	}

	public void setTaxpayerIdCd(String taxpayerIdCd) {
		this.taxpayerIdCd = taxpayerIdCd;
	}

	public int getSumAmt() {
		return sumAmt;
	}

	public void setSumAmt(int sumAmt) {
		this.sumAmt = sumAmt;
	}

	public Date getReceiptIssDt() {
		return receiptIssDt;
	}

	public void setReceiptIssDt(Date receiptIssDt) {
		this.receiptIssDt = receiptIssDt;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
    
    
}
