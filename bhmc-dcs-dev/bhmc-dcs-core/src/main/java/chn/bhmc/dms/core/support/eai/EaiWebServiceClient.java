package chn.bhmc.dms.core.support.eai;

import org.springframework.ws.client.core.WebServiceTemplate;

import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EaiWebServiceClient.java
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

public class EaiWebServiceClient {

    private WebServiceTemplate webServiceTemplate;

    private SimpleMessage sendMessage = new SimpleMessage();
    private SimpleMessage receiveMessage = new SimpleMessage();

    /**
     * @param webServiceTemplate the webServiceTemplate to set
     */
    public void setWebServiceTemplate(WebServiceTemplate webServiceTemplate) {
        this.webServiceTemplate = webServiceTemplate;
    }

    public SimpleMessage sendRequest(){

        CommDMSDoc commDMSDoc = (CommDMSDoc)webServiceTemplate.marshalSendAndReceive(sendMessage.getMessage());
        SimpleMessage simpleMessage = new SimpleMessage();
        simpleMessage.setMessage(commDMSDoc);

        return simpleMessage;
    }

    /**
     * @return the sendMessage
     */
    public SimpleMessage getSendMessage() {
        return sendMessage;
    }

    /**
     * @return the receiveMessage
     */
    public SimpleMessage getReceiveMessage() {
        return receiveMessage;
    }




}
