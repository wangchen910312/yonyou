package chn.bhmc.dms.ser.est.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstDocNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class EstDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl{
    

    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMM");
    }
}
