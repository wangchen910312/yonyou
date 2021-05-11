package chn.bhmc.dms.sal.acc.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * 용품판매오더번호 생성 전략 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2017. 2. 09.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                    수정자                                     수정내용
 *  ===========    =============    ===========================
 *  2017. 2. 09.   Kang Seok Han    최초 생성
 * </pre>
 */
public class AccessoryItemSalesIdGenStrategy extends AbstractIdGnrStrategyImpl {
    @Override
    public String buildPrefix(String prefix){
        return prefix + LocalDate.now().toString("yyyy");
    }
}
