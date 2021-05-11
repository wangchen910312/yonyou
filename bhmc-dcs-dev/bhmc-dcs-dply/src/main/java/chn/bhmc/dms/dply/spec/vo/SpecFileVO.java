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
 * @ClassName   : SpecFileVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecFileVO extends BaseVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -169394005034588066L;


    /**
     * SPEC코드
     **/
    private String specCd                 ;

    /**
     * SPEC유형명
     **/

    private String specTpNm               ;

    /**
     * 일련번호
     **/
    private int seq                       ;

    /**
     * 작업시도횟수
     **/
    private int operTryCnt                ;

    /**
     * 소스파일경로명
     **/
    private String srcFilePathNm          ;

    /**
     * 대상파일경로명
     **/
    private String targFilePathNm         ;

    /**
     * 딜러코드자동추가여부
     **/
    private String dlrCdAutoAddYn         ;

    /**
     * 실패이후계속진행여부
     **/
    private String failAftCtnuPgssYn      ;

    /**
     * 실패이후롤백여부
     **/
    private String failAftRollbackYn      ;

    /**
     * 백업대상파일경로명
     **/
    private String bakTargFilePathNm      ;

    /**
     * 등록자ID
     **/
    private String regUsrId               ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt                    ;

    /**
     * 수정자ID
     **/
    private String updtUsrId              ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt                   ;

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
     * @param dlrCdAutoAddYn the dlrCdAutoAddYn to set
     */
    public void setDlrCdAutoAddYn(String dlrCdAutoAddYn) {
        this.dlrCdAutoAddYn = dlrCdAutoAddYn;
    }

    /**
     * @return the dlrCdAutoAddYn
     */
    public String getDlrCdAutoAddYn() {
        return dlrCdAutoAddYn;
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
     * @param bakTargFilePathNm the bakTargFilePathNm to set
     */
    public void setBakTargFilePathNm(String bakTargFilePathNm) {
        this.bakTargFilePathNm = bakTargFilePathNm;
    }

    /**
     * @return the bakTargFilePathNm
     */
    public String getBakTargFilePathNm() {
        return bakTargFilePathNm;
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
