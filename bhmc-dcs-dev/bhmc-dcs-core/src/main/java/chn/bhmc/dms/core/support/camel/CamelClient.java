package chn.bhmc.dms.core.support.camel;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.Marshaller;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.oxm.XmlMappingException;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CamelClient.java
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

public class CamelClient {

    Logger log = LoggerFactory.getLogger(CamelClient.class);

    Data sendData = new Data();
    Data receiveData = new Data();

    String endpointUrl;

    Jaxb2Marshaller marshaller;

    Jaxb2Marshaller unmarshaller;
/*
    public static class CustomCharacterEscapeHandler implements CharacterEscapeHandler {

        @Override
        public void escape(char[] buf, int start, int length, boolean isAttVal, Writer out) throws IOException {
            if (buf != null){
                StringBuilder sb = new StringBuilder();
                for (int i = start; i < start + length; i++) {
                    char ch = buf[i];

                    //by adding these, it prevent the problem happened when unmarshalling
                    if (ch == '&') {
                        sb.append("&amp;");
                        continue;
                    }

                    if (ch == '"' && isAttVal) {
                        sb.append("&quot;");
                        continue;
                    }

                    if (ch == '\'' && isAttVal) {
                        sb.append("&apos;");
                        continue;
                    }


                    // otherwise print normally
                    sb.append(ch);
                }

                //Make corrections of unintended changes
                String st = sb.toString();

                st = st.replace("&amp;quot;", "&quot;")
                       .replace("&amp;lt;", "&lt;")
                       .replace("&amp;gt;", "&gt;")
                       .replace("&amp;apos;", "&apos;")
                       .replace("&amp;amp;", "&amp;");


                out.write(st);
            }
        }

    }
*/

    /**
     * @param marshaller the marshaller to set
     */
    public void setMarshaller(Jaxb2Marshaller marshaller) {
        Map<String, Object> properties = new HashMap<String, Object>();
        properties.put(Marshaller.JAXB_ENCODING, "UTF-8");
        properties.put(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
//        properties.put(CharacterEscapeHandler.class.getName(), new CustomCharacterEscapeHandler());

        marshaller.setMarshallerProperties(properties);

        this.marshaller = marshaller;
    }

    /**
     * @param unmarshaller the unmarshaller to set
     */
    public void setUnmarshaller(Jaxb2Marshaller unmarshaller) {
        this.unmarshaller = unmarshaller;
    }

    public Data getSendData(){
        return this.sendData;
    }

    public void setIfId(String ifId) {
        this.sendData.getHeader().setIfId(ifId);
    }

    public void setSender(String sender) {
        this.sendData.getHeader().setSender(sender);
    }

    public void addSendMessages(List<Map<String, Object>> messages) {
        this.sendData.getBody().getMessage().getResults().addAll(messages);
    }

    public void addSendMessage(Map<String, Object> message){
        this.sendData.getBody().getMessage().getResults().add(message);
    }

    public void addSendAttachments(List<Attachment> attachments) {
        this.sendData.getAttachements().addAll(attachments);
    }

    public void addSendAttachment(Attachment attachment) {
        this.sendData.getAttachements().add(attachment);
    }

    public void addSendAttachment(String name, String path) {
       addSendAttachment(name, path, null);
    }

    public void addSendAttachment(String name, String path, String data) {
        Attachment attachment = new Attachment();
        attachment.setName(name);
        attachment.setPath(path);
        attachment.setData(data);

        this.sendData.getAttachements().add(attachment);
    }

    /**
     * @param endpointUrl the endpointUrl to set
     */
    public void setEndpointUrl(String endpointUrl) {
        this.endpointUrl = endpointUrl;
    }

    public Data sendRequest() throws ClientProtocolException, IOException {
        CloseableHttpClient httpClient = null;
        try{
            httpClient = HttpClientBuilder.create().build();
            HttpPost request = new HttpPost(this.endpointUrl);

            String sendData = buildXML();
            sendData = sendData.replaceAll("&quot;", "\"");

            log.debug("==SEND DATA==");
            log.debug(sendData);

            StringEntity requestEntity = new StringEntity(sendData, "UTF-8");
            request.addHeader("content-type", "application/x-www-form-urlencoded");
            request.setEntity(requestEntity);

            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");

            log.debug("==RECEIVE DATA==");
            log.debug(responseText);

            receiveData = (Data)convertXMLToObj(responseText);

            return receiveData;
        }finally{
            if(httpClient != null){
                try{
                    httpClient.close();
                }catch(IOException e){}
            }
        }
    }

    private String buildXML() {
        buildMessage();
        return convertObjToXML();
    }

    private void buildMessage() {
        List<Map<String, Object>> messages = getSendData().getBody().getMessage().getResults();

        if(messages.size() > 0){
            getSendData().getBody().setJsonMessage(JSONArray.toJSONString(messages));
        }
    }

    private String convertObjToXML() {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        StreamResult result = new StreamResult(out);

        try {
            marshaller.marshal(getSendData(), result);
            log.debug(out.toString());
        } catch (XmlMappingException e) {
            e.printStackTrace();
        }

        return out.toString();
    }

    private Object convertXMLToObj(String xmlString) {

        Data data = null;
        ByteArrayInputStream in = new ByteArrayInputStream(xmlString.getBytes());
        StreamSource streamSource = new StreamSource(in);

        try {
            data = (Data)unmarshaller.unmarshal(streamSource);
            log.debug("convertXMLToObj=\n"+data.getBody().getJsonMessage());
        } catch (XmlMappingException e) {
            e.printStackTrace();
        }

        return data;
    }
}
