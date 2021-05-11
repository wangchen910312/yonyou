package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkingSearchVO.java
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

public class WorkingSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 523782164808795453L;

    private String sCalendarId;
    private int sDayweekCnt;
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
     * @return the sDayweekCnt
     */
    public int getsDayweekCnt() {
        return sDayweekCnt;
    }
    /**
     * @param sDayweekCnt the sDayweekCnt to set
     */
    public void setsDayweekCnt(int sDayweekCnt) {
        this.sDayweekCnt = sDayweekCnt;
    }
}