package chn.bhmc.dms.ser.wac.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaDocNoIdGenStrategy.java
 * @Description : PWA 요청 DOC NO 
 * @author Kwon Ki Hyun
 * @since 2016. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 7.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class PwaDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl{
 
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMM");
    }

}
