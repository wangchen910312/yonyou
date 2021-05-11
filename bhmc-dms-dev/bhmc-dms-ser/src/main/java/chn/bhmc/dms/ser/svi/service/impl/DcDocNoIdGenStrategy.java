package chn.bhmc.dms.ser.svi.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DcDocNoIdGenStrategy.java
 * @Description : 할인 등록 DOC NO
 * @author YIN XUEYUAN
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class DcDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl{

    
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMM");
    }



}
