package chn.bhmc.dms.sample.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.servlet.http.HttpServletRequest;
import javax.xml.transform.stream.StreamSource;

import able.com.web.HController;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.oxm.XmlMappingException;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sample.tx.service.SampleService;
import chn.bhmc.dms.sample.tx.service.dao.SampleDAO;
import chn.bhmc.dms.ws.DcsWebService;
import chn.bhmc.dms.ws.DmsWebService;
import chn.bhmc.dms.ws.VehicleEnterNotificationRequest;
import chn.bhmc.dms.ws.VehicleEnterNotificationResponse;
import chn.bhmc.dms.ws.sal.bdw.ObjectFactory;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsDoc;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsHeader;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsParam;
import chn.bhmc.dms.ws.sal.bdw.SalBasicDataWsParams;
import egovframework.rte.fdl.cmmn.exception.FdlException;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 4.     Kang Seok Han     최초 생성
 * </pre>
 */
@Controller
public class SampleController extends HController {

	private final static Logger logger = LoggerFactory.getLogger(SampleController.class);

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Resource(name="sampleDAO")
    SampleDAO sampleDAO;

    @Resource(name="jaxb2Marshaller")
    Jaxb2Marshaller unmarshaller;

//    @Resource(name="vehicleEnterNotificationWebServiceTemplate")
//    WebServiceTemplate vehicleEnterNotificationWebServiceTemplate;

    @Resource(name="fileDocNoIdgenService")
    TableIdGenService fileDocNoIdgenService;

    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    @Resource(name="dcsWebServiceClient")
    DcsWebService dcsWebServiceClient;

    @Resource(name="dmsWebServiceClient")
    DmsWebService dmsWebServiceClient;

//    @Resource(name="notificationWebJmsTemplate")
//    JmsTemplate notificationWebJmsTemplate;

//    @Resource(name="notificationMobileJmsTemplate")
//    JmsTemplate notificationMobileJmsTemplate;

    @Resource(name="notificationJmsTemplate")
    JmsTemplate notificationJmsTemplate;

    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    @Resource(name="sampleService")
    SampleService sampleService;

    @Resource(name="userService")
    UserService userService;

    @RequestMapping(value = "/samples/sampleSalBasicDataRequest.do", method = RequestMethod.GET)
    public String sampleWebServiceTest() throws Exception {

        SalBasicDataWsDoc salBasicDataWsDocRequest = new SalBasicDataWsDoc();
        SalBasicDataWsHeader salBasicDataWsHeader = new SalBasicDataWsHeader();
        salBasicDataWsHeader.setId("TEST001");

        ObjectFactory objectFactory = new ObjectFactory();
        salBasicDataWsDocRequest.setHeader(salBasicDataWsHeader);

        SalBasicDataWsParams salBasicDataWsParams = new SalBasicDataWsParams();
        List<SalBasicDataWsParam> params = salBasicDataWsParams.getParam();
        SalBasicDataWsParam param = new SalBasicDataWsParam();
        param.setName("param1");
        param.setValue("value1");
        params.add(param);

        salBasicDataWsHeader.setParams(objectFactory.createSalBasicDataWsHeaderParams(salBasicDataWsParams));

        SalBasicDataWsDoc salBasicDataWsDocResponse = dcsWebServiceClient.salBasicDataRequest(salBasicDataWsDocRequest);
        log.info("salBasicDataWsDocResponse:" + salBasicDataWsDocResponse.getBody().getValue());

        return null;
    }

    @RequestMapping(value = "/samples/selectResumableFileUploadMain.do", method = RequestMethod.GET)
    public String selectResumableFileUploadMain(){
        return "/samples/resumableFileUpload";
    }

    @RequestMapping(value = "/samples/selectResumableFileUploadMain2.do", method = RequestMethod.GET)
    public String selectResumableFileUploadMain2(){
        return "/samples/resumableFileUpload2";
    }

    @RequestMapping(value = "/samples/selectCopyExcelToGrid.do", method = RequestMethod.GET)
    public String selectCopyExcelToGrid(){
        return "/samples/selectCopyExcelToGrid";
    }

    @RequestMapping(value = "/samples/selectInterfaceClient.do", method = RequestMethod.GET)
    public String selectInterfaceClient() throws ClientProtocolException, IOException{

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("PTS002");

        Map<String, Object> message = new HashMap<String, Object>();
        message.put("IVR_PNO", "4333123116");
        message.put("TEST", "test1");

//        camelClient.addSendMessage(message);
//        camelClient.addSendAttachment("jfjjfj", request.getServletContext().getInitParameter("FILE_UPLOAD_PATH") + "/xxxx/xxx.xxx");


        @SuppressWarnings("unused")
        Data receiveData = camelClient.sendRequest();

        return null;
    }

