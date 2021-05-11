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
 * @ClassName   : CalendarSearchVO.java
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

public class CalendarInfoSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9064950367982773890L;

    private String  sCalendarId;
    private String  sHdayCalendarId;
    private String  sLangCd;
    private String  sCalendarTp;
    private String  sCalendarNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;

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
     * @return the sHdayCalendarId
     */
    public String getsHdayCalendarId() {
        return sHdayCalendarId;
    }
    /**
     * @param sHdayCalendarId the sHdayCalendarId to set
     */
    public void setsHdayCalendarId(String sHdayCalendarId) {
        this.sHdayCalendarId = sHdayCalendarId;
    }
    /**
     * @return the sLangCd
     */
    public String getsLangCd() {
        return sLangCd;
    }
    /**
     * @param sLangCd the sLangCd to set
     */
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
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
     * @return the sCalendarNm
     */
    public String getsCalendarNm() {
        return sCalendarNm;
    }
    /**
     * @param sCalendarNm the sCalendarNm to set
     */
    public void setsCalendarNm(String sCalendarNm) {
        this.sCalendarNm = sCalendarNm;
    }
    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }
    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }
    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }
}