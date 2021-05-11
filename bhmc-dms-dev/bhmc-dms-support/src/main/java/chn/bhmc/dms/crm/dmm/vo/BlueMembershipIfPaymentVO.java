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

public class BlueMembershipIfPaymentVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    @JsonProperty("DealerId")
    private String dealerId; //딜러 ID

    @JsonProperty("Tel")
    private String phoneNumber;

    @JsonProperty("IdentityNumber")
    private String identityNumber;

    @JsonProperty("Amount")
    private String amount;

    @JsonProperty("Name")
    private String userName;

    @JsonProperty("Ispay")
    private String isPay;

    @JsonProperty("PayNumber")
    private String payNumber;

    @JsonProperty("createtime")
    private String createDate;

    @JsonProperty("Status")
    private String status;

    /**
     * @return the dealerId
     */
    public String getDealerId() {
        return dealerId;
    }

    /**
     * @param dealerId the dealerId to set
     */
    public void setDealerId(String dealerId) {
        this.dealerId = dealerId;
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
     * @return the payNumber
     */
    public String getPayNumber() {
        return payNumber;
    }

    /**
     * @param payNumber the payNumber to set
     */
    public void setPayNumber(String payNumber) {
        this.payNumber = payNumber;
    }

    /**
     * @return the createDate
     */
    public String getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
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


}
