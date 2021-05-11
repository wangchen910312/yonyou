package chn.bhmc.dms.dply.cmm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SyncCommandSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SyncCommandSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3322412587384558105L;

    private String ipAddr;

    private String port;

    private String rootSymbolicName;

    private String dcsMqPort;

    private String mesgCd;

    private String mesgGrpCd;

    private String dlrCd;

    private String symbolicName;

    private String operType;

    private String groupId;

    private String artifactid;

    private String version;

    private String specCd;

    private String deployVerNo;

    private String repository;

    private String deployOperCd;

    private String deployReqSeq;

    private String reqBodyNeed;

    private String sql;

    private String srcFileUrl     ;

    private String trgtFilePath   ;

    private String propertyFilePath  ;

    private String keyNm             ;

    private String keyVal            ;

    private String fileType          ;

    private String operCmdNm           ;

    private String operDirNm           ;

    private String operCmdEnvCont      ;

    private String successDecisionStr  ;

    private String failDecisionStr     ;

    private String objectNm            ;

    private String reload              ;

    private String directoryPath       ;

    private String srcFilePathNm ;

    private String targFilePathNm;

    private String updateDate;


    private List<SyncCommandBundleVO> syncCommandBundleVOList;

    /**
     * @param ipAddr the ipAddr to set
     */
    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }

    /**
     * @return the ipAddr
     */
    public String getIpAddr() {
        return ipAddr;
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
     * @param mesgCd the mesgCd to set
     */
    public void setMesgCd(String mesgCd) {
        this.mesgCd = mesgCd;
    }

    /**
     * @return the mesgCd
     */
    public String getMesgCd() {
        return mesgCd;
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
     * @param symbolicName the symbolicName to set
     */
    public void setSymbolicName(String symbolicName) {
        this.symbolicName = symbolicName;
    }

    /**
     * @return the symbolicName
     */
    public String getSymbolicName() {
        return symbolicName;
    }

    /**
     * @param syncCommandBundleVOList the syncCommandBundleVOList to set
     */
    public void setSyncCommandBundleVOList(List<SyncCommandBundleVO> syncCommandBundleVOList) {
        this.syncCommandBundleVOList = syncCommandBundleVOList;
    }

    /**
     * @return the syncCommandBundleVOList
     */
    public List<SyncCommandBundleVO> getSyncCommandBundleVOList() {
        return syncCommandBundleVOList;
    }

    /**
     * @param groupId the groupId to set
     */
    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    /**
     * @return the groupId
     */
    public String getGroupId() {
        return groupId;
    }

    /**
     * @param artifactid the artifactid to set
     */
    public void setArtifactid(String artifactid) {
        this.artifactid = artifactid;
    }

    /**
     * @return the artifactid
     */
    public String getArtifactid() {
        return artifactid;
    }

    /**
     * @param operType the operType to set
     */
    public void setOperType(String operType) {
        this.operType = operType;
    }

    /**
     * @return the operType
     */
    public String getOperType() {
        return operType;
    }

    /**
     * @param version the version to set
     */
    public void setVersion(String version) {
        this.version = version;
    }

    /**
     * @return the version
     */
    public String getVersion() {
        return version;
    }

    /**
     * @param rootSymbolicName the rootSymbolicName to set
     */
    public void setRootSymbolicName(String rootSymbolicName) {
        this.rootSymbolicName = rootSymbolicName;
    }

    /**
     * @return the rootSymbolicName
     */
    public String getRootSymbolicName() {
        return rootSymbolicName;
    }

    /**
     * @param mesgGrpCd the mesgGrpCd to set
     */
    public void setMesgGrpCd(String mesgGrpCd) {
        this.mesgGrpCd = mesgGrpCd;
    }

    /**
     * @return the mesgGrpCd
     */
    public String getMesgGrpCd() {
        return mesgGrpCd;
    }

    /**
     * @param dcsMqPort the dcsMqPort to set
     */
    public void setDcsMqPort(String dcsMqPort) {
        this.dcsMqPort = dcsMqPort;
    }

    /**
     * @return the dcsMqPort
     */
    public String getDcsMqPort() {
        return dcsMqPort;
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
     * @param repository the repository to set
     */
    public void setRepository(String repository) {
        this.repository = repository;
    }

    /**
     * @return the repository
     */
    public String getRepository() {
        return repository;
    }

    /**
     * @param deployOperCd the deployOperCd to set
     */
    public void setDeployOperCd(String deployOperCd) {
        this.deployOperCd = deployOperCd;
    }

    /**
     * @return the deployOperCd
     */
    public String getDeployOperCd() {
        return deployOperCd;
    }

    /**
     * @param deployReqSeq the deployReqSeq to set
     */
    public void setDeployReqSeq(String deployReqSeq) {
        this.deployReqSeq = deployReqSeq;
    }

    /**
     * @return the deployReqSeq
     */
    public String getDeployReqSeq() {
        return deployReqSeq;
    }

    /**
     * @param reqBodyNeed the reqBodyNeed to set
     */
    public void setReqBodyNeed(String reqBodyNeed) {
        this.reqBodyNeed = reqBodyNeed;
    }

    /**
     * @return the reqBodyNeed
     */
    public String getReqBodyNeed() {
        return reqBodyNeed;
    }

    /**
     * @param sql the sql to set
     */
    public void setSql(String sql) {
        this.sql = sql;
    }

    /**
     * @return the sql
     */
    public String getSql() {
        return sql;
    }

    /**
     * @param srcFileUrl the srcFileUrl to set
     */
    public void setSrcFileUrl(String srcFileUrl) {
        this.srcFileUrl = srcFileUrl;
    }

    /**
     * @return the srcFileUrl
     */
    public String getSrcFileUrl() {
        return srcFileUrl;
    }

    /**
     * @param trgtFilePath the trgtFilePath to set
     */
    public void setTrgtFilePath(String trgtFilePath) {
        this.trgtFilePath = trgtFilePath;
    }

    /**
     * @return the trgtFilePath
     */
    public String getTrgtFilePath() {
        return trgtFilePath;
    }

    /**
     * @param propertyFilePath the propertyFilePath to set
     */
    public void setPropertyFilePath(String propertyFilePath) {
        this.propertyFilePath = propertyFilePath;
    }

    /**
     * @return the propertyFilePath
     */
    public String getPropertyFilePath() {
        return propertyFilePath;
    }

    /**
     * @param keyNm the keyNm to set
     */
    public void setKeyNm(String keyNm) {
        this.keyNm = keyNm;
    }

    /**
     * @return the keyNm
     */
    public String getKeyNm() {
        return keyNm;
    }

    /**
     * @param keyVal the keyVal to set
     */
    public void setKeyVal(String keyVal) {
        this.keyVal = keyVal;
    }

    /**
     * @return the keyVal
     */
    public String getKeyVal() {
        return keyVal;
    }

    /**
     * @param fileType the fileType to set
     */
    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    /**
     * @return the fileType
     */
    public String getFileType() {
        return fileType;
    }

    /**
     * @param operCmdNm the operCmdNm to set
     */
    public void setOperCmdNm(String operCmdNm) {
        this.operCmdNm = operCmdNm;
    }

    /**
     * @return the operCmdNm
     */
    public String getOperCmdNm() {
        return operCmdNm;
    }

    /**
     * @param operDirNm the operDirNm to set
     */
    public void setOperDirNm(String operDirNm) {
        this.operDirNm = operDirNm;
    }

    /**
     * @return the operDirNm
     */
    public String getOperDirNm() {
        return operDirNm;
    }

    /**
     * @param operCmdEnvCont the operCmdEnvCont to set
     */
    public void setOperCmdEnvCont(String operCmdEnvCont) {
        this.operCmdEnvCont = operCmdEnvCont;
    }

    /**
     * @return the operCmdEnvCont
     */
    public String getOperCmdEnvCont() {
        return operCmdEnvCont;
    }

    /**
     * @param successDecisionStr the successDecisionStr to set
     */
    public void setSuccessDecisionStr(String successDecisionStr) {
        this.successDecisionStr = successDecisionStr;
    }

    /**
     * @return the successDecisionStr
     */
    public String getSuccessDecisionStr() {
        return successDecisionStr;
    }

    /**
     * @param failDecisionStr the failDecisionStr to set
     */
    public void setFailDecisionStr(String failDecisionStr) {
        this.failDecisionStr = failDecisionStr;
    }

    /**
     * @return the failDecisionStr
     */
    public String getFailDecisionStr() {
        return failDecisionStr;
    }

    /**
     * @param objectNm the objectNm to set
     */
    public void setObjectNm(String objectNm) {
        this.objectNm = objectNm;
    }

    /**
     * @return the objectNm
     */
    public String getObjectNm() {
        return objectNm;
    }

    /**
     * @param reload the reload to set
     */
    public void setReload(String reload) {
        this.reload = reload;
    }

    /**
     * @return the reload
     */
    public String getReload() {
        return reload;
    }

    /**
     * @param directoryPath the directoryPath to set
     */
    public void setDirectoryPath(String directoryPath) {
        this.directoryPath = directoryPath;
    }

    /**
     * @return the directoryPath
     */
    public String getDirectoryPath() {
        return directoryPath;
    }

    /**
     * @param srcFilePathNm the srcFilePathNm to set
     */
    public void setSrcFilePathNm(String srcFilePathNm) {
        this.srcFilePathNm = srcFilePathNm;
    }

    /**
     * @return the srcFilePathNm
     */
    public String getSrcFilePathNm() {
        return srcFilePathNm;
    }
    /**
     * @param targFilePathNm the targFilePathNm to set
     */
    public void setTargFilePathNm(String targFilePathNm) {
        this.targFilePathNm = targFilePathNm;
    }

    /**
     * @return the targFilePathNm
     */
    public String getTargFilePathNm() {
        return targFilePathNm;
    }

    /**
     * @param targFilePathNm the targFilePathNm to set
     */
    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * @return the targFilePathNm
     */
    public String getUpdateDate() {
        return updateDate;
    }

}
