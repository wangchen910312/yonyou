package chn.bhmc.dms.core.support.camel;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import able.com.util.fmt.StringUtil;

import chn.bhmc.dms.core.util.ObjectUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RequestData.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.     Kang Seok Han     최초 생성
 * </pre>
 */
@XmlRootElement(name="CommDMSDoc")
@XmlAccessorType(XmlAccessType.FIELD)
public class Data {

    @XmlElement(name="Header")
    private Header header = new Header();

    @XmlElement(name="Body")
    private Body body = new Body();

    @XmlElementWrapper(name="Attachements")
    @XmlElement(name="Attachment")
    private List<Attachment> attachements = new ArrayList<Attachment>();

    @XmlElement(name="Footer")
    private Footer footer = new Footer();

    /**
     * @return the header
     */
    public Header getHeader() {
        return header;
    }
    /**
     * @param header the header to set
     */
    public void setHeader(Header header) {
        this.header = header;
    }
    /**
     * @return the body
     */
    public Body getBody() {
        return body;
    }
    /**
     * @param body the body to set
     */
    public void setBody(Body body) {
        this.body = body;
    }
    /**
     * @return the attachements
     */
    public List<Attachment> getAttachements() {
        return attachements;
    }
    /**
     * @param attachements the attachements to set
     */
    public void setAttachements(List<Attachment> attachements) {
        this.attachements = attachements;
    }
    /**
     * @return the footer
     */
    public Footer getFooter() {
        return footer;
    }
    /**
     * @param footer the footer to set
     */
    public void setFooter(Footer footer) {
        this.footer = footer;
    }

    public <T> T readMessage(Class<T> valueType) {
        if(this.getBody() == null && StringUtil.isEmpty(this.getBody().getJsonMessage())) {
            return null;
        }

        return ObjectUtil.readValue(this.getBody().getJsonMessage(), valueType);
    }

    public <T> List<T> readMessages(Class<T> valueType) {
        if(this.getBody() == null && StringUtil.isEmpty(this.getBody().getJsonMessage())) {
            return null;
        }

        return ObjectUtil.readValues(this.getBody().getJsonMessage(), valueType);
    }

//    @SuppressWarnings("unchecked")
//    public List<Map<String, Object>> getBodyMessageListMap() {
//        List<Map<String, Object>> messages = new ArrayList<Map<String, Object>>();
//
//        if(this.getBody() != null && !StringUtil.isEmpty(this.getBody().getJsonMessage())) {
//
//            JSONParser jsonParser = new JSONParser();
//
//            try {
//
//                JSONObject jsonObject = (JSONObject)jsonParser.parse(this.getBody().getJsonMessage());
//                messages = (JSONArray)jsonObject.get("results");
//
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }
//        }
//
//        return messages;
//    }



}
