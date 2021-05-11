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
 * @ClassName  : InvoiceMonthlyDeductVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since author description
 *  ===========    =============    ===========================
 *  2016. 8. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class InvoiceMonthlyDeductVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5354241951438887716L;

    /**
     * 공제번호
     **/
    @NotEmpty
    private String ddctNo;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 공제사유코드
     **/
    @NotEmpty
    private String ddctReasonCd;

    /**
     * 공제사유내용
     **/
    private String ddctReasonCont;

    /**
     * 총금액
     **/
    private Double totAmt;

    /**
     * 공제금액
     **/
    private Double ddctAmt;

    /**
     * 잔여금액
     **/
    private Double balAmt;

    /**
     * 공제요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ddctReqDt;

    /**
     * 인보이스번호
     **/
    private String invcNo;

    /**
     * 인보이스일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 인보이스금액
     **/
    private Double invcAmt;

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
     * 클레임버전코드
     **/
    private String claimVerCd;

    /**
     * 공제년월
     **/
    private String ddctYyMm;

    /**
     * 공제총금액
     **/
    private Double ddctTotAmt;

    /**
     * 공제총품목금액
     **/
    private Double ddctTotItemAmt;

    /**
     * 공제총공임금액
     **/
    private Double ddctTotLbrAmt;

    /**
     * 공제총외주금액
     **/
    private Double ddctTotSubAmt;

    /**
     * 승인총금액
     **/
    private Double approveTotAmt;

    /**
     * 승인총품목금액
     **/
    private Double approveTotItemAmt;

    /**
     * 승인총공임금액
     **/
    private Double approveTotLbrAmt;

    /**
     * 승인총외주금액
     **/
    private Double approveTotSubAmt;

    /**
     * 원RO번호
     **/
    private String baseRoNo;

    /**
     * @return the ddctNo
     */
    public String getDdctNo() {
        return ddctNo;
    }

    /**
     * @param ddctNo the ddctNo to set
     */
    public void setDdctNo(String ddctNo) {
        this.ddctNo = ddctNo;
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
     * @return the ddctReasonCd
     */
    public String getDdctReasonCd() {
        return ddctReasonCd;
    }

    /**
     * @param ddctReasonCd the ddctReasonCd to set
     */
    public void setDdctReasonCd(String ddctReasonCd) {
        this.ddctReasonCd = ddctReasonCd;
    }

    /**
     * @return the ddctReasonCont
     */
    public String getDdctReasonCont() {
        return ddctReasonCont;
    }

    /**
     * @param ddctReasonCont the ddctReasonCont to set
     */
    public void setDdctReasonCont(String ddctReasonCont) {
        this.ddctReasonCont = ddctReasonCont;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the ddctAmt
     */
    public Double getDdctAmt() {
        return ddctAmt;
    }

    /**
     * @param ddctAmt the ddctAmt to set
     */
    public void setDdctAmt(Double ddctAmt) {
        this.ddctAmt = ddctAmt;
    }

    /**
     * @return the balAmt
     */
    public Double getBalAmt() {
        return balAmt;
    }

    /**
     * @param balAmt the balAmt to set
     */
    public void setBalAmt(Double balAmt) {
        this.balAmt = balAmt;
    }

    /**
     * @return the ddctReqDt
     */
    public Date getDdctReqDt() {
        return ddctReqDt;
    }

    /**
     * @param ddctReqDt the ddctReqDt to set
     */
    public void setDdctReqDt(Date ddctReqDt) {
        this.ddctReqDt = ddctReqDt;
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
     * @return the invcAmt
     */
    public Double getInvcAmt() {
        return invcAmt;
    }

    /**
     * @param invcAmt the invcAmt to set
     */
    public void setInvcAmt(Double invcAmt) {
        this.invcAmt = invcAmt;
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
     * @return the ddctYyMm
     */
    public String getDdctYyMm() {
        return ddctYyMm;
    }

    /**
     * @param ddctYyMm the ddctYyMm to set
     */
    public void setDdctYyMm(String ddctYyMm) {
        this.ddctYyMm = ddctYyMm;
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
     * @return the ddctTotItemAmt
     */
    public Double getDdctTotItemAmt() {
        return ddctTotItemAmt;
    }

    /**
     * @param ddctTotItemAmt the ddctTotItemAmt to set
     */
    public void setDdctTotItemAmt(Double ddctTotItemAmt) {
        this.ddctTotItemAmt = ddctTotItemAmt;
    }

    /**
     * @return the ddctTotLbrAmt
     */
    public Double getDdctTotLbrAmt() {
        return ddctTotLbrAmt;
    }

    /**
     * @param ddctTotLbrAmt the ddctTotLbrAmt to set
     */
    public void setDdctTotLbrAmt(Double ddctTotLbrAmt) {
        this.ddctTotLbrAmt = ddctTotLbrAmt;
    }

    /**
     * @return the ddctTotSubAmt
     */
    public Double getDdctTotSubAmt() {
        return ddctTotSubAmt;
    }

    /**
     * @param ddctTotSubAmt the ddctTotSubAmt to set
     */
    public void setDdctTotSubAmt(Double ddctTotSubAmt) {
        this.ddctTotSubAmt = ddctTotSubAmt;
    }

    /**
     * @return the approveTotAmt
     */
    public Double getApproveTotAmt() {
        return approveTotAmt;
    }

    /**
     * @param approveTotAmt the approveTotAmt to set
     */
    public void setApproveTotAmt(Double approveTotAmt) {
        this.approveTotAmt = approveTotAmt;
    }

    /**
     * @return the approveTotItemAmt
     */
    public Double getApproveTotItemAmt() {
        return approveTotItemAmt;
    }

    /**
     * @param approveTotItemAmt the approveTotItemAmt to set
     */
    public void setApproveTotItemAmt(Double approveTotItemAmt) {
        this.approveTotItemAmt = approveTotItemAmt;
    }

    /**
     * @return the approveTotLbrAmt
     */
    public Double getApproveTotLbrAmt() {
        return approveTotLbrAmt;
    }

    /**
     * @param approveTotLbrAmt the approveTotLbrAmt to set
     */
    public void setApproveTotLbrAmt(Double approveTotLbrAmt) {
        this.approveTotLbrAmt = approveTotLbrAmt;
    }

    /**
     * @return the approveTotSubAmt
     */
    public Double getApproveTotSubAmt() {
        return approveTotSubAmt;
    }

    /**
     * @param approveTotSubAmt the approveTotSubAmt to set
     */
    public void setApproveTotSubAmt(Double approveTotSubAmt) {
        this.approveTotSubAmt = approveTotSubAmt;
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
