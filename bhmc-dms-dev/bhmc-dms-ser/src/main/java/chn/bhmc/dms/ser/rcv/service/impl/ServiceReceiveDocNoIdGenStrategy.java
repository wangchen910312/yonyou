package chn.bhmc.dms.ser.rcv.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveDocNoIdGenStrategy.java
 * @Description : 수납 등록 DOC NO
 * @author YIN XUEYUAN
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class ServiceReceiveDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl{

    
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMM");
    }

}