    @RequestMapping(value = "/samples/selectInterfaceUnmarshaller.do", method = RequestMethod.GET)
    public String selectInterfaceUnmarshaller(){
        Data data = null;
        String xmlString = "<?xml version='1.0' encoding='UTF-8'?>"
                           +"<CommDMSDoc>"
                           +"<Header>"
                           +"    <IF_ID>PTS001</IF_ID>"
                           +"    <COMPANY>H</COMPANY>"
                           +"    <SENDER>AMOS</SENDER>"
                           +"    <RECEIVER>A07AA</RECEIVER>"
                           +"    <ROOTCONTEXT_ID></ROOTCONTEXT_ID>"
                           +"    <CONTEXT_ID></CONTEXT_ID>"
                           +"    <MAINPROCESS_ID></MAINPROCESS_ID>"
                           +"    <SUBPROCESS_ID></SUBPROCESS_ID>"
                           +"    <ADDRESS>10.125.211.115</ADDRESS>"
                           +"    <TOTCOUNT></TOTCOUNT>"
                           +"    <TRANCOUNT></TRANCOUNT>"
                           +"    <FLAG></FLAG>"
                           +"</Header>"
                           +"<Body>"
                           +"    <MESSAGE></MESSAGE>"
                           +"</Body>"
                           +"<Footer>"
                           +"    <IFRESULT>E</IFRESULT>"
                           +"    <IFFAILMSG>xxxx</IFFAILMSG>"
                           +"</Footer>"
                           +"</CommDMSDoc>";

        ByteArrayInputStream in = new ByteArrayInputStream(xmlString.getBytes());
        StreamSource streamSource = new StreamSource(in);

        try {
            data = (Data)unmarshaller.unmarshal(streamSource);

            log.debug(data.getBody().getJsonMessage());


        } catch (XmlMappingException e) {
            e.printStackTrace();
        }

        return null;
    }

    @RequestMapping(value = "/samples/selectPortlet1.do", method = RequestMethod.GET)
    public String selectPortlet1(){
        return "/samples/selectPortlet1";
    }

    @RequestMapping(value = "/samples/selectPortlet2.do", method = RequestMethod.GET)
    public String selectPortlet2(){
        return "/samples/selectPortlet2";
    }

    @RequestMapping(value = "/samples/selectPortlet3.do", method = RequestMethod.GET)
    public String selectPortlet3(){
        return "/samples/selectPortlet3";
    }

    @RequestMapping(value = "/samples/selectPortlet4.do", method = RequestMethod.GET)
    public String selectPortlet4(){
        return "/samples/selectPortlet4";
    }

    @RequestMapping(value = "/samples/selectPortlet5.do", method = RequestMethod.GET)
    public String selectPortlet5(){
        return "/samples/selectPortlet5";
    }

    @RequestMapping(value = "/samples/selectPortlet6.do", method = RequestMethod.GET)
    public String selectPortlet6(){
        return "/samples/selectPortlet6";
    }


    @RequestMapping(value = "/samples/selectPortletTodo.do", method = RequestMethod.GET)
    public String selectPortletTodo(){
        return "/samples/selectPortletTodo";
    }

    @RequestMapping(value = "/samples/selectPortletChart.do", method = RequestMethod.GET)
    public String selectPortletChart(){
        return "/samples/selectPortletChart";
    }

    @RequestMapping(value = "/samples/selectProcedureTest.do", method = RequestMethod.GET)
    public String selectProcedureTest(Model model){

        Map<String, String> params = new HashMap<String, String>();
        params.put("testInput","INPUT");
        params.put("testOutput", "");

        sampleDAO.selectProcedureTest(params);

        model.addAttribute("testInput", params.get("testInput"));
        model.addAttribute("testOutput", params.get("testOutput"));

        return "/samples/selectProcedureTest";
    }

    @SuppressWarnings("unused")
    @RequestMapping(value = "/samples/selectJsonBindingTest.do", method = RequestMethod.GET)
    public String selectJsonBindingTest() {

        List<JsonBindingTest> jsonBindingTest = ObjectUtil.readValues("{\"IsSuccess\":true,\"Message\":\"SUCCESS\",\"Errors\":null,\"Data\":{\"UserName\":\"15510704592\",\"RealName\":\"木木基\",\"PhoneNumber\":\"15510704592\",\"IdentityNumber\":\"513228197805071415\",\"Gender\":\"\",\"Birthday\":\"\",\"Email\":\"564678981@qq.com\",\"Address\":\"\",\"BlueMembership_Id\":\"0000407B-0E6F-4325-B8CB-4FFBE12635D4\",\"BlueMembership_No\":\"16061006826\",\"MLevel\":\"10\"}}", JsonBindingTest.class);

        return null;

        //MessageHolder<T> messageParser = (MessageHolder<T>)Obje
        //ObjectUtil.readValue(this.getBody().getJsonMessage(), valueType);
    }

