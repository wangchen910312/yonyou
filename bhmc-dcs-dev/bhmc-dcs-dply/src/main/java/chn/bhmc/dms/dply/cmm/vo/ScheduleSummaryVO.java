package chn.bhmc.dms.dply.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ScheduleSummaryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 16.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class ScheduleSummaryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8748731271678286317L;

    private String Flag;

    private int Cnt;

    private String deployStartDtDisp  ;

    private int workingCnt     ;

    private int readyCnt       ;

    private int runningCnt     ;

    private int stoppedCnt     ;

    private int cancelCnt      ;

    private int completedCnt   ;

    private int failCnt        ;

    private int totalCnt       ;

    private int scheduledCnt   ;

    private int immediateCnt   ;



    private String specCd            ;

    private String specNm            ;

    private String deployVerNo       ;

    private String scheduleTpCd      ;

    private String deployTpCd        ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployPlanStartDt   ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   deployStartDt     ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   deployEndDt       ;

    private String deployStatCd      ;

    private int    trgtDmsCnt        ;

    private int    failDmsCnt        ;

    private int    achkFailAlwCnt    ;

    private int    alwFailDmsCnt     ;


    /**
     * @param flag the flag to set
     */
    public void setFlag(String flag) {
        Flag = flag;
    }

    /**
     * @return the flag
     */
    public String getFlag() {
        return Flag;
    }

    /**
     * @param cnt the cnt to set
     */
    public void setCnt(int cnt) {
        Cnt = cnt;
    }

    /**
     * @return the cnt
     */
    public int getCnt() {
        return Cnt;
    }

    /**
     * @param deployStartDtDisp the deployStartDtDisp to set
     */
    public void setDeployStartDtDisp(String deployStartDtDisp) {
        this.deployStartDtDisp = deployStartDtDisp;
    }

    /**
     * @return the deployStartDtDisp
     */
    public String getDeployStartDtDisp() {
        return deployStartDtDisp;
    }

    /**
     * @param workingCnt the workingCnt to set
     */
    public void setWorkingCnt(int workingCnt) {
        this.workingCnt = workingCnt;
    }

    /**
     * @return the workingCnt
     */
    public int getWorkingCnt() {
        return workingCnt;
    }

    /**
     * @param readyCnt the readyCnt to set
     */
    public void setReadyCnt(int readyCnt) {
        this.readyCnt = readyCnt;
    }

    /**
     * @return the readyCnt
     */
    public int getReadyCnt() {
        return readyCnt;
    }

    /**
     * @param runningCnt the runningCnt to set
     */
    public void setRunningCnt(int runningCnt) {
        this.runningCnt = runningCnt;
    }

    /**
     * @return the runningCnt
     */
    public int getRunningCnt() {
        return runningCnt;
    }

    /**
     * @param stoppedCnt the stoppedCnt to set
     */
    public void setStoppedCnt(int stoppedCnt) {
        this.stoppedCnt = stoppedCnt;
    }

    /**
     * @return the stoppedCnt
     */
    public int getStoppedCnt() {
        return stoppedCnt;
    }

    /**
     * @param cancelCnt the cancelCnt to set
     */
    public void setCancelCnt(int cancelCnt) {
        this.cancelCnt = cancelCnt;
    }

    /**
     * @return the cancelCnt
     */
    public int getCancelCnt() {
        return cancelCnt;
    }

    /**
     * @param completedCnt the completedCnt to set
     */
    public void setCompletedCnt(int completedCnt) {
        this.completedCnt = completedCnt;
    }

    /**
     * @return the completedCnt
     */
    public int getCompletedCnt() {
        return completedCnt;
    }

    /**
     * @param failCnt the failCnt to set
     */
    public void setFailCnt(int failCnt) {
        this.failCnt = failCnt;
    }

    /**
     * @return the failCnt
     */
    public int getFailCnt() {
        return failCnt;
    }

    /**
     * @param totalCnt the totalCnt to set
     */
    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    /**
     * @return the totalCnt
     */
    public int getTotalCnt() {
        return totalCnt;
    }

    /**
     * @param scheduledCnt the scheduledCnt to set
     */
    public void setScheduledCnt(int scheduledCnt) {
        this.scheduledCnt = scheduledCnt;
    }

    /**
     * @return the scheduledCnt
     */
    public int getScheduledCnt() {
        return scheduledCnt;
    }

    /**
     * @param immediateCnt the immediateCnt to set
     */
    public void setImmediateCnt(int immediateCnt) {
        this.immediateCnt = immediateCnt;
    }

    /**
     * @return the immediateCnt
     */
    public int getImmediateCnt() {
        return immediateCnt;
    }

    /**
     * @param specCd the specCd to set
     */
    public void setSpecCd(String specCd) {
        this.specCd = specCd;
    }

    /**
     * @return the specCd
     */
    public String getSpecCd() {
        return specCd;
    }

    /**
     * @param specNm the specNm to set
     */
    public void setSpecNm(String specNm) {
        this.specNm = specNm;
    }

    /**
     * @return the specNm
     */
    public String getSpecNm() {
        return specNm;
    }

    /**
     * @param deployVerNo the deployVerNo to set
     */
    public void setDeployVerNo(String deployVerNo) {
        this.deployVerNo = deployVerNo;
    }

    /**
     * @return the deployVerNo
     */
    public String getDeployVerNo() {
        return deployVerNo;
    }

    /**
     * @param scheduleTpCd the scheduleTpCd to set
     */
    public void setScheduleTpCd(String scheduleTpCd) {
        this.scheduleTpCd = scheduleTpCd;
    }

    /**
     * @return the scheduleTpCd
     */
    public String getScheduleTpCd() {
        return scheduleTpCd;
    }

    /**
     * @param deployTpCd the deployTpCd to set
     */
    public void setDeployTpCd(String deployTpCd) {
        this.deployTpCd = deployTpCd;
    }

    /**
     * @return the deployTpCd
     */
    public String getDeployTpCd() {
        return deployTpCd;
    }

    /**
     * @param deployStartDt the deployStartDt to set
     */
    public void setDeployStartDt(Date deployStartDt) {
        this.deployStartDt = deployStartDt;
    }

    /**
     * @return the deployStartDt
     */
    public Date getDeployStartDt() {
        return deployStartDt;
    }

    /**
     * @param deployEndDt the deployEndDt to set
     */
    public void setDeployEndDt(Date deployEndDt) {
        this.deployEndDt = deployEndDt;
    }

    /**
     * @return the deployEndDt
     */
    public Date getDeployEndDt() {
        return deployEndDt;
    }

    /**
     * @param deployStatCd the deployStatCd to set
     */
    public void setDeployStatCd(String deployStatCd) {
        this.deployStatCd = deployStatCd;
    }

    /**
     * @return the deployStatCd
     */
    public String getDeployStatCd() {
        return deployStatCd;
    }

    /**
     * @param trgtDmsCnt the trgtDmsCnt to set
     */
    public void setTrgtDmsCnt(int trgtDmsCnt) {
        this.trgtDmsCnt = trgtDmsCnt;
    }

    /**
     * @return the trgtDmsCnt
     */
    public int getTrgtDmsCnt() {
        return trgtDmsCnt;
    }

    /**
     * @param failDmsCnt the failDmsCnt to set
     */
    public void setFailDmsCnt(int failDmsCnt) {
        this.failDmsCnt = failDmsCnt;
    }

    /**
     * @return the failDmsCnt
     */
    public int getFailDmsCnt() {
        return failDmsCnt;
    }

    /**
     * @param achkFailAlwCnt the achkFailAlwCnt to set
     */
    public void setAchkFailAlwCnt(int achkFailAlwCnt) {
        this.achkFailAlwCnt = achkFailAlwCnt;
    }

    /**
     * @return the achkFailAlwCnt
     */
    public int getAchkFailAlwCnt() {
        return achkFailAlwCnt;
    }

    /**
     * @param alwFailDmsCnt the alwFailDmsCnt to set
     */
    public void setAlwFailDmsCnt(int alwFailDmsCnt) {
        this.alwFailDmsCnt = alwFailDmsCnt;
    }

    /**
     * @return the alwFailDmsCnt
     */
    public int getAlwFailDmsCnt() {
        return alwFailDmsCnt;
    }

    /**
     * @param deployPlanStartDt the deployPlanStartDt to set
     */
    public void setDeployPlanStartDt(Date deployPlanStartDt) {
        this.deployPlanStartDt = deployPlanStartDt;
    }

    /**
     * @return the deployPlanStartDt
     */
    public Date getDeployPlanStartDt() {
        return deployPlanStartDt;
    }

}
