package chn.bhmc.dms.mis.tmp.vo;

import java.util.Date;

/**
 * <pre>
 * [제조사] 동종업계 참조
 * </pre>
 *
 * @ClassName   : TargetReferSameBsnsVO.java
 * @Description : [제조사] 동종업계 참조
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetReferSameBsnsVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    // 조회조건
    private String sReferYearMonth;     // 등록년월

    // 데이터
    private String referDt;             // 참조년월일
    private String referYearDt;         // 참조년
    private String referMonthDt;        // 참조월
    private String referDayDt;          // 참조일
    private String visitReqVal;         // 내방요청율
    private String visitDealVal;        // 내방거래율
    private String totDealVal;          // 거래율
    private String perOfterVal;         // 개인정보 제공율
    private String successVal;          // 성공율
    private String targetAchVal;        // 목표달성율
    private String goodsCarQty;         // 용품차량수량
    private String insApplyRate;        // 보험적용율
    private String fincApplyRate;       // 금융적용율

    private String dlrCd;               // 딜러코드
    private String dlrNm;               // 딜러명

    private String regUsrId;            // 등록자ID
    private Date regDt;                 // 등록일자
    private String updtUsrId;           // 수정자ID
    private Date updtDt;                // 수정일자
    /**
     * @return the sReferYearMonth
     */
    public String getsReferYearMonth() {
        return sReferYearMonth;
    }
    /**
     * @param sReferYearMonth the sReferYearMonth to set
     */
    public void setsReferYearMonth(String sReferYearMonth) {
        this.sReferYearMonth = sReferYearMonth;
    }
    /**
     * @return the referDt
     */
    public String getReferDt() {
        return referDt;
    }
    /**
     * @param referDt the referDt to set
     */
    public void setReferDt(String referDt) {
        this.referDt = referDt;
    }
    /**
     * @return the referYearDt
     */
    public String getReferYearDt() {
        return referYearDt;
    }
    /**
     * @param referYearDt the referYearDt to set
     */
    public void setReferYearDt(String referYearDt) {
        this.referYearDt = referYearDt;
    }
    /**
     * @return the referMonthDt
     */
    public String getReferMonthDt() {
        return referMonthDt;
    }
    /**
     * @param referMonthDt the referMonthDt to set
     */
    public void setReferMonthDt(String referMonthDt) {
        this.referMonthDt = referMonthDt;
    }
    /**
     * @return the referDayDt
     */
    public String getReferDayDt() {
        return referDayDt;
    }
    /**
     * @param referDayDt the referDayDt to set
     */
    public void setReferDayDt(String referDayDt) {
        this.referDayDt = referDayDt;
    }
    /**
     * @return the visitReqVal
     */
    public String getVisitReqVal() {
        return visitReqVal;
    }
    /**
     * @param visitReqVal the visitReqVal to set
     */
    public void setVisitReqVal(String visitReqVal) {
        this.visitReqVal = visitReqVal;
    }
    /**
     * @return the visitDealVal
     */
    public String getVisitDealVal() {
        return visitDealVal;
    }
    /**
     * @param visitDealVal the visitDealVal to set
     */
    public void setVisitDealVal(String visitDealVal) {
        this.visitDealVal = visitDealVal;
    }
    /**
     * @return the totDealVal
     */
    public String getTotDealVal() {
        return totDealVal;
    }
    /**
     * @param totDealVal the totDealVal to set
     */
    public void setTotDealVal(String totDealVal) {
        this.totDealVal = totDealVal;
    }
    /**
     * @return the perOfterVal
     */
    public String getPerOfterVal() {
        return perOfterVal;
    }
    /**
     * @param perOfterVal the perOfterVal to set
     */
    public void setPerOfterVal(String perOfterVal) {
        this.perOfterVal = perOfterVal;
    }
    /**
     * @return the successVal
     */
    public String getSuccessVal() {
        return successVal;
    }
    /**
     * @param successVal the successVal to set
     */
    public void setSuccessVal(String successVal) {
        this.successVal = successVal;
    }
    /**
     * @return the targetAchVal
     */
    public String getTargetAchVal() {
        return targetAchVal;
    }
    /**
     * @param targetAchVal the targetAchVal to set
     */
    public void setTargetAchVal(String targetAchVal) {
        this.targetAchVal = targetAchVal;
    }
    /**
     * @return the goodsCarQty
     */
    public String getGoodsCarQty() {
        return goodsCarQty;
    }
    /**
     * @param goodsCarQty the goodsCarQty to set
     */
    public void setGoodsCarQty(String goodsCarQty) {
        this.goodsCarQty = goodsCarQty;
    }
    /**
     * @return the insApplyRate
     */
    public String getInsApplyRate() {
        return insApplyRate;
    }
    /**
     * @param insApplyRate the insApplyRate to set
     */
    public void setInsApplyRate(String insApplyRate) {
        this.insApplyRate = insApplyRate;
    }
    /**
     * @return the fincApplyRate
     */
    public String getFincApplyRate() {
        return fincApplyRate;
    }
    /**
     * @param fincApplyRate the fincApplyRate to set
     */
    public void setFincApplyRate(String fincApplyRate) {
        this.fincApplyRate = fincApplyRate;
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
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
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
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
}
