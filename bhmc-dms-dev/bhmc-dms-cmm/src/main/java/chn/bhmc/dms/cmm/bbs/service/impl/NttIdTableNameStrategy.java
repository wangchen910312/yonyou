package chn.bhmc.dms.cmm.bbs.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileDocNoTableNameStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NttIdTableNameStrategy implements TableNameStrategy {
    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String makeTableName(String originalTableName) {
        return originalTableName + LocalDate.now().toString("yyyyMMdd");
    }
}