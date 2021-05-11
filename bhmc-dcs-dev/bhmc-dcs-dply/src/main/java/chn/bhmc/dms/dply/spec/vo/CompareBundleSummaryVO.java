package chn.bhmc.dms.dply.spec.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CompareBundleSummaryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 31.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class CompareBundleSummaryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4046245067259184301L;

    private String dlrCd             ;

    private String dlrNm             ;

    private String stdDt             ;

    private int    compareTrgtCnt    ;

    private int    deployExist       ;

    private String accord            ;

    private String notAccord         ;

    private String accordNotActive   ;

    private String miss              ;

    private String compareResult     ;

    private String deployHist        ;

    private String compareDt         ;

    private int    dlrCnt            ;

    private int totDmsCnt          ;

    private int completedDmsCnt    ;

    private int uncompletedDmsCnt  ;

    private int accordDmsCnt       ;

    private int disaccoredDmsCnt   ;



    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param stdDt the stdDt to set
     */
    public void setStdDt(String stdDt) {
        this.stdDt = stdDt;
    }

    /**
     * @return the stdDt
     */
    public String getStdDt() {
        return stdDt;
    }

    /**
     * @param compareTrgtCnt the compareTrgtCnt to set
     */
    public void setCompareTrgtCnt(int compareTrgtCnt) {
        this.compareTrgtCnt = compareTrgtCnt;
    }

    /**
     * @return the compareTrgtCnt
     */
    public int getCompareTrgtCnt() {
        return compareTrgtCnt;
    }

    /**
     * @param deployExist the deployExist to set
     */
    public void setDeployExist(int deployExist) {
        this.deployExist = deployExist;
    }

    /**
     * @return the deployExist
     */
    public int getDeployExist() {
        return deployExist;
    }

    /**
     * @param accord the accord to set
     */
    public void setAccord(String accord) {
        this.accord = accord;
    }

    /**
     * @return the accord
     */
    public String getAccord() {
        return accord;
    }

    /**
     * @param notAccord the notAccord to set
     */
    public void setNotAccord(String notAccord) {
        this.notAccord = notAccord;
    }

    /**
     * @return the notAccord
     */
    public String getNotAccord() {
        return notAccord;
    }

    /**
     * @param accordNotActive the accordNotActive to set
     */
    public void setAccordNotActive(String accordNotActive) {
        this.accordNotActive = accordNotActive;
    }

    /**
     * @return the accordNotActive
     */
    public String getAccordNotActive() {
        return accordNotActive;
    }

    /**
     * @param miss the miss to set
     */
    public void setMiss(String miss) {
        this.miss = miss;
    }

    /**
     * @return the miss
     */
    public String getMiss() {
        return miss;
    }

    /**
     * @param compareResult the compareResult to set
     */
    public void setCompareResult(String compareResult) {
        this.compareResult = compareResult;
    }

    /**
     * @return the compareResult
     */
    public String getCompareResult() {
        return compareResult;
    }

    /**
     * @param deployHist the deployHist to set
     */
    public void setDeployHist(String deployHist) {
        this.deployHist = deployHist;
    }

    /**
     * @return the deployHist
     */
    public String getDeployHist() {
        return deployHist;
    }

    /**
     * @param compareDt the compareDt to set
     */
    public void setCompareDt(String compareDt) {
        this.compareDt = compareDt;
    }

    /**
     * @return the compareDt
     */
    public String getCompareDt() {
        return compareDt;
    }

    /**
     * @param dlrCnt the dlrCnt to set
     */
    public void setDlrCnt(int dlrCnt) {
        this.dlrCnt = dlrCnt;
    }

    /**
     * @return the dlrCnt
     */
    public int getDlrCnt() {
        return dlrCnt;
    }

    /**
     * @param totDmsCnt the totDmsCnt to set
     */
    public void setTotDmsCnt(int totDmsCnt) {
        this.totDmsCnt = totDmsCnt;
    }

    /**
     * @return the totDmsCnt
     */
    public int getTotDmsCnt() {
        return totDmsCnt;
    }

    /**
     * @param completedDmsCnt the completedDmsCnt to set
     */
    public void setCompletedDmsCnt(int completedDmsCnt) {
        this.completedDmsCnt = completedDmsCnt;
    }

    /**
     * @return the completedDmsCnt
     */
    public int getCompletedDmsCnt() {
        return completedDmsCnt;
    }

    /**
     * @param uncompletedDmsCnt the uncompletedDmsCnt to set
     */
    public void setUncompletedDmsCnt(int uncompletedDmsCnt) {
        this.uncompletedDmsCnt = uncompletedDmsCnt;
    }

    /**
     * @return the uncompletedDmsCnt
     */
    public int getUncompletedDmsCnt() {
        return uncompletedDmsCnt;
    }

    /**
     * @param accordDmsCnt the accordDmsCnt to set
     */
    public void setAccordDmsCnt(int accordDmsCnt) {
        this.accordDmsCnt = accordDmsCnt;
    }

    /**
     * @return the accordDmsCnt
     */
    public int getAccordDmsCnt() {
        return accordDmsCnt;
    }

    /**
     * @param disaccoredDmsCnt the disaccoredDmsCnt to set
     */
    public void setDisaccoredDmsCnt(int disaccoredDmsCnt) {
        this.disaccoredDmsCnt = disaccoredDmsCnt;
    }

    /**
     * @return the disaccoredDmsCnt
     */
    public int getDisaccoredDmsCnt() {
        return disaccoredDmsCnt;
    }
}
