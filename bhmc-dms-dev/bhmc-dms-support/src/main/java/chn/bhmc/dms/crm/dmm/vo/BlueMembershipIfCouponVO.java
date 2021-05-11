package chn.bhmc.dms.crm.dmm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipIfCouponVO
 * @Description : 블루멤버십 쿠폰정보 (인터페이스) VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipIfCouponVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Hyunjoo Kim
 * @since 2016. 11. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 22.     Hyunjoo Kim     최초 생성
 * </pre>
 */
public class BlueMembershipIfCouponVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    private boolean isUseStat;

    @JsonProperty("Msg")
    private String couponResultMsg;//사용 불가능 원인

    @JsonProperty("RoDocNo")
    private String roDocNo;//RO문서번호

    @JsonProperty("ContractNo")
    private String contractNo;//계약번호

    @JsonProperty("ReduceCost")
    private String reduceCost;//비용

    @JsonProperty("Tel")
    private String telNo;//전화번호

    @JsonProperty("CardBeginDate")
    private String couponBeginDate;//쿠폰 시작일

    @JsonProperty("CardEndDate")
    private String couponEndDate;//쿠폰 종료일

    @JsonProperty("CardRemark")
    private String remark;//쿠폰 설명

    @JsonProperty("CardCategory")
    private String couponTp;//쿠폰유형 ( 1: 공임비, 2:부품비, 3:총금액)

    @JsonProperty("CardName")
    private String cardName;    //쿠폰명

    @JsonProperty("ActivityType")
    private String activityType;    //캠페인명

    /**
     * @return the isUseStat
     */
    public boolean isUseStat() {
        return isUseStat;
    }

    /**
     * @param isUseStat the isUseStat to set
     */
    public void setUseStat(boolean isUseStat) {
        this.isUseStat = isUseStat;
    }

    /**
     * @return the couponResultMsg
     */
    public String getCouponResultMsg() {
        return couponResultMsg;
    }

    /**
     * @param couponResultMsg the couponResultMsg to set
     */
    public void setCouponResultMsg(String couponResultMsg) {
        this.couponResultMsg = couponResultMsg;
    }

    @JsonProperty("IfResult")//"S" : 사용가능 / "F" : 사용불가능
    public void setIfResult(String ifResult){
        if(("S").equals(ifResult)){
            this.isUseStat = true;
        }else if(("F").equals(ifResult)){
            this.isUseStat = false;
        }
    }

    @JsonProperty("Status")//"1":사용성공, "0":사용실패
    public void setStatus(String status){
        if(("1").equals(status)){
            this.isUseStat = true;
        }else if(("0").equals(status)){
            this.isUseStat = false;
        }
    }

    @JsonProperty("ResultMsg")//사용 불가능 원인
    public void setResultMsg(String couponResultMsg){
        this.couponResultMsg = couponResultMsg;
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
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the reduceCost
     */
    public String getReduceCost() {
        return reduceCost;
    }

    /**
     * @param reduceCost the reduceCost to set
     */
    public void setReduceCost(String reduceCost) {
        this.reduceCost = reduceCost;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the couponBeginDate
     */
    public String getCouponBeginDate() {
        return couponBeginDate;
    }

    /**
     * @param couponBeginDate the couponBeginDate to set
     */
    public void setCouponBeginDate(String couponBeginDate) {
        this.couponBeginDate = couponBeginDate;
    }

    /**
     * @return the couponEndDate
     */
    public String getCouponEndDate() {
        return couponEndDate;
    }

    /**
     * @param couponEndDate the couponEndDate to set
     */
    public void setCouponEndDate(String couponEndDate) {
        this.couponEndDate = couponEndDate;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the couponTp
     */
    public String getCouponTp() {
        return couponTp;
    }

    /**
     * @param couponTp the couponTp to set
     */
    public void setCouponTp(String couponTp) {
        this.couponTp = couponTp;
    }

    /**
     * @return the cardName
     */
    public String getCardName() {
        return cardName;
    }

    /**
     * @param cardName the cardName to set
     */
    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    /**
     * @return the activityType
     */
    public String getActivityType() {
        return activityType;
    }

    /**
     * @param activityType the activityType to set
     */
    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }
}
