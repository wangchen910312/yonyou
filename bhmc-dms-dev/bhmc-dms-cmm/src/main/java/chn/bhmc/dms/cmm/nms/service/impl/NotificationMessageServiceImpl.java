package chn.bhmc.dms.cmm.nms.service.impl;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.velocity.app.Velocity;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.jms.JmsException;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.NotificationPolicyService;
import chn.bhmc.dms.cmm.nms.service.NotificationTargetService;
import chn.bhmc.dms.cmm.nms.service.NotificationTemplateService;
import chn.bhmc.dms.cmm.nms.service.dao.NotificationMessageDAO;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateVO;
import chn.bhmc.dms.cmm.sms.service.SmsMessageIfService;
import chn.bhmc.dms.cmm.sms.vo.SmsMessageIfVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("notificationMessageService")
public class NotificationMessageServiceImpl extends HService implements NotificationMessageService {

    @Resource(name="notificationMessageDAO")
    NotificationMessageDAO notificationMessageDAO;

    @Resource(name="notificationTargetService")
    NotificationTargetService notificationTargetService;

    @Resource(name="notificationPolicyService")
    NotificationPolicyService notificationPolicyService;

    @Resource(name="notificationTemplateService")
    NotificationTemplateService notificationTemplateService;

    @Resource(name="notificationJmsTemplate")
    JmsTemplate notificationJmsTemplate;

    @Resource(name="smsMessageIfService")
    SmsMessageIfService smsMessageIfService;

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#sendNotificationMessage(java.lang.String, java.lang.String, org.apache.velocity.VelocityContext)
     */
    @Override
    public void sendNotificationMessage(String sysCd, String alrtPolicyGrpId, String dlrCd, NotificationMessageContext context) throws Exception {
        sendNotificationMessage(dlrCd, alrtPolicyGrpId, dlrCd, context, null);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#sendNotificationMessage(java.lang.String, java.lang.String, org.apache.velocity.VelocityContext)
     */
    @Override
    public void sendNotificationMessage(String sysCd, String alrtPolicyGrpId, String dlrCd, NotificationMessageContext context, List<NotificationTargetUserVO> targetUsers) throws Exception {
        NotificationPolicyVO notificationPolicyVO = notificationPolicyService.selectNotificationPolicyByGrpId(alrtPolicyGrpId);

        //알림정책 정보가 없다면 예외를 발생한다.
        if(notificationPolicyVO == null){
            throw processException("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.alrtPolicyGrpId", null, LocaleContextHolder.getLocale())});
        }
        
        //알람정책 사용여부가 'Y'가 아닌경우
        if(!"Y".equals(notificationPolicyVO.getUseYn())){
        	return;
        }

        List<NotificationMessageVO> notificationMessageList = new ArrayList<NotificationMessageVO>();
        Map<String, NotificationTemplateVO> templateMap = new HashMap<String, NotificationTemplateVO>();
        Map<String, NotificationTargetUserVO> targetUserMap = new HashMap<String, NotificationTargetUserVO>();

        //알림정책 템플릿 목록 조회
        NotificationTemplateSearchVO notificationTemplateSearchVO = new NotificationTemplateSearchVO();
        notificationTemplateSearchVO.setsAlrtPolicyGrpId(notificationPolicyVO.getAlrtPolicyGrpId());
        notificationTemplateSearchVO.setsAlrtPolicyId(notificationPolicyVO.getAlrtPolicyId());
        List<NotificationTemplateVO> templateList = notificationTemplateService.selectNotificationTemplatesByCondition(notificationTemplateSearchVO);

        for(NotificationTemplateVO obj : templateList){
            templateMap.put(obj.getMesgTmplTp(), obj);
        }

        if(targetUsers == null){
            targetUsers = notificationTargetService.selectNotificationTargetAllUsers(dlrCd, notificationPolicyVO.getAlrtPolicyGrpId(), notificationPolicyVO.getAlrtPolicyId());
        }

