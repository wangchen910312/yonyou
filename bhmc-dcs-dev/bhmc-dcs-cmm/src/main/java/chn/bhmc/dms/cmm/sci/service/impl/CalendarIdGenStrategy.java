package chn.bhmc.dms.cmm.sci.service.impl;

import org.joda.time.LocalDate;

import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalendarIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class CalendarIdGenStrategy extends EgovIdGnrStrategyImpl {
    @Override
    public void setPrefix(String prefix){
        super.setPrefix(prefix + LocalDate.now().toString("yyyyMM") + "-");
    }
}