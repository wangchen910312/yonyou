package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeployHistoryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DeployHistoryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2889930085607627634L;

    private String specCd        ;

    private String specNm        ;

    private String specCont      ;

    private String deployVerNo   ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployStartDt   ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deployEndDt     ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt         ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt           ;

    private String status        ;

    private int    dmsCnt        ;

    private int    sucessCnt     ;

    private int    failCnt       ;

    private String duration      ;

    private String redeploy      ;

    private String scheduleTpCd  ;

    private String deployStatCd  ;

    private String deployTpCd    ;

    private int achkFailAlwCnt   ;

    private int alwFailDmsCnt    ;



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
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param dmsCnt the dmsCnt to set
     */
    public void setDmsCnt(int dmsCnt) {
        this.dmsCnt = dmsCnt;
    }

    /**
     * @return the dmsCnt
     */
    public int getDmsCnt() {
        return dmsCnt;
    }

    /**
     * @param sucessCnt the sucessCnt to set
     */
    public void setSucessCnt(int sucessCnt) {
        this.sucessCnt = sucessCnt;
    }

    /**
     * @return the sucessCnt
     */
    public int getSucessCnt() {
        return sucessCnt;
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
     * @param duration the duration to set
     */
    public void setDuration(String duration) {
        this.duration = duration;
    }

    /**
     * @return the duration
     */
    public String getDuration() {
        return duration;
    }

    /**
     * @param redeploy the redeploy to set
     */
    public void setRedeploy(String redeploy) {
        this.redeploy = redeploy;
    }

    /**
     * @return the redeploy
     */
    public String getRedeploy() {
        return redeploy;
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
     * @param specCont the specCont to set
     */
    public void setSpecCont(String specCont) {
        this.specCont = specCont;
    }

    /**
     * @return the specCont
     */
    public String getSpecCont() {
        return specCont;
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
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
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

}
