package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimInvoiceEditVO.java
 * @Description : 索赔发票编辑VO
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票编辑VO
 * </pre>
 */
public class ClaimInvoiceEditVO extends BaseVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4229966887008844167L;

    /**
     * 经销商代码
     **/
    private String dlrCd; 
    
    /**
     * 经销商名称
     **/
    private String dlrNm; 
     
    /**
     * 发票备注
     **/
    private String remark; 
     
    /**
     * 开票状态 编码
     **/
    private String receiptTp;
    
    /**
     * 开票状态 字符串
     **/
    private String receiptTpNm;
     
    /**
     * 发票号
     **/
    private String receiptNo;
    
    /**
     * 发票代码
     **/
    private String receiptCd;
    
    /**
     * 发票ID（接口表SA_0502_2IS的主键，可以从SA_0502T表中获取）
     **/
    private String receiptId;
    
    /**
     * 结算单号
     **/
    private String settlementNo;
    
    /**
     * 发票抬头 
     **/
    private String buyNm;
     
    /**
     * 纳税人识别号
     **/
    private String taxpayerIdCd;
     
    /**
     * 发票金额
     **/
    private String scanSumAmt;
    
    /**
     * 索赔单编号
     **/
    private String invcNo;

    
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getReceiptTp() {
        return receiptTp;
    }

    public void setReceiptTp(String receiptTp) {
        this.receiptTp = receiptTp;
    }

    public String getReceiptTpNm() {
        return receiptTpNm;
    }

    public void setReceiptTpNm(String receiptTpNm) {
        this.receiptTpNm = receiptTpNm;
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

    public String getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(String receiptId) {
        this.receiptId = receiptId;
    }

    public String getSettlementNo() {
        return settlementNo;
    }

    public void setSettlementNo(String settlementNo) {
        this.settlementNo = settlementNo;
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

    public String getScanSumAmt() {
        return scanSumAmt;
    }

    public void setScanSumAmt(String scanSumAmt) {
        this.scanSumAmt = scanSumAmt;
    }

    public String getInvcNo() {
        return invcNo;
    }

    public void setInvcNo(String invcNo) {
        this.invcNo = invcNo;
    }  
     

}
