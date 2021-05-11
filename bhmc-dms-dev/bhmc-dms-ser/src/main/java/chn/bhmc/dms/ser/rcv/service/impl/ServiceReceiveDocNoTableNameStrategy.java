package chn.bhmc.dms.ser.rcv.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveDocNoTableNameStrategy.java
 * @Description : 수납 테이블 정책.
 * @author YIN XUEYUAN
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class ServiceReceiveDocNoTableNameStrategy implements TableNameStrategy {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String makeTableName(String originalTableName) {

        return originalTableName +LoginUtil.getDlrCd()+ LocalDate.now().toString("yyyyMM");
    }



}
