package chn.bhmc.dms.crm.dmm.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

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

public class BlueMembershipIfInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    @JsonProperty("BlueMembership_Id")
    private String blueMembershipId;

    @JsonProperty("BlueMembership_No")
    private String blueMembershipNo;

    @JsonProperty("Mlevel")
    private String mLevel;

    @JsonProperty("Amount")
    private String amount;

    private Date mLevelBeginDate;

    private Date mLevelInvalidDate;

    @JsonProperty("Point")
    private String point;

    @JsonProperty("BlueMembership_YN")
    private String blueMembershipYN;

    @JsonProperty("UserName")
    private String userName;

    @JsonProperty("RealName")
    private String realName;

    @JsonProperty("PhoneNumber")
    private String phoneNumber;

    @JsonProperty("IdentityNumber")
    private String identityNumber;

    @JsonProperty("Gender")
    private String gender;

    @JsonProperty("Birthday")
    private String birthday;

    @JsonProperty("Email")
    private String email;

    @JsonProperty("Address")
    private String address;

    @JsonProperty("Scale")
    private String pointExchangeRule;  //"0.1" 元：积分

    @JsonProperty("TotalPoint")
    private String totalSavePoint; //전체 적립포인트

    @JsonProperty("UserValue")
    private String totalConsumePoint; //전체 사용포인트

    @JsonProperty("ReceivedCardCount")
    private String usableCardCnt; //사용가능 쿠폰 수

    @JsonProperty("MaxConsumInte")
    private String maxConsumePoint; //사용가능 최대 Point

    private Date regDt;//가입일

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
     * @return the mLevel
     */
    public String getmLevel() {
        return mLevel;
    }

    /**
     * @param mLevel the mLevel to set
     */
    public void setmLevel(String mLevel) {
        this.mLevel = mLevel;
    }

    @JsonProperty("MLevel")
    public void setMLevel(String mLevel) {
        this.mLevel = mLevel;
    }

    /**
     * @return the mLevelBeginDate
     */
    public Date getmLevelBeginDate() {
        return mLevelBeginDate;
    }

    /**
     * @param mLevelBeginDate the mLevelBeginDate to set
     */
    public void setmLevelBeginDate(Date mLevelBeginDate) {
        this.mLevelBeginDate = mLevelBeginDate;
    }

    @JsonProperty("MLevelBeginDate")
    public void setMLevelBeginDate(String mLevelBeginDate) {
        this.mLevelBeginDate = getDate(mLevelBeginDate);
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
     * @return the mLevelInvalidDate
     */
    public Date getmLevelInvalidDate() {
        return mLevelInvalidDate;
    }

    /**
     * @param mLevelInvalidDate the mLevelInvalidDate to set
     */
    public void setmLevelInvalidDate(Date mLevelInvalidDate) {
        this.mLevelInvalidDate = mLevelInvalidDate;
    }

    @JsonProperty("MLevelInvalidDate")
    public void setMLevelInvalidDate(String mLevelInvalidDate) {
        this.mLevelInvalidDate = getDate(mLevelInvalidDate);
    }
    /**
     * @return the point
     */
    public String getPoint() {
        return point;
    }

    /**
     * @param point the point to set
     */
    public void setPoint(String point) {
        this.point = point;
    }

    /**
     * @return the blueMembershipYN
     */
    public String getBlueMembershipYN() {
        return blueMembershipYN;
    }

    /**
     * @param blueMembershipYN the blueMembershipYN to set
     */
    public void setBlueMembershipYN(String blueMembershipYN) {
        this.blueMembershipYN = blueMembershipYN;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the realName
     */
    public String getRealName() {
        return realName;
    }

    /**
     * @param realName the realName to set
     */
    public void setRealName(String realName) {
        this.realName = realName;
    }

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
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the birthday
     */
    public String getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the pointExchangeRule
     */
    public String getPointExchangeRule() {
        return pointExchangeRule;
    }

    /**
     * @param pointExchangeRule the pointExchangeRule to set
     */
    public void setPointExchangeRule(String pointExchangeRule) {
        this.pointExchangeRule = pointExchangeRule;
    }

    /**
     * @return the totalSavePoint
     */
    public String getTotalSavePoint() {
        return totalSavePoint;
    }

    /**
     * @param totalSavePoint the totalSavePoint to set
     */
    public void setTotalSavePoint(String totalSavePoint) {
        this.totalSavePoint = totalSavePoint;
    }

    /**
     * @return the totalConsumePoint
     */
    public String getTotalConsumePoint() {
        return totalConsumePoint;
    }

    /**
     * @param totalConsumePoint the totalConsumePoint to set
     */
    public void setTotalConsumePoint(String totalConsumePoint) {
        this.totalConsumePoint = totalConsumePoint;
    }

    /**
     * @return the usableCardCnt
     */
    public String getUsableCardCnt() {
        return usableCardCnt;
    }

    /**
     * @param usableCardCnt the usableCardCnt to set
     */
    public void setUsableCardCnt(String usableCardCnt) {
        this.usableCardCnt = usableCardCnt;
    }

    /**
     * @return the maxConsumePoint
     */
    public String getMaxConsumePoint() {
        return maxConsumePoint;
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

    @JsonProperty("AuthenticationTime")
    public void setAuthenticationTime(String regDt){
        this.regDt = getDate(regDt);
    }

    /**
     * @param maxConsumePoint the maxConsumePoint to set
     */
    public void setMaxConsumePoint(String maxConsumePoint) {
        this.maxConsumePoint = maxConsumePoint;
    }

    private Date getDate(String sDate){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = null;
        try {
            date = formatter.parse(sDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }


}
