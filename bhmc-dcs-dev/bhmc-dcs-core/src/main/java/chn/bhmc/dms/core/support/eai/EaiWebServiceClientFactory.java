package chn.bhmc.dms.core.support.eai;

import org.springframework.ws.client.core.WebServiceTemplate;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EaiWebServiceClientFactory.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 10.     Kang Seok Han     최초 생성
 * </pre>
 */

public class EaiWebServiceClientFactory {

    private WebServiceTemplate webServiceTemplate;

    /**
     * @param webServiceTemplate the webServiceTemplate to set
     */
    public void setWebServiceTemplate(WebServiceTemplate webServiceTemplate) {
        this.webServiceTemplate = webServiceTemplate;
    }

    public EaiWebServiceClient createEaiWebServiceClient(){

        EaiWebServiceClient eaiWebServiceClient = new EaiWebServiceClient();
        eaiWebServiceClient.setWebServiceTemplate(this.webServiceTemplate);

        return eaiWebServiceClient;
    }
}
