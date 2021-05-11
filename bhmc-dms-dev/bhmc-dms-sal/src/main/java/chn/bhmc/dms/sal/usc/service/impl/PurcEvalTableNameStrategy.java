package chn.bhmc.dms.sal.usc.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcEvalTableNameStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 25.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class PurcEvalTableNameStrategy implements TableNameStrategy {

    /*
     * {@inheritDoc}
     */
    @Override
    public String makeTableName(String originalTableName) {

        return originalTableName +LoginUtil.getDlrCd()+ LocalDate.now().toString("yyyy");
    }

}