        for(NotificationTargetUserVO obj : targetUsers){
            String[] mesgTmplTpList = obj.getMesgTmplTpList().split(",");
            for(String mesgTmplTp : mesgTmplTpList){
                String key = obj.getUsrId() + mesgTmplTp;
                if(!targetUserMap.containsKey(key)){
                    NotificationTargetUserVO obj2 = new NotificationTargetUserVO();
                    BeanUtils.copyProperties(obj2, obj);

                    obj2.setMesgTmplTp(mesgTmplTp);
                    targetUserMap.put(key, obj2);
                }
            }
        }

        //알림메세지 템플릿을 적용한다.
        Iterator<Entry<String, NotificationTargetUserVO>> iter = targetUserMap.entrySet().iterator();
        while(iter.hasNext()){
            NotificationTargetUserVO obj = iter.next().getValue();
            NotificationTemplateVO template = templateMap.get(obj.getMesgTmplTp());

            if(template != null){
                String mesgId = UUID.randomUUID().toString();

                StringWriter swOut = new StringWriter();
                Velocity.evaluate(context.getVelocityContext(), swOut, mesgId, template.getMesgTmplCont());

                NotificationMessageVO notificationMessageVO = new NotificationMessageVO(dlrCd, mesgId, swOut.toString(), obj.getMesgTmplTp(), obj.getUsrId(), obj.getHpNo(), notificationPolicyVO.getActionUrlWeb(), notificationPolicyVO.getActionUrlMob(), context.getActionParams(), alrtPolicyGrpId, notificationPolicyVO.getAlrtPolicyId());

                notificationMessageList.add(notificationMessageVO);
            }
        }

        String usrId = null;

        try{
            usrId = LoginUtil.getUserId();
        }catch(NullPointerException e){
            usrId = "SYSTEM";
        }

        List<SmsMessageIfVO> smsMessageList = new ArrayList<SmsMessageIfVO>();

        //알림메세지를 발송하고 저장한다.
        for(NotificationMessageVO notificationMessageVO : notificationMessageList){

            NotificationMessageCreator notificationMessageCreator = new NotificationMessageCreator();
            notificationMessageCreator.setNotificationMessageVO(notificationMessageVO);

            //모바일 푸쉬
            if(NotificationMessageService.MESG_TP_MOBILE_PUSH.equals(notificationMessageVO.getMesgTp())){
                /*
                 * add by Han Kang Seok 2017.05.23
                 * 모바일 푸쉬는 DB 폴링방식을 적용하고 있어 JMS 메세지를 보낼 필요가 없다
                try{
                    notificationJmsTemplate.send(resolveDestinationName(notificationMessageVO), notificationMessageCreator);
                    notificationMessageVO.setSendYn("Y");
                    notificationMessageVO.setSendDt(new Date());
                }catch(JmsException e){
                    notificationMessageVO.setSendYn("N");
                    notificationMessageVO.setSendDt(null);
                }
                */

                notificationMessageVO.setSendYn("Y");
                notificationMessageVO.setSendDt(new Date());

            //웹 푸쉬
            }else if(NotificationMessageService.MESG_TP_WEB_PUSH.equals(notificationMessageVO.getMesgTp())){
                try{
                    notificationJmsTemplate.send(resolveDestinationName(notificationMessageVO), notificationMessageCreator);
                    notificationMessageVO.setSendYn("Y");
                    notificationMessageVO.setSendDt(new Date());
                }catch(JmsException e){
                    notificationMessageVO.setSendYn("N");
                    notificationMessageVO.setSendDt(null);
                }
            //SMS 발송
            }else if(NotificationMessageService.MESG_TP_SMS.equals(notificationMessageVO.getMesgTp())){
                SmsMessageIfVO smsMessageIfVO  = new SmsMessageIfVO();
                smsMessageIfVO.setDlrCd(notificationMessageVO.getDlrCd());
                smsMessageIfVO.setTelNo(notificationMessageVO.getReceiveUsrHpNo());
                smsMessageIfVO.setRegUsrId(usrId);
                smsMessageIfVO.setSmsCont(notificationMessageVO.getMesgCont());
                smsMessageIfVO.setCustNo(context.getCustNo());
                if(!StringUtil.isEmpty(context.getResvDt())){
                    smsMessageIfVO.setSmsSendDstinCd(SmsMessageIfService.SMS_SEND_DSTIN_CD_RESERVATION);
                    smsMessageIfVO.setResvDt(context.getResvDt());
                    smsMessageIfVO.setAppDstinCd(SmsMessageIfService.APP_DSTN_CD_SERVICE_RESERVATION);
                    smsMessageIfVO.setAppSeq(context.getAppSeq());
                } else {
                    smsMessageIfVO.setAppDstinCd(SmsMessageIfService.APP_DSTN_CD_ALARM);
                    smsMessageIfVO.setAppSeq(notificationMessageVO.getMesgId());
                    smsMessageIfVO.setSmsSendDstinCd(SmsMessageIfService.SMS_SEND_DSTIN_CD_IMMEDIATELY);
                }

                smsMessageList.add(smsMessageIfVO);

                notificationMessageVO.setSendYn("Y");
                notificationMessageVO.setSendDt(new Date());
            }

            insertNotificationMessage(notificationMessageVO);
        }

