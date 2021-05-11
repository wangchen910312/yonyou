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
 * @ClassName   : ClaimInfoStatusVO.java
 * @Description : 클레임 정보 현황 VO
 * @author Kwon Ki Hyun
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class ClaimInfoStatusVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5453102666735999643L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 딜러명
     */
    private String dlrNm;

    /**
     * 차량소유자명
     **/
    private String carOwnerNm;

    /**
     * 차량소유자전화번호
     **/
    private String carOwnerTelNo;

    /**
     * 차대번호
     */
    private String vinNo;

    /**
     * 차량등록번호
     **/
    private String carRegNo;

    /**
     * 보증일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartDt;

    /**
     * 보증일자(SORT)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartDtFormat;

    /**
     * RO번호
     */
    private String roDocNo;

    /**
     * RO시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roStartDt;

    /**
     * RO시작일자(SORT)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roStartDtFormat;

    /**
     * RO종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roEndDt;

    /**
     * RO종료일자(SORT)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roEndDtFormat;

    /**
     * 클레임문서번호
     **/
    private String claimDocNo;

    /**
     * 클레임상태코드
     **/
    private String claimStatCd;

    /**
     * 클레임상태명칭
     **/
    private String claimStatNm;

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
     * 캠페인리콜번호
     **/
    private String crNo;

    /**
     * 원인작업항목
     */
    private String cauOperAtcCd;

    /**
     * 원인작업항목명
     */
    private String cauOperAtcNm;

    /**
     * 원인부품코드
     */
    private String cauItemCd;

    /**
     * 원인부품명
     */
    private String cauItemNm;

    /**
     * 요청금액
     */
    private Double reqAmt;

    /**
     * 합계금액
     */
    private Double confirmTotAmt;

    /**
     * 공임금액
     */
    private Double lbrAmt;

    /**
     * 부품금액
     */
    private Double itemAmt;

    /**
     * 외주금액
     */
    private Double subAmt;

    /**
     * 클레임유형
     */
    private String claimTp;

    /**
     * 클레임유형명
     */
    private String claimTpNm;

    /**
     * 주행거리
     */
    private int runDistVal;


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
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the carOwnerNm
     */
    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    /**
     * @param carOwnerNm the carOwnerNm to set
     */
    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }

    /**
     * @return the carOwnerTelNo
     */
    public String getCarOwnerTelNo() {
        return carOwnerTelNo;
    }

    /**
     * @param carOwnerTelNo the carOwnerTelNo to set
     */
    public void setCarOwnerTelNo(String carOwnerTelNo) {
        this.carOwnerTelNo = carOwnerTelNo;
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
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    /**
     * @return the wartDt
     */
    public Date getWartDt() {
        return wartDt;
    }

    /**
     * @param wartDt the wartDt to set
     */
    public void setWartDt(Date wartDt) {
        this.wartDt = wartDt;
    }

    /**
     * @return the wartDtFormat
     */
    public Date getWartDtFormat() {
        return wartDtFormat;
    }

    /**
     * @param wartDtFormat the wartDtFormat to set
     */
    public void setWartDtFormat(Date wartDtFormat) {
        this.wartDtFormat = wartDtFormat;
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
     * @return the roStartDt
     */
    public Date getRoStartDt() {
        return roStartDt;
    }

    /**
     * @param roStartDt the roStartDt to set
     */
    public void setRoStartDt(Date roStartDt) {
        this.roStartDt = roStartDt;
    }

    /**
     * @return the roStartDtFormat
     */
    public Date getRoStartDtFormat() {
        return roStartDtFormat;
    }

    /**
     * @param roStartDtFormat the roStartDtFormat to set
     */
    public void setRoStartDtFormat(Date roStartDtFormat) {
        this.roStartDtFormat = roStartDtFormat;
    }

    /**
     * @return the roEndDt
     */
    public Date getRoEndDt() {
        return roEndDt;
    }

    /**
     * @param roEndDt the roEndDt to set
     */
    public void setRoEndDt(Date roEndDt) {
        this.roEndDt = roEndDt;
    }

    /**
     * @return the roEndDtFormat
     */
    public Date getRoEndDtFormat() {
        return roEndDtFormat;
    }

    /**
     * @param roEndDtFormat the roEndDtFormat to set
     */
    public void setRoEndDtFormat(Date roEndDtFormat) {
        this.roEndDtFormat = roEndDtFormat;
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
     * @return the claimStatNm
     */
    public String getClaimStatNm() {
        return claimStatNm;
    }

    /**
     * @param claimStatNm the claimStatNm to set
     */
    public void setClaimStatNm(String claimStatNm) {
        this.claimStatNm = claimStatNm;
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
     * @return the crNo
     */
    public String getCrNo() {
        return crNo;
    }

    /**
     * @param crNo the crNo to set
     */
    public void setCrNo(String crNo) {
        this.crNo = crNo;
    }

    /**
     * @return the cauOperAtcCd
     */
    public String getCauOperAtcCd() {
        return cauOperAtcCd;
    }

    /**
     * @param cauOperAtcCd the cauOperAtcCd to set
     */
    public void setCauOperAtcCd(String cauOperAtcCd) {
        this.cauOperAtcCd = cauOperAtcCd;
    }

    /**
     * @return the cauOperAtcNm
     */
    public String getCauOperAtcNm() {
        return cauOperAtcNm;
    }

    /**
     * @param cauOperAtcNm the cauOperAtcNm to set
     */
    public void setCauOperAtcNm(String cauOperAtcNm) {
        this.cauOperAtcNm = cauOperAtcNm;
    }

    /**
     * @return the cauItemCd
     */
    public String getCauItemCd() {
        return cauItemCd;
    }

    /**
     * @param cauItemCd the cauItemCd to set
     */
    public void setCauItemCd(String cauItemCd) {
        this.cauItemCd = cauItemCd;
    }

    /**
     * @return the cauItemNm
     */
    public String getCauItemNm() {
        return cauItemNm;
    }

    /**
     * @param cauItemNm the cauItemNm to set
     */
    public void setCauItemNm(String cauItemNm) {
        this.cauItemNm = cauItemNm;
    }

    /**
     * @return the reqAmt
     */
    public Double getReqAmt() {
        return reqAmt;
    }

    /**
     * @param reqAmt the reqAmt to set
     */
    public void setReqAmt(Double reqAmt) {
        this.reqAmt = reqAmt;
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
     * @return the lbrAmt
     */
    public Double getLbrAmt() {
        return lbrAmt;
    }

    /**
     * @param lbrAmt the lbrAmt to set
     */
    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    /**
     * @return the itemAmt
     */
    public Double getItemAmt() {
        return itemAmt;
    }

    /**
     * @param itemAmt the itemAmt to set
     */
    public void setItemAmt(Double itemAmt) {
        this.itemAmt = itemAmt;
    }

    /**
     * @return the subAmt
     */
    public Double getSubAmt() {
        return subAmt;
    }

    /**
     * @param subAmt the subAmt to set
     */
    public void setSubAmt(Double subAmt) {
        this.subAmt = subAmt;
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

    /**
     * @return the claimTpNm
     */
    public String getClaimTpNm() {
        return claimTpNm;
    }

    /**
     * @param claimTpNm the claimTpNm to set
     */
    public void setClaimTpNm(String claimTpNm) {
        this.claimTpNm = claimTpNm;
    }

    /**
     * @return the runDistVal
     */
    public int getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }

}