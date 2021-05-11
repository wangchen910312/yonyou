package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

//import java.util.List;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author  Cheol Man Oh
 * @since 2016. 4. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 11.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DmsVO extends BaseVO  {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1433296601313774854L;

    private String dlrCd;

    private String deployTargYn          ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   lastAchkReqDt         ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   lastAchkResDt         ;

    private String lastAchkResCd         ;

    private String lastAchkResMsgCont    ;

    private String dlrNm;

    private String telNo;

    private String faxNo;

    private String ip;

    private String port;

    private String homepageUrl;

    private String failYn;

    private String sqlDeploy       ;

    private String repoDeploy      ;

    private String fileDeploy      ;

    private String deployProcess   ;

    private String result          ;

    private String resultMsg       ;

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
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param faxNo the faxNo to set
     */
    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }

    /**
     * @return the faxNo
     */
    public String getFaxNo() {
        return faxNo;
    }

    /**
     * @param ip the ip to set
     */
    public void setIp(String ip) {
        this.ip = ip;
    }

    /**
     * @return the ip
     */
    public String getIp() {
        return ip;
    }

    /**
     * @param port the port to set
     */
    public void setPort(String port) {
        this.port = port;
    }

    /**
     * @return the port
     */
    public String getPort() {
        return port;
    }

    /**
     * @param homepageUrl the homepageUrl to set
     */
    public void setHomepageUrl(String homepageUrl) {
        this.homepageUrl = homepageUrl;
    }

    /**
     * @return the homepageUrl
     */
    public String getHomepageUrl() {
        return homepageUrl;
    }


    /**
     * @param deployTargYn the deployTargYn to set
     */
    public void setDeployTargYn(String deployTargYn) {
        this.deployTargYn = deployTargYn;
    }

    /**
     * @return the deployTargYn
     */
    public String getDeployTargYn() {
        return deployTargYn;
    }

    /**
     * @param lastAchkReqDt the lastAchkReqDt to set
     */
    public void setLastAchkReqDt(Date lastAchkReqDt) {
        this.lastAchkReqDt = lastAchkReqDt;
    }

    /**
     * @return the lastAchkReqDt
     */
    public Date getLastAchkReqDt() {
        return lastAchkReqDt;
    }

    /**
     * @param lastAchkResDt the lastAchkResDt to set
     */
    public void setLastAchkResDt(Date lastAchkResDt) {
        this.lastAchkResDt = lastAchkResDt;
    }

    /**
     * @return the lastAchkResDt
     */
    public Date getLastAchkResDt() {
        return lastAchkResDt;
    }

    /**
     * @param lastAchkResCd the lastAchkResCd to set
     */
    public void setLastAchkResCd(String lastAchkResCd) {
        this.lastAchkResCd = lastAchkResCd;
    }

    /**
     * @return the lastAchkResCd
     */
    public String getLastAchkResCd() {
        return lastAchkResCd;
    }

    /**
     * @param lastAchkResMsgCont the lastAchkResMsgCont to set
     */
    public void setLastAchkResMsgCont(String lastAchkResMsgCont) {
        this.lastAchkResMsgCont = lastAchkResMsgCont;
    }

    /**
     * @return the lastAchkResMsgCont
     */
    public String getLastAchkResMsgCont() {
        return lastAchkResMsgCont;
    }

    /**
     * @param failYn the failYn to set
     */
    public void setFailYn(String failYn) {
        this.failYn = failYn;
    }

    /**
     * @return the failYn
     */
    public String getFailYn() {
        return failYn;
    }

    /**
     * @param sqlDeploy the sqlDeploy to set
     */
    public void setSqlDeploy(String sqlDeploy) {
        this.sqlDeploy = sqlDeploy;
    }

    /**
     * @return the sqlDeploy
     */
    public String getSqlDeploy() {
        return sqlDeploy;
    }

    /**
     * @param repoDeploy the repoDeploy to set
     */
    public void setRepoDeploy(String repoDeploy) {
        this.repoDeploy = repoDeploy;
    }

    /**
     * @return the repoDeploy
     */
    public String getRepoDeploy() {
        return repoDeploy;
    }

    /**
     * @param fileDeploy the fileDeploy to set
     */
    public void setFileDeploy(String fileDeploy) {
        this.fileDeploy = fileDeploy;
    }

    /**
     * @return the fileDeploy
     */
    public String getFileDeploy() {
        return fileDeploy;
    }

    /**
     * @param deployProcess the deployProcess to set
     */
    public void setDeployProcess(String deployProcess) {
        this.deployProcess = deployProcess;
    }

    /**
     * @return the deployProcess
     */
    public String getDeployProcess() {
        return deployProcess;
    }

    /**
     * @param result the result to set
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * @return the result
     */
    public String getResult() {
        return result;
    }

    /**
     * @param resultMsg the resultMsg to set
     */
    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }

    /**
     * @return the resultMsg
     */
    public String getResultMsg() {
        return resultMsg;
    }

}
