package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LangCdVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class LangCdVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -30821431056182646L;

    private String calendarId;
    private String langCd;
    private String calendarTxt;

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
     * @return the calendarTxt
     */
    public String getCalendarTxt() {
        return calendarTxt;
    }
    /**
     * @param calendarTxt the calendarTxt to set
     */
    public void setCalendarTxt(String calendarTxt) {
        this.calendarTxt = calendarTxt;
    }
}