package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddMembersConsumeVO.java
 * @Description : 포인트 소비 신규
 * @author Kim Hyun Ho
 * @since 2016. 7. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 27.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class AddMembersConsumeVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2514240307072163771L;

  //[TODO] 요청 파라미터
    private String DealerId; //딜러 ID
    private String ConsumeType; //소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 ) * 1,2 는 현재 사용하지 않음.
    private String ConsumePoints; //소비 포인트 ( 적립인 경우 값을 0 )
    private String TotalCost; //총비용
    private String ConsumeDate; //소비 시간
    private String PhoneNumber; //사용자 이동전화
    private String OperatorDate; //입력 날짜
    private String IdentityNumber; //회원 신분증 번호
    private String VIN; //vin번호

    //[TODO] 응답 파라미터
    private String Point; //남는 포인트
    private String PointSeq; //소비증정 포인트(적립포인트)

    //[TODO] 성공여부
    private String IfSuccess;

    /**
     * @return the dealerId
     */
    public String getDealerId() {
        return DealerId;
    }

    /**
     * @param dealerId the dealerId to set
     */
    public void setDealerId(String dealerId) {
        DealerId = dealerId;
    }

    /**
     * @return the consumeType
     */
    public String getConsumeType() {
        return ConsumeType;
    }

    /**
     * @param consumeType the consumeType to set
     */
    public void setConsumeType(String consumeType) {
        ConsumeType = consumeType;
    }

    /**
     * @return the consumePoints
     */
    public String getConsumePoints() {
        return ConsumePoints;
    }

    /**
     * @param consumePoints the consumePoints to set
     */
    public void setConsumePoints(String consumePoints) {
        ConsumePoints = consumePoints;
    }

    /**
     * @return the totalCost
     */
    public String getTotalCost() {
        return TotalCost;
    }

    /**
     * @param totalCost the totalCost to set
     */
    public void setTotalCost(String totalCost) {
        TotalCost = totalCost;
    }

    /**
     * @return the consumeDate
     */
    public String getConsumeDate() {
        return ConsumeDate;
    }

    /**
     * @param consumeDate the consumeDate to set
     */
    public void setConsumeDate(String consumeDate) {
        ConsumeDate = consumeDate;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return PhoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        PhoneNumber = phoneNumber;
    }

    /**
     * @return the operatorDate
     */
    public String getOperatorDate() {
        return OperatorDate;
    }

    /**
     * @param operatorDate the operatorDate to set
     */
    public void setOperatorDate(String operatorDate) {
        OperatorDate = operatorDate;
    }

    /**
     * @return the identityNumber
     */
    public String getIdentityNumber() {
        return IdentityNumber;
    }

    /**
     * @param identityNumber the identityNumber to set
     */
    public void setIdentityNumber(String identityNumber) {
        IdentityNumber = identityNumber;
    }

    /**
     * @return the vIN
     */
    public String getVIN() {
        return VIN;
    }

    /**
     * @param vIN the vIN to set
     */
    public void setVIN(String vIN) {
        VIN = vIN;
    }

    /**
     * @return the point
     */
    public String getPoint() {
        return Point;
    }

    /**
     * @param point the point to set
     */
    public void setPoint(String point) {
        Point = point;
    }

    /**
     * @return the pointSeq
     */
    public String getPointSeq() {
        return PointSeq;
    }

    /**
     * @param pointSeq the pointSeq to set
     */
    public void setPointSeq(String pointSeq) {
        PointSeq = pointSeq;
    }

    /**
     * @return the ifSuccess
     */
    public String getIfSuccess() {
        return IfSuccess;
    }

    /**
     * @param ifSuccess the ifSuccess to set
     */
    public void setIfSuccess(String ifSuccess) {
        IfSuccess = ifSuccess;
    }



}
