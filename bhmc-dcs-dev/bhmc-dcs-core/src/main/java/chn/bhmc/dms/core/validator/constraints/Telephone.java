package chn.bhmc.dms.core.validator.constraints;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import chn.bhmc.dms.core.validator.constraints.impl.TelephoneValidator;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Telephone.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kang Seok Han     최초 생성
 * </pre>
 */

@Documented
@Constraint(validatedBy = TelephoneValidator.class)
@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER })
@Retention(RUNTIME)
public @interface Telephone {
	String message() default "{chn.bhmc.validation.constraint.Telephone.message}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}