package chn.bhmc.dms.bat.crm.crq.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatVocPushSignAlarmsService
 * @Description : VOC PushAlarm
 * @author LEE IN MOON
 * @since 2016.12.15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.12.15.     LEE IN MOON     최초 생성
 * </pre>
 */

public interface BatVocPushSignAlarmsService {

    /**
     * VOC PushAlarm
     * @param null
     * @return Count
     */
    public int selectVocPushSignAlarms() throws Exception;

}