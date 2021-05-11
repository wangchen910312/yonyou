package chn.bhmc.dms.par.pmm.vo;
import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 합격증  파일 VO
 * </pre>
 *
 * @ClassName   : CertificationResultVO.java
 * @Description : CertificationResultVO Class
 * @author In Bo Shim
 * @since 2016. 11. 07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 07.     In Bo Shim     최초 생성
 * </pre>
 */

public class CertificationResultVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6360624368096325970L;

    /**
     * 상태코드
     */
    @JsonProperty("status")
    private String status;

    /**
     * 엔진합격증신청서코드
     */
    @JsonProperty("apply_code")
    private String apply_code;

    /**
     * 엔진합격증 정상 메시지
     */
    @JsonProperty("message")
    private String message;

    /**
     * 엔진합격증 에러메시지
     */
    @JsonProperty("errorMessage")
    private String errorMessage;

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
     * @return the apply_code
     */
    public String getApply_code() {
        return apply_code;
    }

    /**
     * @param apply_code the apply_code to set
     */
    public void setApply_code(String apply_code) {
        this.apply_code = apply_code;
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
}
