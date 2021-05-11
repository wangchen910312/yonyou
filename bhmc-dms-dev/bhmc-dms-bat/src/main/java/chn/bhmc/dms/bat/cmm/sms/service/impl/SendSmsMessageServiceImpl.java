package chn.bhmc.dms.bat.cmm.sms.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.http.client.ClientProtocolException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.sms.service.SendSmsMessageService;
import chn.bhmc.dms.bat.cmm.sms.service.dao.SendSmsMessageDAO;
import chn.bhmc.dms.bat.cmm.sms.vo.SendSmsMessageVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
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
@Service("sendSmsMessageServiceImpl")
public class SendSmsMessageServiceImpl extends HService implements SendSmsMessageService {
    /**
     * DCS - SMS Relay 서버간 I/F 전송을 위한 DAO
     */
    @Resource(name="sendSmsMessageDAO")
    SendSmsMessageDAO sendSmsMessageDAO;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;
    /*
     * @see chn.bhmc.dms.bat.cmm.sms.service.insertSendSMSMessage#insertSendSMSMessage
     */
    @Override
    public void requestSMSMessage() throws Exception {
        String[] lblList = new String[1];
        List<SendSmsMessageVO> dlrList = new ArrayList<SendSmsMessageVO>();
        List<SendSmsMessageVO> smsList = new ArrayList<SendSmsMessageVO>();
        try{

            //SMS 예약 전송 건을 전송 대기 Flag로 변경 (중간에 취소 가능하도록 하기 위해 전송 1시간 전에 변경)
            sendSmsMessageDAO.updateSmsResvSendFlag();

            dlrList = sendSmsMessageDAO.selectRequestSMSDlrCdList();

            //딜러별 전송
            for(int i = 0; i < dlrList.size(); i++){
                if(dlrList.size() > 0){
                    smsList = sendSmsMessageDAO.selectRequestSMSMessage(dlrList.get(i));

                    this.requestCemelSMSMessage(smsList);
                }
            }
        }catch(ClientProtocolException ce){
            log.error(ce.getMessage(), ce);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
        }catch(IOException ce){
            log.error(ce.getMessage(), ce);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
        }
    }

    /**
     * SMS 인터페이스 전송(DMS -> Camel)
     * @param smsMessageIfVO
     */
    public int requestCemelSMSMessage(List<SendSmsMessageVO> smsMessageIfVOs) throws Exception {
    	SimpleDateFormat dateFormat= new SimpleDateFormat("yyyyMMddHHmm");
    	SimpleDateFormat simpleDateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String[] lblList = new String[1];
        String ifResult = "0";
        CamelClient camelClient = camelClientFactory.createCamelClient();
        Data receiveData = new Data();
        int cnt = 0;
        try{

            camelClient.setIfId("COM026"); //SMS Info Send Code
            //딜러별 전송
            for(int i = 0; i < smsMessageIfVOs.size(); i++){
                camelClient.setSender(smsMessageIfVOs.get(i).getDlrCd());// set sender dlrCd

                Map<String, Object> message = new HashMap<String, Object>();
                message.put("DLR_CD", smsMessageIfVOs.get(i).getDlrCd());
                message.put("SEQ", smsMessageIfVOs.get(i).getSeq());
                message.put("SMS_SEND_DSTIN_CD", smsMessageIfVOs.get(i).getSmsSendDstinCd());
                message.put("TEL_NO", smsMessageIfVOs.get(i).getTelNo());
                message.put("SMS_CONT", smsMessageIfVOs.get(i).getSmsCont());
                message.put("RESV_DT", smsMessageIfVOs.get(i).getResvDt());
                message.put("SMS_SEND_YN", smsMessageIfVOs.get(i).getSmsSendYn());
                message.put("APP_DSTIN_CD", smsMessageIfVOs.get(i).getAppDstinCd());
                message.put("APP_SEQ", smsMessageIfVOs.get(i).getAppSeq());
                message.put("RECEIVE_RSLT_CD", smsMessageIfVOs.get(i).getReceiveRsltCd());
                message.put("REG_USR_ID", smsMessageIfVOs.get(i).getRegUsrId());
                message.put("UPDT_USR_ID", smsMessageIfVOs.get(i).getRegUsrId());
              //20191128  判断是否有预发送时间(ResvDt),如有则作为regDt/updtDt 传入dcs,防止过期短信发送
                if(StringUtil.isEmpty(smsMessageIfVOs.get(i).getResvDt())) {
                	message.put("REG_DT", simpleDateFormat.format(smsMessageIfVOs.get(i).getRegDt()));
                	message.put("UPDT_DT", simpleDateFormat.format(smsMessageIfVOs.get(i).getUpdtDt()));
                }else {
                	message.put("REG_DT", simpleDateFormat.format(dateFormat.parse(smsMessageIfVOs.get(i).getResvDt())));
                	message.put("UPDT_DT", simpleDateFormat.format(dateFormat.parse(smsMessageIfVOs.get(i).getResvDt())));
                }
                message.put("IF_REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
                message.put("IF_REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
                message.put("BAT_ID", camelClient.getSendData().getHeader().getRootContextId());

                // message add
                camelClient.addSendMessage(message);
                cnt++;
            }
            if(cnt > 0){
                receiveData = camelClient.sendRequest();
                ifResult = receiveData.getFooter().getIfResult();
            }

            if("Z".equals(ifResult)){
                for(int j = 0; j < smsMessageIfVOs.size(); j++){
                    sendSmsMessageDAO.updateSmsMessageIFSucc(smsMessageIfVOs.get(j));
                    sendSmsMessageDAO.updateSmsMessageEaiIFSucc(smsMessageIfVOs.get(j));
                }
            }else{
                for(int j = 0; j < smsMessageIfVOs.size(); j++){
                    sendSmsMessageDAO.updateSmsMessageIFFail(smsMessageIfVOs.get(j));
                    sendSmsMessageDAO.updateSmsMessageEaiIFFail(smsMessageIfVOs.get(j));
                }
            }
        }catch(ClientProtocolException ce){
            log.error(ce.getMessage(), ce);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
        }catch(IOException ce){
            log.error(ce.getMessage(), ce);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
        }

        return cnt;
    }
}
