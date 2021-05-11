package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimInvoiceRecVO.java
 * @Description : 索赔发票收款 发票VO
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票收款 发票VO
 * </pre>
 */
public class ClaimInvoiceRecExcelDownloadVO extends BaseVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4229206457012844124L;

    /**
     * 索赔主单编码（结算报表号）
     **/
    private String invcNo;
    
    /**
     * 发票号
     **/
    private String receiptNo;
    
    /**
     * 发票代码
     **/
    private String receiptCd;
    
    /**
     * 发票抬头 
     **/
    private String buyNm;
     
    /**
     * 纳税人识别号
     **/
    private String taxpayerIdCd;
    
    /**
     * 确定合计金额
     **/
    private String confirmTotAmt;
    
    /**
     * 扣减合计金额
     **/
    private String ddctTotAmt;
    
    /**
     * 索赔合计金额（结算金额）
     **/
    private String invcClaimTotAmt;
     
    /**
     * 发票金额
     **/
    private String scanSumAmt;
    
    /**
     * 发票日期是BaseVO里的regDt
     */
    
    /**
     * 发票备注
     **/
    private String remark;

    
    public String getInvcNo() {
        return invcNo;
    }

    public void setInvcNo(String invcNo) {
        this.invcNo = invcNo;
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

    public String getConfirmTotAmt() {
        return confirmTotAmt;
    }

    public void setConfirmTotAmt(String confirmTotAmt) {
        this.confirmTotAmt = confirmTotAmt;
    }

    public String getDdctTotAmt() {
        return ddctTotAmt;
    }

    public void setDdctTotAmt(String ddctTotAmt) {
        this.ddctTotAmt = ddctTotAmt;
    }

    public String getInvcClaimTotAmt() {
        return invcClaimTotAmt;
    }

    public void setInvcClaimTotAmt(String invcClaimTotAmt) {
        this.invcClaimTotAmt = invcClaimTotAmt;
    }

    public String getScanSumAmt() {
        return scanSumAmt;
    }

    public void setScanSumAmt(String scanSumAmt) {
        this.scanSumAmt = scanSumAmt;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
    
}
