package chn.bhmc.dms.bat.common.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;

/**
 * @Description 日期,时间工具类
 *
 * @author 于鸿海
 * @date 2018年8月29日 下午2:16:40
 */
public class DateUtils {
	
	private static Logger logger = Logger.getLogger(DateUtils.class.getName());
	
	// 日期
	public final static String DEFAILT_DATE = "yyyy-MM-dd";
	// 日期
	public final static String DEFAILT_DATE2 = "yyyyMM";
	// 日期时间
	public final static String DEFAILT_DATE_TIME = "yyyy-MM-dd HH:mm:ss";
	// 时间
	public final static String DEFAULT_TIME = "HH:mm:ss";
	// 到毫秒时间
	public final static String DEFAILT_DATE_TIME_STAMP = "yyMMddHHmmssSSS";
	
	public static final long ONE_DAY = 24 * 60 * 60 * 1000L;

	/**
	 * @Description 获取当前系统时间
	 */
    public static Date getCurrentDateTimeDate() {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(DEFAILT_DATE_TIME);
            return formatter.parse(getCurrentDateTimeStr(DEFAILT_DATE_TIME));
        } catch (Exception e) {
        	logger.error(e.getLocalizedMessage());
            return null;
        }
    }
    
    /**
	 * @Description 获取当前系统时间
	 */
    public static Date getCurrentDate() {
    	try {
    		SimpleDateFormat formatter = new SimpleDateFormat(DEFAILT_DATE);
    		return formatter.parse(getCurrentDateTimeStr(DEFAILT_DATE));
    	} catch (Exception e) {
    		logger.error(e.getLocalizedMessage());
    		return null;
    	}
    }
    
    public static String getCurrentDateTimeStr() {
    	try {
    		return getCurrentDateTimeStr(DEFAILT_DATE_TIME);
    	} catch (Exception e) {
    		logger.error(e.getLocalizedMessage());
    		return null;
    	}
    }

    public static String getCurrentDateTimeStr(String formatStr) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(formatStr);
            return formatter.format(new Date());
        } catch (Exception e) {
        	logger.error(e.getLocalizedMessage());
            return null;
        }
    }
    
    public static String getTimeStamp() {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(DEFAILT_DATE_TIME_STAMP);
            return formatter.format(new Date());
        } catch (Exception e) {
        	logger.error(e.getLocalizedMessage());
            return null;
        }
    }
    
    /**
	 * @Description Date类型时间转换为String型，并格式化（yyyy-MM-dd HH:mm:ss E xxxx年xx月xx日 xx：xx：xx 星期x）
	 */
    public static String convertDate2String(Date date) {
    	return convertDate2String(date, DEFAILT_DATE_TIME);
    }
    
    public static String convertDateString2String(String data) {
    	try {
    		SimpleDateFormat sdf = new SimpleDateFormat ("EEE MMM dd HH:mm:ss Z yyyy", Locale.UK);
            return convertDate2String(sdf.parse(data));
        } catch (Exception e) {
        	logger.error(e.getLocalizedMessage());
            return null;
        }
    }
    
    public static String convertDate2String(Date date, String format) {
    	String str = null;
    	try {
    		SimpleDateFormat formatter = new SimpleDateFormat(format);
    		str = formatter.format(date);
    		return str;
    	} catch (Exception e) {
    		logger.error(e.getLocalizedMessage());
    		return null;
    	}
    }
    
    /**
	 * @Description String类型时间转换为Date型，并格式化（yyyy-MM-dd HH:mm:ss E xxxx年xx月xx日 xx：xx：xx 星期x）
	 */
    public static Date convertString2Date(String dateStr) {
    	return convertString2Date(dateStr, DEFAILT_DATE_TIME);
    }
    
    /**
	 * @Description String类型时间转换为Date型(yyyy-MM-dd)，并格式化（yyyy-MM-dd HH:mm:ss E xxxx年xx月xx日 xx：xx：xx 星期x）
	 */
    public static Date convertString2YMD(String dateStr) {
    	return convertString2Date(dateStr, DEFAILT_DATE);
    }
    
    public static Date convertString2Date(String dateStr, String format) {
    	Date date = new Date();
    	try {
    		SimpleDateFormat formatter = new SimpleDateFormat(format);
    		date = formatter.parse(dateStr);
    		return date;
    	} catch (Exception e) {
    		logger.error(e.getLocalizedMessage());
    		return null;
    	}
    }
    
    /**
	 * @Description 获取年份
	 */
    public static int getYear() {
    	return Calendar.getInstance().get(Calendar.YEAR);
    }
    
    /**
	 * @Description 返回当月最后一天日期 
	 */
    public static Date lastDay(Date date) {
    	Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE));
		return calendar.getTime();
	}
    
    /**
     * <p>Title：返回两个日期的差异天数</p>
     * @author Gongrs 2020年6月30日 下午1:45:51
	 * @param date1 参照日期
	 * @param date2 比较日期
	 * @remark 参照日期与比较日期之间的毫秒数差异(也可以是两个时间的对比)
	 * @return 1.正数表示参照日期在比较日期之后
	 * @return 2.0表示两个日期同天，负数表示参照日期在比较日期之前
	 * @return 3.负数表示参照日期在比较日期之前
     */
	public static int dayDiff(Date date1, Date date2) {
		long diff = date1.getTime() - date2.getTime();
		return (int) (diff / ONE_DAY);
	}
	
	/**
	 * <p>Title：将毫秒数转换为n天n时n分n秒</p>
	 * @author Gongrs 2020年6月30日 下午1:45:45
	 * @param mss 毫秒数
	 */
	public static long[] formatDuring(long mss) {
		long days = mss / (1000 * 60 * 60 * 24);
		long hours = (mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
		long minutes = (mss % (1000 * 60 * 60)) / (1000 * 60);
		long seconds = (mss % (1000 * 60)) / 1000;
		return new long[] {days, hours, minutes, seconds};
	}
	
	/**
	 * @Description 获取当天的开始时间
	 */
    public static Date getDayBegin() {
    	Calendar cal = new GregorianCalendar();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
	 * @Description 获取当天的结束时间
	 */
    public static Date getDayEnd() {
        Calendar cal = new GregorianCalendar();
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        return cal.getTime();
    }
    
    /**
	 * @Description 获取昨天的开始时间
	 */
    public static Date getBeginDayOfYesterday() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayBegin());
        cal.add(Calendar.DAY_OF_MONTH, -1);
        return cal.getTime();
    }
    
    /**
	 * @Description 获取昨天的结束时间
	 */
    public static Date getEndDayOfYesterDay() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayEnd());
        cal.add(Calendar.DAY_OF_MONTH, -1);
        return cal.getTime();
    }
    
    /**
	 * @Description 获取明天的开始时间
	 */
    public static Date getBeginDayOfTomorrow() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayBegin());
        cal.add(Calendar.DAY_OF_MONTH, 1);
        return cal.getTime();
    }
    
    /**
	 * @Description 获取明天的结束时间
	 */
    public static Date getEndDayOfTomorrow() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayEnd());
        cal.add(Calendar.DAY_OF_MONTH, 1);
        return cal.getTime();
    }
    
    /**
	 * @Description 获取本周的开始时间
	 */
    public static Date getBeginDayOfWeek() {
    	Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
        if (dayofweek == 1) {
            dayofweek += 7;
        }
        cal.add(Calendar.DATE, 2 - dayofweek);
        return getDayStartTime(cal.getTime());
    }
    
    /**
	 * @Description 获取本周的结束时间
	 */
    public static Date getEndDayOfWeek(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(getBeginDayOfWeek());  
        cal.add(Calendar.DAY_OF_WEEK, 6); 
        Date weekEndSta = cal.getTime();
        return getDayEndTime(weekEndSta);
    }

    /**
	 * @Description 获取本月的开始时间
	 */
	public static Date getBeginDayOfMonth() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(getNowYear(), getNowMonth() - 1, 1);
		return getDayStartTime(calendar.getTime());
	}
     
	/**
	 * @Description 获取本月的结束时间
	 */
	public static Date getEndDayOfMonth() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(getNowYear(), getNowMonth() - 1, 1);
		int day = calendar.getActualMaximum(5);
		calendar.set(getNowYear(), getNowMonth() - 1, day);
		return getDayEndTime(calendar.getTime());
	}
     
	/**
	 * @Description 获取本年的开始时间
	 */
	public static Date getBeginDayOfYear() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, getNowYear());
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		cal.set(Calendar.DATE, 1);
		return getDayStartTime(cal.getTime());
	}
    
	/**
	 * @Description 获取本年的结束时间
	 */
	public static Date getEndDayOfYear() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, getNowYear());
		cal.set(Calendar.MONTH, Calendar.DECEMBER);
		cal.set(Calendar.DATE, 31);
		return getDayEndTime(cal.getTime());
	}
	
	/**
	 * @Description 获取某个日期的开始时间
	 */
	public static Timestamp getDayStartTime(Date d) {
    	Calendar calendar = Calendar.getInstance();
    	if (d != null) {
    		calendar.setTime(d);
    	}
    	calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return new Timestamp(calendar.getTimeInMillis());
    }
    
	/**
	 * @Description 获取某个日期的结束时间
	 */
    public static Timestamp getDayEndTime(Date d) {
        Calendar calendar = Calendar.getInstance();
        if (d != null) {
    		calendar.setTime(d);
    	}
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 23, 59, 59);
        calendar.set(Calendar.MILLISECOND, 999);
        return new Timestamp(calendar.getTimeInMillis());
    }
    
    /**
	 * @Description 获取今年是哪一年
	 */
	public static Integer getNowYear() {
		Date date = new Date();
		GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
        gc.setTime(date);
        return Integer.valueOf(gc.get(1));
    }
    
	/**
	 * @Description 获取本月是哪一月
	 */
	public static int getNowMonth() {
		Date date = new Date();
		GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
		gc.setTime(date);
		return gc.get(2) + 1;
	}
	
	/**
	 * @Description 两个日期相减得到的天数
	 */
	public static int getDiffDays(Date beginDate, Date endDate) {
		if (beginDate == null || endDate == null) {
			throw new IllegalArgumentException("getDiffDays param is null!");
		}
		long diff = (endDate.getTime() - beginDate.getTime()) / (1000 * 60 * 60 * 24);
		int days = new Long(diff).intValue();
		return days;
	}
	
	/**
	 * @Description 两个日期相减得到的毫秒数
	 */
	public static long dateDiff(Date beginDate, Date endDate) {
		long date1ms = beginDate.getTime();
		long date2ms = endDate.getTime();
		return date2ms - date1ms;
	}
    
	/**
	 * @Description 获取两个日期中的最大日期
	 */
	public static Date max(Date beginDate, Date endDate) {
		if (beginDate == null) {
			return endDate;
        }
        if (endDate == null) {
            return beginDate;
        }
        if (beginDate.after(endDate)) {
            return beginDate;
        }
        return endDate;
    }

	/**
	 * @Description 获取两个日期中的最小日期
	 */
	public static Date min(Date beginDate, Date endDate) {
        if (beginDate == null) {
            return endDate;
        }
        if (endDate == null) {
            return beginDate;
        }
        if (beginDate.after(endDate)) {
            return endDate;
        }
        return beginDate;
	}

	/**
	 * @Description 返回某月该季度的第一个月
	 */
	public static Date getFirstSeasonDate(Date date) {
		final int[] SEASON = { 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4 };
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int sean = SEASON[cal.get(Calendar.MONTH)];
        cal.set(Calendar.MONTH, sean * 3 - 3);
        return cal.getTime();
	}

	/**
	 * @Description 返回某个日期下几天的日期
	 */
	public static Date getNextDay(Date date, int i) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.set(Calendar.DATE, cal.get(Calendar.DATE) + i);
        return cal.getTime();
    }
 
	/**
	 * @Description 返回某个日期前几天的日期
	 */
	public static Date getFrontDay(Date date, int i) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.set(Calendar.DATE, cal.get(Calendar.DATE) - i);
        return cal.getTime();
    }

	/**
	 * @Description 获取某年某月到某年某月按天的切片日期集合（间隔天数的集合）
	 */
	public static List<Date> getTimeList(int beginYear, int beginMonth, int endYear, int endMonth, int k) {
		List<Date> list = new ArrayList<Date>();
		if (beginYear == endYear) {
			for (int j = beginMonth; j <= endMonth; j++) {
				list.addAll(getTimeList(beginYear, j, k));
			}
        } else {
            for (int j = beginMonth; j < 12; j++) {
                list.addAll(getTimeList(beginYear, j, k));
            }
            for (int i = beginYear + 1; i < endYear; i++) {
                for (int j = 0; j < 12; j++) {
                    list.addAll(getTimeList(i, j, k));
                }
            }
            for (int j = 0; j <= endMonth; j++) {
                list.addAll(getTimeList(endYear, j, k));
            }
        }
        return list;
	}

	/**
	 * @Description 获取某年某月按天切片日期集合（某个月间隔多少天的日期集合）
	 */
	public static List<Date> getTimeList(int beginYear, int beginMonth, int k) {
        List<Date> list = new ArrayList<Date>();
        Calendar begincal = new GregorianCalendar(beginYear, beginMonth, 1);
        int max = begincal.getActualMaximum(Calendar.DATE);
        for (int i = 1; i < max; i = i + k) {
            list.add(begincal.getTime());
            begincal.add(Calendar.DATE, k);
        }
        begincal = new GregorianCalendar(beginYear, beginMonth, max);
        list.add(begincal.getTime());
        return list;
	}
	
	/**
	 * @Description 获取当天1点的开始时间
	 */
    public static Date getBeginDayOne() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayBegin());
        cal.add(Calendar.DAY_OF_MONTH, 0);
        cal.add(Calendar.HOUR_OF_DAY, 1);
        return cal.getTime();
    }
    
    /**
	 * @Description 获取下一天1点的开始时间
	 */
    public static Date getBeginDayOneOfTomorrow() {
    	Calendar cal = new GregorianCalendar();
    	cal.setTime(getDayBegin());
    	cal.add(Calendar.DAY_OF_MONTH, 1);
    	cal.add(Calendar.HOUR_OF_DAY, 1);
    	return cal.getTime();
    }
    
    /**
     * <p>Title：获取当月天数</p>
     * @author Gongrs 2019年8月6日 上午10:29:39
     * @param MonthStr:月份(例:2019-08)
     */
    public static int getDaysOfMonth(String MonthStr) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(sdf.parse(MonthStr+"-01"));
    	return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }
	
    /**
     * <p>Title：根据日期计算星期</p>
     * @author Grs 2019年3月12日 上午11:27:37
     * @param
     */
	public static int getWeek(Date date){
		int[] weeks = {7, 1, 2, 3, 4, 5, 6};
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int week_index = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (week_index<0) {
			week_index = 0;
		}
		return weeks[week_index];
	}
	
    /**
     * <p>Title：根据日期计算日期所在周的周一至周日日期</p>
     * @author Grs 2019年3月12日 上午10:29:56
     * @param startDate:开始日期字符串，eg：2019-03-12
     */
	public static Date[] getDatesByStartDate(Date paramDate) {
		Date[] dates = new Date[7];
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(paramDate);
		for (int i=0; i<7; i++) {
			if (i==0) {
				cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			} else {
				cal.set(Calendar.DATE, cal.get(Calendar.DATE) + 1);
			}
			dates[i] = cal.getTime();
			// String weeklast = new SimpleDateFormat("YYYY-MM-dd").format(cal.getTime());
			// System.out.println(weeklast);
		}
		
		return dates;
	}

}