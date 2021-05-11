package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimInvoiceEditVO.java
 * @Description : 索赔发票编辑SearchVO
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票编辑SearchVO
 * </pre>
 */
public class ClaimInvoiceEditSearchVO extends SearchVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4029666877888454057L;

    /**
     * 经销商代码
     **/
    private String sDlrCd; 
    
    /**
     * 经销商名称
     **/
    private String sDlrNm; 
     
    /**
     * 发票备注
     **/
    private String sRemark; 
     
    /**
     * 索赔主单编号
     */
    private String sInvcNo; 
    
    /**
     * 开票状态
     **/
    private String sReceiptTp;
     
    /**
     * 结算单号
     **/
    private String sSettlementNo;
    
    /**
     * 发票号
     **/
    private String sReceiptNo;
    
    /**
     * 发票代码
     **/
    private String sReceiptCd;
    
    /**
     * 报表结算年月start
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcStartDt;
    
    /**
     * 报表结算年月end
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcEndDt;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsDlrNm() {
        return sDlrNm;
    }

    public void setsDlrNm(String sDlrNm) {
        this.sDlrNm = sDlrNm;
    }

    public String getsRemark() {
        return sRemark;
    }

    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    public String getsInvcNo() {
        return sInvcNo;
    }

    public void setsInvcNo(String sInvcNo) {
        this.sInvcNo = sInvcNo;
    }

    public String getsReceiptTp() {
        return sReceiptTp;
    }

    public void setsReceiptTp(String sReceiptTp) {
        this.sReceiptTp = sReceiptTp;
    }

    public String getsSettlementNo() {
        return sSettlementNo;
    }

    public void setsSettlementNo(String sSettlementNo) {
        this.sSettlementNo = sSettlementNo;
    }

    public String getsReceiptNo() {
        return sReceiptNo;
    }

    public void setsReceiptNo(String sReceiptNo) {
        this.sReceiptNo = sReceiptNo;
    }

    public String getsReceiptCd() {
        return sReceiptCd;
    }

    public void setsReceiptCd(String sReceiptCd) {
        this.sReceiptCd = sReceiptCd;
    }

    public Date getsInvcStartDt() {
        return sInvcStartDt;
    }

    public void setsInvcStartDt(Date sInvcStartDt) {
        this.sInvcStartDt = sInvcStartDt;
    }

    public Date getsInvcEndDt() {
        return sInvcEndDt;
    }

    public void setsInvcEndDt(Date sInvcEndDt) {
        this.sInvcEndDt = sInvcEndDt;
    }


}
