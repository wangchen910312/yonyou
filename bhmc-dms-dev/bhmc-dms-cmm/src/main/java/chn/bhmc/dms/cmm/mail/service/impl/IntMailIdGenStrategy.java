package chn.bhmc.dms.cmm.mail.service.impl;

import org.joda.time.LocalDate;

import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IntMailIdGenStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class IntMailIdGenStrategy extends EgovIdGnrStrategyImpl {
    @Override
    public void setPrefix(String prefix){
        super.setPrefix(prefix + LocalDate.now().toString("yyyyMM") + "-");
    }
}