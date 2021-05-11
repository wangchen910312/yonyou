package chn.bhmc.dms.par.pcm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInterfaceResultVO.java
 * @Description : ClaimInterfaceResultVO.java
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

public class ClaimInterfaceResultVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 259309063894817108L;

    /**
     * 상태
     */
    private String status;

    /**
     * 에러메시지
     */
    private String errorMessage;

    /**
     * 클레임코드
     */
    @JsonProperty("claim_code")
    private String claimCode;

    /**
     * 코드
     */
    @JsonProperty("code")
    private String code;

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
     * @return the errorMessage
     */
    public String getErrorMessage() {
        return errorMessage;
    }

    /**
     * @param errorMessage the errorMessage to set
     */
    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    /**
     * @return the claimCode
     */
    public String getClaimCode() {
        return claimCode;
    }

    /**
     * @param claimCode the claimCode to set
     */
    public void setClaimCode(String claimCode) {
        this.claimCode = claimCode;
    }

    /**
     * @return the code
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code the code to set
     */
    public void setCode(String code) {
        this.code = code;
    }
}
