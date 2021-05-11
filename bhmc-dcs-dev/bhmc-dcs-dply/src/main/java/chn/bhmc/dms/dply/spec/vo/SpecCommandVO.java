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
 * @ClassName   : SpecCommandVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class SpecCommandVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7345865072130549100L;


    private String specCd                 ;

    private String specTpNm               ;

    private int    seq                    ;

    private String operCmdNm              ;

    private String operCmdEnvCont         ;

    private String operDirNm              ;

    private String successDecisionStr    ;

    private String failDecisionStr        ;

    private String failAftCtnuPgssYn      ;

    private String failAftRollbackYn      ;

    private String rollbackOperCmdNm      ;

    private String rollbackOperCmdEnvCont ;

    private String rollbackOperDirNm      ;

    private String regUsrId               ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt                    ;

    private String updtUsrId              ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt                 ;

    private String deployProrVal          ;

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
     * @param specTpNm the specTpNm to set
     */
    public void setSpecTpNm(String specTpNm) {
        this.specTpNm = specTpNm;
    }

    /**
     * @return the specTpNm
     */
    public String getSpecTpNm() {
        return specTpNm;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
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
     * @param successDecisionStr the successDecisionStr to set
     */
    public void setsuccessDecisionStr(String successDecisionStr) {
        this.successDecisionStr = successDecisionStr;
    }

    /**
     * @return the successDecisionStr
     */
    public String getsuccessDecisionStr() {
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
     * @param failAftCtnuPgssYn the failAftCtnuPgssYn to set
     */
    public void setFailAftCtnuPgssYn(String failAftCtnuPgssYn) {
        this.failAftCtnuPgssYn = failAftCtnuPgssYn;
    }

    /**
     * @return the failAftCtnuPgssYn
     */
    public String getFailAftCtnuPgssYn() {
        return failAftCtnuPgssYn;
    }

    /**
     * @param failAftRollbackYn the failAftRollbackYn to set
     */
    public void setFailAftRollbackYn(String failAftRollbackYn) {
        this.failAftRollbackYn = failAftRollbackYn;
    }

    /**
     * @return the failAftRollbackYn
     */
    public String getFailAftRollbackYn() {
        return failAftRollbackYn;
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
     * @param rollbackOperCmdEnvCont the rollbackOperCmdEnvCont to set
     */
    public void setRollbackOperCmdEnvCont(String rollbackOperCmdEnvCont) {
        this.rollbackOperCmdEnvCont = rollbackOperCmdEnvCont;
    }

    /**
     * @return the rollbackOperCmdEnvCont
     */
    public String getRollbackOperCmdEnvCont() {
        return rollbackOperCmdEnvCont;
    }

    /**
     * @param rollbackOperDirNm the rollbackOperDirNm to set
     */
    public void setRollbackOperDirNm(String rollbackOperDirNm) {
        this.rollbackOperDirNm = rollbackOperDirNm;
    }

    /**
     * @return the rollbackOperDirNm
     */
    public String getRollbackOperDirNm() {
        return rollbackOperDirNm;
    }

    /**
     * @param deployProrVal the deployProrVal to set
     */
    public void setDeployProrVal(String deployProrVal) {
        this.deployProrVal = deployProrVal;
    }

    /**
     * @return the deployProrVal
     */
    public String getDeployProrVal() {
        return deployProrVal;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }


}
