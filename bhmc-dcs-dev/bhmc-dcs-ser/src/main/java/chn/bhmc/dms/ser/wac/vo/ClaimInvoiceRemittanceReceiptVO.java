package chn.bhmc.dms.ser.wac.vo;

import java.math.BigDecimal;
import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 查询索赔发票汇款发票信息VO
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRemittanceVO.java
 * @Description : 查询索赔发票汇款发票信息VO
 * @author chen shengan
 * @since 2021. 4. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 09.     chen shengan        查询索赔发票汇款发票信息
 * </pre>
 */
public class ClaimInvoiceRemittanceReceiptVO extends BaseVO {
	
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
	
	/**
	 * 备注
	 */
	private String remark;
	
	private String settlementNo;

	public String getSettlementNo() {
		return settlementNo;
	}

	public void setSettlementNo(String settlementNo) {
		this.settlementNo = settlementNo;
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

	public ClaimInvoiceRemittanceReceiptVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClaimInvoiceRemittanceReceiptVO(String receiptCd, String buyNm, String taxpayerIdCd, Date receiptIssDt,
			BigDecimal sumAmt, String remark) {
		super();
		this.receiptCd = receiptCd;
		this.buyNm = buyNm;
		this.taxpayerIdCd = taxpayerIdCd;
		this.receiptIssDt = receiptIssDt;
		this.sumAmt = sumAmt;
		this.remark = remark;
	}
	

}
