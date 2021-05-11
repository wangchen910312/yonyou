package chn.bhmc.dms.ser.svi.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RateDocNoTableNameStrategy.java
 * @Description : 임률 테이블 정책.
 * @author YIN XUEYUAN
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class RateDocNoTableNameStrategy implements TableNameStrategy {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String makeTableName(String originalTableName) {

        return originalTableName +LoginUtil.getDlrCd()+ LocalDate.now().toString("yyyyMM");
    }



}
