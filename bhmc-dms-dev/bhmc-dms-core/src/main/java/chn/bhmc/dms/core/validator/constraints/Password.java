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
import javax.validation.constraints.DecimalMax;

import chn.bhmc.dms.core.validator.constraints.impl.PasswordValidator;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Password.java
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
@Constraint(validatedBy = PasswordValidator.class)
@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER })
@Retention(RUNTIME)
public @interface Password {
	String message() default "{chn.bhmc.validation.constraint.Password.message}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};

	/**
	 * 영문 대문자 포함여부 기본값은 true
	 * @return
	 */
	boolean includeCapitalLetter() default true;

	/**
	 * 알파벳 포함 여부 기본값은 true
	 * @return
	 */
	boolean includeAlphabet() default true;

	/**
	 * 특수문자 포함 여부 기본값은 true
	 * @return
	 */
	boolean includeSpecialLetter() default true;

	/**
	 * 숫자 포함 여부 기본값은 false
	 * @return
	 */
	boolean includeNumber() default false;

	/**
	 * 최소 길이
	 * @return
	 */
	long minLength() default 6;

	/**
	 * 최대 길이
	 * @return
	 */
	long maxLength() default 20;

	/**
	 * Defines several {@link DecimalMax} annotations on the same element.
	 *
	 * @see DecimalMax
	 */
	@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER })
	@Retention(RUNTIME)
	@Documented
	@interface List {
		Password[] value();
	}
}
