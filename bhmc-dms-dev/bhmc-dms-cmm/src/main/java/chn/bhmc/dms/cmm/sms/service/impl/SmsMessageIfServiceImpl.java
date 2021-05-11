package chn.bhmc.dms.cmm.sms.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sms.service.SmsMessageIfService;
import chn.bhmc.dms.cmm.sms.service.dao.SmsMessageIfDAO;
import chn.bhmc.dms.cmm.sms.vo.SmsMessageIfVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsMessageIfServiceImpl.java
 * @Description : DMS에서 DCS로 SMS 전송을 위한 인터페이스
 * @author Choi Kyung Yong
 * @since 2016. 9. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since           author                 description
 *  ===========    ===============    ===========================
 *  2016. 9. 5.    Choi Kyung Yong                최초 생성
 * </pre>
 */

@Service("smsMessageIfService")
public class SmsMessageIfServiceImpl extends HService implements SmsMessageIfService {

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 게시판 DAO
     */
    @Resource(name = "smsMessageIfDAO")
    SmsMessageIfDAO smsMessageIfDAO;

    /**
     * 알림서비스에서 생성된 트랜젝션을 사용하면 에러 발생시 알림서비스에서 수행된 작업도 함께 롤백 처리가 되어
     * 알림서비스에서 생성된 트랜젝션을 사용하지 않고 새로운 트랜젝션을 사용하도록 설정함
     */
    @Override
    //@Transactional(value="txManager", rollbackFor={ClientProtocolException.class, IOException.class}, propagation=Propagation.REQUIRES_NEW)
    public String mergeSmsMessageIF(List<SmsMessageIfVO> smsMessageIfVOs) throws Exception {

        int cnt = smsMessageIfVOs.size();
        int i;
        String ifResult = "0";
        String seq = "";
        String[] lblList = new String[1];
        String invalidStrMessage = "";
        SmsMessageIfVO smsMessageIfVO = new SmsMessageIfVO();
        try{
            for(i = 0; i < cnt; i++){
                smsMessageIfVO = smsMessageIfVOs.get(i);
                seq = smsMessageIfDAO.selectSmsMessageSeq(smsMessageIfVO);
                smsMessageIfVO.setSeq(seq);
                smsMessageIfVO.setReceiveRsltCd(RECEIVE_RSLT_CD_NOT_SEND);
                smsMessageIfVOs.get(i).setSeq(seq);
                smsMessageIfVOs.get(i).setRegDt(new Date());
                smsMessageIfVOs.get(i).setUpdtDt(new Date());
                smsMessageIfDAO.insertSmsMessageIF(smsMessageIfVO);  //新增到3101t
            }
            if(i > 0){
                invalidStrMessage = this.requestCemelSMSMessage(smsMessageIfVOs);
                ifResult = "1";
            }
        }catch(Exception ex){
            log.error(ex.getMessage());
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
            throw processException("par.lbl.ifErrMsg", lblList);
        }

        if(!StringUtils.isEmpty(invalidStrMessage)){
            throw processException("cmm.err.validateSmsCont", new String[] {invalidStrMessage});
        }
        return ifResult;
    }

    /**
     * 알림서비스에서 생성된 트랜젝션을 사용하면 에러 발생시 알림서비스에서 수행된 작업도 함께 롤백 처리가 되어
     * 알림서비스에서 생성된 트랜젝션을 사용하지 않고 새로운 트랜젝션을 사용하도록 설정함
     */
    @Override
    //@Transactional(value="txManager", rollbackFor={ClientProtocolException.class, IOException.class}, propagation=Propagation.REQUIRES_NEW)
    public String mergeSmsMessageIF(SmsMessageIfVO smsMessageIfVO) throws Exception {

        String seq = null;
        String invalidStrMessage = "";
        String[] lblList = new String[1];
        List<SmsMessageIfVO> smsMessageIfVOs = new ArrayList<SmsMessageIfVO>();
        try{
            if(smsMessageIfVO != null){
                seq = smsMessageIfDAO.selectSmsMessageSeq(smsMessageIfVO);
                smsMessageIfVO.setSeq(seq);
                smsMessageIfVO.setReceiveRsltCd(RECEIVE_RSLT_CD_NOT_SEND);
                //短信录入和修改时间为当前时间
                smsMessageIfVO.setRegDt(new Date());
                smsMessageIfVO.setUpdtDt(new Date());
                smsMessageIfDAO.insertSmsMessageIF(smsMessageIfVO);

                smsMessageIfVOs.add(smsMessageIfVO);
                invalidStrMessage = this.requestCemelSMSMessage(smsMessageIfVOs);

            }
        }catch(Exception ex){
            log.error(ex.getMessage());
            throw processException("par.lbl.ifErrMsg", lblList);
        }

        if(!StringUtils.isEmpty(invalidStrMessage)){
            throw processException("cmm.err.validateSmsCont", new String[] {invalidStrMessage});
        }

        return seq;
    }

