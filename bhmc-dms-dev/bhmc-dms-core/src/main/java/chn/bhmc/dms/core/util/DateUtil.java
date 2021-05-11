package chn.bhmc.dms.core.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

/**
* DateUtil<br>
* <h4>Date and Time Patterns</h4>
* <p>
* Date and time formats are specified by <em>date and time pattern</em>
* strings.
* Within date and time pattern strings, unquoted letters from
* <code>'A'</code> to <code>'Z'</code> and from <code>'a'</code> to
* <code>'z'</code> are interpreted as pattern letters representing the
* components of a date or time string.
* Text can be quoted using single quotes (<code>'</code>) to avoid
* interpretation.
* <code>"''"</code> represents a single quote.
* All other characters are not interpreted; they're simply copied into the
* output string during formatting or matched against the input string
* during parsing.
* <p>
* The following pattern letters are defined (all other characters from
* <code>'A'</code> to <code>'Z'</code> and from <code>'a'</code> to
* <code>'z'</code> are reserved):
* <blockquote>
* <table border=0 cellspacing=3 cellpadding=0 summary="Chart shows pattern letters, date/time component, presentation, and examples.">
*	 <tr bgcolor="#ccccff">
*		 <th align=left>Letter
*		 <th align=left>Date or Time Component
*		 <th align=left>Presentation
*		 <th align=left>Examples
*	 <tr>
*		 <td><code>G</code>
*		 <td>Era designator
*		 <td><a href="#text">Text</a>
*		 <td><code>AD</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>y</code>
*		 <td>Year
*		 <td><a href="#year">Year</a>
*		 <td><code>1996</code>; <code>96</code>
*	 <tr>
*		 <td><code>M</code>
*		 <td>Month in year
*		 <td><a href="#month">Month</a>
*		 <td><code>July</code>; <code>Jul</code>; <code>07</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>w</code>
*		 <td>Week in year
*		 <td><a href="#number">Number</a>
*		 <td><code>27</code>
*	 <tr>
*		 <td><code>W</code>
*		 <td>Week in month
*		 <td><a href="#number">Number</a>
*		 <td><code>2</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>D</code>
*		 <td>Day in year
*		 <td><a href="#number">Number</a>
*		 <td><code>189</code>
*	 <tr>
*		 <td><code>d</code>
*		 <td>Day in month
*		 <td><a href="#number">Number</a>
*		 <td><code>10</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>F</code>
*		 <td>Day of week in month
*		 <td><a href="#number">Number</a>
*		 <td><code>2</code>
*	 <tr>
*		 <td><code>E</code>
*		 <td>Day in week
*		 <td><a href="#text">Text</a>
*		 <td><code>Tuesday</code>; <code>Tue</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>a</code>
*		 <td>Am/pm marker
*		 <td><a href="#text">Text</a>
*		 <td><code>PM</code>
*	 <tr>
*		 <td><code>H</code>
*		 <td>Hour in day (0-23)
*		 <td><a href="#number">Number</a>
*		 <td><code>0</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>k</code>
*		 <td>Hour in day (1-24)
*		 <td><a href="#number">Number</a>
*		 <td><code>24</code>
*	 <tr>
*		 <td><code>K</code>
*		 <td>Hour in am/pm (0-11)
*		 <td><a href="#number">Number</a>
*		 <td><code>0</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>h</code>
*		 <td>Hour in am/pm (1-12)
*		 <td><a href="#number">Number</a>
*		 <td><code>12</code>
*	 <tr>
*		 <td><code>m</code>
*		 <td>Minute in hour
*		 <td><a href="#number">Number</a>
*		 <td><code>30</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>s</code>
*		 <td>Second in minute
*		 <td><a href="#number">Number</a>
*		 <td><code>55</code>
*	 <tr>
*		 <td><code>S</code>
*		 <td>Millisecond
*		 <td><a href="#number">Number</a>
*		 <td><code>978</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>z</code>
*		 <td>Time zone
*		 <td><a href="#timezone">General time zone</a>
*		 <td><code>Pacific Standard Time</code>; <code>PST</code>; <code>GMT-08:00</code>
*	 <tr>
*		 <td><code>Z</code>
*		 <td>Time zone
*		 <td><a href="#rfc822timezone">RFC 822 time zone</a>
*		 <td><code>-0800</code>
* </table>
* </blockquote>
* Pattern letters are usually repeated, as their number determines the
* exact presentation:
* <ul>
* <li><strong><a name="text">Text:</a></strong>
*	 For formatting, if the number of pattern letters is 4 or more,
*	 the full form is used; otherwise a short or abbreviated form
*	 is used if available.
*	 For parsing, both forms are accepted, independent of the number
*	 of pattern letters.
* <li><strong><a name="number">Number:</a></strong>
*	 For formatting, the number of pattern letters is the minimum
*	 number of digits, and shorter numbers are zero-padded to this amount.
*	 For parsing, the number of pattern letters is ignored unless
*	 it's needed to separate two adjacent fields.
* <li><strong><a name="year">Year:</a></strong>
*	 For formatting, if the number of pattern letters is 2, the year
*	 is truncated to 2 digits; otherwise it is interpreted as a
*	 <a href="#number">number</a>.
*	 <p>For parsing, if the number of pattern letters is more than 2,
*	 the year is interpreted literally, regardless of the number of
*	 digits. So using the pattern "MM/dd/yyyy", "01/11/12" parses to
*	 Jan 11, 12 A.D.
*	 <p>For parsing with the abbreviated year pattern ("y" or "yy"),
*	 <code>SimpleDateFormat</code> must interpret the abbreviated year
*	 relative to some century.  It does this by adjusting dates to be
*	 within 80 years before and 20 years after the time the <code>SimpleDateFormat</code>
*	 instance is created. For example, using a pattern of "MM/dd/yy" and a
*	 <code>SimpleDateFormat</code> instance created on Jan 1, 1997,  the string
*	 "01/11/12" would be interpreted as Jan 11, 2012 while the string "05/04/64"
*	 would be interpreted as May 4, 1964.
*	 During parsing, only strings consisting of exactly two digits, as defined by
*	 <A HREF="../../java/lang/Character.html#isDigit(char)"><CODE>Character.isDigit(char)</CODE></A>, will be parsed into the default century.
*	 Any other numeric string, such as a one digit string, a three or more digit
*	 string, or a two digit string that isn't all digits (for example, "-1"), is
*	 interpreted literally.  So "01/02/3" or "01/02/003" are parsed, using the
*	 same pattern, as Jan 2, 3 AD.  Likewise, "01/02/-3" is parsed as Jan 2, 4 BC.
* <li><strong><a name="month">Month:</a></strong>
*	 If the number of pattern letters is 3 or more, the month is
*	 interpreted as <a href="#text">text</a>; otherwise,
*	 it is interpreted as a <a href="#number">number</a>.
* <li><strong><a name="timezone">General time zone:</a></strong>
*	 Time zones are interpreted as <a href="#text">text</a> if they have
*	 names. For time zones representing a GMT offset value, the
*	 following syntax is used:
*	 <pre>
*	 <a name="GMTOffsetTimeZone"><i>GMTOffsetTimeZone:</i></a>
*			 <code>GMT</code> <i>Sign</i> <i>Hours</i> <code>:</code> <i>Minutes</i>
*	 <i>Sign:</i> one of
*			 <code>+ -</code>
*	 <i>Hours:</i>
*			 <i>Digit</i>
*			 <i>Digit</i> <i>Digit</i>
*	 <i>Minutes:</i>
*			 <i>Digit</i> <i>Digit</i>
*	 <i>Digit:</i> one of
*			 <code>0 1 2 3 4 5 6 7 8 9</code></pre>
*	 <i>Hours</i> must be between 0 and 23, and <i>Minutes</i> must be between
*	 00 and 59. The format is locale independent and digits must be taken
*	 from the Basic Latin block of the Unicode standard.
*	 <p>For parsing, <a href="#rfc822timezone">RFC 822 time zones</a> are also
*	 accepted.
* <li><strong><a name="rfc822timezone">RFC 822 time zone:</a></strong>
*	 For formatting, the RFC 822 4-digit time zone format is used:
*	 <pre>
*	 <i>RFC822TimeZone:</i>
*			 <i>Sign</i> <i>TwoDigitHours</i> <i>Minutes</i>
*	 <i>TwoDigitHours:</i>
*			 <i>Digit Digit</i></pre>
*	 <i>TwoDigitHours</i> must be between 00 and 23. Other definitions
*	 are as for <a href="#timezone">general time zones</a>.
*	 <p>For parsing, <a href="#timezone">general time zones</a> are also
*	 accepted.
* </ul>
* <code>SimpleDateFormat</code> also supports <em>localized date and time
* pattern</em> strings. In these strings, the pattern letters described above
* may be replaced with other, locale dependent, pattern letters.
* <code>SimpleDateFormat</code> does not deal with the localization of text
* other than the pattern letters; that's up to the client of the class.
* <p>
*
* <h4>Examples</h4>
*
* The following examples show how date and time patterns are interpreted in
* the U.S. locale. The given date and time are 2001-07-04 12:08:56 local time
* in the U.S. Pacific Time time zone.
* <blockquote>
* <table border=0 cellspacing=3 cellpadding=0 summary="Examples of date and time patterns interpreted in the U.S. locale">
*	 <tr bgcolor="#ccccff">
*		 <th align=left>Date and Time Pattern
*		 <th align=left>Result
*	 <tr>
*		 <td><code>"yyyy.MM.dd G 'at' HH:mm:ss z"</code>
*		 <td><code>2001.07.04 AD at 12:08:56 PDT</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>"EEE, MMM d, ''yy"</code>
*		 <td><code>Wed, Jul 4, '01</code>
*	 <tr>
*		 <td><code>"h:mm a"</code>
*		 <td><code>12:08 PM</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>"hh 'o''clock' a, zzzz"</code>
*		 <td><code>12 o'clock PM, Pacific Daylight Time</code>
*	 <tr>
*		 <td><code>"K:mm a, z"</code>
*		 <td><code>0:08 PM, PDT</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>"yyyyy.MMMMM.dd GGG hh:mm aaa"</code>
*		 <td><code>02001.July.04 AD 12:08 PM</code>
*	 <tr>
*		 <td><code>"EEE, d MMM yyyy HH:mm:ss Z"</code>
*		 <td><code>Wed, 4 Jul 2001 12:08:56 -0700</code>
*	 <tr bgcolor="#eeeeff">
*		 <td><code>"yyMMddHHmmssZ"</code>
*		 <td><code>010704120856-0700</code>
* </table>
* </blockquote>
*
* <h4><a name="synchronization">Synchronization</a></h4>
*
* <p>
* Date formats are not synchronized.
* It is recommended to create separate format instances for each thread.
* If multiple threads access a format concurrently, it must be synchronized
* externally.
* <P>
* @version 1.0 2005/03/09
* @author Kang Seok Han
*/
public class DateUtil {

