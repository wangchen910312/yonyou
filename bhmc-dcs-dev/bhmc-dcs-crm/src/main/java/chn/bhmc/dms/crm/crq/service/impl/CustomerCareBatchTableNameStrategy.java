package chn.bhmc.dms.crm.crq.service.impl;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerCareBatchTableNameStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2016.06.22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.22.     In Moon Lee     최초 생성
 * </pre>
 */

public class CustomerCareBatchTableNameStrategy implements TableNameStrategy {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String makeTableName(String originalTableName) {
        return originalTableName;
    }
}
