package chn.bhmc.dms.bat.crm.crq.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.crq.service.BatVocPushSignAlarmsService;
import chn.bhmc.dms.bat.crm.crq.service.dao.BatVocPushSignAlarmsDAO;
import chn.bhmc.dms.bat.crm.crq.vo.BatVocMgmtVO;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.core.Constants;

/**
 * @ClassName   : BatVocPushSignAlarmsServiceImpl
 * @Description : VOC PushAlarm
 * @author LEE IN MOON
 * @since 2016.12.15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016.12.15.     LEE IN MOON     최초 생성
 * </pre>
 */
@Service("batVocPushSignAlarmsService")
public class BatVocPushSignAlarmsServiceImpl extends HService implements BatVocPushSignAlarmsService {

    /**
     * VOC PushAlarm DAO
     */
    @Resource(name="batVocPushSignAlarmsDAO")
    BatVocPushSignAlarmsDAO batVocPushSignAlarmsDAO;

    /**
     * notificationMessageService
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    @Override
    public int selectVocPushSignAlarms() throws Exception {

        List<BatVocMgmtVO> vocAlramList = new ArrayList<BatVocMgmtVO>();

        vocAlramList = batVocPushSignAlarmsDAO.selectVocPushSignAlarmList();

        if ( vocAlramList.size() > 0  ) {

            for (BatVocMgmtVO obj : vocAlramList) {

                pushSignAlarms(obj.getDlrCd(), obj.getVocNo(), obj.getAlramHm());

            };

        };

        return 0;
    }


    /**
     * 알람을 보낸다.
     */
    public void pushSignAlarms(String dlrCd, String vocNo, int alramHm) throws Exception {

        // CRM-00-12 : 배정 / CRM-00-13 : 6H,12H / CRM-00-14 : 18H / CRM-00-15 : 24H / CRM-00-16 : 72H / CRM-00-17 : 7D / CRM-00-18 : 15D / CRM-00-19 : 60D
        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "";
        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("vocNo", vocNo);
        context.setActionParams("vocNo="+vocNo);

        if ( 0 <= alramHm && alramHm <= 360 ) {
            alrtPolicyGrpId = "CRM-00-13";
        } else if ( 360 < alramHm && alramHm <= 720 ) {
            alrtPolicyGrpId = "CRM-00-13";
        } else if ( 720 < alramHm && alramHm <= 1080) {
            alrtPolicyGrpId = "CRM-00-14";
        } else if ( 1080 < alramHm && alramHm <= 1440 ) {
            alrtPolicyGrpId = "CRM-00-15";
        } else if ( 1440 < alramHm && alramHm <= 4320 ) {
            alrtPolicyGrpId = "CRM-00-16";
        } else if ( 4320 < alramHm && alramHm <= 10080 ) {
            alrtPolicyGrpId = "CRM-00-17";
        } else if ( 10080 < alramHm && alramHm <= 21600 ) {
            alrtPolicyGrpId = "CRM-00-18";
        } else if ( 21600 < alramHm && alramHm <= 43200 ) {
            alrtPolicyGrpId = "CRM-00-18";
        };

        if ( StringUtils.isNotEmpty(alrtPolicyGrpId)) {
            // 알람 타켓을 알람설정에서 지정한경우.
            notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context);
        };

    }
}