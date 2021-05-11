package chn.bhmc.dms.ser.svi.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RateDocNoIdGenStrategy.java
 * @Description : 임률 등록 DOC NO
 * @author YIN XUEYUAN
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class RateDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl{

    @Override
    public String buildPrefix(String prefix) {
        return prefix +LoginUtil.getDlrCd()+ LocalDate.now().toString("yyyyMM");
    }



}
