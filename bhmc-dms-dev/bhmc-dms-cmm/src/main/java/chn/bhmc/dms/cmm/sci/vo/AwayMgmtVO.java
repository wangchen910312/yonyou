package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayMgmtVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class AwayMgmtVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8426241144205196607L;

    private String usrId;
    private String usrNm;
    private String empNo;
    private String leftDt;
    private String leftStartHm;
    private String leftEndHm;
    private String revStartHm;
    private String revEndHm;
    private String revCont;

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
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }
    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }
    /**
     * @return the empNo
     */
    public String getEmpNo() {
        return empNo;
    }
    /**
     * @param empNo the empNo to set
     */
    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }
    /**
     * @return the leftDt
     */
    public String getLeftDt() {
        return leftDt;
    }
    /**
     * @param leftDt the leftDt to set
     */
    public void setLeftDt(String leftDt) {
        this.leftDt = leftDt;
    }
    /**
     * @return the leftStartHm
     */
    public String getLeftStartHm() {
        return leftStartHm;
    }
    /**
     * @param leftStartHm the leftStartHm to set
     */
    public void setLeftStartHm(String leftStartHm) {
        this.leftStartHm = leftStartHm;
    }
    /**
     * @return the leftEndHm
     */
    public String getLeftEndHm() {
        return leftEndHm;
    }
    /**
     * @param leftEndHm the leftEndHm to set
     */
    public void setLeftEndHm(String leftEndHm) {
        this.leftEndHm = leftEndHm;
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