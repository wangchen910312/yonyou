package chn.bhmc.dms.crm.dmm.vo;

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

public class BlueMembershipIfDataVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    @JsonProperty("IdentityNumber")
    private String identityNumber; //회원 신분증 번호

    @JsonProperty("UserName")
    private String userName;

    @JsonProperty("RealName")
    private String realName;

    @JsonProperty("PhoneNumber")
    private String phoneNumber;

    @JsonProperty("Gender")
    private String gender;

    @JsonProperty("Birthday")
    private String birthday;

    @JsonProperty("Email")
    private String email;

    @JsonProperty("Address")
    private String address;

    @JsonProperty("BlueMembership_Id")
    private String blueMembershipId; //회원번호

    @JsonProperty("BlueMembership_No")
    private String blueMembershipNo; //회원카드번호

    @JsonProperty("MLevel")
    private String mLevel; //회원 등급1- 등록 회원 10-일반 카드 11- 실버 12-골드

    @JsonProperty("MLevelBeginDate")
    private String mLevelBeginDate; //회원유효기간

    @JsonProperty("Point")
    private String Point; //남는 포인트 , //포인트 변동수치, //회원포인트

    @JsonProperty("PointSeq")
    private String PointSeq; //소비증정 포인트(적립포인트)

    @JsonProperty("Type")
    private String type; //1 신규, 2 소비

    @JsonProperty("UpdateDate")
    private String updateDate; //포인트변동시간

    @JsonProperty("Remark")
    private String remark; //포인트 변동원인

    @JsonProperty("Operator")
    private String operator; //조작인

    @JsonProperty("Msg")
    private String msg; //사용불가능원인

    @JsonProperty("IfResult")
    private String ifResult; //"S" : SUCCESS / "F" : FAIL

    @JsonProperty("BlueMembership_YN")
    private String blueMembershipYn; // BM여부 "Y" :YES / "N" : NO

    @JsonProperty("Status")
    private String status; //사용 사태: 1: 사용 , 0: 미사용

    @JsonProperty("ResultMsg")
    private String ResultMsg; //사용불가능원인

    @JsonProperty("Amount")
    private String amount; ////지불금액

    @JsonProperty("MLevelInvalidDate")
    private String mLevelInvalidDate; //회원유효기간

    @JsonProperty("Message")
    private String message; //

    @JsonProperty("Errors")
    private String errors; //




    //[TODO] 응답결과 파라미터
    @JsonProperty("IsSuccess")
    private Boolean isSuccess;

    public BlueMembershipIfDataVO(){}

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

    /**
     * @return the mLevelBeginDate
     */
    public String getmLevelBeginDate() {
        return mLevelBeginDate;
    }

    /**
     * @param mLevelBeginDate the mLevelBeginDate to set
     */
    public void setmLevelBeginDate(String mLevelBeginDate) {
        this.mLevelBeginDate = mLevelBeginDate;
    }

    /**
     * @return the isSuccess
     */
    public Boolean getIsSuccess() {
        return isSuccess;
    }

    /**
     * @param isSuccess the isSuccess to set
     */
    public void setIsSuccess(Boolean isSuccess) {
        this.isSuccess = isSuccess;
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
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the updateDate
     */
    public String getUpdateDate() {
        return updateDate;
    }

    /**
     * @param updateDate the updateDate to set
     */
    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
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
     * @return the msg
     */
    public String getMsg() {
        return msg;
    }

    /**
     * @param msg the msg to set
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * @return the ifResult
     */
    public String getIfResult() {
        return ifResult;
    }

    /**
     * @param ifResult the ifResult to set
     */
    public void setIfResult(String ifResult) {
        this.ifResult = ifResult;
    }

    /**
     * @return the blueMembershipYn
     */
    public String getBlueMembershipYn() {
        return blueMembershipYn;
    }

    /**
     * @param blueMembershipYn the blueMembershipYn to set
     */
    public void setBlueMembershipYn(String blueMembershipYn) {
        this.blueMembershipYn = blueMembershipYn;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the resultMsg
     */
    public String getResultMsg() {
        return ResultMsg;
    }

    /**
     * @param resultMsg the resultMsg to set
     */
    public void setResultMsg(String resultMsg) {
        ResultMsg = resultMsg;
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
    public String getmLevelInvalidDate() {
        return mLevelInvalidDate;
    }

    /**
     * @param mLevelInvalidDate the mLevelInvalidDate to set
     */
    public void setmLevelInvalidDate(String mLevelInvalidDate) {
        this.mLevelInvalidDate = mLevelInvalidDate;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }


    /**
     * @return the errors
     */
    public String getErrors() {
        return errors;
    }

    /**
     * @param errors the errors to set
     */
    public void setErrors(String errors) {
        this.errors = errors;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "BlueMembershipIfDataVO [identityNumber=" + identityNumber + ", userName=" + userName + ", realName="
                + realName + ", phoneNumber=" + phoneNumber + ", gender=" + gender + ", birthday=" + birthday
                + ", email=" + email + ", address=" + address + ", blueMembershipId=" + blueMembershipId
                + ", blueMembershipNo=" + blueMembershipNo + ", mLevel=" + mLevel + ", mLevelBeginDate="
                + mLevelBeginDate + ", Point=" + Point + ", PointSeq=" + PointSeq + ", type=" + type + ", updateDate="
                + updateDate + ", remark=" + remark + ", operator=" + operator + ", msg=" + msg + ", ifResult="
                + ifResult + ", blueMembershipYn=" + blueMembershipYn + ", status=" + status + ", ResultMsg="
                + ResultMsg + ", amount=" + amount + ", mLevelInvalidDate=" + mLevelInvalidDate + ", message="
                + message + ", errors=" + errors + ", isSuccess=" + isSuccess + "]";
    }


}
