package chn.bhmc.dms.sal.acu.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;

/**
 * 예약판매 키 구현 클래스
 *
 * @author Jin Suk Kim
 * @since 2016. 5. 25.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일           수정자              수정내용
 *  ===========    =============    ===========================
 *  2017. 3. 03.    Jin Suk Kim          최초 생성
 * </pre>
 */
public class ContBeforeMngTableNameStrategy implements TableNameStrategy {

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String makeTableName(String originalTableName) {
        return originalTableName + LoginUtil.getDlrCd()+LocalDate.now().toString("yyyyMM");
    }

}