        if(smsMessageList.size() > 0){
            try{
                smsMessageIfService.mergeSmsMessageIF(smsMessageList);
            }catch(Exception e){
                //TODO [한강석] SMS발송 실패시 알림메세지의 발송 정보를 변경하자.
            }
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#insertNotificationMessage(chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO)
     */
    @Override
    public void insertNotificationMessage(NotificationMessageVO notificationMessageVO) throws Exception {
        notificationMessageDAO.insertNotificationMessage(notificationMessageVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#deleteNotificationMessage(java.lang.String)
     */
    @Override
    public int deleteNotificationMessage(String mesgId) throws Exception {
        return notificationMessageDAO.deleteNotificationMessage(mesgId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#updateReceive(java.lang.String)
     */
    @Override
    public int updateReceive(String mesgId) throws Exception {
        return notificationMessageDAO.updateReceive(mesgId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#selectNotificationMessageByKey(java.lang.String)
     */
    @Override
    public NotificationMessageVO selectNotificationMessageByKey(String mesgId) throws Exception {
        return notificationMessageDAO.selectNotificationMessageByKey(mesgId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#selectNotificationMessagesByCondition(chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO)
     */
    @Override
    public List<NotificationMessageVO> selectNotificationMessagesByCondition(NotificationMessageSearchVO searchVO) throws Exception {
        return notificationMessageDAO.selectNotificationMessagesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#selectNotificationMessagesByConditionCnt(chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO)
     */
    @Override
    public int selectNotificationMessagesByConditionCnt(NotificationMessageSearchVO searchVO) throws Exception {
        return notificationMessageDAO.selectNotificationMessagesByConditionCnt(searchVO);
    }

    private String resolveDestinationName(NotificationMessageVO notificationMessageVO){
        return String.format("dms.nms.%s.%s", notificationMessageVO.getMesgTp(), notificationMessageVO.getReceiveUsrId());
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#updateNotificationInfoRcve(java.util.List)
     */
    @Override
    public int updateNotificationInfoRcve(List<String> list) throws Exception {
        int result = 0;
        for (String mesgId: list) {
            result += updateNotificationInfoRcve(mesgId);
        }
        return result;
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.NotificationMessageService#updateNotificationInfoRcve(java.lang.String)
     */
    @Override
    public int updateNotificationInfoRcve(String mesgId) throws Exception {
        return notificationMessageDAO.updateNotificationInfoRcve(mesgId);
    }

}
