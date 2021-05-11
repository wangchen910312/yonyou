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
 * @ClassName   : SpecPrtyVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 31.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecPrtyVO extends BaseVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2209510250016849972L;

    /**
     * SPEC코드
     **/
    private String specCd               ;

    /**
     * SPEC유형명
     **/
    private String specTpNm             ;

    /**
     * 일련번호
     **/
    private int seq                  ;

    /**
     * 작업시도횟수
     **/
    private int operTryCnt           ;

    /**
     * PROPERTY파일명
     **/
    private String prtyFileNm           ;

    /**
     * PROPERTY키명
     **/
    private String prtyKeyNm            ;

    /**
     * PROPERTY키값
     **/
    private String prtyKeyVal           ;

    /**
     * 실패이후계속진행여부
     **/
    private String failAftCtnuPgssYn    ;

    /**
     * 실패이후롤백여부
     **/
    private String failAftRollbackYn    ;

    /**
     * PROPERTY파일타입명
     **/
    private String prtyFileTpNm         ;

    /**
     * 등록자ID
     **/
    private String regUsrId             ;


    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt                ;

    /**
     * 수정자ID
     **/
    private String updtUsrId            ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt               ;

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
     * @param prtyFileNm the prtyFileNm to set
     */
    public void setPrtyFileNm(String prtyFileNm) {
        this.prtyFileNm = prtyFileNm;
    }

    /**
     * @return the prtyFileNm
     */
    public String getPrtyFileNm() {
        return prtyFileNm;
    }

    /**
     * @param prtyKeyNm the prtyKeyNm to set
     */
    public void setPrtyKeyNm(String prtyKeyNm) {
        this.prtyKeyNm = prtyKeyNm;
    }

    /**
     * @return the prtyKeyNm
     */
    public String getPrtyKeyNm() {
        return prtyKeyNm;
    }

    /**
     * @param prtyKeyVal the prtyKeyVal to set
     */
    public void setPrtyKeyVal(String prtyKeyVal) {
        this.prtyKeyVal = prtyKeyVal;
    }

    /**
     * @return the prtyKeyVal
     */
    public String getPrtyKeyVal() {
        return prtyKeyVal;
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
     * @param prtyFileTpNm the prtyFileTpNm to set
     */
    public void setPrtyFileTpNm(String prtyFileTpNm) {
        this.prtyFileTpNm = prtyFileTpNm;
    }

    /**
     * @return the prtyFileTpNm
     */
    public String getPrtyFileTpNm() {
        return prtyFileTpNm;
    }

}