    @RequestMapping(value = "/samples/selectVehicleEnterNotificationWebServiceTest.do", method = RequestMethod.GET)
    public String selectVehicleEnterNotificationWebServiceTest() throws Exception{

        VehicleEnterNotificationRequest req = new VehicleEnterNotificationRequest();
        req.setVehicleNo("69마2440");
        req.setDlrCd("D0119");

        VehicleEnterNotificationResponse res = dmsWebServiceClient.vehicleEnterNotification(req);

        logger.info("result : {}", res.getResult());
        logger.info("message : {}", res.getMessage());

        return null;
    }

    @RequestMapping(value = "/samples/selectVelocityTest.do", method = RequestMethod.GET)
    public String selectVelocityTest(){
        String strTemplate = "$name님 환영합니다.";

        VelocityContext context = new VelocityContext();
        context.put("name", "한강석");

        StringWriter swOut = new StringWriter();
        Velocity.evaluate(context, swOut, "VM-001", strTemplate);

        return null;
    }

    @RequestMapping(value = "/samples/selectDlrCdTest.do", method = RequestMethod.GET)
    public String selectDlrCdTest(){
        return null;
    }

    @RequestMapping(value = "/samples/selectFileDocNo.do", method = RequestMethod.GET)
    public String selectFileDocNo() throws FdlException{
        return null;
    }

    /**
     * 알림메세지 발송 테스트
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/samples/selectNotificationMessageTest.do", method = RequestMethod.GET)
    public String selectNotificationMessageTest() throws Exception {
        /*
        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "P-0001";
        String dlrCd = "D0103";
        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("mesgTp", "test messages!!");


        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context);
        */

        //Test_001
        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "COM-0001";
        String dlrCd = "D0103";
        NotificationMessageContext context = new NotificationMessageContext();

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context);

        return null;
    }

    @RequestMapping(value = "/samples/selectJmsTemplateTest.do", method = RequestMethod.GET)
    public String selectJmsTemplateTest(@RequestParam(value="tp", defaultValue="W") String tp, @RequestParam(value="user", defaultValue="admin2") String user) throws Exception {

        MessageCreator messageCreator = new  MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                TextMessage message = session.createTextMessage("hellow");
                message.setStringProperty("viewId", "view-0001");
                message.setStringProperty("viewNm", "화면명");
                message.setStringProperty("viewUrlNm", "/cmm/tmp/messageTemplate/selectMessageTemplateMain.do");
                return message;
            }
        };

        notificationJmsTemplate.send("dms.nms."+tp+"."+user, messageCreator);

        return null;
    }


    @RequestMapping(value = "/samples/selectLoadingTest.do", method = RequestMethod.GET)
    public String selectLoadingTest() throws Exception {
        return "/samples/selectLoadingTest";
    }

    @RequestMapping(value = "/samples/selectRoleTest.do", method = RequestMethod.GET)
    public String selectRoleTest() throws Exception {
        boolean hasRole = LoginUtil.hasRole("ROLE_CRM_R_02");
        logger.debug("hasRole ROLE_CRM_R_02 : " + hasRole);

        return null;
    }

    /**
     * TO-DO 등록 테스트
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/samples/insertTodoInfo.do", method = RequestMethod.GET)
    public String insertTodoInfo() throws Exception {

        TodoInfoVO todoInfoVO = new TodoInfoVO();
        todoInfoVO.setTodoPolicyId("TD-P-00001");
        todoInfoVO.setTodoDesc("TODO 테스트2");
        todoInfoVO.setActionParams("param1=value1&param2=value2");
        todoInfoVO.setRegUsrId("system");

        todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO("admin2"));

        todoInfoService.insertTodoInfo(todoInfoVO);

        return null;
    }

    /**
     * 로그인 정보 테스트
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/samples/testLoginUtil.do", method = RequestMethod.GET)
    public String testLoginUtil() throws Exception {

        LoginUtil.getSdptCd();

        return null;
    }

    @RequestMapping(value = "/samples/testHttpClientCookie.do", method = RequestMethod.GET)
    public String testHttpClientCookie(HttpServletRequest request) throws ClientProtocolException, IOException {

        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        CookieStore cookieStore = new BasicCookieStore();

        BasicClientCookie cookie = new BasicClientCookie("JSESSIONID", request.getSession().getId());
        cookie.setDomain("localhost");
        cookie.setAttribute(ClientCookie.DOMAIN_ATTR, "true");
        cookie.setPath("/");
        cookieStore.addCookie(cookie);

        HttpContext httpContext = new BasicHttpContext();
        httpContext.setAttribute(HttpClientContext.COOKIE_STORE, cookieStore);

        HttpGet httpGet = new HttpGet("http://localhost:8080/bhmc-dms-web/cmm/sci/fileUpload/selectFileDownload.do?fileDocNo=FDA07AA20160830-000011&fileNo=1");

        HttpResponse response1 = httpClient.execute(httpGet, httpContext);

        HttpEntity entity = response1.getEntity();

        if (entity != null) {

            BufferedInputStream bis = null;
            BufferedOutputStream bos = null;

            try {
                String filePath = "sdcard/aaaa.jpg";
                bis = new BufferedInputStream(entity.getContent());
                bos = new BufferedOutputStream(new FileOutputStream(new File(filePath)));

                int inByte;
                while ((inByte = bis.read()) != -1) {
                    bos.write(inByte);
                }

            } catch (IOException ex) {
                throw ex;
            } catch (RuntimeException ex) {
                throw ex;
            } finally {
                try{
                    bis.close();
                }catch(Exception e){}

                try{
                    bos.close();
                }catch(Exception e){}

                try{
                    httpClient.close();
                }catch(Exception e){}
            }
        }

        return null;
    }

    @RequestMapping(value = "/samples/tabstrip.do", method = RequestMethod.GET)
    public String tabstrip(HttpServletRequest request) throws ClientProtocolException, IOException {
    	return "/tabstrip";
    }

    /*@RequestMapping(value = "/samples/selectUsersByRoleIdAndViewId.do", method = RequestMethod.GET)
    public String selectUsersByRoleIdAndViewId() throws Exception {
    	List<UserVO> list = userService.selectUsersByRoleIdAndViewId("D", "D0103", "ROLE_INSPECTOR", "VIEW-D-11910", "READ", "N");

    	for(UserVO user : list){
    	    logger.debug(user.getUsrId() + ":" + user.getUsrNm());
    	}

    	return null;
    }*/

