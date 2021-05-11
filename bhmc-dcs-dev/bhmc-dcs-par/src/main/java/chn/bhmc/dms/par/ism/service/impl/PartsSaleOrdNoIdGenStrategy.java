package chn.bhmc.dms.par.ism.service.impl;

import org.joda.time.LocalDate;

import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleOrdNoIdGenStrategy.java
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

public class PartsSaleOrdNoIdGenStrategy extends EgovIdGnrStrategyImpl {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public void setPrefix(String prefix) {
        super.setPrefix(prefix + LocalDate.now().toString("yyyyMMdd"));
    }

}
