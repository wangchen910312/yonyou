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
 * @ClassName   : SpecBundleVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class SpecBundleVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3975467456799195838L;


    /**
     * SPEC코드
     **/
    private String specCd              ;

    /**
     * SPEC유형명
     **/
    private String specTpNm            ;

    /**
     * 일련번호
     **/
    private int    seq                 ;

    /**
     * 작업명령어명
     **/
    private String operCmdNm           ;

    /**
     * 작업시도횟수
     **/
    private int    operTryCnt          ;

    /**
     * 번들그룹ID
     **/
    private String bundleGrpId         ;

    /**
     * 번들아티팩트ID
     **/
    private String bundleAtftId        ;

    /**
     * 번들버전번호
     **/
    private String bundleVerNo         ;

    /**
     * 실패이후계속진행여부
     **/
    private String failAftCtnuPgssYn   ;

    /**
     * 실패이후롤백여부
     **/
    private String failAftRollbackYn   ;

    /**
     * 롤백작업명령어명
     **/
    private String rollbackOperCmdNm   ;

    /**
     * 롤백우선순위값
     **/
    private int    rollbackProrVal     ;

    /**
     * 등록자ID
     **/
    private String regUsrId            ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt               ;

    /**
     * 수정자ID
     **/
    private String updtUsrId           ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt              ;

    /**
     * Symbolic Name
     **/
    private String symbolicNm          ;


    /**
     *
     **/
    private String bundleNm          ;

    /**
    *
    **/
   private int deployProrVal   ;

   /**
   *
   **/
  private String srcFilePathNm ;
    /**
    *
    **/
  private String targFilePathNm;

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
     * @param bundleGrpId the bundleGrpId to set
     */
    public void setBundleGrpId(String bundleGrpId) {
        this.bundleGrpId = bundleGrpId;
    }

    /**
     * @return the bundleGrpId
     */
    public String getBundleGrpId() {
        return bundleGrpId;
    }

    /**
     * @param bundleAtftId the bundleAtftId to set
     */
    public void setBundleAtftId(String bundleAtftId) {
        this.bundleAtftId = bundleAtftId;
    }

    /**
     * @return the bundleAtftId
     */
    public String getBundleAtftId() {
        return bundleAtftId;
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
}
