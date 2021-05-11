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

public class BlueMembershipIfVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    //[TODO] 요청 파라미터
    private String sIdentityNumber;//회원 신분증 번호
    private String sDealerId; //딜러 ID
    private String sConsumeType; //소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 ) * 1,2 는 현재 사용하지 않음.
    private String sConsumePoints; //소비 포인트 ( 적립인 경우 값을 0 )
    private String sTotalCost; //총비용
    private String sConsumeDate; //소비 시간
    private String sPhoneNumber; //사용자 이동전화
    private String sOperatorDate; //입력 날짜
    private String sVin; //vin번호
    private String sBeginDate; //시작 날짜(yyyyMMddHHmmss)
    private String sEndDate; //완료 날짜(yyyyMMddHHmmss)
    private String sBlueMembershipNo; //회원카드번호
    private String sPaperWork;//신분증유형( 1:신분증, 2:여권 , 3:군관증 )
    private String sAgree;//지불여부 ( 1:지불 완료, 0: 미지불 )
    private String sAmount;//지불금액
    private String sNickName;// 닉네임
    private String sCardType; //쿠폰 유형
    private String sCardNo;//쿠폰 번호(인증번호)
    private String sCarCategory; //차형
    private String sCustName; //이름
    private String sMileAge; //주행거리
    private String sOperator; //등록자Id

    //[TODO] 응답 파라미터
    @JsonProperty("IsSuccess")
    private boolean isSuccess;

    @JsonProperty("Message")
    private String message;


    @JsonProperty("Errors")
    private String errors;


    @JsonProperty("Data")
    private BlueMembershipIfDataVO data;

    public BlueMembershipIfVO(){}



    /**
     * @return the sIdentityNumber
     */
    public String getsIdentityNumber() {
        return sIdentityNumber;
    }



    /**
     * @param sIdentityNumber the sIdentityNumber to set
     */
    public void setsIdentityNumber(String sIdentityNumber) {
        this.sIdentityNumber = sIdentityNumber;
    }



    /**
     * @return the isSuccess
     */
    public boolean isSuccess() {
        return isSuccess;
    }

    /**
     * @param isSuccess the isSuccess to set
     */
    public void setSuccess(boolean isSuccess) {
        this.isSuccess = isSuccess;
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

    /**
     * @return the data
     */
    public BlueMembershipIfDataVO getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(BlueMembershipIfDataVO data) {
        this.data = data;
    }



    /**
     * @return the sDealerId
     */
    public String getsDealerId() {
        return sDealerId;
    }



    /**
     * @param sDealerId the sDealerId to set
     */
    public void setsDealerId(String sDealerId) {
        this.sDealerId = sDealerId;
    }



    /**
     * @return the sConsumeType
     */
    public String getsConsumeType() {
        return sConsumeType;
    }



    /**
     * @param sConsumeType the sConsumeType to set
     */
    public void setsConsumeType(String sConsumeType) {
        this.sConsumeType = sConsumeType;
    }



    /**
     * @return the sConsumePoints
     */
    public String getsConsumePoints() {
        return sConsumePoints;
    }



    /**
     * @param sConsumePoints the sConsumePoints to set
     */
    public void setsConsumePoints(String sConsumePoints) {
        this.sConsumePoints = sConsumePoints;
    }



    /**
     * @return the sTotalCost
     */
    public String getsTotalCost() {
        return sTotalCost;
    }



    /**
     * @param sTotalCost the sTotalCost to set
     */
    public void setsTotalCost(String sTotalCost) {
        this.sTotalCost = sTotalCost;
    }



    /**
     * @return the sConsumeDate
     */
    public String getsConsumeDate() {
        return sConsumeDate;
    }



    /**
     * @param sConsumeDate the sConsumeDate to set
     */
    public void setsConsumeDate(String sConsumeDate) {
        this.sConsumeDate = sConsumeDate;
    }



    /**
     * @return the sPhoneNumber
     */
    public String getsPhoneNumber() {
        return sPhoneNumber;
    }



    /**
     * @param sPhoneNumber the sPhoneNumber to set
     */
    public void setsPhoneNumber(String sPhoneNumber) {
        this.sPhoneNumber = sPhoneNumber;
    }



    /**
     * @return the sOperatorDate
     */
    public String getsOperatorDate() {
        return sOperatorDate;
    }



    /**
     * @param sOperatorDate the sOperatorDate to set
     */
    public void setsOperatorDate(String sOperatorDate) {
        this.sOperatorDate = sOperatorDate;
    }



    /**
     * @return the sVin
     */
    public String getsVin() {
        return sVin;
    }



    /**
     * @param sVin the sVin to set
     */
    public void setsVin(String sVin) {
        this.sVin = sVin;
    }



    /**
     * @return the sBeginDate
     */
    public String getsBeginDate() {
        return sBeginDate;
    }



    /**
     * @param sBeginDate the sBeginDate to set
     */
    public void setsBeginDate(String sBeginDate) {
        this.sBeginDate = sBeginDate;
    }



    /**
     * @return the sEndDate
     */
    public String getsEndDate() {
        return sEndDate;
    }



    /**
     * @param sEndDate the sEndDate to set
     */
    public void setsEndDate(String sEndDate) {
        this.sEndDate = sEndDate;
    }



    /**
     * @return the sBlueMembershipNo
     */
    public String getsBlueMembershipNo() {
        return sBlueMembershipNo;
    }



    /**
     * @param sBlueMembershipNo the sBlueMembershipNo to set
     */
    public void setsBlueMembershipNo(String sBlueMembershipNo) {
        this.sBlueMembershipNo = sBlueMembershipNo;
    }



    /**
     * @return the sPaperWork
     */
    public String getsPaperWork() {
        return sPaperWork;
    }



    /**
     * @param sPaperWork the sPaperWork to set
     */
    public void setsPaperWork(String sPaperWork) {
        this.sPaperWork = sPaperWork;
    }



    /**
     * @return the sAgree
     */
    public String getsAgree() {
        return sAgree;
    }



    /**
     * @param sAgree the sAgree to set
     */
    public void setsAgree(String sAgree) {
        this.sAgree = sAgree;
    }



    /**
     * @return the sAmount
     */
    public String getsAmount() {
        return sAmount;
    }



    /**
     * @param sAmount the sAmount to set
     */
    public void setsAmount(String sAmount) {
        this.sAmount = sAmount;
    }



    /**
     * @return the sNickName
     */
    public String getsNickName() {
        return sNickName;
    }



    /**
     * @param sNickName the sNickName to set
     */
    public void setsNickName(String sNickName) {
        this.sNickName = sNickName;
    }



    /**
     * @return the sCardType
     */
    public String getsCardType() {
        return sCardType;
    }



    /**
     * @param sCardType the sCardType to set
     */
    public void setsCardType(String sCardType) {
        this.sCardType = sCardType;
    }



    /**
     * @return the sCardNo
     */
    public String getsCardNo() {
        return sCardNo;
    }



    /**
     * @param sCardNo the sCardNo to set
     */
    public void setsCardNo(String sCardNo) {
        this.sCardNo = sCardNo;
    }



    /**
     * @return the sCarCategory
     */
    public String getsCarCategory() {
        return sCarCategory;
    }



    /**
     * @param sCarCategory the sCarCategory to set
     */
    public void setsCarCategory(String sCarCategory) {
        this.sCarCategory = sCarCategory;
    }



    /**
     * @return the sCustName
     */
    public String getsCustName() {
        return sCustName;
    }



    /**
     * @param sCustName the sCustName to set
     */
    public void setsCustName(String sCustName) {
        this.sCustName = sCustName;
    }



    /**
     * @return the sMileAge
     */
    public String getsMileAge() {
        return sMileAge;
    }



    /**
     * @param sMileAge the sMileAge to set
     */
    public void setsMileAge(String sMileAge) {
        this.sMileAge = sMileAge;
    }



    /**
     * @return the sOperator
     */
    public String getsOperator() {
        return sOperator;
    }



    /**
     * @param sOperator the sOperator to set
     */
    public void setsOperator(String sOperator) {
        this.sOperator = sOperator;
    }




}
