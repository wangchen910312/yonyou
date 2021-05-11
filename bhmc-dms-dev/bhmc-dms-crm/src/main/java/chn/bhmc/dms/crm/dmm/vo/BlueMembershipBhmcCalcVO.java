package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcSearchVO.java
 * @Description : 블루멤버십 정산 검색 VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BlueMembershipBhmcCalcVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2668796708125559022L;

    private String dlrCd;
    private int calcSeq;
    private Date calcStartDt;
    private Date calcEndDt;
    private Date calcReqDt;
    private double calcReqAmt;
    private double calcTotAmt;

    private String calcAcceptYn;
    private String calcAcceptYnCont;
    private Date calcAcceptDt;

    private double calcLastAmt;
    private Date calcLastDt;
    private String calcLastCont;

    private String regUsrId;
    private Date regDt;
    private String updtUsrId;
    private Date updtDt;
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the calcSeq
     */
    public int getCalcSeq() {
        return calcSeq;
    }
    /**
     * @param calcSeq the calcSeq to set
     */
    public void setCalcSeq(int calcSeq) {
        this.calcSeq = calcSeq;
    }
    /**
     * @return the calcStartDt
     */
    public Date getCalcStartDt() {
        return calcStartDt;
    }
    /**
     * @param calcStartDt the calcStartDt to set
     */
    public void setCalcStartDt(Date calcStartDt) {
        this.calcStartDt = calcStartDt;
    }
    /**
     * @return the calcEndDt
     */
    public Date getCalcEndDt() {
        return calcEndDt;
    }
    /**
     * @param calcEndDt the calcEndDt to set
     */
    public void setCalcEndDt(Date calcEndDt) {
        this.calcEndDt = calcEndDt;
    }
    /**
     * @return the calcReqDt
     */
    public Date getCalcReqDt() {
        return calcReqDt;
    }
    /**
     * @param calcReqDt the calcReqDt to set
     */
    public void setCalcReqDt(Date calcReqDt) {
        this.calcReqDt = calcReqDt;
    }

    /**
     * @return the calcAcceptYn
     */
    public String getCalcAcceptYn() {
        return calcAcceptYn;
    }
    /**
     * @param calcAcceptYn the calcAcceptYn to set
     */
    public void setCalcAcceptYn(String calcAcceptYn) {
        this.calcAcceptYn = calcAcceptYn;
    }
    /**
     * @return the calcAcceptYnCont
     */
    public String getCalcAcceptYnCont() {
        return calcAcceptYnCont;
    }
    /**
     * @param calcAcceptYnCont the calcAcceptYnCont to set
     */
    public void setCalcAcceptYnCont(String calcAcceptYnCont) {
        this.calcAcceptYnCont = calcAcceptYnCont;
    }
    /**
     * @return the calcAcceptDt
     */
    public Date getCalcAcceptDt() {
        return calcAcceptDt;
    }
    /**
     * @param calcAcceptDt the calcAcceptDt to set
     */
    public void setCalcAcceptDt(Date calcAcceptDt) {
        this.calcAcceptDt = calcAcceptDt;
    }
    /**
     * @return the calcLastDt
     */
    public Date getCalcLastDt() {
        return calcLastDt;
    }
    /**
     * @param calcLastDt the calcLastDt to set
     */
    public void setCalcLastDt(Date calcLastDt) {
        this.calcLastDt = calcLastDt;
    }
    /**
     * @return the calcLastCont
     */
    public String getCalcLastCont() {
        return calcLastCont;
    }
    /**
     * @param calcLastCont the calcLastCont to set
     */
    public void setCalcLastCont(String calcLastCont) {
        this.calcLastCont = calcLastCont;
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
    /**
     * @return the calcReqAmt
     */
    public double getCalcReqAmt() {
        return calcReqAmt;
    }
    /**
     * @param calcReqAmt the calcReqAmt to set
     */
    public void setCalcReqAmt(double calcReqAmt) {
        this.calcReqAmt = calcReqAmt;
    }
    /**
     * @return the calcTotAmt
     */
    public double getCalcTotAmt() {
        return calcTotAmt;
    }
    /**
     * @param calcTotAmt the calcTotAmt to set
     */
    public void setCalcTotAmt(double calcTotAmt) {
        this.calcTotAmt = calcTotAmt;
    }
    /**
     * @return the calcLastAmt
     */
    public double getCalcLastAmt() {
        return calcLastAmt;
    }
    /**
     * @param calcLastAmt the calcLastAmt to set
     */
    public void setCalcLastAmt(double calcLastAmt) {
        this.calcLastAmt = calcLastAmt;
    }

}
