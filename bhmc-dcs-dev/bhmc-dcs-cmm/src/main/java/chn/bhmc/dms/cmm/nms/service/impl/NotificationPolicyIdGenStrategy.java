package chn.bhmc.dms.cmm.nms.service.impl;

import org.joda.time.LocalDate;

import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

/**
 * <pre>
 * 알림정책 ID를 동적으로 변화하기 우한 Prefix를 구성한다.
 * </pre>
 *
 * @ClassName   : NotificationPolicyIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationPolicyIdGenStrategy extends EgovIdGnrStrategyImpl {

    @Override
    public void setPrefix(String prefix){
        super.setPrefix(prefix + "-" + LocalDate.now().toString("yyyyMM") + "-");
    }
}
