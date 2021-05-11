package chn.bhmc.dms.par.ism.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * 부품예류 키 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 14.     In Bo Shim      최초 생성
 * </pre>
 */

public class ParBorrowDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

    @Override
    public String buildPrefix(String prefix){
        return prefix + LocalDate.now().toString("yyyyMM");
    }


}
