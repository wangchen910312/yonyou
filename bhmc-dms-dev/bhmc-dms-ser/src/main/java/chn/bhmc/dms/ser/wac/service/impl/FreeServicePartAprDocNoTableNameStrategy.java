package chn.bhmc.dms.ser.wac.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FreeServicePartDocNoTableNameStrategy.java
 * @Description : 면비부품 문서번호 생성
 * @author Kwon ki hyun
 * @since 2016. 8. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 20.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class FreeServicePartAprDocNoTableNameStrategy implements TableNameStrategy{

    /*
     * {@inheritDoc}
     */
    @Override
    public String makeTableName(String originalTableName) {

        return originalTableName +LoginUtil.getDlrCd()+ LocalDate.now().toString("yyyyMM");
    }
}
