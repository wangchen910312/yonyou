package chn.bhmc.dms.core.support.camel;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    public static final Logger log = LoggerFactory.getLogger(CamelClient.class);

    public static final Logger monitorLogger = LoggerFactory.getLogger("chn.bhmc.dms.inf.log.monitor");

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

    public void setCompany(String company) {
        this.sendData.getHeader().setCompany(company);
    }

    public void setSender(String sender) {
        this.sendData.getHeader().setSender(sender);
    }

    public void setReceiver(String receiver) {
        this.sendData.getHeader().setReceiver(receiver);
    }

    public void setRootContextId(String rootContextId) {
        this.sendData.getHeader().setRootContextId(rootContextId);
    }

    public void setContextId(String contextId) {
        this.sendData.getHeader().setContextId(contextId);
    }

    public void setAddress(String address) {
        this.sendData.getHeader().setAddress(address);
    }

    public void setTotCount(int totCount) {
        this.sendData.getHeader().setTotCount(totCount);
    }

    public void setTranCount(int tranCount) {
        this.sendData.getHeader().setTranCount(tranCount);
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

    public Data sendRequest() throws ClientProtocolException, IOException, XmlMappingException {
        CloseableHttpClient httpClient = null;
        String sendData = null;
        String responseText = null;

        try{
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            String logFlag = "Start";
            String rootContextID = this.getSendData().getHeader().getRootContextId();
            String contextId = this.getSendData().getHeader().getContextId();
            String interfaceId = this.getSendData().getHeader().getIfId();
            String sender = this.getSendData().getHeader().getSender();
            String receiver = this.getSendData().getHeader().getReceiver();
            String status = "";
            String start = sdf.format(new Date());
            String end = "";
            String userData = "";
            String exception = "";

            monitorLogger.info(
                    String.format(
                        "[RootContextID=%s] [LogFlag=%s] [ContextID=%s] [InterfaceId=%s] [Sender=%s] [Receiver=%s] [Status=%s] [Start=%s] [End=%s] [UserData=%s] [Exception=%s]"
                        ,rootContextID
                        ,logFlag
                        ,contextId
                        ,interfaceId
                        ,sender
                        ,receiver
                        ,status
                        ,start
                        ,end
                        ,userData
                        ,exception
                    )
                );

            sendData = buildXML();
            sendData = sendData.replaceAll("&quot;", "\"");

            log.info("[SEND]");
            log.info(sendData);

            StringEntity requestEntity = new StringEntity(sendData, "UTF-8");

            httpClient = HttpClientBuilder
            .create()
            .setRetryHandler(new CamelClientHttpRequestRetryHandler())
            .build();

            HttpPost request = new HttpPost(this.endpointUrl);
            request.addHeader("content-type", "application/x-www-form-urlencoded");
            request.setEntity(requestEntity);

            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            responseText = EntityUtils.toString(responseEntity, "UTF-8");

            log.info("[RECEIVE]");
            log.info(responseText);

            receiveData = (Data)convertXMLToObj(responseText);

            logFlag = "End";
            end = sdf.format(new Date());
            status = receiveData.getFooter().getIfResult();
            exception = receiveData.getFooter().getIfFailMsg();
            monitorLogger.info(
                    String.format(
                        "[RootContextID=%s] [LogFlag=%s] [ContextID=%s] [InterfaceId=%s] [Sender=%s] [Receiver=%s] [Status=%s] [Start=%s] [End=%s] [UserData=%s] [Exception=%s]"
                        ,rootContextID
                        ,logFlag
                        ,contextId
                        ,interfaceId
                        ,sender
                        ,receiver
                        ,status
                        ,start
                        ,end
                        ,userData
                        ,exception
                    )
                );

            return receiveData;
        }catch(ClientProtocolException e){
            log.error("[ERROR:SEND]");
            log.error(sendData);
            log.error("[ERROR:RECEIVE]");
            log.error(responseText);
            throw e;
        }catch(IOException e){
            log.error("[ERROR:SEND]");
            log.error(sendData);
            log.error("[ERROR:RECEIVE]");
            log.error(responseText);
            throw e;
        }catch(XmlMappingException e){
            log.error("[ERROR:SEND]");
            log.error(sendData);
            log.error("[ERROR:RECEIVE]");
            log.error(responseText);
            throw e;
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

    private String convertObjToXML() throws XmlMappingException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        StreamResult result = new StreamResult(out);

        try {
            marshaller.marshal(getSendData(), result);
        } catch (XmlMappingException e) {
            e.printStackTrace();
            throw e;
        }

        return out.toString();
    }

    private Object convertXMLToObj (String xmlString) throws XmlMappingException {

        Data data = null;
        ByteArrayInputStream in = new ByteArrayInputStream(xmlString.getBytes());
        StreamSource streamSource = new StreamSource(in);

        try {
            data = (Data)unmarshaller.unmarshal(streamSource);
        } catch (XmlMappingException e) {
        	log.error("unmarshal error:\n{}", xmlString);
            e.printStackTrace();
            throw e;
        }

        return data;
    }
}
