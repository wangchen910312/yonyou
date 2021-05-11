package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserAwardCustomCardInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
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

public class UserAwardCustomCardInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3980573254747692009L;


    //[TODO] 요청 파라미터
    private String DealerId; //딜러번호
    private String IdentityNumber; //증서 번호
    private String CardType; //쿠폰 유형
    private String CardNo;//쿠폰 번호(인증번호)
    private String VIN;//vin번호
    private String CarCategory; //차형
    private String CustName; //이름
    private String MileAge; //주행거리


    //[TODO] 응답 파라미터
    private String Status; //사용 사태: 1: 사용 , 0: 미사용
    private String ResultMsg; //사용불가능원인

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
     * @return the cardType
     */
    public String getCardType() {
        return CardType;
    }

    /**
     * @param cardType the cardType to set
     */
    public void setCardType(String cardType) {
        CardType = cardType;
    }

    /**
     * @return the cardNo
     */
    public String getCardNo() {
        return CardNo;
    }

    /**
     * @param cardNo the cardNo to set
     */
    public void setCardNo(String cardNo) {
        CardNo = cardNo;
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
     * @return the carCategory
     */
    public String getCarCategory() {
        return CarCategory;
    }

    /**
     * @param carCategory the carCategory to set
     */
    public void setCarCategory(String carCategory) {
        CarCategory = carCategory;
    }

    /**
     * @return the custName
     */
    public String getCustName() {
        return CustName;
    }

    /**
     * @param custName the custName to set
     */
    public void setCustName(String custName) {
        CustName = custName;
    }

    /**
     * @return the mileAge
     */
    public String getMileAge() {
        return MileAge;
    }

    /**
     * @param mileAge the mileAge to set
     */
    public void setMileAge(String mileAge) {
        MileAge = mileAge;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return Status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        Status = status;
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
