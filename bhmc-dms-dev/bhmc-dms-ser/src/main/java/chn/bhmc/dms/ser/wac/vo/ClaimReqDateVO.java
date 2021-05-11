package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimReqDateVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since   author description
 * =========== ============= ===========================
 * 2016. 5. 17.  Kwon Ki Hyun  최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="vinNo", mesgKey="global.lbl.vinNo")
    ,@ValidField(field="claimDocNo", mesgKey="ser.lbl.claimNo")
})
public class ClaimReqDateVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5298011582409116783L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 클레임문서번호
     **/
    private String claimDocNo;

    /**
     * 차대번호
     **/
    private String vinNo;

    /**
     * 클레임확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimConfirmDt;

    /**
     * 클레임확정일자(SORT)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimConfirmDtFormat;

    /**
     * 클레임 건수
     **/
    private Double claimCnt;

    /**
     * 합계금액
     **/
    private Double claimTotAmt;

    /**
     * 확정공임금액
     **/
    private Double confirmLbrAmt;

    /**
     * 확정품목금액
     **/
    private Double confirmItemAmt;

    /**
     * 확정외주공임금액
     **/
    private Double confirmSubLbrAmt;

    /**
     * 클레임청구일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimReqDt;

    /**
     * 클레임청구일자(SORT)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimReqDtFormat;

    /**
     * 클레임상태코드
     **/
    private String claimStatCd;

    /**
     * RO문서번호
     **/
    private String roDocNo;





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
     * @return the claimConfirmDt
     */
    public Date getClaimConfirmDt() {
        return claimConfirmDt;
    }

    /**
     * @param claimConfirmDt the claimConfirmDt to set
     */
    public void setClaimConfirmDt(Date claimConfirmDt) {
        this.claimConfirmDt = claimConfirmDt;
    }

    /**
     * @return the claimConfirmDtFormat
     */
    public Date getClaimConfirmDtFormat() {
        return claimConfirmDtFormat;
    }

    /**
     * @param claimConfirmDtFormat the claimConfirmDtFormat to set
     */
    public void setClaimConfirmDtFormat(Date claimConfirmDtFormat) {
        this.claimConfirmDtFormat = claimConfirmDtFormat;
    }

    /**
     * @return the claimCnt
     */
    public Double getClaimCnt() {
        return claimCnt;
    }

    /**
     * @param claimCnt the claimCnt to set
     */
    public void setClaimCnt(Double claimCnt) {
        this.claimCnt = claimCnt;
    }

    /**
     * @return the claimTotAmt
     */
    public Double getClaimTotAmt() {
        return claimTotAmt;
    }

    /**
     * @param claimTotAmt the claimTotAmt to set
     */
    public void setClaimTotAmt(Double claimTotAmt) {
        this.claimTotAmt = claimTotAmt;
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
     * @return the confirmSubLbrAmt
     */
    public Double getConfirmSubLbrAmt() {
        return confirmSubLbrAmt;
    }

    /**
     * @param confirmSubLbrAmt the confirmSubLbrAmt to set
     */
    public void setConfirmSubLbrAmt(Double confirmSubLbrAmt) {
        this.confirmSubLbrAmt = confirmSubLbrAmt;
    }

    /**
     * @return the claimReqDt
     */
    public Date getClaimReqDt() {
        return claimReqDt;
    }

    /**
     * @param claimReqDt the claimReqDt to set
     */
    public void setClaimReqDt(Date claimReqDt) {
        this.claimReqDt = claimReqDt;
    }

    /**
     * @return the claimReqDtFormat
     */
    public Date getClaimReqDtFormat() {
        return claimReqDtFormat;
    }

    /**
     * @param claimReqDtFormat the claimReqDtFormat to set
     */
    public void setClaimReqDtFormat(Date claimReqDtFormat) {
        this.claimReqDtFormat = claimReqDtFormat;
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
}