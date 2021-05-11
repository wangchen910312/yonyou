package chn.bhmc.dms.sal.uco.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * 소매 중고차 계약 키 구현 클래스
 *
 * @author Jin Suk Kim
 * @since 2016. 5. 25.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일         수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 6. 03.     Jin Suk Kim        최초 생성
 * </pre>
 */
public class RetailUsedCarContractIdGenStrategy extends AbstractIdGnrStrategyImpl {

    @Override
    public String buildPrefix(String prefix) {
        return prefix + LocalDate.now().toString("yyyy");
    }

}
