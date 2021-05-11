package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkingVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class WorkingVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4413472941382811369L;

    private String  calendarId;
    private int     dayweekCnt;
    private String  dayWeekList;
    /**
     * @return the calendarId
     */
    public String getCalendarId() {
        return calendarId;
    }
    /**
     * @param calendarId the calendarId to set
     */
    public void setCalendarId(String calendarId) {
        this.calendarId = calendarId;
    }
    /**
     * @return the dayweekCnt
     */
    public int getDayweekCnt() {
        return dayweekCnt;
    }
    /**
     * @param dayweekCnt the dayweekCnt to set
     */
    public void setDayweekCnt(int dayweekCnt) {
        this.dayweekCnt = dayweekCnt;
    }
    /**
     * @return the dayWeekList
     */
    public String getDayWeekList() {
        return dayWeekList;
    }
    /**
     * @param dayWeekList the dayWeekList to set
     */
    public void setDayWeekList(String dayWeekList) {
        this.dayWeekList = dayWeekList;
    }
}