package chn.bhmc.dms.cmm.bbs.service.impl;

import org.joda.time.LocalDate;

import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileDocNoIdGenStrategy.java
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

public class NttIdGenStrategy extends EgovIdGnrStrategyImpl {

    @Override
    public void setPrefix(String prefix){
        super.setPrefix(prefix + LocalDate.now().toString("yyyyMM") + "-");
    }
}