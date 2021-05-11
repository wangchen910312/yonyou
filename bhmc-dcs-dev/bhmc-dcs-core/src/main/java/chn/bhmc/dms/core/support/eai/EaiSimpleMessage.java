package chn.bhmc.dms.core.support.eai;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;

import chn.bhmc.dms.core.support.eai.schema.Attachment;
import chn.bhmc.dms.core.support.eai.schema.Attachments;
import chn.bhmc.dms.core.support.eai.schema.Body;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.support.eai.schema.Header;
import chn.bhmc.dms.core.support.eai.schema.ObjectFactory;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EaiSimpleMessage.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 15.     Kang Seok Han     최초 생성
 * </pre>
 */

public class EaiSimpleMessage {

    private final String ifId;
    private final String company;
    private final String sender;
    private final String receiver;
    private final String flag;
    private final List<Map<String, Object>> messages;
    private final List<Map<String, String>> attachements;

    private EaiSimpleMessage(Builder b){
        this.ifId = b.ifId;
        this.company = b.company;
        this.sender = b.sender;
        if(StringUtils.isBlank(b.receiver)){
            this.receiver = "ALL";
        }else{
            this.receiver = b.receiver;
        }

        this.messages = b.messages;
        this.flag = b.flag;
        this.attachements = b.attachements;
    }

    @SuppressWarnings("unchecked")
    public CommDMSDoc buildCommDMSDoc(){

        ObjectFactory objectFactory = new ObjectFactory();
        CommDMSDoc doc = new CommDMSDoc();
        String timeStr = DateUtil.getDate("yyyyMMddHHmmss");
        String randomStr = RandomStringUtils.randomAlphabetic(5);
        String rootContextid = String.format("%s-%s-%s", ifId,timeStr,randomStr);

        //Header 설정
        Header header = new Header();
        header.setIFID(this.ifId);
        header.setROOTCONTEXTID(objectFactory.createHeaderROOTCONTEXTID(rootContextid));
        header.setCOMPANY(this.company);
        header.setSENDER(this.sender);
        header.setRECEIVER(this.receiver);
        header.setFLAG(objectFactory.createHeaderFLAG(this.flag));
        doc.setHeader(header);

        //메세지 설정
        if(messages.size() > 0){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("results", this.messages);
            String bodyMessage = jsonObject.toJSONString();

            Body body = new Body();
            body.setMESSAGE(objectFactory.createBodyMESSAGE(bodyMessage));
            doc.setBody(objectFactory.createCommDMSDocBody(body));
        }

        //첨부파일 설정
        if(attachements.size() > 0){

            Attachments attachmentList = objectFactory.createAttachments();

            for(Map<String, String> attachment : attachements){
                Attachment obj = new Attachment();
                obj.setNAME(objectFactory.createAttachmentNAME(attachment.get("name")));
                obj.setPATH(objectFactory.createAttachmentPATH(attachment.get("path")));
                obj.setDATA(objectFactory.createAttachmentDATA(attachment.get("data")));

                attachmentList.getAttachment().add(obj);
            }

            doc.setAttachments(objectFactory.createCommDMSDocAttachments(attachmentList));
        }


        return doc;
    }

    public static class Builder {

        private String ifId;
        private String company;
        private String sender;
        private String receiver;
        private String flag;
        private List<Map<String, Object>> messages = new ArrayList<Map<String, Object>>();
        private List<Map<String, String>> attachements = new ArrayList<Map<String, String>>();

        public Builder ifId(String ifId){
            this.ifId = ifId;
            return this;
        }

        public Builder company(String company){
            this.company = company;
            return this;
        }

        public Builder sender(String sender){
            this.sender = sender;
            return this;
        }

        public Builder receiver(String receiver){
            this.receiver = receiver;
            return this;
        }

        public Builder flag(String flag){
            this.flag = flag;
            return this;
        }

        public Builder addMessage(Map<String, Object> message){
            this.messages.add(message);
            return this;
        }

        public Builder addMessage(List<Map<String, Object>> messages){
            this.messages.addAll(messages);
            return this;
        }

        public Builder addAttachment(String name, String path, String data){
            Map<String, String> attachment = new HashMap<String, String>();
            attachment.put("name", name);
            attachment.put("path", path);
            attachment.put("data", data);

            this.attachements.add(attachment);
            return this;
        }

        public EaiSimpleMessage build(){
            return new EaiSimpleMessage(this);
        }

    }
}
