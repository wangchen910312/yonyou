package chn.bhmc.dms.core.validator.constraints.impl;

import java.util.regex.Matcher;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import chn.bhmc.dms.core.validator.constraints.Telephone;

/**
 * <pre>
 * Check that a given string is a well-formed telephone number.
 * </pre>
 *
 * @ClassName   : TelephoneValidator.java
 * @Description : Check that a given string is a well-formed telephone number.
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

public class TelephoneValidator implements ConstraintValidator<Telephone, String> {
	private static final String ATOM = "^[0-9]\\d{2}-(\\d{3}|\\d{4})-\\d{4}$";

	private final java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(ATOM,
			java.util.regex.Pattern.CASE_INSENSITIVE);

	public void initialize(Telephone annotation) {}

	public boolean isValid(String value, ConstraintValidatorContext context) {
		if (value == null || value.length() == 0) {
			return true;
		}
		Matcher m = pattern.matcher(value);
		return m.matches();
	}
}
