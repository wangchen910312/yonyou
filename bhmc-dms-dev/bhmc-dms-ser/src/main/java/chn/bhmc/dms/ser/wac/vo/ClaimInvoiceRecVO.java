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
public class ClaimInvoiceRecVO extends BaseVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4229966887008844167L;

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
     * 发票金额
     **/
    private String scanSumAmt;
    
    /**
     * 发票备注
     **/
    private String remark;

    /**
     * 发票日期是BaseVO里的regDt
     */

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
