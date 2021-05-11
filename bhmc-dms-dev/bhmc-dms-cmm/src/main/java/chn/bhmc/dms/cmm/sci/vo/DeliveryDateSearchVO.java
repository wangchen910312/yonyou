package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryDateSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class DeliveryDateSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -9062680026266534945L;

    private String  sDt;
    private String  sCalendarId;
    private int     sDelayDay = -1;

    /**
     * @return the sDt
     */
    public String getsDt() {
        return sDt;
    }
    /**
     * @param sDt the sDt to set
     */
    public void setsDt(String sDt) {
        this.sDt = sDt;
    }
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
     * @return the sDelayDay
     */
    public int getsDelayDay() {
        return sDelayDay;
    }
    /**
     * @param sDelayDay the sDelayDay to set
     */
    public void setsDelayDay(int sDelayDay) {
        this.sDelayDay = sDelayDay;
    }
}