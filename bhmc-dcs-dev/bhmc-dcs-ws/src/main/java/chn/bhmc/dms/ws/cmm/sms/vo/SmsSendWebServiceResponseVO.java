package chn.bhmc.dms.ws.cmm.sms.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleWebServiceVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 1. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 23.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SmsSendWebServiceResponseVO {

    private String smsSendResultCd;

    private String smsSendMesgId;

    private String content;

    /**
     * @return the smsSendResultCd
     */
    public String getSmsSendResultCd() {
        return smsSendResultCd;
    }

    /**
     * @param smsSendResultCd the smsSendResultCd to set
     */
    public void setSmsSendResultCd(String smsSendResultCd) {
        this.smsSendResultCd = smsSendResultCd;
    }

    /**
     * @return the smsSendMesgId
     */
    public String getSmsSendMesgId() {
        return smsSendMesgId;
    }

    /**
     * @param smsSendMesgId the smsSendMesgId to set
     */
    public void setSmsSendMesgId(String smsSendMesgId) {
        this.smsSendMesgId = smsSendMesgId;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

}
