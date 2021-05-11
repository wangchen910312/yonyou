package chn.bhmc.dms.dply.spec.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecSqlVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 28.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecSqlVO extends BaseVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4711163521892356918L;


    /**
     * SPEC코드
     **/
    private String specCd                 ;


    /**
     * SPEC코드
     **/
    private String specTpNm               ;

    /**
     * SPEC코드
     **/
    private int seq                       ;

    /**
     * SPEC코드
     **/
    private String sqlTextCont            ;

    /**
     * SPEC코드
     **/
    private int operTryCnt                ;

    /**
     * SPEC코드
     **/
    private String failAftCtnuPgssYn      ;

    /**
     * SPEC코드
     **/
    private String failAftRollbackYn      ;

    /**
     * SPEC코드
     **/
    private String rollbackSqlTextCont    ;

    /**
     * SPEC코드
     **/
    private int rollbackProrVal        ;

    /**
     * 등록자ID
     **/
    private String regUsrId  ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt      ;

    /**
     * 수정자ID
     **/
    private String updtUsrId ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt     ;


    /**
     *
     **/
    private int deployProrVal   ;



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
     * @param sqlTextCont the sqlTextCont to set
     */
    public void setSqlTextCont(String sqlTextCont) {
        this.sqlTextCont = sqlTextCont;
    }

    /**
     * @return the sqlTextCont
     */
    public String getSqlTextCont() {
        return sqlTextCont;
    }

    /**
     * @param operTryCnt the operTryCnt to set
     */
    public void setOperTryCnt(int operTryCnt) {
        this.operTryCnt = operTryCnt;
    }

    /**
     * @return the operTryCnt
     */
    public int getOperTryCnt() {
        return operTryCnt;
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
     * @param rollbackSqlTextCont the rollbackSqlTextCont to set
     */
    public void setRollbackSqlTextCont(String rollbackSqlTextCont) {
        this.rollbackSqlTextCont = rollbackSqlTextCont;
    }

    /**
     * @return the rollbackSqlTextCont
     */
    public String getRollbackSqlTextCont() {
        return rollbackSqlTextCont;
    }

    /**
     * @param rollbackProrVal the rollbackProrVal to set
     */
    public void setRollbackProrVal(int rollbackProrVal) {
        this.rollbackProrVal = rollbackProrVal;
    }

    /**
     * @return the rollbackProrVal
     */
    public int getRollbackProrVal() {
        return rollbackProrVal;
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

    /**
     * @param deployProrVal the deployProrVal to set
     */
    public void setDeployProrVal(int deployProrVal) {
        this.deployProrVal = deployProrVal;
    }

    /**
     * @return the deployProrVal
     */
    public int getDeployProrVal() {
        return deployProrVal;
    }


}
