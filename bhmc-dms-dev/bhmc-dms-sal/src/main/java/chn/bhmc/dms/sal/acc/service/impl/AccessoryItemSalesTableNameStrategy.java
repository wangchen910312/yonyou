package chn.bhmc.dms.sal.acc.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;

/**
 * 용품판매오더 번호 생성 테이블명(시퀀스명) 생성 전략
 *
 * @author Kang Seok Han
 * @since 2017. 2. 09.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                                 수정내용
 *  ===========    =============    ===========================
 *  2017. 2. 09.   Kang Seok Han    최초 생성
 * </pre>
 */
public class AccessoryItemSalesTableNameStrategy implements TableNameStrategy {
    @Override
    public String makeTableName(String originalTableName) {
        return originalTableName +LoginUtil.getDlrCd()+ LocalDate.now().toString("yyyy");
    }
}
