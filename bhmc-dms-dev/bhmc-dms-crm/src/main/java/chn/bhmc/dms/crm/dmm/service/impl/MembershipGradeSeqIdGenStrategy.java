package chn.bhmc.dms.crm.dmm.service.impl;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeCdIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipGradeSeqIdGenStrategy extends AbstractIdGnrStrategyImpl {
    @Override
    public String buildPrefix(String prefix) {
        return "MG";
    }
}
