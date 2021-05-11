package chn.bhmc.dms.core.validator.constraints.impl;

import java.util.regex.Matcher;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import chn.bhmc.dms.core.validator.constraints.Url;

/**
 * <pre>
 * Check that a given string is a well-formed url.
 * </pre>
 *
 * @ClassName   : UrlValidator.java
 * @Description : Check that a given string is a well-formed url.
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

public class UrlValidator implements ConstraintValidator<Url, String> {
	private static final String ATOM = "(http|https|ftp)://[^\\s^\\.]+(\\.[^\\s^\\.]+)*";

	private java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(ATOM,
			java.util.regex.Pattern.CASE_INSENSITIVE);

	public void initialize(Url annotation) {
	}

	public boolean isValid(String value, ConstraintValidatorContext context) {
		if (value == null || value.length() == 0) {
			return true;
		}
		Matcher m = pattern.matcher(value);
		return m.matches();
	}
}
