package chn.bhmc.dms.par.ism.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * 구매요청 키 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 16.     In Bo Shim      최초 생성
 * </pre>
 */

public class ParReqDocNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

    @Override
    public String buildPrefix(String prefix){
        return prefix + LocalDate.now().toString("yyyyMM");

    }


}