	public static final String DEFAULT_PATTERN 		= "yyyy-MM-dd";
	public static final String DEFAULT_TS_PATTERN 	= "yyyy-MM-dd HH:mm:ss.S";

	public DateUtil(){}

	public static Date convertToDate(String value){
		return convertToDate(value, null);
	}

	public static java.sql.Date convertToSqlDate(String value){
		return convertToSqlDate(convertToDate(value));
	}

	public static java.sql.Date convertToSqlDate(Date date){
		if(date == null){
			return null;
		}else{
			return new java.sql.Date(date.getTime());
		}
	}

	public static Date convertToDate(String value, String pattern) {
        DateFormat df = null;

        try {

            if (StringUtils.isEmpty(value)) {
                return null;
            }

            if(pattern != null){
            	df = new SimpleDateFormat(pattern);
            }else{
            	df = new SimpleDateFormat(DEFAULT_PATTERN);
            }

            return df.parse(value);
        } catch (Exception e) {
        	e.printStackTrace();
        }

        return null;

    }

	public static Timestamp convertToTimestamp(String value){
		return convertToTimestamp(value, null);
	}

	public static Timestamp convertToTimestamp(String value, String pattern){
		Date date = convertToDate(value, pattern);

		if(date != null){
			return new Timestamp(date.getTime());
		}

		return null;
	}

