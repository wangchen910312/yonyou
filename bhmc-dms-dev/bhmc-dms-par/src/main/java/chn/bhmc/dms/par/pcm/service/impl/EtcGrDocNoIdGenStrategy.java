package chn.bhmc.dms.par.pcm.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EtcGrDocNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     Ju Won Lee     최초 생성
 * </pre>
 */

public class EtcGrDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyyMMdd");
    }

}