    /**
     * SMS 예약 취소를 위한 인터페이스
     * @param smsMessageIfVO
     */
    @Override
    //@Transactional(value="txManager", rollbackFor={ClientProtocolException.class, IOException.class}, propagation=Propagation.REQUIRES_NEW)
    public int updateSmsMessageCancIF(List<SmsMessageIfVO> smsMessageIfVOs) throws Exception {
        int cnt = smsMessageIfVOs.size();
        int rtnCnt = 0;
        String[] lblList = new   String[1];
        SmsMessageIfVO smsMessageIfVO = new SmsMessageIfVO();
        try{
            for(int i = 0; i < cnt; i++){
                smsMessageIfVO = smsMessageIfVOs.get(i);
                smsMessageIfDAO.updateSmsMessageCancIF(smsMessageIfVO);
            }
        }catch(Exception ex){
            log.error(ex.getMessage());
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
            throw processException("par.lbl.ifErrMsg", lblList);
        }

        return rtnCnt;
    }

    /**
     * SMS 인터페이스 전송(DMS -> Camel)
     * @param smsMessageIfVO
     */
    public String requestCemelSMSMessage(List<SmsMessageIfVO> smsMessageIfVOs) throws Exception {    	
    	
    	SimpleDateFormat dateFormat= new SimpleDateFormat("yyyyMMddHHmm");
    	SimpleDateFormat simpleDateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String ifResult = "0";
        CamelClient camelClient = camelClientFactory.createCamelClient();
        Data receiveData = new Data();
        int cnt = 0;
        String invalidStrMessage = "";
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
                message.put("SMS_SEND_YN", "N");
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
                String sSmsSendDstinCd = smsMessageIfVOs.get(i).getSmsSendDstinCd();
                if(StringUtils.isNotEmpty(sSmsSendDstinCd)){
                    if(SMS_SEND_DSTIN_CD_IMMEDIATELY.equals(sSmsSendDstinCd)){
                        camelClient.addSendMessage(message);
                        cnt++;
                    }
                }
            }
            if(cnt > 0){
                receiveData = camelClient.sendRequest();
                ifResult = receiveData.getFooter().getIfResult();
            }

            if("Z".equals(ifResult)){
                for(int j = 0; j < smsMessageIfVOs.size(); j++){
                    smsMessageIfDAO.updateSmsMessageIfSuccess(smsMessageIfVOs.get(j));
                    smsMessageIfDAO.updateSmsMessageEaiIfSuccess(smsMessageIfVOs.get(j));
                }
                JSONParser jsonParser = new JSONParser();

                JSONObject jsonObject1 = (JSONObject)jsonParser.parse(receiveData.getBody().getJsonMessage());
                JSONObject jsonObject2 = (JSONObject) jsonObject1.get("return");
                JSONArray array = (JSONArray) jsonObject2.get("arrSmsSendWebServiceResponse");
                JSONObject jsonObject3 = new JSONObject();
                for(int i=0; i< array.size(); i++){
                    jsonObject3 = (JSONObject) array.get(i);
                    if(Constants.SMSSENDRESULTCD_VALIDATEFAIL.equals(jsonObject3.get("smsSendResultCd").toString())){
                        if(!"".equals(invalidStrMessage)) invalidStrMessage += " , ";
                        invalidStrMessage += jsonObject3.get("content").toString();
                    }
                }
            }
        }catch(ClientProtocolException ce){
            log.error(ce.toString());
            throw ce;
        }catch(IOException ce){
            log.error(ce.toString());
            throw ce;
        }

        return invalidStrMessage;
    }
}