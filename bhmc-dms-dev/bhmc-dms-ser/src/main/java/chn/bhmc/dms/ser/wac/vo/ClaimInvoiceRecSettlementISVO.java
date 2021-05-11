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
 * @Description : 索赔发票收款  结算单接口ISVO
 * @author lixinfei
 * @since 2021. 04. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since           author      description 
 * =========== ============= ===========================
 * 2021. 04. 12.  lixinfei      索赔发票收款 结算单接口ISVO
 * </pre>
 */
public class ClaimInvoiceRecSettlementISVO extends BaseVO{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -4229616877008840147L;


    /**
     * DLR_CD经销商代码
     */
    private String dlrCd;
    
    /**
     * INVC_NO结算报表号
     */
    private String invcNo;
    
    /**
     * RECEIPT_TP开票状态  01(未开票),02(已开票),03(已退票)
     **/
    private String receiptTp;
    
    /**
     * 快递公司
     **/
    private String expsCmpNm;
    
    /**
     * 快递状态
     **/
    private String trsfTp;
    
    /**
     * 快递单号
     **/
    private String trsfNo;
    
    /**
     * 快递备注
     **/
    private String remark;

    /**
     * 寄件人
     **/
    private String senderNm;
    
    /**
     * 收件人
     **/
    private String recipNm;
    
    /**
     * 寄件人联系电话 
     **/
    private String senderTelno;
    
    /**
     * 收件人联系电话  
     **/
    private String recipTelno;
    
    /**
     * 寄件人地址 
     **/
    private String senderAddr;
    
    /**
     * 收件人地址 
     **/
    private String recipAddr;
    
    /**
     * SE_0960T PAYM_TP汇款状态  01(未汇款),02(已汇款),03(已收款)
     **/
    private String paymTp;
    
    /**
     * PAYM_DT汇款日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date paymDt;
    
    /**
     * RCV_CPLT_DT收款日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rcvCpltDt;
    
    /**
     * FAIL_DT退票日期 
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date failDt;
    
    /**
     * RECIP_DT收票日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date recipDt;
    
    /**
     * 退票次数
     **/
    private String failCnt;
    
    /**
     * 退票原因
     **/
    private String failMsg;
    
    /**
     * 退票备注
     **/
    private String failRemark;

    
    
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

    public String getReceiptTp() {
        return receiptTp;
    }

    public void setReceiptTp(String receiptTp) {
        this.receiptTp = receiptTp;
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

    public String getTrsfNo() {
        return trsfNo;
    }

    public void setTrsfNo(String trsfNo) {
        this.trsfNo = trsfNo;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getSenderNm() {
        return senderNm;
    }

    public void setSenderNm(String senderNm) {
        this.senderNm = senderNm;
    }

    public String getRecipNm() {
        return recipNm;
    }

    public void setRecipNm(String recipNm) {
        this.recipNm = recipNm;
    }

    public String getSenderTelno() {
        return senderTelno;
    }

    public void setSenderTelno(String senderTelno) {
        this.senderTelno = senderTelno;
    }

    public String getRecipTelno() {
        return recipTelno;
    }

    public void setRecipTelno(String recipTelno) {
        this.recipTelno = recipTelno;
    }

    public String getSenderAddr() {
        return senderAddr;
    }

    public void setSenderAddr(String senderAddr) {
        this.senderAddr = senderAddr;
    }

    public String getRecipAddr() {
        return recipAddr;
    }

    public void setRecipAddr(String recipAddr) {
        this.recipAddr = recipAddr;
    }

    public String getPaymTp() {
        return paymTp;
    }

    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }

    public Date getPaymDt() {
        return paymDt;
    }

    public void setPaymDt(Date paymDt) {
        this.paymDt = paymDt;
    }

    public Date getRcvCpltDt() {
        return rcvCpltDt;
    }

    public void setRcvCpltDt(Date rcvCpltDt) {
        this.rcvCpltDt = rcvCpltDt;
    }

    public Date getFailDt() {
        return failDt;
    }

    public void setFailDt(Date failDt) {
        this.failDt = failDt;
    }

    public Date getRecipDt() {
        return recipDt;
    }

    public void setRecipDt(Date recipDt) {
        this.recipDt = recipDt;
    }

    public String getFailCnt() {
        return failCnt;
    }

    public void setFailCnt(String failCnt) {
        this.failCnt = failCnt;
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

}
