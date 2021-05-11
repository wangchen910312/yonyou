package chn.bhmc.dms.ws;

import javax.jws.WebParam;
import javax.jws.WebService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsWebService.java
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
        name="DmsWebService"
        ,targetNamespace="http://www.bhmc.com.cn/schema/dms-webservice")
public interface DmsWebService {
    public VehicleEnterNotificationResponse vehicleEnterNotification(@WebParam(name="vehicleEnterNotificationRequest") VehicleEnterNotificationRequest vehicleEnterNotificationRequest) throws Exception;
}
