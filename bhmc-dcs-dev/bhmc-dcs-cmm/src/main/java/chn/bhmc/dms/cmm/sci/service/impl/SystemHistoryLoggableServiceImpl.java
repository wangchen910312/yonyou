package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.Map;

import able.com.service.HService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemHistoryLoggableService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SystemHistoryLoggableServiceImpl.java
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

@Service("systemHistoryLoggableService")
public class SystemHistoryLoggableServiceImpl extends HService implements SystemHistoryLoggableService {

    Logger log = LoggerFactory.getLogger(SystemHistoryLoggableServiceImpl.class);

    @Override
    public Object selectSystemHistoryLoggable(Map<String, Object> context) throws Exception {

        log.debug("SystemHistoryLoggableService Execute");

        return null;
    }
}