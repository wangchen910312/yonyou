package chn.bhmc.dms.core.support.databind;

import java.text.DateFormat;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JsonDateFormatConverter.java
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

public interface JsonDateFormatConverter {
    public DateFormat dateFormat();
}
