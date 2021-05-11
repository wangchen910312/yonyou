package chn.bhmc.dms.par.pmm.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CertNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Eun Jung Jang
 * @since 2016. 5. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 30.     Eun Jung Jang     최초 생성
 * </pre>
 */

public class CertNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyMMdd");
    }

}
