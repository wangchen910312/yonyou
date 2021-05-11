package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : InvoiceMonthlyVO.java
 * @Description : 월별인보이스 VO
 * @author Kwon ki hyun
 * @since 2016. 8. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since         author  description
 *  ===========    =============    ===========================
 *  2016. 8. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class InvoiceMonthlyVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8293391954889259475L;

    /**
     * 인보이스번호
     **/
    @NotEmpty
    private String invcNo;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 인보이스일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 인보이스클레임수량
     **/
    private int invcClaimCnt;

    /**
     * 청구금액
     */
    private Double claimReqAmt;

    /**
     * 인보이스클레임합계금액
     **/
    private Double invcClaimTotAmt;

    /**
     * 인보이스클레임품목금액
     **/
    private Double invcClaimItemAmt;

    /**
     * 인보이스클레임공임금액
     **/
    private Double invcClaimLbrAmt;

    /**
     * 인보이스클레임외주금액
     **/
    private Double invcClaimSubAmt;

    /**
     * 공제합계금액
     **/
    private Double ddctTotAmt;

    /**
     * 공제품목금액
     **/
    private Double ddctItemAmt;

    /**
     * 공제공임금액
     **/
    private Double ddctLbrAmt;

    /**
     * 공제외주금액
     **/
    private Double ddctSubAmt;

    /**
     * 확정합계금액
     **/
    private Double confirmTotAmt;

    /**
     * 확정품목금액
     **/
    private Double confirmItemAmt;

    /**
     * 확정공임금액
     **/
    private Double confirmLbrAmt;

    /**
     * 확정외주금액
     **/
    private Double confirmSubAmt;

    /**
     * @return the invcNo
     */
    public String getInvcNo() {
        return invcNo;
    }

    /**
     * @param invcNo the invcNo to set
     */
    public void setInvcNo(String invcNo) {
        this.invcNo = invcNo;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the invcDt
     */
    public Date getInvcDt() {
        return invcDt;
    }

    /**
     * @param invcDt the invcDt to set
     */
    public void setInvcDt(Date invcDt) {
        this.invcDt = invcDt;
    }

    /**
     * @return the invcClaimCnt
     */
    public int getInvcClaimCnt() {
        return invcClaimCnt;
    }

    /**
     * @param invcClaimCnt the invcClaimCnt to set
     */
    public void setInvcClaimCnt(int invcClaimCnt) {
        this.invcClaimCnt = invcClaimCnt;
    }

    /**
     * @return the invcClaimTotAmt
     */
    public Double getInvcClaimTotAmt() {
        return invcClaimTotAmt;
    }

    /**
     * @param invcClaimTotAmt the invcClaimTotAmt to set
     */
    public void setInvcClaimTotAmt(Double invcClaimTotAmt) {
        this.invcClaimTotAmt = invcClaimTotAmt;
    }

    /**
     * @return the invcClaimItemAmt
     */
    public Double getInvcClaimItemAmt() {
        return invcClaimItemAmt;
    }

    /**
     * @param invcClaimItemAmt the invcClaimItemAmt to set
     */
    public void setInvcClaimItemAmt(Double invcClaimItemAmt) {
        this.invcClaimItemAmt = invcClaimItemAmt;
    }

    /**
     * @return the invcClaimLbrAmt
     */
    public Double getInvcClaimLbrAmt() {
        return invcClaimLbrAmt;
    }

    /**
     * @param invcClaimLbrAmt the invcClaimLbrAmt to set
     */
    public void setInvcClaimLbrAmt(Double invcClaimLbrAmt) {
        this.invcClaimLbrAmt = invcClaimLbrAmt;
    }

    /**
     * @return the invcClaimSubAmt
     */
    public Double getInvcClaimSubAmt() {
        return invcClaimSubAmt;
    }

    /**
     * @param invcClaimSubAmt the invcClaimSubAmt to set
     */
    public void setInvcClaimSubAmt(Double invcClaimSubAmt) {
        this.invcClaimSubAmt = invcClaimSubAmt;
    }

    /**
     * @return the ddctTotAmt
     */
    public Double getDdctTotAmt() {
        return ddctTotAmt;
    }

    /**
     * @param ddctTotAmt the ddctTotAmt to set
     */
    public void setDdctTotAmt(Double ddctTotAmt) {
        this.ddctTotAmt = ddctTotAmt;
    }

    /**
     * @return the ddctItemAmt
     */
    public Double getDdctItemAmt() {
        return ddctItemAmt;
    }

    /**
     * @param ddctItemAmt the ddctItemAmt to set
     */
    public void setDdctItemAmt(Double ddctItemAmt) {
        this.ddctItemAmt = ddctItemAmt;
    }

    /**
     * @return the ddctLbrAmt
     */
    public Double getDdctLbrAmt() {
        return ddctLbrAmt;
    }

    /**
     * @param ddctLbrAmt the ddctLbrAmt to set
     */
    public void setDdctLbrAmt(Double ddctLbrAmt) {
        this.ddctLbrAmt = ddctLbrAmt;
    }

    /**
     * @return the ddctSubAmt
     */
    public Double getDdctSubAmt() {
        return ddctSubAmt;
    }

    /**
     * @param ddctSubAmt the ddctSubAmt to set
     */
    public void setDdctSubAmt(Double ddctSubAmt) {
        this.ddctSubAmt = ddctSubAmt;
    }

    /**
     * @return the confirmTotAmt
     */
    public Double getConfirmTotAmt() {
        return confirmTotAmt;
    }

    /**
     * @param confirmTotAmt the confirmTotAmt to set
     */
    public void setConfirmTotAmt(Double confirmTotAmt) {
        this.confirmTotAmt = confirmTotAmt;
    }

    /**
     * @return the confirmItemAmt
     */
    public Double getConfirmItemAmt() {
        return confirmItemAmt;
    }

    /**
     * @param confirmItemAmt the confirmItemAmt to set
     */
    public void setConfirmItemAmt(Double confirmItemAmt) {
        this.confirmItemAmt = confirmItemAmt;
    }

    /**
     * @return the confirmLbrAmt
     */
    public Double getConfirmLbrAmt() {
        return confirmLbrAmt;
    }

    /**
     * @param confirmLbrAmt the confirmLbrAmt to set
     */
    public void setConfirmLbrAmt(Double confirmLbrAmt) {
        this.confirmLbrAmt = confirmLbrAmt;
    }

    /**
     * @return the confirmSubAmt
     */
    public Double getConfirmSubAmt() {
        return confirmSubAmt;
    }

    /**
     * @param confirmSubAmt the confirmSubAmt to set
     */
    public void setConfirmSubAmt(Double confirmSubAmt) {
        this.confirmSubAmt = confirmSubAmt;
    }

    /**
     * @return the claimReqAmt
     */
    public Double getClaimReqAmt() {
        return claimReqAmt;
    }

    /**
     * @param claimReqAmt the claimReqAmt to set
     */
    public void setClaimReqAmt(Double claimReqAmt) {
        this.claimReqAmt = claimReqAmt;
    }



}
