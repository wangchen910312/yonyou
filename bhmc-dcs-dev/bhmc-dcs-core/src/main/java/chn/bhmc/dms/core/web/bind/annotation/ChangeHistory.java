package chn.bhmc.dms.core.web.bind.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeHistory.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 31.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface ChangeHistory {
    public String beanId();
    public String sysDstinCd(); // System 구분 - Ex) "01", "02"...
    public String chgTp();      // 작업 유형 - Ex) "C", "U", "D"
}