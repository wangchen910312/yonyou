package chn.bhmc.dms.ser.wac.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FreeServicePartDocNoIdGenStrategy.java
 * @Description : 면비부품 문서번호 생성
 * @author Kwon ki hyun
 * @since 2016. 8. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 20.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class FreeServicePartAprDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl{

     
    
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMM");
    }

}
