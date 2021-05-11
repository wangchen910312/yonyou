package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcPointInfoVO
 * @Description : 블루멤버십 정산 상세 VO
 * @author Lee In Moon
 * @since 2016.12.12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.12.12.     Lee In Moon     최초 생성
 * </pre>
 */

public class BlueMembershipCalcPointInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8682376011620692466L;

    private String blueMembershipId;
    private String hpNo;       //휴대폰 번호
    private String ssnCrnNo;      //신분증 번호
    private String vinNo;          //
    private String pointCd;        //소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 )
    private String occrPointVal;     //소비 포인트
    private String totAmt;           //총 비용
    private String occrPointCost;    //소비 금액(포인트 대신 결재 비용 )
    private String accuPointVal;     //적립 포인트
    private String consumeDate;       // 소비 시간 (yyyyMMddHHmmss)
    /**
     * @return the blueMembershipId
     */
    public String getBlueMembershipId() {
        return blueMembershipId;
    }
    /**
     * @param blueMembershipId the blueMembershipId to set
     */
    public void setBlueMembershipId(String blueMembershipId) {
        this.blueMembershipId = blueMembershipId;
    }
    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }
    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
    /**
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }
    /**
     * @param ssnCrnNo the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
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
     * @return the pointCd
     */
    public String getPointCd() {
        return pointCd;
    }
    /**
     * @param pointCd the pointCd to set
     */
    public void setPointCd(String pointCd) {
        this.pointCd = pointCd;
    }
    /**
     * @return the occrPointVal
     */
    public String getOccrPointVal() {
        return occrPointVal;
    }
    /**
     * @param occrPointVal the occrPointVal to set
     */
    public void setOccrPointVal(String occrPointVal) {
        this.occrPointVal = occrPointVal;
    }
    /**
     * @return the totAmt
     */
    public String getTotAmt() {
        return totAmt;
    }
    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(String totAmt) {
        this.totAmt = totAmt;
    }
    /**
     * @return the occrPointCost
     */
    public String getOccrPointCost() {
        return occrPointCost;
    }
    /**
     * @param occrPointCost the occrPointCost to set
     */
    public void setOccrPointCost(String occrPointCost) {
        this.occrPointCost = occrPointCost;
    }
    /**
     * @return the accuPointVal
     */
    public String getAccuPointVal() {
        return accuPointVal;
    }
    /**
     * @param accuPointVal the accuPointVal to set
     */
    public void setAccuPointVal(String accuPointVal) {
        this.accuPointVal = accuPointVal;
    }
    /**
     * @return the consumeDate
     */
    public String getConsumeDate() {
        return consumeDate;
    }
    /**
     * @param consumeDate the consumeDate to set
     */
    public void setConsumeDate(String consumeDate) {
        this.consumeDate = consumeDate;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "BlueMembershipCalcPointInfoVO [blueMembershipId=" + blueMembershipId + ", hpNo=" + hpNo + ", ssnCrnNo="
                + ssnCrnNo + ", vinNo=" + vinNo + ", pointCd=" + pointCd + ", occrPointVal=" + occrPointVal
                + ", totAmt=" + totAmt + ", occrPointCost=" + occrPointCost + ", accuPointVal=" + accuPointVal
                + ", consumeDate=" + consumeDate + "]";
    }

}