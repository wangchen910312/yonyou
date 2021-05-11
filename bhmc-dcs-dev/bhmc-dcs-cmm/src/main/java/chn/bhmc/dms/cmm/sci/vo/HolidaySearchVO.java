package chn.bhmc.dms.cmm.sci.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : HolidaySearchVO.java
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

public class HolidaySearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1258474999004305677L;

    private String sCalendarId;
    private String sCalendarTp;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOldHdayDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sNewHdayDt;

    private String sHdayInfoTxt;

    /**
     * @return the sCalendarId
     */
    public String getsCalendarId() {
        return sCalendarId;
    }

    /**
     * @param sCalendarId the sCalendarId to set
     */
    public void setsCalendarId(String sCalendarId) {
        this.sCalendarId = sCalendarId;
    }

    /**
     * @return the sCalendarTp
     */
    public String getsCalendarTp() {
        return sCalendarTp;
    }

    /**
     * @param sCalendarTp the sCalendarTp to set
     */
    public void setsCalendarTp(String sCalendarTp) {
        this.sCalendarTp = sCalendarTp;
    }

    /**
     * @return the sOldHdayDt
     */
    public Date getsOldHdayDt() {
        return sOldHdayDt;
    }

    /**
     * @param sOldHdayDt the sOldHdayDt to set
     */
    public void setsOldHdayDt(Date sOldHdayDt) {
        this.sOldHdayDt = sOldHdayDt;
    }

    /**
     * @return the sNewHdayDt
     */
    public Date getsNewHdayDt() {
        return sNewHdayDt;
    }

    /**
     * @param sNewHdayDt the sNewHdayDt to set
     */
    public void setsNewHdayDt(Date sNewHdayDt) {
        this.sNewHdayDt = sNewHdayDt;
    }

    /**
     * @return the sHdayInfoTxt
     */
    public String getsHdayInfoTxt() {
        return sHdayInfoTxt;
    }

    /**
     * @param sHdayInfoTxt the sHdayInfoTxt to set
     */
    public void setsHdayInfoTxt(String sHdayInfoTxt) {
        this.sHdayInfoTxt = sHdayInfoTxt;
    }
}