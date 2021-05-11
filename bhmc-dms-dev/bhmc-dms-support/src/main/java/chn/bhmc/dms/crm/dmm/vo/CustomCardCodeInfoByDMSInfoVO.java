package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomCardCodeInfoByDMSInfoVO.java
 * @Description : 쿠폰 사용 여부 조회.
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

public class CustomCardCodeInfoByDMSInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6250299428433562831L;

    //[TODO] 요청 파라미터
    private String DealerId; //딜러번호
    private String IdentityNumber; //증서 번호
    private String CardType; //쿠폰 유형
    private String CardNo;//쿠폰 번호(인증번호)
    private String VIN;//vin번호

    //[TODO] 응답 파라미터
    private String Msg; //사용불가능원인
    private String IfResult; //"S" : SUCCESS / "F" : FAIL

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
     * @return the msg
     */
    public String getMsg() {
        return Msg;
    }

    /**
     * @param msg the msg to set
     */
    public void setMsg(String msg) {
        Msg = msg;
    }

    /**
     * @return the ifResult
     */
    public String getIfResult() {
        return IfResult;
    }

    /**
     * @param ifResult the ifResult to set
     */
    public void setIfResult(String ifResult) {
        IfResult = ifResult;
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
