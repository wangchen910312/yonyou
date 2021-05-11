package chn.bhmc.dms.mob.api.crm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipIfVO
 * @Description : 블루멤버십 회원정보(인터페이스) VO
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

public class BlueMembershipIfParamVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    // 인터페이스 파라미터용
    private String phoneNumber; //휴대폰 번호
    private String paperWork; //신분증 유형(신분증 =1, 여권=2, 군관증=3)
    private String identityNumber;//신분증 번호
    private String dealerId;//딜러 ID
    private String agree;//지불 여부(1: 지불 완료, 0: 미 지불 )
    private String amount;//지불 금액
    private String vin;//VIN 번호
    private String consumeType;//소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 )
    private String consumePoints;//소비 포인트 ( 적립인 경우 값을 0 )
    private String totalCost;//할인받지않은 금액
    private String consumeDate;//소비 시간 (yyyyMMddHHmmss)
    private String operatorDate;//입력 날짜
    private String beginDate;//시작 날짜(yyyyMMddHHmmss)
    private String endDate;//완료 날짜(yyyyMMddHHmmss)
    private String blueMembershipNo;//회원 카드 번호
    private String cardNo;//쿠폰 번호(인증 번호)
    private String carCategory;//차형
    private String custName;//고객명
    private String mileAge;//주행 거리
    private String operator;//입력자 ID
    private String useNum;//소비번호(RO번호/계약번호 등등)
    private String paymentCost;//총 지불 비용(할인후)

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }
    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    /**
     * @return the paperWork
     */
    public String getPaperWork() {
        return paperWork;
    }
    /**
     * @param paperWork the paperWork to set
     */
    public void setPaperWork(String paperWork) {
        this.paperWork = paperWork;
    }
    /**
     * @return the identityNumber
     */
    public String getIdentityNumber() {
        return identityNumber;
    }
    /**
     * @param identityNumber the identityNumber to set
     */
    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }
    /**
     * @return the dealerId
     */
    public String getDealerId() {
        return dealerId;
    }
    /**
     * @param dealerId the dealerId to set
     */
    public void setDealerId(String dealerId) {
        this.dealerId = dealerId;
    }
    /**
     * @return the agree
     */
    public String getAgree() {
        return agree;
    }
    /**
     * @param agree the agree to set
     */
    public void setAgree(String agree) {
        this.agree = agree;
    }
    /**
     * @return the amount
     */
    public String getAmount() {
        return amount;
    }
    /**
     * @param amount the amount to set
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }
    /**
     * @return the vin
     */
    public String getVin() {
        return vin;
    }
    /**
     * @param vin the vin to set
     */
    public void setVin(String vin) {
        this.vin = vin;
    }
    /**
     * @return the consumeType
     */
    public String getConsumeType() {
        return consumeType;
    }
    /**
     * @param consumeType the consumeType to set
     */
    public void setConsumeType(String consumeType) {
        this.consumeType = consumeType;
    }
    /**
     * @return the consumePoints
     */
    public String getConsumePoints() {
        return consumePoints;
    }
    /**
     * @param consumePoints the consumePoints to set
     */
    public void setConsumePoints(String consumePoints) {
        this.consumePoints = consumePoints;
    }
    /**
     * @return the totalCost
     */
    public String getTotalCost() {
        return totalCost;
    }
    /**
     * @param totalCost the totalCost to set
     */
    public void setTotalCost(String totalCost) {
        this.totalCost = totalCost;
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
    /**
     * @return the operatorDate
     */
    public String getOperatorDate() {
        return operatorDate;
    }
    /**
     * @param operatorDate the operatorDate to set
     */
    public void setOperatorDate(String operatorDate) {
        this.operatorDate = operatorDate;
    }
    /**
     * @return the beginDate
     */
    public String getBeginDate() {
        return beginDate;
    }
    /**
     * @param beginDate the beginDate to set
     */
    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }
    /**
     * @return the endDate
     */
    public String getEndDate() {
        return endDate;
    }
    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
    /**
     * @return the blueMembershipNo
     */
    public String getBlueMembershipNo() {
        return blueMembershipNo;
    }
    /**
     * @param blueMembershipNo the blueMembershipNo to set
     */
    public void setBlueMembershipNo(String blueMembershipNo) {
        this.blueMembershipNo = blueMembershipNo;
    }
    /**
     * @return the cardNo
     */
    public String getCardNo() {
        return cardNo;
    }
    /**
     * @param cardNo the cardNo to set
     */
    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }
    /**
     * @return the carCategory
     */
    public String getCarCategory() {
        return carCategory;
    }
    /**
     * @param carCategory the carCategory to set
     */
    public void setCarCategory(String carCategory) {
        this.carCategory = carCategory;
    }
    /**
     * @return the custName
     */
    public String getCustName() {
        return custName;
    }
    /**
     * @param custName the custName to set
     */
    public void setCustName(String custName) {
        this.custName = custName;
    }
    /**
     * @return the mileAge
     */
    public String getMileAge() {
        return mileAge;
    }
    /**
     * @param mileAge the mileAge to set
     */
    public void setMileAge(String mileAge) {
        this.mileAge = mileAge;
    }
    /**
     * @return the operator
     */
    public String getOperator() {
        return operator;
    }
    /**
     * @param operator the operator to set
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }
    /**
     * @return the useNum
     */
    public String getUseNum() {
        return useNum;
    }
    /**
     * @param useNum the useNum to set
     */
    public void setUseNum(String useNum) {
        this.useNum = useNum;
    }
    /**
     * @return the paymentCost
     */
    public String getPaymentCost() {
        return paymentCost;
    }
    /**
     * @param paymentCost the paymentCost to set
     */
    public void setPaymentCost(String paymentCost) {
        this.paymentCost = paymentCost;
    }

}
