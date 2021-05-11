package chn.bhmc.dms.cmm.sci.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalendarVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 1.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CalendarVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -609335744172076025L;


    private String calendarId;
    private String hdayCalendarId;
    private String calendarTp;
    private String calendarNm;
    private Date startDt;
    private Date endDt;
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
     * @return the hdayCalendarId
     */
    public String getHdayCalendarId() {
        return hdayCalendarId;
    }
    /**
     * @param hdayCalendarId the hdayCalendarId to set
     */
    public void setHdayCalendarId(String hdayCalendarId) {
        this.hdayCalendarId = hdayCalendarId;
    }
    /**
     * @return the calendarTp
     */
    public String getCalendarTp() {
        return calendarTp;
    }
    /**
     * @param calendarTp the calendarTp to set
     */
    public void setCalendarTp(String calendarTp) {
        this.calendarTp = calendarTp;
    }
    /**
     * @return the calendarNm
     */
    public String getCalendarNm() {
        return calendarNm;
    }
    /**
     * @param calendarNm the calendarNm to set
     */
    public void setCalendarNm(String calendarNm) {
        this.calendarNm = calendarNm;
    }
    /**
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }
    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }
    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }
}