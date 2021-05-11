package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MemberUserintegralInfoVO.java
 * @Description : 블루멤버십 회원 포인트 조회
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

public class MemberUserintegralInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4337753842826637611L;

    //[TODO] 요청 파라미터
    private String IdentityNumber; //회원 신분증 번호
    private String DealerId; //딜러ID
    private String PhoneNumber; //휴대폰 번호
    private String VIN; //vin번호

    //[TODO] 응답 파라미터
    private String BlueMembership_Id; //회원번호
    private String BlueMembership_No; //회원카드번호
    private String MLevel; //회원 등급1- 등록 회원 10-일반 카드 11- 실버 12-골드
    private String MLevelInvalidDate; //회원유효기간
    private String Point; //회원포인트
    private String BlueMembership_Yn; // BM여부 "Y" :YES / "N" : NO

    //[TODO] 성공여부
    private String IfSuccess;

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
     * @return the blueMembership_Id
     */
    public String getBlueMembership_Id() {
        return BlueMembership_Id;
    }

    /**
     * @param blueMembership_Id the blueMembership_Id to set
     */
    public void setBlueMembership_Id(String blueMembership_Id) {
        BlueMembership_Id = blueMembership_Id;
    }

    /**
     * @return the blueMembership_No
     */
    public String getBlueMembership_No() {
        return BlueMembership_No;
    }

    /**
     * @param blueMembership_No the blueMembership_No to set
     */
    public void setBlueMembership_No(String blueMembership_No) {
        BlueMembership_No = blueMembership_No;
    }

    /**
     * @return the mLevel
     */
    public String getMLevel() {
        return MLevel;
    }

    /**
     * @param mLevel the mLevel to set
     */
    public void setMLevel(String mLevel) {
        MLevel = mLevel;
    }

    /**
     * @return the mLevelInvalidDate
     */
    public String getMLevelInvalidDate() {
        return MLevelInvalidDate;
    }

    /**
     * @param mLevelInvalidDate the mLevelInvalidDate to set
     */
    public void setMLevelInvalidDate(String mLevelInvalidDate) {
        MLevelInvalidDate = mLevelInvalidDate;
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
     * @return the blueMembership_Yn
     */
    public String getBlueMembership_Yn() {
        return BlueMembership_Yn;
    }

    /**
     * @param blueMembership_Yn the blueMembership_Yn to set
     */
    public void setBlueMembership_Yn(String blueMembership_Yn) {
        BlueMembership_Yn = blueMembership_Yn;
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
