package chn.bhmc.dms.ser.wac.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 查询索赔发票汇款信息VO
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRemittanceVO.java
 * @Description : 查询索赔发票汇款信息VO
 * @author chen shengan
 * @since 2021. 4. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 09.     chen shengan        查询索赔发票汇款信息
 * </pre>
 */
public class ClaimInvoiceRemittanceVO extends BaseVO {
	
	/**
	 * 经销商代码
	 */
	private String dlrCd;
	
	/**
	 * 经销商名称
	 */
	private String dlrNm;
	
	/**
	 * 结算报表编号
	 */
	private String invcNo;
	
	/**
	 * 汇款状态代码
	 */
	private String paymTp;
	
	/**
	 * 汇款状态名称
	 */
	private String paymNm;
	
	/**
	 * 汇款日期
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date paymDt;
	
	/**
	 * 结算报表年月
	 */
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date invcDt;
	
	/**
	 * 确定合计金额
	 */
	private BigDecimal confirmTotAmt;
	
	/**
	 * 折扣合计金额
	 */
	private BigDecimal ddctTotAmt;
	
	/**
	 * 结算合计金额
	 */
	private BigDecimal invcClaimTotAmt;
	
	/**
	 * 发票号
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
	 * 发票日期
	 */
	private Date receiptIssDt;
	
	/**
	 * 发票金额
	 */
	private BigDecimal sumAmt;
	
	private String settlementNo;
	
	/**
	 * 备注
	 */
	private String remark;

	public String getSettlementNo() {
		return settlementNo;
	}

	public void setSettlementNo(String settlementNo) {
		this.settlementNo = settlementNo;
	}

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

	public String getPaymTp() {
		return paymTp;
	}

	public void setPaymTp(String paymTp) {
		this.paymTp = paymTp;
	}

	public Date getInvcDt() {
		return invcDt;
	}

	public void setInvcDt(Date invcDt) {
		this.invcDt = invcDt;
	}

	public BigDecimal getConfirmTotAmt() {
		return confirmTotAmt;
	}

	public void setConfirmTotAmt(BigDecimal confirmTotAmt) {
		this.confirmTotAmt = confirmTotAmt;
	}

	public BigDecimal getDdctTotAmt() {
		return ddctTotAmt;
	}

	public void setDdctTotAmt(BigDecimal ddctTotAmt) {
		this.ddctTotAmt = ddctTotAmt;
	}

	public BigDecimal getInvcClaimTotAmt() {
		return invcClaimTotAmt;
	}

	public void setInvcClaimTotAmt(BigDecimal invcClaimTotAmt) {
		this.invcClaimTotAmt = invcClaimTotAmt;
	}

	public Date getPaymDt() {
		return paymDt;
	}

	public void setPaymDt(Date paymDt) {
		this.paymDt = paymDt;
	}

	public String getPaymNm() {
		return paymNm;
	}

	public void setPaymNm(String paymNm) {
		this.paymNm = paymNm;
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

	public Date getReceiptIssDt() {
		return receiptIssDt;
	}

	public void setReceiptIssDt(Date receiptIssDt) {
		this.receiptIssDt = receiptIssDt;
	}

	public BigDecimal getSumAmt() {
		return sumAmt;
	}

	public void setSumAmt(BigDecimal sumAmt) {
		this.sumAmt = sumAmt;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public ClaimInvoiceRemittanceVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClaimInvoiceRemittanceVO(String dlrCd, String dlrNm, String invcNo, String paymTp, String paymNm,
			Date paymDt, Date invcDt, BigDecimal confirmTotAmt, BigDecimal ddctTotAmt, BigDecimal invcClaimTotAmt,
			String receiptCd, String buyNm, String taxpayerIdCd, Date receiptIssDt, BigDecimal sumAmt, String remark) {
		super();
		this.dlrCd = dlrCd;
		this.dlrNm = dlrNm;
		this.invcNo = invcNo;
		this.paymTp = paymTp;
		this.paymNm = paymNm;
		this.paymDt = paymDt;
		this.invcDt = invcDt;
		this.confirmTotAmt = confirmTotAmt;
		this.ddctTotAmt = ddctTotAmt;
		this.invcClaimTotAmt = invcClaimTotAmt;
		this.receiptCd = receiptCd;
		this.buyNm = buyNm;
		this.taxpayerIdCd = taxpayerIdCd;
		this.receiptIssDt = receiptIssDt;
		this.sumAmt = sumAmt;
		this.remark = remark;
	}

	

}
