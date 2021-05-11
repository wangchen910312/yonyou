package chn.bhmc.dms.sample.web;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.transform.stream.StreamSource;

import able.com.web.HController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.oxm.XmlMappingException;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.sample.dao.SampleDAO;
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

    Logger log = LoggerFactory.getLogger(SampleController.class);

    @Resource(name="sampleDAO")
    SampleDAO sampleDAO;

    @Resource(name="jaxb2Marshaller")
    Jaxb2Marshaller unmarshaller;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

//    @Resource(name="dcsWebServiceClient")
//    DcsWebService dcsWebServiceClient;

//    @RequestMapping(value = "/samples/sampleWebServiceTest.do", method = RequestMethod.GET)
//    public String sampleWebServiceTest() throws Exception {
//
//        SampleWebServiceRequest sampleWebServiceRequest  = new SampleWebServiceRequest();
//        sampleWebServiceRequest.setParam1(1);
//        sampleWebServiceRequest.setParam2(2);
//
//        SampleWebServiceResponse sampleWebServiceResponse = dcsWebServiceClient.sum(sampleWebServiceRequest);
//        log.debug("sampleWebServiceResponse.getResult() : " + sampleWebServiceResponse.getResult());
//
//        SmsSendWebServiceRequest smsSendWebServiceRequest = new SmsSendWebServiceRequest();
//        smsSendWebServiceRequest.setBatId("0");
//        SmsSendWebServiceResponse smsSendWebServiceResponse  = dcsWebServiceClient.SmsSendRequest(smsSendWebServiceRequest);
//        dcsWebServiceClient.SmsSendRequest(smsSendWebServiceRequest);
//        //log.debug("smsSendWebServiceResponse.getResult() : " + smsSendWebServiceResponse.getArrSmsSendWebServiceResponse().get(0));
//
//        return null;
//    }

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

    @RequestMapping(value = "/samples/selectEaiClientTest.do", method = RequestMethod.GET)
    public String selectEaiClientTest(){

        Map<String, Object> message = new HashMap<String, Object>();
        message.put("DLR_CD", "D0101");
        message.put("LINE_NO","13");
        message.put("VIN_NO", "LBEJMBJB7DX366407");
        message.put("RETURN_STAT_CD", "S");
        message.put("ACPT_DT","");
        message.put("JUDG_DT", "");
        message.put("RETURN_APPROVE_NO", "");
        message.put("CORP_OPN_CONT", "");
        message.put("DLR_BUDN_AMT", "0");
        message.put("CORP_BUDN_AMT", "0");
        message.put("UPDT_USR_ID", "");
        message.put("UPDT_DT", "");

        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
        .ifId("SER035")
        .company("H")
        .sender("SER")
        .receiver("D0101")
        .flag("Y")
        .addMessage(message)
        .addAttachment("", "", "")
        .build()
        .buildCommDMSDoc();

        CommDMSDoc commDMSDoc = eaiClient.sendRequest(reqCommDMSDoc);

        String ifresultCd = commDMSDoc.getFooter().getValue().getIFRESULT().getValue();

        if(!ifresultCd.equals("Z")){

//            JAXBElement<String>  ifResult = commDMSDoc.getFooter().getValue().getIFRESULT();
//            JAXBElement<String>  ifResultMsg =  commDMSDoc.getFooter().getValue().getIFFAILMSG();

            log.error("commDMSDoc ifResult Value ="+ commDMSDoc.getFooter().getValue().getIFRESULT().getValue());
            log.error("commDMSDoc ifResultMsg Value="+ commDMSDoc.getFooter().getValue().getIFFAILMSG());
            log.error("commDMSDoc IFRESULT ="+ commDMSDoc.getFooter().getValue().getIFRESULT());

        }

        return null;

    }

}
