package chn.bhmc.dms.par.cpm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 기술자문헤더 VO
 *
 * @ClassName   : SkilAndQnaHeaderVO.java
 * @Description : SkilAndQnaHeaderVO Class
 * @author In Bo Shim
 * @since 2016. 7. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim     최초 생성
 * </pre>
 */

public class SkillAndQnaResultVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4233651822794526225L;

    /**
     * 상태코드
     */
    @JsonProperty("status")
    private String status;

    /**
     * 상태코드
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