    public static String convertToString(Object value, String pattern) {
    	return convertToString(value, pattern, LocaleContextHolder.getLocale());
    }

    public static String convertToString(Object value, String pattern, Locale locale) {

        if (value instanceof Date) {
            DateFormat df = null;

            try {

	            if(pattern != null){
	            	df = new SimpleDateFormat(pattern, locale);
	            }else{
	            	df = new SimpleDateFormat(DEFAULT_PATTERN, locale);
	            }

	            if (value instanceof Timestamp) {
	                df = new SimpleDateFormat(DEFAULT_TS_PATTERN, locale);
	            }


                return df.format(value);
            } catch (Exception e) {
            	e.printStackTrace();
            }

            return null;
        } else {
            return value.toString();
        }
    }

    public static String convertToDateTimeString(Object value) {

        if (value instanceof Date) {
            DateFormat df = null;

            try {
                df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                return df.format(value);
            } catch (Exception e) {
            	e.printStackTrace();
            }

            return null;
        } else {
            return null;
        }
    }
    public static String convertToDateString(Object value) {

        if (value instanceof Date) {
            DateFormat df = null;

            try {
                df = new SimpleDateFormat("yyyy-MM-dd");
                return df.format(value);
            } catch (Exception e) {
            	e.printStackTrace();
            }

            return null;
        } else {
            return null;
        }
    }


