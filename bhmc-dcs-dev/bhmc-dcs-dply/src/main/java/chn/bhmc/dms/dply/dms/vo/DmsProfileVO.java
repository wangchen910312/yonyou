package chn.bhmc.dms.dply.dms.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfileVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DmsProfileVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5146318741516764368L;


    private String dlrCd;

    private String deployTargYn          ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   lastAchkReqDt         ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   lastAchkResDt         ;

    private String lastAchkResCd         ;

    private String lastAchkResMsgCont    ;

    private String dlrNm;

    private String dlrEngNm;

    private String crnNo;

    private String telNo;

    private String faxNo;

    private String ip;

    private String port;

    private String homepageUrl;

    private String lastDplyDt;

    private String sqlDeploy       ;

    private String repoDeploy      ;

    private String fileDeploy      ;

    private String deployProcess   ;

    private String result          ;

    private String resultMsg       ;

    private String dmsOperEmailNm  ;

    private String dmsOperTelNo    ;

    private String deployTpCd      ;


    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        // TODO Auto-generated method stub

    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        // TODO Auto-generated method stub
        return null;
    }

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
     * @param dlrEngNm the dlrEngNm to set
     */
    public void setDlrEngNm(String dlrEngNm) {
        this.dlrEngNm = dlrEngNm;
    }

    /**
     * @return the dlrEngNm
     */
    public String getDlrEngNm() {
        return dlrEngNm;
    }

    /**
     * @param crnNo the crnNo to set
     */
    public void setCrnNo(String crnNo) {
        this.crnNo = crnNo;
    }

    /**
     * @return the crnNo
     */
    public String getCrnNo() {
        return crnNo;
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
     * @param lastDplyDt the lastDplyDt to set
     */
    public void setLastDplyDt(String lastDplyDt) {
        this.lastDplyDt = lastDplyDt;
    }

    /**
     * @return the lastDplyDt
     */
    public String getLastDplyDt() {
        return lastDplyDt;
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

    /**
     * @param dmsOperEmailNm the dmsOperEmailNm to set
     */
    public void setDmsOperEmailNm(String dmsOperEmailNm) {
        this.dmsOperEmailNm = dmsOperEmailNm;
    }

    /**
     * @return the dmsOperEmailNm
     */
    public String getDmsOperEmailNm() {
        return dmsOperEmailNm;
    }

    /**
     * @param dmsOperTelNo the dmsOperTelNo to set
     */
    public void setDmsOperTelNo(String dmsOperTelNo) {
        this.dmsOperTelNo = dmsOperTelNo;
    }

    /**
     * @return the dmsOperTelNo
     */
    public String getDmsOperTelNo() {
        return dmsOperTelNo;
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

}
