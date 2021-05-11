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
 * @ClassName   : PwaStatTableVO.java
 * @Description : PWA 통계표 VO
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

public class PwaStatTableVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4653190919910361612L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 딜러명
     */
    private String dlrNm;

    /**
     * PWA NO
     */
    private String pwaDocNo;

    /**
     * 딜러결재요청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrSignReqDt;

    /**
     * 딜러결재요청일자(SORT)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrSignReqDtFormat;

    /**
     * pwa 승인번호
     */
    private String pwaApproveNo;

    /**
     * 차대번호
     */
    private String vinNo;

    /**
     * RO번호
     */
    private String roDocNo;

    /**
     * 클레임문서번호
     **/
    private String claimDocNo;

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
     * 주행거리
     */
    private int runDistVal;

    /**
     * PWA 유형코드1
     */
    private String pwaTpCd1;

    /**
     * PWA 유형코드1 명칭
     */
    private String pwaTpNm1;

    /**
     * PWA 유형코드2
     */
    private String pwaTpCd2;

    /**
     * PWA 유형코드2 명칭
     */
    private String pwaTpNm2;

    /**
     * 외주금액
     */
    private Double subAmt;

    /**
     * 합계금액
     */
    private Double pwaTotAmt;

    /**
     * 본사승인일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date hqApproveDt;

    /**
     * 본사승인일자(SORT)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date hqApproveDtFormat;

    /**
     * PWA 상태
     */
    private String pwaStatCd;

    /**
     * PWA 상태명
     */
    private String pwaStatNm;

    /**
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 등록일자(SORT)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDtFormat;





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
     * @return the pwaDocNo
     */
    public String getPwaDocNo() {
        return pwaDocNo;
    }

    /**
     * @param pwaDocNo the pwaDocNo to set
     */
    public void setPwaDocNo(String pwaDocNo) {
        this.pwaDocNo = pwaDocNo;
    }

    /**
     * @return the dlrSignReqDt
     */
    public Date getDlrSignReqDt() {
        return dlrSignReqDt;
    }

    /**
     * @param dlrSignReqDt the dlrSignReqDt to set
     */
    public void setDlrSignReqDt(Date dlrSignReqDt) {
        this.dlrSignReqDt = dlrSignReqDt;
    }

    /**
     * @return the dlrSignReqDtFormat
     */
    public Date getDlrSignReqDtFormat() {
        return dlrSignReqDtFormat;
    }

    /**
     * @param dlrSignReqDtFormat the dlrSignReqDtFormat to set
     */
    public void setDlrSignReqDtFormat(Date dlrSignReqDtFormat) {
        this.dlrSignReqDtFormat = dlrSignReqDtFormat;
    }

    /**
     * @return the pwaApproveNo
     */
    public String getPwaApproveNo() {
        return pwaApproveNo;
    }

    /**
     * @param pwaApproveNo the pwaApproveNo to set
     */
    public void setPwaApproveNo(String pwaApproveNo) {
        this.pwaApproveNo = pwaApproveNo;
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

    /**
     * @return the pwaTpCd1
     */
    public String getPwaTpCd1() {
        return pwaTpCd1;
    }

    /**
     * @param pwaTpCd1 the pwaTpCd1 to set
     */
    public void setPwaTpCd1(String pwaTpCd1) {
        this.pwaTpCd1 = pwaTpCd1;
    }

    /**
     * @return the pwaTpNm1
     */
    public String getPwaTpNm1() {
        return pwaTpNm1;
    }

    /**
     * @param pwaTpNm1 the pwaTpNm1 to set
     */
    public void setPwaTpNm1(String pwaTpNm1) {
        this.pwaTpNm1 = pwaTpNm1;
    }

    /**
     * @return the pwaTpCd2
     */
    public String getPwaTpCd2() {
        return pwaTpCd2;
    }

    /**
     * @param pwaTpCd2 the pwaTpCd2 to set
     */
    public void setPwaTpCd2(String pwaTpCd2) {
        this.pwaTpCd2 = pwaTpCd2;
    }

    /**
     * @return the pwaTpNm2
     */
    public String getPwaTpNm2() {
        return pwaTpNm2;
    }

    /**
     * @param pwaTpNm2 the pwaTpNm2 to set
     */
    public void setPwaTpNm2(String pwaTpNm2) {
        this.pwaTpNm2 = pwaTpNm2;
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
     * @return the pwaTotAmt
     */
    public Double getPwaTotAmt() {
        return pwaTotAmt;
    }

    /**
     * @param pwaTotAmt the pwaTotAmt to set
     */
    public void setPwaTotAmt(Double pwaTotAmt) {
        this.pwaTotAmt = pwaTotAmt;
    }

    /**
     * @return the hqApproveDt
     */
    public Date getHqApproveDt() {
        return hqApproveDt;
    }

    /**
     * @param hqApproveDt the hqApproveDt to set
     */
    public void setHqApproveDt(Date hqApproveDt) {
        this.hqApproveDt = hqApproveDt;
    }

    /**
     * @return the hqApproveDtFormat
     */
    public Date getHqApproveDtFormat() {
        return hqApproveDtFormat;
    }

    /**
     * @param hqApproveDtFormat the hqApproveDtFormat to set
     */
    public void setHqApproveDtFormat(Date hqApproveDtFormat) {
        this.hqApproveDtFormat = hqApproveDtFormat;
    }

    /**
     * @return the pwaStatCd
     */
    public String getPwaStatCd() {
        return pwaStatCd;
    }

    /**
     * @param pwaStatCd the pwaStatCd to set
     */
    public void setPwaStatCd(String pwaStatCd) {
        this.pwaStatCd = pwaStatCd;
    }

    /**
     * @return the pwaStatNm
     */
    public String getPwaStatNm() {
        return pwaStatNm;
    }

    /**
     * @param pwaStatNm the pwaStatNm to set
     */
    public void setPwaStatNm(String pwaStatNm) {
        this.pwaStatNm = pwaStatNm;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the regDtFormat
     */
    public Date getRegDtFormat() {
        return regDtFormat;
    }

    /**
     * @param regDtFormat the regDtFormat to set
     */
    public void setRegDtFormat(Date regDtFormat) {
        this.regDtFormat = regDtFormat;
    }
}