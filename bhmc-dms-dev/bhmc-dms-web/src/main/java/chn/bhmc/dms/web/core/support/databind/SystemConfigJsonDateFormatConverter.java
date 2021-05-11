package chn.bhmc.dms.web.core.support.databind;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.databind.JsonDateFormatConverter;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SystemConfigJsonDateFormatConverter.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SystemConfigJsonDateFormatConverter implements JsonDateFormatConverter {

    public static final String defaultDateFormat = "yyyy-MM-dd";
    SystemConfigInfoService systemConfigInfoService;

    /*
     * @see chn.bhmc.dms.core.support.databind.JsonDateFormatConverter#dateFormat()
     */
    @Override
    public DateFormat dateFormat() {

        DateFormat dateFormat;

        try {
            dateFormat = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        } catch (Exception e) {
            dateFormat = new SimpleDateFormat(defaultDateFormat);
        }

        return dateFormat;
    }

    public void setSystemConfigInfoService(SystemConfigInfoService systemConfigInfoService) {
        this.systemConfigInfoService = systemConfigInfoService;
    }

}
