package chn.bhmc.dms.dply.dms.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BundleDeployHistoryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public class BundleDeployHistoryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 214482910355610948L;

    private String specCd               ;

    private String specNm               ;

    private String symbolicNm           ;

    private String bundleVerNo          ;

    private String operCmdNm            ;

    private String deployProcYn         ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   deployProcDt         ;

    private String deployRsltCd         ;

    private String deployRsltMesgCont   ;

    private String rollbackRsltCd       ;

    private String rollbackRsltMesgCont ;

    private String rollbackOperCmdNm    ;

    private String bundleNm             ;

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
     * @param symbolicNm the symbolicNm to set
     */
    public void setSymbolicNm(String symbolicNm) {
        this.symbolicNm = symbolicNm;
    }

    /**
     * @return the symbolicNm
     */
    public String getSymbolicNm() {
        return symbolicNm;
    }

    /**
     * @param bundleVerNo the bundleVerNo to set
     */
    public void setBundleVerNo(String bundleVerNo) {
        this.bundleVerNo = bundleVerNo;
    }

    /**
     * @return the bundleVerNo
     */
    public String getBundleVerNo() {
        return bundleVerNo;
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
     * @param deployProcYn the deployProcYn to set
     */
    public void setDeployProcYn(String deployProcYn) {
        this.deployProcYn = deployProcYn;
    }

    /**
     * @return the deployProcYn
     */
    public String getDeployProcYn() {
        return deployProcYn;
    }

    /**
     * @param deployProcDt the deployProcDt to set
     */
    public void setDeployProcDt(Date deployProcDt) {
        this.deployProcDt = deployProcDt;
    }

    /**
     * @return the deployProcDt
     */
    public Date getDeployProcDt() {
        return deployProcDt;
    }

    /**
     * @param deployRsltCd the deployRsltCd to set
     */
    public void setDeployRsltCd(String deployRsltCd) {
        this.deployRsltCd = deployRsltCd;
    }

    /**
     * @return the deployRsltCd
     */
    public String getDeployRsltCd() {
        return deployRsltCd;
    }

    /**
     * @param deployRsltMesgCont the deployRsltMesgCont to set
     */
    public void setDeployRsltMesgCont(String deployRsltMesgCont) {
        this.deployRsltMesgCont = deployRsltMesgCont;
    }

    /**
     * @return the deployRsltMesgCont
     */
    public String getDeployRsltMesgCont() {
        return deployRsltMesgCont;
    }

    /**
     * @param rollbackRsltCd the rollbackRsltCd to set
     */
    public void setRollbackRsltCd(String rollbackRsltCd) {
        this.rollbackRsltCd = rollbackRsltCd;
    }

    /**
     * @return the rollbackRsltCd
     */
    public String getRollbackRsltCd() {
        return rollbackRsltCd;
    }

    /**
     * @param rollbackRsltMesgCont the rollbackRsltMesgCont to set
     */
    public void setRollbackRsltMesgCont(String rollbackRsltMesgCont) {
        this.rollbackRsltMesgCont = rollbackRsltMesgCont;
    }

    /**
     * @return the rollbackRsltMesgCont
     */
    public String getRollbackRsltMesgCont() {
        return rollbackRsltMesgCont;
    }

    /**
     * @param rollbackOperCmdNm the rollbackOperCmdNm to set
     */
    public void setRollbackOperCmdNm(String rollbackOperCmdNm) {
        this.rollbackOperCmdNm = rollbackOperCmdNm;
    }

    /**
     * @return the rollbackOperCmdNm
     */
    public String getRollbackOperCmdNm() {
        return rollbackOperCmdNm;
    }

    /**
     * @param bundleNm the bundleNm to set
     */
    public void setBundleNm(String bundleNm) {
        this.bundleNm = bundleNm;
    }

    /**
     * @return the bundleNm
     */
    public String getBundleNm() {
        return bundleNm;
    }


}
