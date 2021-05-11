package chn.bhmc.dms.mis.tis.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * [딜러사] 목표 개선 현황
 * </pre>
 *
 * @ClassName   : TargetIpvmStatusSearchVO.java
 * @Description : [딜러사] 목표 개선 현황
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetIpvmStatusSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5143802370527758322L;

    private String improveYearMonth;
    private String improveCause;
    private String improveCauseFile;

    private String seq;
    private String regYyMm;
    private String regYy;
    private String regMm;
    private String reasonCont;
    private String fileDocNo;
    private String fileNo;
    private String delYn;
    private String regUsrId;
    private Date regDt;
    private String updtUsrId;
    private Date updtDt;
    /**
     * @return the improveYearMonth
     */
    public String getImproveYearMonth() {
        return improveYearMonth;
    }
    /**
     * @param improveYearMonth the improveYearMonth to set
     */
    public void setImproveYearMonth(String improveYearMonth) {
        this.improveYearMonth = improveYearMonth;
    }
    /**
     * @return the improveCause
     */
    public String getImproveCause() {
        return improveCause;
    }
    /**
     * @param improveCause the improveCause to set
     */
    public void setImproveCause(String improveCause) {
        this.improveCause = improveCause;
    }
    /**
     * @return the improveCauseFile
     */
    public String getImproveCauseFile() {
        return improveCauseFile;
    }
    /**
     * @param improveCauseFile the improveCauseFile to set
     */
    public void setImproveCauseFile(String improveCauseFile) {
        this.improveCauseFile = improveCauseFile;
    }
    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }
    /**
     * @return the regYyMm
     */
    public String getRegYyMm() {
        return regYyMm;
    }
    /**
     * @param regYyMm the regYyMm to set
     */
    public void setRegYyMm(String regYyMm) {
        this.regYyMm = regYyMm;
    }
    /**
     * @return the regYy
     */
    public String getRegYy() {
        return regYy;
    }
    /**
     * @param regYy the regYy to set
     */
    public void setRegYy(String regYy) {
        this.regYy = regYy;
    }
    /**
     * @return the regMm
     */
    public String getRegMm() {
        return regMm;
    }
    /**
     * @param regMm the regMm to set
     */
    public void setRegMm(String regMm) {
        this.regMm = regMm;
    }
    /**
     * @return the reasonCont
     */
    public String getReasonCont() {
        return reasonCont;
    }
    /**
     * @param reasonCont the reasonCont to set
     */
    public void setReasonCont(String reasonCont) {
        this.reasonCont = reasonCont;
    }
    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }
    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }
    /**
     * @return the fileNo
     */
    public String getFileNo() {
        return fileNo;
    }
    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }
    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }
    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }



}
