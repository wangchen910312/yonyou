package chn.bhmc.dms.ser.wac.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimOldItemManageDocNoIdGenStrategy.java
 * @Description : 고품 관리 DOC NO
 * @author YIN XUEYUAN
 * @since 2016. 5. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 6.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class ClaimOldItemManageDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl{

  
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMM");
    }



}
