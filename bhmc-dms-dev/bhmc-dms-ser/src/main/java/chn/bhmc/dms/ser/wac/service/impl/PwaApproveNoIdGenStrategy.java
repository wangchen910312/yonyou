package chn.bhmc.dms.ser.wac.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaApproveNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class PwaApproveNoIdGenStrategy extends AbstractIdGnrStrategyImpl{
    
  
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMM");
    }

}
