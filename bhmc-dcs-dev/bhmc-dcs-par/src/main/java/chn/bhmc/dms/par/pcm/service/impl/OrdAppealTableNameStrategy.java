package chn.bhmc.dms.par.pcm.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustNoTableNameStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     In Bo Shim     최초 생성
 * </pre>
 */

public class OrdAppealTableNameStrategy implements TableNameStrategy {

    @Override
    public String makeTableName(String originalTableName) {
        return originalTableName + LocalDate.now().toString("yyyyMMdd");
    }
}
