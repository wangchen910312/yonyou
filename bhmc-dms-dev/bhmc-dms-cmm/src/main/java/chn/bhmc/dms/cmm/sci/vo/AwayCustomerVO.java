package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerVO.java
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

public class AwayCustomerVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 35966431679590782L;

    private String  revOldDt;
    private String  revNewDt;
    private String  strRevDt;
    private String  usrId;
    private String  startHm;
    private String  endHm;
    private String  revStartHm;
    private String  revEndHm;
    private String  revOldStartHm;
    private String  revNewStartHm;
    private String  revOldEndHm;
    private String  revNewEndHm;
    private String  revCont;

    /**
     * @return the revOldDt
     */
    public String getRevOldDt() {
        return revOldDt;
    }
    /**
     * @param revOldDt the revOldDt to set
     */
    public void setRevOldDt(String revOldDt) {
        this.revOldDt = revOldDt;
    }
    /**
     * @return the revNewDt
     */
    public String getRevNewDt() {
        return revNewDt;
    }
    /**
     * @param revNewDt the revNewDt to set
     */
    public void setRevNewDt(String revNewDt) {
        this.revNewDt = revNewDt;
    }
    /**
     * @return the strRevDt
     */
    public String getStrRevDt() {
        return strRevDt;
    }
    /**
     * @param strRevDt the strRevDt to set
     */
    public void setStrRevDt(String strRevDt) {
        this.strRevDt = strRevDt;
    }
    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }
    /**
     * @return the startHm
     */
    public String getStartHm() {
        return startHm;
    }
    /**
     * @param startHm the startHm to set
     */
    public void setStartHm(String startHm) {
        this.startHm = startHm;
    }
    /**
     * @return the endHm
     */
    public String getEndHm() {
        return endHm;
    }
    /**
     * @param endHm the endHm to set
     */
    public void setEndHm(String endHm) {
        this.endHm = endHm;
    }
    /**
     * @return the revStartHm
     */
    public String getRevStartHm() {
        return revStartHm;
    }
    /**
     * @param revStartHm the revStartHm to set
     */
    public void setRevStartHm(String revStartHm) {
        this.revStartHm = revStartHm;
    }
    /**
     * @return the revEndHm
     */
    public String getRevEndHm() {
        return revEndHm;
    }
    /**
     * @param revEndHm the revEndHm to set
     */
    public void setRevEndHm(String revEndHm) {
        this.revEndHm = revEndHm;
    }
    /**
     * @return the revOldStartHm
     */
    public String getRevOldStartHm() {
        return revOldStartHm;
    }
    /**
     * @param revOldStartHm the revOldStartHm to set
     */
    public void setRevOldStartHm(String revOldStartHm) {
        this.revOldStartHm = revOldStartHm;
    }
    /**
     * @return the revNewStartHm
     */
    public String getRevNewStartHm() {
        return revNewStartHm;
    }
    /**
     * @param revNewStartHm the revNewStartHm to set
     */
    public void setRevNewStartHm(String revNewStartHm) {
        this.revNewStartHm = revNewStartHm;
    }
    /**
     * @return the revOldEndHm
     */
    public String getRevOldEndHm() {
        return revOldEndHm;
    }
    /**
     * @param revOldEndHm the revOldEndHm to set
     */
    public void setRevOldEndHm(String revOldEndHm) {
        this.revOldEndHm = revOldEndHm;
    }
    /**
     * @return the revNewEndHm
     */
    public String getRevNewEndHm() {
        return revNewEndHm;
    }
    /**
     * @param revNewEndHm the revNewEndHm to set
     */
    public void setRevNewEndHm(String revNewEndHm) {
        this.revNewEndHm = revNewEndHm;
    }
    /**
     * @return the revCont
     */
    public String getRevCont() {
        return revCont;
    }
    /**
     * @param revCont the revCont to set
     */
    public void setRevCont(String revCont) {
        this.revCont = revCont;
    }
}