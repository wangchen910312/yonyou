package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimInvoiceRecSettlementVO.java
 * @Description : 索赔发票收款  结算单VO
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票收款 结算单VO
 * </pre>
 */
public class ClaimInvoiceRecSettlementVO extends BaseVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4229966887008844167L;

    /**
     * SE_0960T DLR_CD经销商代码
     */
    private String dlrCd;
    
    /**
     * SE_0930T INVC_NO结算报表号
     */
    private String invcNo;
    
    /**
     * SE_0960T PAYM_TP汇款状态  01(未汇款),02(已汇款),03(已收款)
     **/
    private String paymTp;
    
    /**
     * SE_0960T RCV_CPLT_DT收款日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rcvCpltDt;
    
    /**
     * SE_0930T INVC_DT结算报表年月 
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;
    
    /**
     * SE_0930T CONFIRM_TOT_AMT确定合计金额
     **/
    private String confirmTotAmt;
    
    /**
     * SE_0930T DDCT_TOT_AMT扣减合计金额
     **/
    private String ddctTotAmt;
    
    /**
     * SE_0930T INVC_CLAIM_TOT_AMT索赔合计金额（结算金额）
     **/
    private String invcClaimTotAmt;

    
    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
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

    public Date getRcvCpltDt() {
        return rcvCpltDt;
    }

    public void setRcvCpltDt(Date rcvCpltDt) {
        this.rcvCpltDt = rcvCpltDt;
    }

    public Date getInvcDt() {
        return invcDt;
    }

    public void setInvcDt(Date invcDt) {
        this.invcDt = invcDt;
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

}
