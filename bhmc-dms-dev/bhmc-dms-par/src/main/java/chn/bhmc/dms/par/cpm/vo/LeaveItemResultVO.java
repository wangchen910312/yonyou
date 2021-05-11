package chn.bhmc.dms.par.cpm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 방치품 전송결과 VO.
 *
 * @ClassName   : LeaveItemResultVO.java
 * @Description : LeaveItemResultVO Class
 * @author In Bo Shim
 * @since 2016. 11. 01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 01.     In Bo Shim     최초 생성
 * </pre>
 */

public class LeaveItemResultVO {

    /**
     * 상태코드
     */
    @JsonProperty("status")
    private String status;

    /**
     * 메시지
     */
    @JsonProperty("message")
    private String message;

    /**
     * 파일URL
     */
    @JsonProperty("fileUrl")
    private String fileUrl;

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
     * @return the fileUrl
     */
    public String getFileUrl() {
        return fileUrl;
    }

    /**
     * @param fileUrl the fileUrl to set
     */
    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }



}
