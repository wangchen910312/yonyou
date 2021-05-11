package chn.bhmc.dms.crm.dmm.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipNoIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 4. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

    @Override
    public String buildPrefix(String prefix) {
        return "M" + LoginUtil.getDlrCd() + LocalDate.now().toString("yyyyMM");
    }

//    @Override
//    public void setPrefix(String prefix) {
//        //멤버십 번호체계 ex) M + 딜러번호 + 년 + 월 + 5자리
//        super.setPrefix("M" + LoginUtil.getDlrCd() + LocalDate.now().toString("yyyyMM"));
//    }
}
