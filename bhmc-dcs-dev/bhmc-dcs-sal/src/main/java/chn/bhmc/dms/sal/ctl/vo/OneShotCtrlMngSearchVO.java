package chn.bhmc.dms.sal.ctl.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OneShotCtrlMngSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 11. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 10.     Lee Seungmin     최초 생성
 * </pre>
 */

public class OneShotCtrlMngSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3873584341637935293L;
    private String sDlrCdLeft;//좌측딜러
    private String sDlrTpL;//좌측딜러타입
    private String sCtrlYnLeft;//좌측원키공제상태
    private String sDlrTpR;//우측딜러타입
    private String sDlrCdRight;//우측딜러
    private String sCtrlYnRight;//우측원키공제상태
    private String sDiviCdL;//좌측사업부
    private String sOffCdL;//좌측사무소
    private String sDiviCdR;//우측사업부
    private String sOffCdR;//우측사무소

    /**
     * @return the sDiviCdL
     */
    public String getsDiviCdL() {
        return sDiviCdL;
    }
    /**
     * @param sDiviCdL the sDiviCdL to set
     */
    public void setsDiviCdL(String sDiviCdL) {
        this.sDiviCdL = sDiviCdL;
    }
    /**
     * @return the sOffCdL
     */
    public String getsOffCdL() {
        return sOffCdL;
    }
    /**
     * @param sOffCdL the sOffCdL to set
     */
    public void setsOffCdL(String sOffCdL) {
        this.sOffCdL = sOffCdL;
    }
    /**
     * @return the sDiviCdR
     */
    public String getsDiviCdR() {
        return sDiviCdR;
    }
    /**
     * @param sDiviCdR the sDiviCdR to set
     */
    public void setsDiviCdR(String sDiviCdR) {
        this.sDiviCdR = sDiviCdR;
    }
    /**
     * @return the sOffCdR
     */
    public String getsOffCdR() {
        return sOffCdR;
    }
    /**
     * @param sOffCdR the sOffCdR to set
     */
    public void setsOffCdR(String sOffCdR) {
        this.sOffCdR = sOffCdR;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sDlrCdLeft
     */
    public String getsDlrCdLeft() {
        return sDlrCdLeft;
    }
    /**
     * @param sDlrCdLeft the sDlrCdLeft to set
     */
    public void setsDlrCdLeft(String sDlrCdLeft) {
        this.sDlrCdLeft = sDlrCdLeft;
    }

    /**
     * @return the sDlrTpL
     */
    public String getsDlrTpL() {
        return sDlrTpL;
    }
    /**
     * @param sDlrTpL the sDlrTpL to set
     */
    public void setsDlrTpL(String sDlrTpL) {
        this.sDlrTpL = sDlrTpL;
    }
    /**
     * @return the sCtrlYnLeft
     */
    public String getsCtrlYnLeft() {
        return sCtrlYnLeft;
    }
    /**
     * @param sCtrlYnLeft the sCtrlYnLeft to set
     */
    public void setsCtrlYnLeft(String sCtrlYnLeft) {
        this.sCtrlYnLeft = sCtrlYnLeft;
    }
    /**
     * @return the sDlrTpR
     */
    public String getsDlrTpR() {
        return sDlrTpR;
    }
    /**
     * @param sDlrTpR the sDlrTpR to set
     */
    public void setsDlrTpR(String sDlrTpR) {
        this.sDlrTpR = sDlrTpR;
    }
    /**
     * @return the sDlrCdRight
     */
    public String getsDlrCdRight() {
        return sDlrCdRight;
    }
    /**
     * @param sDlrCdRight the sDlrCdRight to set
     */
    public void setsDlrCdRight(String sDlrCdRight) {
        this.sDlrCdRight = sDlrCdRight;
    }
    /**
     * @return the sCtrlYnRight
     */
    public String getsCtrlYnRight() {
        return sCtrlYnRight;
    }
    /**
     * @param sCtrlYnRight the sCtrlYnRight to set
     */
    public void setsCtrlYnRight(String sCtrlYnRight) {
        this.sCtrlYnRight = sCtrlYnRight;
    }


}
