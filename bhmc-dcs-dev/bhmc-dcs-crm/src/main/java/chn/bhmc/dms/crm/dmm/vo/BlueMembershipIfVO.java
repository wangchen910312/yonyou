package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

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

public class BlueMembershipIfVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8003036911477609673L;

    private String loginName;
    private String systemMType;
    private String mLevel;
    private String mType;
    private String id;
    private String phoneNumber;
    private String identityNumber;
    private String carTypeReturnIntegral;
    private String levelName;
    private String realName;
    private String nickName;
    private String memberCardNumber;
    private String faceImage;
    private String statusName;
    private String integral;
    private String blueBean;
    private String userType;
    private String userTypeInt;
    private String jingYanZhi;
    private String genderName;
    private String birthday;
    private String lastLogonTime;
    private String createTime;
    private String beMembershipTime;
    private String address;
    private String interest;
    private String isPay;
    private String isNeedModifyPw;
    private String vin;
    private Date mLevelBeginDate;
    private Date mLevelInvalidDate;
    private String amount;
    private String nPaperWork;
    private String neducational;
    private String nJob;
    private String nOffice;
    private String nIndustry;
    private String nRemark;
    private String nIsMarriage;
    private String nMainContact;
    private String nMainTelePhone;
    private String nOrganizationCode;
    private String email;
    private String provency;
    private String city;
    private String area;
    private String nTelePhone;
    private String nTransactionTime;
    /**
     * @return the loginName
     */
    public String getLoginName() {
        return loginName;
    }
    /**
     * @param loginName the loginName to set
     */
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }
    /**
     * @return the systemMType
     */
    public String getSystemMType() {
        return systemMType;
    }
    /**
     * @param systemMType the systemMType to set
     */
    public void setSystemMType(String systemMType) {
        this.systemMType = systemMType;
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
    /**
     * @return the mType
     */
    public String getmType() {
        return mType;
    }
    /**
     * @param mType the mType to set
     */
    public void setmType(String mType) {
        this.mType = mType;
    }
    /**
     * @return the id
     */
    public String getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
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
     * @return the carTypeReturnIntegral
     */
    public String getCarTypeReturnIntegral() {
        return carTypeReturnIntegral;
    }
    /**
     * @param carTypeReturnIntegral the carTypeReturnIntegral to set
     */
    public void setCarTypeReturnIntegral(String carTypeReturnIntegral) {
        this.carTypeReturnIntegral = carTypeReturnIntegral;
    }
    /**
     * @return the levelName
     */
    public String getLevelName() {
        return levelName;
    }
    /**
     * @param levelName the levelName to set
     */
    public void setLevelName(String levelName) {
        this.levelName = levelName;
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
     * @return the nickName
     */
    public String getNickName() {
        return nickName;
    }
    /**
     * @param nickName the nickName to set
     */
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    /**
     * @return the memberCardNumber
     */
    public String getMemberCardNumber() {
        return memberCardNumber;
    }
    /**
     * @param memberCardNumber the memberCardNumber to set
     */
    public void setMemberCardNumber(String memberCardNumber) {
        this.memberCardNumber = memberCardNumber;
    }
    /**
     * @return the faceImage
     */
    public String getFaceImage() {
        return faceImage;
    }
    /**
     * @param faceImage the faceImage to set
     */
    public void setFaceImage(String faceImage) {
        this.faceImage = faceImage;
    }
    /**
     * @return the statusName
     */
    public String getStatusName() {
        return statusName;
    }
    /**
     * @param statusName the statusName to set
     */
    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
    /**
     * @return the integral
     */
    public String getIntegral() {
        return integral;
    }
    /**
     * @param integral the integral to set
     */
    public void setIntegral(String integral) {
        this.integral = integral;
    }
    /**
     * @return the blueBean
     */
    public String getBlueBean() {
        return blueBean;
    }
    /**
     * @param blueBean the blueBean to set
     */
    public void setBlueBean(String blueBean) {
        this.blueBean = blueBean;
    }
    /**
     * @return the userType
     */
    public String getUserType() {
        return userType;
    }
    /**
     * @param userType the userType to set
     */
    public void setUserType(String userType) {
        this.userType = userType;
    }
    /**
     * @return the userTypeInt
     */
    public String getUserTypeInt() {
        return userTypeInt;
    }
    /**
     * @param userTypeInt the userTypeInt to set
     */
    public void setUserTypeInt(String userTypeInt) {
        this.userTypeInt = userTypeInt;
    }
    /**
     * @return the jingYanZhi
     */
    public String getJingYanZhi() {
        return jingYanZhi;
    }
    /**
     * @param jingYanZhi the jingYanZhi to set
     */
    public void setJingYanZhi(String jingYanZhi) {
        this.jingYanZhi = jingYanZhi;
    }
    /**
     * @return the genderName
     */
    public String getGenderName() {
        return genderName;
    }
    /**
     * @param genderName the genderName to set
     */
    public void setGenderName(String genderName) {
        this.genderName = genderName;
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
     * @return the lastLogonTime
     */
    public String getLastLogonTime() {
        return lastLogonTime;
    }
    /**
     * @param lastLogonTime the lastLogonTime to set
     */
    public void setLastLogonTime(String lastLogonTime) {
        this.lastLogonTime = lastLogonTime;
    }
    /**
     * @return the createTime
     */
    public String getCreateTime() {
        return createTime;
    }
    /**
     * @param createTime the createTime to set
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    /**
     * @return the beMembershipTime
     */
    public String getBeMembershipTime() {
        return beMembershipTime;
    }
    /**
     * @param beMembershipTime the beMembershipTime to set
     */
    public void setBeMembershipTime(String beMembershipTime) {
        this.beMembershipTime = beMembershipTime;
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
     * @return the interest
     */
    public String getInterest() {
        return interest;
    }
    /**
     * @param interest the interest to set
     */
    public void setInterest(String interest) {
        this.interest = interest;
    }
    /**
     * @return the isPay
     */
    public String getIsPay() {
        return isPay;
    }
    /**
     * @param isPay the isPay to set
     */
    public void setIsPay(String isPay) {
        this.isPay = isPay;
    }
    /**
     * @return the isNeedModifyPw
     */
    public String getIsNeedModifyPw() {
        return isNeedModifyPw;
    }
    /**
     * @param isNeedModifyPw the isNeedModifyPw to set
     */
    public void setIsNeedModifyPw(String isNeedModifyPw) {
        this.isNeedModifyPw = isNeedModifyPw;
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
     * @return the nPaperWork
     */
    public String getnPaperWork() {
        return nPaperWork;
    }
    /**
     * @param nPaperWork the nPaperWork to set
     */
    public void setnPaperWork(String nPaperWork) {
        this.nPaperWork = nPaperWork;
    }
    /**
     * @return the neducational
     */
    public String getNeducational() {
        return neducational;
    }
    /**
     * @param neducational the neducational to set
     */
    public void setNeducational(String neducational) {
        this.neducational = neducational;
    }
    /**
     * @return the nJob
     */
    public String getnJob() {
        return nJob;
    }
    /**
     * @param nJob the nJob to set
     */
    public void setnJob(String nJob) {
        this.nJob = nJob;
    }
    /**
     * @return the nOffice
     */
    public String getnOffice() {
        return nOffice;
    }
    /**
     * @param nOffice the nOffice to set
     */
    public void setnOffice(String nOffice) {
        this.nOffice = nOffice;
    }
    /**
     * @return the nIndustry
     */
    public String getnIndustry() {
        return nIndustry;
    }
    /**
     * @param nIndustry the nIndustry to set
     */
    public void setnIndustry(String nIndustry) {
        this.nIndustry = nIndustry;
    }
    /**
     * @return the nRemark
     */
    public String getnRemark() {
        return nRemark;
    }
    /**
     * @param nRemark the nRemark to set
     */
    public void setnRemark(String nRemark) {
        this.nRemark = nRemark;
    }
    /**
     * @return the nIsMarriage
     */
    public String getnIsMarriage() {
        return nIsMarriage;
    }
    /**
     * @param nIsMarriage the nIsMarriage to set
     */
    public void setnIsMarriage(String nIsMarriage) {
        this.nIsMarriage = nIsMarriage;
    }
    /**
     * @return the nMainContact
     */
    public String getnMainContact() {
        return nMainContact;
    }
    /**
     * @param nMainContact the nMainContact to set
     */
    public void setnMainContact(String nMainContact) {
        this.nMainContact = nMainContact;
    }
    /**
     * @return the nMainTelePhone
     */
    public String getnMainTelePhone() {
        return nMainTelePhone;
    }
    /**
     * @param nMainTelePhone the nMainTelePhone to set
     */
    public void setnMainTelePhone(String nMainTelePhone) {
        this.nMainTelePhone = nMainTelePhone;
    }
    /**
     * @return the nOrganizationCode
     */
    public String getnOrganizationCode() {
        return nOrganizationCode;
    }
    /**
     * @param nOrganizationCode the nOrganizationCode to set
     */
    public void setnOrganizationCode(String nOrganizationCode) {
        this.nOrganizationCode = nOrganizationCode;
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
     * @return the provency
     */
    public String getProvency() {
        return provency;
    }
    /**
     * @param provency the provency to set
     */
    public void setProvency(String provency) {
        this.provency = provency;
    }
    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }
    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }
    /**
     * @return the area
     */
    public String getArea() {
        return area;
    }
    /**
     * @param area the area to set
     */
    public void setArea(String area) {
        this.area = area;
    }
    /**
     * @return the nTelePhone
     */
    public String getnTelePhone() {
        return nTelePhone;
    }
    /**
     * @param nTelePhone the nTelePhone to set
     */
    public void setnTelePhone(String nTelePhone) {
        this.nTelePhone = nTelePhone;
    }
    /**
     * @return the nTransactionTime
     */
    public String getnTransactionTime() {
        return nTransactionTime;
    }
    /**
     * @param nTransactionTime the nTransactionTime to set
     */
    public void setnTransactionTime(String nTransactionTime) {
        this.nTransactionTime = nTransactionTime;
    }




}
