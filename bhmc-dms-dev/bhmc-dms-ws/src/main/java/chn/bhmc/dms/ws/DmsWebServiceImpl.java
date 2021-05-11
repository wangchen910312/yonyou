package chn.bhmc.dms.ws;

import javax.annotation.Resource;
import javax.jws.WebService;

import org.apache.velocity.VelocityContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsWebServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 1. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 23.     Kang Seok Han     최초 생성
 * </pre>
 */

@WebService(
    endpointInterface = "chn.bhmc.dms.ws.DmsWebService"
    ,serviceName="DmsWebService"
    ,portName="DmsWebServicePort")
public class DmsWebServiceImpl implements DmsWebService {

    private final static Logger logger = LoggerFactory.getLogger(DmsWebService.class);

    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    @Override
    public VehicleEnterNotificationResponse vehicleEnterNotification(VehicleEnterNotificationRequest vehicleEnterNotificationRequest) throws Exception {

        VehicleEnterNotificationResponse vehicleEnterNotificationResponse = new VehicleEnterNotificationResponse();
        String vehicleNo = vehicleEnterNotificationRequest.getVehicleNo();
        String dlrCd = vehicleEnterNotificationRequest.getDlrCd();

        logger.debug("vehicleNo : {} ", vehicleNo);
        logger.debug("dlrCd : {} ", dlrCd);

        //차량진입 알림서비스 호출
        NotificationMessageContext context = new NotificationMessageContext();
        VelocityContext velocityContext = context.getVelocityContext();
        velocityContext.put("currentDate", DateUtil.getDate("MM-dd HH:mm"));
        velocityContext.put("vehicleNumber", vehicleNo);

        notificationMessageService.sendNotificationMessage(Constants.SYS_CD_DLR, "SER-0004", dlrCd, context);

        vehicleEnterNotificationResponse.setResult("S");
        vehicleEnterNotificationResponse.setMessage("");

        return vehicleEnterNotificationResponse;
    }
}
