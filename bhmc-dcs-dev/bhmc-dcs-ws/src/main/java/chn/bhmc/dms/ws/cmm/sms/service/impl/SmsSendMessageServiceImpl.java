package chn.bhmc.dms.ws.cmm.sms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ws.cmm.sms.vo.SmsSendWebServiceResponseVO;

import chn.bhmc.dms.core.context.WebContext;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.ws.cmm.sms.message.SmsSendWebServiceRequest;
import chn.bhmc.dms.ws.cmm.sms.message.SmsSendWebServiceResponse;
import chn.bhmc.dms.ws.cmm.sms.service.SmsSendMessageService;
import chn.bhmc.dms.ws.cmm.sms.service.dao.SmsSendMessageDAO;
import chn.bhmc.dms.ws.cmm.sms.vo.SmsSendMessageForWsVO;
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
 *  2016. 9. 1.     Choi KyungYong           최초 생성
 * </pre>
 */
@Service("smsSendMessageService")
public class SmsSendMessageServiceImpl extends HService implements SmsSendMessageService {

    /**
     * DCS - SMS Relay 서버간 I/F 전송을 위한 DAO
     */
    @Resource(name="smsSendMessageDAO")
    SmsSendMessageDAO smsSendMessageDAO;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /*
     * @see chn.bhmc.dms.bat.cmm.sms.service.getSMSMessageValidate#getSMSMessageValidate
     */
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> getSMSMessageValidate(SmsSendWebServiceRequest smsSendWebServiceRequest) throws Exception {

        HashMap<String, String> rtnMap = new HashMap<String, String>();
        HashMap<String, Object> pMap = new HashMap<String, Object>();
        List<HashMap<String, String>> rtnList = new ArrayList<HashMap<String,String>>();
        try{
            if(smsSendWebServiceRequest != null){
                pMap.put("batId", smsSendWebServiceRequest.getBatId());
                //sms 전송 데이터 selsect
                List<SmsSendMessageForWsVO> list = smsSendMessageDAO.selectRequestSMSMessageForWs(pMap);

                JSONObject jsonData = new JSONObject();
                String dlrCd = "";
                String seq = "";
                for(int i = 0; i < list.size(); i++){
                    jsonData = new JSONObject();
                    dlrCd = list.get(i).getDlrCd();
                    seq = list.get(i).getSeq();
                    jsonData.put("content", list.get(i).getSmsCont());
                    rtnMap.put("jsonData", jsonData.toJSONString());
                    rtnMap.put("dlrCd", dlrCd);
                    rtnMap.put("seq", seq);

                    rtnList.add(rtnMap);
                }
            }
        }catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }

        return rtnList;
    }

    /*
     * @see chn.bhmc.dms.ws.cmm.sms.service.requestSMSMessageValidate#requestSMSMessageValidate
     */
    public SmsSendWebServiceResponse requestSMSMessageValidate(List<HashMap<String, String>> pList) throws Exception{

        SmsSendWebServiceResponse smsSendWebServiceResponse = new SmsSendWebServiceResponse();
        List<SmsSendWebServiceResponseVO> arrSmsSendWebServiceResponse = new ArrayList<SmsSendWebServiceResponseVO>();
        SmsSendWebServiceResponseVO smsSendWebServiceResponseVO = new SmsSendWebServiceResponseVO();
        CloseableHttpClient httpClient = null;
        try{
            String url = WebContext.getServletContext().getInitParameter("SMS_RELAY_SERVER_VALIDATE_URL");
            HttpPost request =  new HttpPost(url);
            httpClient = HttpClientBuilder.create().build();
            HashMap<String, String> pMap = new HashMap<String, String>();
            String sendData = "";
            String seq = "";
            if(pList != null && pList.size() > 0){
                HttpResponse response = null;
                HttpEntity responseEntity = null;
                String responseText = null;
                Object obj = null;
                JSONObject jsonRecvData = null;
                String requestResultCd = null;
                String reponseContent = "";
                smsSendWebServiceResponseVO = new SmsSendWebServiceResponseVO();
                for(int i = 0; i < pList.size(); i++){
                    pMap = pList.get(i);
                    sendData = pMap.get("jsonData");
                    seq = pMap.get("seq");
                    StringEntity requestEntity = new StringEntity(sendData, "UTF-8");
                    request.addHeader("content-type", "application/x-www-form-urlencoded");
                    request.setEntity(requestEntity);

                    //SMS Relay 서버 전송(contents 검증)
                    response = httpClient.execute(request);
                    if(response != null){
                        responseEntity = response.getEntity();
                        responseText = EntityUtils.toString(responseEntity, "UTF-8");

                        if(responseText != null){
                            obj = JSONValue.parseWithException(responseText);
                            jsonRecvData = (JSONObject)obj;
                            requestResultCd = jsonRecvData.get("result").toString();
                            if("10".equals(requestResultCd)){
                                reponseContent = jsonRecvData.get("content").toString();
                            }else{
                                reponseContent = "";
                            }

                            smsSendWebServiceResponseVO.setSmsSendResultCd(requestResultCd);
                            smsSendWebServiceResponseVO.setSmsSendMesgId(seq);
                            smsSendWebServiceResponseVO.setContent(reponseContent);
                            arrSmsSendWebServiceResponse.add(smsSendWebServiceResponseVO);
                        }
                    }
                }
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        }finally{
            httpClient.close();
        }

        smsSendWebServiceResponse.setArrSmsSendWebServiceResponse(arrSmsSendWebServiceResponse);

        return smsSendWebServiceResponse;
    }

}
