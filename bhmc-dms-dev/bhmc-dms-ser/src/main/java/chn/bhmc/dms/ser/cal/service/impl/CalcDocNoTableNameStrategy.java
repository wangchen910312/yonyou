package chn.bhmc.dms.ser.cal.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalcDocNoTableNameStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     KyungMok Kim     최초 생성
 * </pre>
 */

public class CalcDocNoTableNameStrategy implements TableNameStrategy {

    /*
     * {@inheritDoc}
     */
    @Override
    public String makeTableName(String originalTableName) {

        return originalTableName + LoginUtil.getDlrCd() + LocalDate.now().toString("yyyyMM");
    }



}
