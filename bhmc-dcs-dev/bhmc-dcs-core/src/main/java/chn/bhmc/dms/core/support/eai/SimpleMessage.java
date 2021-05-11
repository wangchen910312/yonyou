package chn.bhmc.dms.core.support.eai;

import java.util.List;
import java.util.Map;

import javax.xml.bind.JAXBElement;

import org.json.simple.JSONObject;

import chn.bhmc.dms.core.support.eai.schema.Attachment;
import chn.bhmc.dms.core.support.eai.schema.Body;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.support.eai.schema.Footer;
import chn.bhmc.dms.core.support.eai.schema.Header;
import chn.bhmc.dms.core.support.eai.schema.ObjectFactory;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SimpleMessage.java
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

public class SimpleMessage {

    private CommDMSDoc message;

    public SimpleMessage(){
        ObjectFactory objectFactory = new ObjectFactory();
        CommDMSDoc commDMSDoc = objectFactory.createCommDMSDoc();
        commDMSDoc.setHeader(objectFactory.createHeader());
        commDMSDoc.setBody(objectFactory.createCommDMSDocBody(objectFactory.createBody()));
        commDMSDoc.setFooter(objectFactory.createCommDMSDocFooter(objectFactory.createFooter()));

        this.message = commDMSDoc;
    }

    public void setIfId(String ifId){
        getMessage().getHeader().setIFID(ifId);
    }

    public void setHeader(String ifId, String company, String sender, String receiver) {
        Header header = getMessage().getHeader();
        header.setIFID(ifId);
        header.setCOMPANY(company);
        header.setSENDER(sender);
        header.setRECEIVER(receiver);
    }

    public Header getHeader(){
        return getMessage().getHeader();
    }

    public Body getBody(){
        return getMessage().getBody().getValue();
    }

    public Footer getFooter(){
        return getMessage().getFooter().getValue();
    }

    public List<Attachment> getAttachments(){
        return getMessage().getAttachments().getValue().getAttachment();
    }

    @SuppressWarnings("unchecked")
    public void addMessages(List<Map<String, Object>> messages) {

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("results", messages);

        ObjectFactory objectFactory = new ObjectFactory();
        JAXBElement<String> bodyMessage = objectFactory.createBodyMESSAGE(jsonObject.toJSONString());

        this.message.getBody().getValue().setMESSAGE(bodyMessage);
    }

    @SuppressWarnings("unchecked")
    public void addMessage(Map<String, Object> message){

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("results", message);

        ObjectFactory objectFactory = new ObjectFactory();
        JAXBElement<String> bodyMessage = objectFactory.createBodyMESSAGE(jsonObject.toJSONString());

        this.message.getBody().getValue().setMESSAGE(bodyMessage);
    }

    public void addAttachments(List<Attachment> attachments) {
        getAttachments().addAll(attachments);
    }

    public void addAttachment(Attachment attachment) {
        getAttachments().add(attachment);
    }

    public void addAttachment(String name, String path) {
       addAttachment(name, path, null);
    }

    public void addAttachment(String name, String path, String data) {

        ObjectFactory objectFactory = new ObjectFactory();
        Attachment attachment = objectFactory.createAttachment();

        attachment.setNAME(objectFactory.createAttachmentNAME(name));
        attachment.setPATH(objectFactory.createAttachmentPATH(path));
        attachment.setDATA(objectFactory.createAttachmentDATA(data));

        getAttachments().add(attachment);
    }

    /**
     * @return the message
     */
    public CommDMSDoc getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(CommDMSDoc message) {
        this.message = message;
    }


}