	public static String getDate(String pattern){
		return getDate(Calendar.getInstance().getTime(), pattern, -1, -1);
	}

	public static String getDate(String date, String sourcePattern, String destPattern){
		return getDate(convertToDate(date, sourcePattern), destPattern);
	}


	public static String getDate(String pattern, int field, int amount){
		return getDate(Calendar.getInstance().getTime(), pattern, field, amount);
	}


	public static String getDate(Date date, String pattern){
		return getDate(date, pattern, -1, -1);
	}



	public static String getDate(Date date, String pattern, int field, int amount){
		if(date == null || pattern == null){
			return "";
		}

		if(field != -1){
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(field, amount);

			date = calendar.getTime();
		}

		SimpleDateFormat sf=new SimpleDateFormat(pattern);
		return sf.format(date);
	}


	public static Date add(Date date, int field, int amount){

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(field, amount);

			return calendar.getTime();


	}

	public static Date getFirstDateOfYear(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.MONTH, 0);
        calendar.set(Calendar.DATE, 1);

        return calendar.getTime();
    }

	public static Date getFirstDateOfMonth(Date date){
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    calendar.set(Calendar.DATE, 1);

	    return calendar.getTime();
    }

	public static Date getLastDateOfMonth(Date date){
		return DateUtil.add(DateUtil.add(date, Calendar.MONTH, 1), Calendar.DATE, -1);
	}

	public static String getDate(long millis, String pattern) {
		if(millis == 0L || pattern == null){
			return "";
		}

		return getDate(new Date(millis), pattern, -1, -1);
	}


	public static int getMaximumDateOfMonth(int year, int month){
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month-1);
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}


	public static int getMinimalDaysInFirstWeek(int year, int month){
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month-1);
		calendar.set(Calendar.DATE, 1);
		return calendar.get(Calendar.DAY_OF_WEEK);
	}


	public static int getMaximumDaysInLastWeek(int year, int month){
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month);
		calendar.set(Calendar.DATE, getMaximumDateOfMonth(year, month));
		return calendar.get(Calendar.DAY_OF_WEEK);
	}


	public static int getDayOfWeek(Date date){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.DAY_OF_WEEK);
	}


	public static long getCurrentTimeMillis(){
		return Calendar.getInstance(Locale.KOREA).getTimeInMillis();
	}


	public static int daysBetween(Date early, Date late) {
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(early);
		c2.setTime(late);

		return (int) (toJulian(c2) - toJulian(c1));
	}

	public static final float toJulian(Calendar c) {
		int Y = c.get(Calendar.YEAR);
		int M = c.get(Calendar.MONTH);
		int D = c.get(Calendar.DATE);
		int A = Y / 100;
		int B = A / 4;
		int C = 2 - A + B;
		float E = (int) (365.25f * (Y + 4716));
		float F = (int) (30.6001f * (M + 1));
		float JD = (C + D + E + F) - 1524.5f;
		return JD;
	}


}
