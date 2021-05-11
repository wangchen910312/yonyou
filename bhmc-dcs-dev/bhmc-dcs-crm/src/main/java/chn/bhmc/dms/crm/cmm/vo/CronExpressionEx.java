package chn.bhmc.dms.crm.cmm.vo;


import java.text.ParseException;
import java.util.Iterator;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeSet;

/**
 *
 * @author Administrator
 */
public class CronExpressionEx extends CronExpression {


  public static final int ALL_SPEC_INT = 99; // '*'

  public static final Integer ALL_SPEC = new Integer(ALL_SPEC_INT);
  public static final int NO_SPEC_INT = 98; // '?'
  public static final Integer NO_SPEC = NO_SPEC_INT;

  private String secondsExp;
  private String minutesExp;
  private String hoursExp;
  private String daysOfMonthExp;
  private String monthsExp;
  private String daysOfWeekExp;

  private transient TreeSet<Integer> seconds;
  private transient TreeSet<Integer> minutes;
  private transient TreeSet<Integer> hours;
  private transient TreeSet<Integer> daysOfMonth;
  private transient TreeSet<Integer> months;
  private transient TreeSet<Integer> daysOfWeek;
  private transient TreeSet<Integer> years;



  protected String getExpressionSetSummary(java.util.Set<Integer> set) {

      if (set.contains(NO_SPEC)) {
          return "?";
      }
      if (set.contains(ALL_SPEC)) {
          return "*";
      }

      StringBuilder buf = new StringBuilder();

      Iterator<Integer> itr = set.iterator();
      boolean first = true;
      while (itr.hasNext()) {
          Integer iVal = itr.next();
          String val = iVal.toString();
          if (!first) {
              buf.append(",");
          }
          buf.append(val);
          first = false;
      }

      return buf.toString();
  }





  public CronExpressionEx(String cronExpression) throws ParseException {
    super(cronExpression);

    StringTokenizer exprsTok = new StringTokenizer(cronExpression, " \t", false);
    secondsExp = exprsTok.nextToken().trim();
    minutesExp = exprsTok.nextToken().trim();
    hoursExp = exprsTok.nextToken().trim();
    daysOfMonthExp = exprsTok.nextToken().trim();
    monthsExp = exprsTok.nextToken().trim();
    daysOfWeekExp = exprsTok.nextToken().trim();
  }

  public Set getSecondsSet() {
    return seconds;
  }

  public String getSecondsField() {
    return getExpressionSetSummary(seconds);
  }

  public Set getMinutesSet() {
    return minutes;
  }

  public String getMinutesField() {
    return getExpressionSetSummary(minutes);
  }

  public Set getHoursSet() {
    return hours;
  }

  public String getHoursField() {
    return getExpressionSetSummary(hours);
  }

  public Set getDaysOfMonthSet() {
    return daysOfMonth;
  }

  public String getDaysOfMonthField() {
    return getExpressionSetSummary(daysOfMonth);
  }

  public Set getMonthsSet() {
    return months;
  }

  public String getMonthsField() {
    return getExpressionSetSummary(months);
  }

  public Set getDaysOfWeekSet() {
    return daysOfWeek;
  }

  public String getDaysOfWeekField() {
    return getExpressionSetSummary(daysOfWeek);
  }

  public String getSecondsExp() {
    return secondsExp;
  }

  public String getMinutesExp() {
    return minutesExp;
  }

  public String getHoursExp() {
    return hoursExp;
  }

  public String getDaysOfMonthExp() {
    return daysOfMonthExp;
  }

  public String getMonthsExp() {
    return monthsExp;
  }

  public String getDaysOfWeekExp() {
    return daysOfWeekExp;
  }
}
