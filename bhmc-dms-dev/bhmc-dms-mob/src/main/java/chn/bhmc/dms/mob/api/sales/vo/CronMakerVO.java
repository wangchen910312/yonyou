package chn.bhmc.dms.mob.api.sales.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CronMakerVO.java
 * @Description : 크론메이커
 * @author In Moon Lee
 * @since 2016.06.01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.01.     In Moon Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

    @ValidField(field="sMinute"          , mesgKey="crm.lbl.minute")        // 분
   ,@ValidField(field="sHour"            , mesgKey="crm.lbl.hour")          // 시
   ,@ValidField(field="sDay"             , mesgKey="crm.lbl.day")           // 일
   ,@ValidField(field="sMonth"           , mesgKey="crm.lbl.month")         // 월
   ,@ValidField(field="sUseWeek"         , mesgKey="crm.lbl.useWeekYn")     // 주 사용여부
   ,@ValidField(field="sWeek"            , mesgKey="crm.lbl.week")          // 주
   ,@ValidField(field="cronExpression"   , mesgKey="crm.lbl.cronExpression")// 주기

})

public class CronMakerVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4082834213292701965L;


    String second = "0";

    @NotNull(groups=Draft.class)
    String[] sMinute;
    @NotNull(groups=Draft.class)
    String[] sHour;
    @NotNull(groups=Draft.class)
    String[] sDay;
    @NotNull(groups=Draft.class)
    String[] sMonth;
    @NotNull(groups=Draft.class)
    String[] sWeek;
    @NotNull(groups=Draft.class)
    String sUseWeek;

    @NotNull(groups=Modify.class)
    String cronExpression;

    String minute;
    String hour;
    String day;
    String month;
    String week;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    List<Date> cronSchedule;                            // 주기 날짜

    /**
     * @return the second
     */
    public String getSecond() {
        return second;
    }

    /**
     * @param second the second to set
     */
    public void setSecond(String second) {
        this.second = second;
    }

    /**
     * @return the sMinute
     */
    public String[] getsMinute() {
        return sMinute;
    }

    /**
     * @param sMinute the sMinute to set
     */
    public void setsMinute(String[] sMinute) {
        this.sMinute = sMinute;
    }

    /**
     * @return the sHour
     */
    public String[] getsHour() {
        return sHour;
    }

    /**
     * @param sHour the sHour to set
     */
    public void setsHour(String[] sHour) {
        this.sHour = sHour;
    }

    /**
     * @return the sDay
     */
    public String[] getsDay() {
        return sDay;
    }

    /**
     * @param sDay the sDay to set
     */
    public void setsDay(String[] sDay) {
        this.sDay = sDay;
    }

    /**
     * @return the sMonth
     */
    public String[] getsMonth() {
        return sMonth;
    }

    /**
     * @param sMonth the sMonth to set
     */
    public void setsMonth(String[] sMonth) {
        this.sMonth = sMonth;
    }

    /**
     * @return the sWeek
     */
    public String[] getsWeek() {
        return sWeek;
    }

    /**
     * @param sWeek the sWeek to set
     */
    public void setsWeek(String[] sWeek) {
        this.sWeek = sWeek;
    }

    /**
     * @return the sUseWeek
     */
    public String getsUseWeek() {
        return sUseWeek;
    }

    /**
     * @param sUseWeek the sUseWeek to set
     */
    public void setsUseWeek(String sUseWeek) {
        this.sUseWeek = sUseWeek;
    }

    /**
     * @return the cronExpression
     */
    public String getCronExpression() {
        return cronExpression;
    }

    /**
     * @param cronExpression the cronExpression to set
     */
    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }

    /**
     * @return the minute
     */
    public String getMinute() {
        return minute;
    }

    /**
     * @param minute the minute to set
     */
    public void setMinute(String minute) {
        this.minute = minute;
    }

    /**
     * @return the hour
     */
    public String getHour() {
        return hour;
    }

    /**
     * @param hour the hour to set
     */
    public void setHour(String hour) {
        this.hour = hour;
    }

    /**
     * @return the day
     */
    public String getDay() {
        return day;
    }

    /**
     * @param day the day to set
     */
    public void setDay(String day) {
        this.day = day;
    }

    /**
     * @return the month
     */
    public String getMonth() {
        return month;
    }

    /**
     * @param month the month to set
     */
    public void setMonth(String month) {
        this.month = month;
    }

    /**
     * @return the week
     */
    public String getWeek() {
        return week;
    }

    /**
     * @param week the week to set
     */
    public void setWeek(String week) {
        this.week = week;
    }

    /**
     * @return the cronSchedule
     */
    public List<Date> getCronSchedule() {
        return cronSchedule;
    }

    /**
     * @param cronSchedule the cronSchedule to set
     */
    public void setCronSchedule(List<Date> cronSchedule) {
        this.cronSchedule = cronSchedule;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CronMakerVO [second=" + second + ", sMinute=" + Arrays.toString(sMinute) + ", sHour="
                + Arrays.toString(sHour) + ", sDay=" + Arrays.toString(sDay) + ", sMonth=" + Arrays.toString(sMonth)
                + ", sWeek=" + Arrays.toString(sWeek) + ", sUseWeek=" + sUseWeek + ", cronExpression=" + cronExpression
                + ", minute=" + minute + ", hour=" + hour + ", day=" + day + ", month=" + month + ", week=" + week
                + ", cronSchedule=" + cronSchedule + "]";
    }

}
