package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LangCdSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 22.     Kang Seok Han     최초 생성
 * </pre>
 */

public class LangCdSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3382321068653544901L;

    private String sCalendarId;
    private String sLangCd;
    private String sCalendarTxt;
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
     * @return the sCalendarTxt
     */
    public String getsCalendarTxt() {
        return sCalendarTxt;
    }
    /**
     * @param sCalendarTxt the sCalendarTxt to set
     */
    public void setsCalendarTxt(String sCalendarTxt) {
        this.sCalendarTxt = sCalendarTxt;
    }
}