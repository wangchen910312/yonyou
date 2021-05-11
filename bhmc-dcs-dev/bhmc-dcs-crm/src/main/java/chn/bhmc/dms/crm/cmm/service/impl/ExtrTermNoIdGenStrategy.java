package chn.bhmc.dms.crm.cmm.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ExtrTermNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author hyoung jun an
 * @since 2016. 4. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 30.   hyoung jun an     최초 생성
 * </pre>
 */

public class ExtrTermNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String buildPrefix(String prefix) {
        return LocalDate.now().toString("yyyyMMdd") + "-";
    }
}