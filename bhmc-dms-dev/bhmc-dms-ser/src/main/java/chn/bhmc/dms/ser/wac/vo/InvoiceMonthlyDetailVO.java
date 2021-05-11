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
 * @ClassName  : InvoiceMonthlyDetailVO.java
 * @Description :  월별 인보이스 상세
 * @author Kwon ki hyun
 * @since 2016. 8. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since author    description
 *  ===========    =============    ===========================
 *  2016. 8. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class InvoiceMonthlyDetailVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5324227683231994122L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 클레임문서번호
     **/
    @NotEmpty
    private String claimDocNo;

    /**
     * RO문서번호
     **/
    @NotEmpty
    private String roDocNo;

    /**
     * 클레임년도
     **/
    private String claimYy;

    /**
     * 클레임버전코드
     **/
    private String claimVerCd;

    /**
     * 클레임상태코드
     **/
    private String claimStatCd;

    /**
     * 인보이스번호
     **/
    @NotEmpty
    private String invcNo;

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
     * 확정합계금액
     **/
    private Double confirmTotAmt;

    /**
     * 확정부가가치세금액
     **/
    private Double confirmVatAmt;

    /**
     * 클레임유형
     **/
    private String claimTp;
    
    /**
     * 클레임유형명
     **/
    private String claimTpNm;

    /**
     * 차대번호
     **/
    private String vinNo;

    /**
     * 판정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date judgDt;

    /**
     * 원RO번호
     **/
    private String baseRoNo;

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
     * @return the claimDocNo
     */
    public String getClaimDocNo() {
        return claimDocNo;
    }

    /**
     * @param claimDocNo the claimDocNo to set
     */
    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the claimYy
     */
    public String getClaimYy() {
        return claimYy;
    }

    /**
     * @param claimYy the claimYy to set
     */
    public void setClaimYy(String claimYy) {
        this.claimYy = claimYy;
    }

    /**
     * @return the claimVerCd
     */
    public String getClaimVerCd() {
        return claimVerCd;
    }

    /**
     * @param claimVerCd the claimVerCd to set
     */
    public void setClaimVerCd(String claimVerCd) {
        this.claimVerCd = claimVerCd;
    }

    /**
     * @return the claimStatCd
     */
    public String getClaimStatCd() {
        return claimStatCd;
    }

    /**
     * @param claimStatCd the claimStatCd to set
     */
    public void setClaimStatCd(String claimStatCd) {
        this.claimStatCd = claimStatCd;
    }

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
     * @return the confirmVatAmt
     */
    public Double getConfirmVatAmt() {
        return confirmVatAmt;
    }

    /**
     * @param confirmVatAmt the confirmVatAmt to set
     */
    public void setConfirmVatAmt(Double confirmVatAmt) {
        this.confirmVatAmt = confirmVatAmt;
    }

    /**
     * @return the claimTp
     */
    public String getClaimTp() {
        return claimTp;
    }

    /**
     * @param claimTp the claimTp to set
     */
    public void setClaimTp(String claimTp) {
        this.claimTp = claimTp;
    }

    
    public String getClaimTpNm() {
        return claimTpNm;
    }

    public void setClaimTpNm(String claimTpNm) {
        this.claimTpNm = claimTpNm;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the judgDt
     */
    public Date getJudgDt() {
        return judgDt;
    }

    /**
     * @param judgDt the judgDt to set
     */
    public void setJudgDt(Date judgDt) {
        this.judgDt = judgDt;
    }

    /**
     * @return the baseRoNo
     */
    public String getBaseRoNo() {
        return baseRoNo;
    }

    /**
     * @param baseRoNo the baseRoNo to set
     */
    public void setBaseRoNo(String baseRoNo) {
        this.baseRoNo = baseRoNo;
    }




}
