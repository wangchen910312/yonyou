package chn.bhmc.dms.sample.web;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JsonBindingData.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 28.     Kang Seok Han     최초 생성
 * </pre>
 */
//TODO[한강석] 샘플입니다 삭제대상
public class JsonBindingData implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4960836932859866128L;

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

    @JsonProperty("BlueMembership_Id")
    private String blueMembershipId;

    @JsonProperty("BlueMembership_No")
    private String blueMembershipNo;

    @JsonProperty("MLevel")
    private String mLevel;

    public JsonBindingData(){}

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

}
