package chn.bhmc.dms.core.support.excel;

import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import chn.bhmc.dms.core.util.DateUtil;

public class ExcelDataBinderUtil {

	public static String toString(Object obj){
		return toString(obj, "");
	}

	public static String toString(Object obj, String defaultStr){

		String value = getStrValue(obj);

		if(value.toLowerCase().equals("null")){
			return defaultStr;
		}

		return StringUtils.defaultIfBlank(value, defaultStr);
	}

	public static BigDecimal toBigDecimal(Object obj){
		return toBigDecimal(obj, null);
	}

	public static BigDecimal toBigDecimal(Object obj, BigDecimal defaultValue){
		String value = getStrValue(obj);

		if(value.toLowerCase().equals("null")){
			return defaultValue;
		}


//		DecimalFormatSymbols symbols = new DecimalFormatSymbols();
//		symbols.setGroupingSeparator(',');
//		symbols.setDecimalSeparator('.');
//		String pattern = "#,##0.0#";

//		DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
//		decimalFormat.setParseBigDecimal(true);
//
//		BigDecimal bigDecimal = (BigDecimal) decimalFormat.parse("10,692,467,440,017.120");

		return new BigDecimal(value);
	}

	public static String toIntegerString(Object obj){
		return String.valueOf(getIntValue(obj));
	}

	public static int getIntValue(Object obj){
		return Double.valueOf(getDoubleValue(obj)).intValue();
	}

	public static double getDoubleValue(Object obj){
		return getDoubleValue(obj, "0.0");
	}

	public static double getDoubleValue(Object obj, String defaultValue){
		return Double.parseDouble(toString(obj, defaultValue));
	}

	public static Date getDateValue(Object obj, String pattern){
		pattern = (StringUtils.isBlank(pattern))? "yyyy-MM-dd":pattern;
		return DateUtil.convertToDate(DateUtil.convertToString(obj, pattern), pattern);
	}

	public static String getStrValue(Object obj){

		if(obj instanceof java.lang.Double){
			java.text.DecimalFormat df = new java.text.DecimalFormat("#.######");
			return df.format(obj);
		}

		return StringUtils.trim(String.valueOf(obj));

	}

}
