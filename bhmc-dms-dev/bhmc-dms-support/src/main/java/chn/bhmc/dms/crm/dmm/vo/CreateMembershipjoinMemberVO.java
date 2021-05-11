package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CreateMembershipjoinMemberVO.java
 * @Description : 딜러의 도움 통해 회원 가입( 타 딜러에서 차량을 구매하고 회원가입을 하는경우 )
 * @author Kim Hyun Ho
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class CreateMembershipjoinMemberVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4348885706330361252L;

    //[TODO] 요청 파라미터
    private String PhoneNumber; //휴대폰번호
    private String PaperWork;//신분증유형( 1:신분증, 2:여권 , 3:군관증 )
    private String IdentityNumber; //증서번호
    private String DealerId; //딜러번호
    private String Agree;//지불여부 ( 1:지불 완료, 0: 미지불 )
    private String Amount;//지불금액

    //[TODO] 응답 파라미터
    private String MLevelBeginDate; //회원유효기간
    private String BlueMembership_Id; //회원번호
    private String BlueMembership_No; //회원카드번호
    private String MLevel; //회원 등급1- 등록 회원 10-일반 카드 11- 실버 12-골드

    //[TODO] 성공여부
    private String IfSuccess;//성공여부

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
     * @return the paperWork
     */
    public String getPaperWork() {
        return PaperWork;
    }

    /**
     * @param paperWork the paperWork to set
     */
    public void setPaperWork(String paperWork) {
        PaperWork = paperWork;
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
     * @return the agree
     */
    public String getAgree() {
        return Agree;
    }

    /**
     * @param agree the agree to set
     */
    public void setAgree(String agree) {
        Agree = agree;
    }

    /**
     * @return the amount
     */
    public String getAmount() {
        return Amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(String amount) {
        Amount = amount;
    }

    /**
     * @return the mLevelBeginDate
     */
    public String getMLevelBeginDate() {
        return MLevelBeginDate;
    }

    /**
     * @param mLevelBeginDate the mLevelBeginDate to set
     */
    public void setMLevelBeginDate(String mLevelBeginDate) {
        MLevelBeginDate = mLevelBeginDate;
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
