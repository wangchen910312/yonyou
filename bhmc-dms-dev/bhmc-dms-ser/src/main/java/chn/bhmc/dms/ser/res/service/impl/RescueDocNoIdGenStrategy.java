package chn.bhmc.dms.ser.res.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : RescueDocNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author YIN XUEYUAN
 * @since 2016. 6. 19.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 19.   YIN XUEYUAN     최초 생성
 * </pre>
 */

public class RescueDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

   
    
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMM");
    }


}
