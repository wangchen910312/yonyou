package chn.bhmc.dms.ws.cmm.sms.message;

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

public class SmsSendWebServiceRequest {
    private String batId;

    /**
     * @return the batId
     */
    public String getBatId() {
        return batId;
    }

    /**
     * @param batId the batId to set
     */
    public void setBatId(String batId) {
        this.batId = batId;
    }
}
