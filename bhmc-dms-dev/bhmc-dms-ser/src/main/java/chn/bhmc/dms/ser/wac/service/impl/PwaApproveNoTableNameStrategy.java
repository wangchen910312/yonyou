package chn.bhmc.dms.ser.wac.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaApproveNoTableNameStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class PwaApproveNoTableNameStrategy implements TableNameStrategy {

    /*
     * {@inheritDoc}
     */
    @Override
    public String makeTableName(String originalTableName) {

        return originalTableName + LocalDate.now().toString("yyyyMM");
    }
    
    

}
