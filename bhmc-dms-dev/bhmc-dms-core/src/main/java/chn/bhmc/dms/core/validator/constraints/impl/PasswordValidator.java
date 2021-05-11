package chn.bhmc.dms.core.validator.constraints.impl;

import java.util.regex.Matcher;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.core.validator.constraints.Password;

/**
 * <pre>
 * Check that a given string is a well-formed password.
 *
 *  (                   # Start of group
 *        (?=.*\d)      #   must contains one digit from 0-9
 *        (?=.*[a-z])   #   must contains one lowercase characters
 *        (?=.*[A-Z])   #   must contains one uppercase characters
 *        (?=.*[@#$%])  #   must contains one special symbols in the list "@#$%"
 *                    . #     match anything with previous condition checking
 *        {6,20}        #        length at least 6 characters and maximum of 20
 *  )                   # End of group
 * </pre>
 *
 * @ClassName   : PasswordValidator.java
 * @Description : Check that a given string is a well-formed password.
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

public class PasswordValidator implements ConstraintValidator<Password, String> {

	private final Logger log = LoggerFactory.getLogger(PasswordValidator.class);
	private java.util.regex.Pattern pattern;

	public void initialize(Password annotation) {

		String patternIncludeNumber = "(?=.*\\d)";
		String patternIncludeAlphabet = "(?=.*[A-Za-z])";
		String patternIncludeCapitalLetter = "(?=.*[A-Z])";
		String patternIncludeSpecialLetter = "(?=.*[@#$%])";

		if(!annotation.includeNumber()){
			patternIncludeNumber = "";
		}

		if(!annotation.includeAlphabet()){
			patternIncludeAlphabet = "";
		}

		if(!annotation.includeCapitalLetter()){
			patternIncludeCapitalLetter = "";
		}

		if(!annotation.includeSpecialLetter()){
			patternIncludeSpecialLetter = "";
		}

		log.debug(String.format("(%s%s%s%s).{%s,%s}", patternIncludeNumber, patternIncludeAlphabet, patternIncludeCapitalLetter, patternIncludeSpecialLetter, annotation.minLength(), annotation.maxLength()));

		pattern = java.util.regex.Pattern.compile(String.format("(%s%s%s%s).{%s,%s}", patternIncludeNumber, patternIncludeAlphabet, patternIncludeCapitalLetter, patternIncludeSpecialLetter, annotation.minLength(), annotation.maxLength()));


	}

	public boolean isValid(String value, ConstraintValidatorContext context) {
		if (value == null || value.length() == 0) {
			return true;
		}
		Matcher m = pattern.matcher(value);
		return m.matches();
	}
}











