package chn.bhmc.dms.cmm.sci.service;

import java.util.Map;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SystemHistoryLoggableService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 6. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 1.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public interface SystemHistoryLoggableService {
    Object selectSystemHistoryLoggable(Map<String, Object> context) throws Exception;
}