//    @MessageMapping("/notificationMessageHandler")
//    public Map<String, String> notificationMessageHandlerTest(){
//        Map<String, String> result = new HashMap<String, String>();
//        result.put("test", "test-value");
//
//        return result;
//    }



/*
    @RequestMapping(value = "/samples/selectNotificationMessageSendTest.do", method = RequestMethod.GET)
    public String selectNotificationMessageSendTest() throws Exception {

//        Hashtable<String, String> env = new Hashtable<String, String>();
//        env.put(Context.INITIAL_CONTEXT_FACTORY, "jeus.jndi.JEUSContextFactory");
//        env.put(Context.URL_PKG_PREFIXES, "jeus.jndi.jns.url");
//        env.put(Context.PROVIDER_URL, "10.125.211.115:9741");
//        Context context = new InitialContext(env);
//
//
//        QueueConnectionFactory queueConnectionFactory = (QueueConnectionFactory)context.lookup("jms/QueueConnectionFactory");
//        QueueConnection queueConnection = queueConnectionFactory.createQueueConnection();
//        QueueSession queueSession = queueConnection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
//        Queue queue = queueSession.createQueue("DynamicQueue?export-name=jms/DynamicQueue&multiple-receiver=true");

        JeusConnectionFactoryCreator connectionFactoryCreator = new JeusConnectionFactoryCreator();
        connectionFactoryCreator.setFactoryName("QueueConnectionFactory");
        connectionFactoryCreator.addBrokerAddress("10.125.211.115", 9741, "default");
        QueueConnectionFactory queueConnectionFactory = (QueueConnectionFactory)connectionFactoryCreator.createConnectionFactory();

        QueueConnection queueConnection = queueConnectionFactory.createQueueConnection();
        QueueSession queueSession = queueConnection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
        Queue queue = queueSession.createQueue("DynamicQueue?export-name=DynamicQueue&multiple-receiver=true");

        MessageProducer producer = queueSession.createProducer(queue);
        MessageConsumer consumer = queueSession.createConsumer(queue);
//        consumer.setMessageListener(new MessageListener(){
//            public void onMessage(Message message){
//                if(message instanceof TextMessage){
//                    TextMessage textMessage = (TextMessage)message;
//                    try {
//                        logger.error("onMessage : " + textMessage.getText());
//                    } catch (JMSException e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//        });
        queueConnection.start();

        TextMessage message1 = queueSession.createTextMessage("Hello");
        message1.setIntProperty("JMS_JEUS_RedeliveryLimit", 3);
        producer.send(message1);
        TextMessage textMessage1 = (TextMessage)consumer.receive();

        TextMessage message2 = queueSession.createTextMessage("World");
        message1.setIntProperty("JMS_JEUS_RedeliveryLimit", 3);
        producer.send(message2);
        TextMessage textMessage2 = (TextMessage)consumer.receive();

        queueConnection.close();

        return null;
    }
*/
}
