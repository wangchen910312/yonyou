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
 * @ClassName   : Holiday.java
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

public class HolidayVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7551231417811177097L;

    @NotBlank
    private String calendarId;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date oldHdayDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date newHdayDt;

    @NotBlank
    private String hdayInfoTxt;

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
     * @return the oldHdayDt
     */
    public Date getOldHdayDt() {
        return oldHdayDt;
    }

    /**
     * @param oldHdayDt the oldHdayDt to set
     */
    public void setOldHdayDt(Date oldHdayDt) {
        this.oldHdayDt = oldHdayDt;
    }

    /**
     * @return the newHdayDt
     */
    public Date getNewHdayDt() {
        return newHdayDt;
    }

    /**
     * @param newHdayDt the newHdayDt to set
     */
    public void setNewHdayDt(Date newHdayDt) {
        this.newHdayDt = newHdayDt;
    }

    /**
     * @return the hdayInfoTxt
     */
    public String getHdayInfoTxt() {
        return hdayInfoTxt;
    }

    /**
     * @param hdayInfoTxt the hdayInfoTxt to set
     */
    public void setHdayInfoTxt(String hdayInfoTxt) {
        this.hdayInfoTxt = hdayInfoTxt;
    }
}