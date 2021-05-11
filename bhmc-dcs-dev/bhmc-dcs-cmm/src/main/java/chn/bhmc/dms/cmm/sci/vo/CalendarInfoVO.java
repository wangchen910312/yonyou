package chn.bhmc.dms.cmm.sci.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalendarInfoVO.java
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

public class CalendarInfoVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 558927596691468177L;

    private String  calendarId;
    private String  hdayCalendarId;
    private String  langCd;
    @NotBlank
    private String  calendarTp;
    @NotBlank
    private String  calendarNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
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
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
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