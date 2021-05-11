package chn.bhmc.dms.bat.cmm.sms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.sms.service.SendSmsMessageService;
import chn.bhmc.dms.bat.cmm.sms.service.dao.SendSmsMessageDAO;
import chn.bhmc.dms.bat.cmm.sms.vo.SendSmsMessageVO;
import chn.bhmc.dms.bat.cmm.sms.vo.SmsMessageResultVO;
import chn.bhmc.dms.core.context.WebContext;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsMessageServiceImpl
 * @Description : DCS - SMS Relay 서버간 I/F 전송을 위한  ServiceImpl
 * @author Choi KyungYong
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2016. 9. 1.     Choi KyungYong            ���� ��
 * </pre>
 */
@Service("sendSmsMessageService")
public class SendSmsMessageServiceImpl extends HService implements SendSmsMessageService {

    /**
     * DCS - SMS Relay 서버간 I/F 전송을 위한 DAO
     */
    @Resource(name="sendSmsMessageDAO")
    SendSmsMessageDAO sendSmsMessageDAO;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /*
     * @see chn.bhmc.dms.bat.cmm.sms.service.insertSendSMSMessage#insertSendSMSMessage
     */
    @SuppressWarnings("unchecked")
    public HashMap<String, String> getSMSMessage() throws Exception {

        HashMap<String, String> rtnMap = new HashMap<String, String>();

        try{
            //sms 전송 데이터 selsect
            List<SendSmsMessageVO> list = new ArrayList<SendSmsMessageVO>();
            list = sendSmsMessageDAO.selectRequestSMSMessage();

            JSONObject jsonData = new JSONObject();
            JSONObject sendJsonData = new JSONObject();
            JSONArray jsonArrayData = new JSONArray();
            String uuid = "";
            String msgId = "";
            String dlrCd = "";
            for(int i = 0; i < list.size(); i++){

                uuid = UUID.randomUUID().toString();
                msgId = uuid.replaceAll("-", "");
                jsonData = new JSONObject();
                jsonData.put("phones", list.get(i).getTelNo());
                jsonData.put("content", list.get(i).getSmsCont());
                jsonData.put("msgid", msgId);
                jsonData.put("dealerid", list.get(i).getDlrCd());
                if(list.get(i).getResvDt() == null){
                    jsonData.put("sendtime", "");
                }else{
                    jsonData.put("sendtime", list.get(i).getResvDt());
                }
                jsonArrayData.add(jsonData);

                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("sendMesgId" , msgId);
                map.put("seq" , list.get(i).getSeq());
                map.put("dlrCd" , list.get(i).getDlrCd());

                sendSmsMessageDAO.updateSmsSeq(map);
                sendSmsMessageDAO.updateSmsSeqIR(map);

                //제외 문자 replace
                sendJsonData.put("data", jsonArrayData);
                dlrCd = list.get(i).getDlrCd();

                rtnMap.put("jsonData", sendJsonData.toJSONString());
                rtnMap.put("dlrCd", dlrCd);
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }

        return rtnMap;
    }

    /*
     * @see chn.bhmc.dms.bat.cmm.sms.service.insertSendSMSMessage#insertSendSMSMessage
     */
    public void requestSMSMessage(HashMap<String, String> pMap) throws Exception{
        String sendData = pMap.get("jsonData");
        String dlrCd = pMap.get("dlrCd");

        log.debug("==SEND DATA==");
        log.debug(sendData);

        String url = WebContext.getServletContext().getInitParameter("SMS_RELAY_SERVER_URL");
        HttpPost request =  new HttpPost(url);
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        try{

            StringEntity requestEntity = new StringEntity(sendData, "UTF-8");
            request.addHeader("content-type", "application/x-www-form-urlencoded");
            request.setEntity(requestEntity);


            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");

            log.debug("==RECEIVE DATA==");
            log.debug(responseText);

            Object obj = JSONValue.parseWithException(responseText);
            JSONObject jsonRecvData = (JSONObject)obj;
            String requestResultCd = jsonRecvData.get("result").toString();
            String requestDescCd = jsonRecvData.get("desc").toString();
            String reponseMsgId = "";
            String responseStatusCd = "";
            String responseDescCd = "";

            JSONArray array = (JSONArray) jsonRecvData.get("data");
            JSONObject jobj = null;
            SmsMessageResultVO smsMessageResultVO = new SmsMessageResultVO();

            if(array != null){
                int iSize = array.size();

                for(int j = 0; j < iSize; j++){
                    jobj = (JSONObject) array.get(j);
                    //sms response 저장
                    reponseMsgId = jobj.get("msgid").toString();
                    responseStatusCd = jobj.get("status").toString();
                    responseDescCd = jobj.get("desc").toString();
                    smsMessageResultVO = new SmsMessageResultVO();

                    smsMessageResultVO.setSendMesgId(reponseMsgId);
                    smsMessageResultVO.setSendRsltCd(requestResultCd);
                    smsMessageResultVO.setSendRsltDetlCont(requestDescCd);
                    smsMessageResultVO.setReceiveRsltCd(responseStatusCd);
                    smsMessageResultVO.setReceiveRsltDetlCont(responseDescCd);
                    smsMessageResultVO.setRegUsrId("Batch");
                    smsMessageResultVO.setUpdtUsrId("Batch");

                    sendSmsMessageDAO.insertSendSMSMessage(smsMessageResultVO);

                    sendSmsMessageDAO.updateSmsResponse(smsMessageResultVO);

                    sendSmsMessageDAO.updateSmsResponseIR(smsMessageResultVO);
                }

                SmsMessageResultVO smsMessageResultVO2 = new SmsMessageResultVO();
                smsMessageResultVO2.setDlrCd(dlrCd);
                sendSmsMessageDAO.insertSmsResponseIS(smsMessageResultVO2);

                CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder().ifId("COM027")
                                                                         .company("H")
                                                                         .sender("DCS")
                                                                         .build()
                                                                         .buildCommDMSDoc();

                eaiClient.sendRequest(reqCommDMSDoc);
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }finally{
            httpClient.close();
        }
    }

}
