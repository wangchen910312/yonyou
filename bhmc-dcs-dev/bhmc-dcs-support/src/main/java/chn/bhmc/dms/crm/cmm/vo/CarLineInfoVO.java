package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarLineInfoVO.java.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public class CarLineInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7506408383877659715L;

    /**
     * SEQ
     **/
    private  String         seq;

    /**
     * 딜러코드
     **/
    private  String      dlrCd;

    /**
     * 사업장코드
     **/
    private  String      pltCd;

    /**
     * 참조테이블명
     **/
    @NotEmpty
    private  String      refTableNm;

    /**
     * 참조키명
     **/
    private  String      refKeyNm;

    /**
     * 관심차종코드
     **/
    @NotEmpty
    private  String      carlineCd;
    private  String      carlineNm;

    /**
     * 관심모델코드
     **/
    @NotEmpty
    private  String      modelCd;
    private  String      modelNm;

    /**
     * 관심플래그여부
     **/
    private  String      flagYn = "N";

    /**
     * 등록자ID
     **/
    private  String      regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        regDt;

    /**
     * 수정자ID
     **/
    private  String      updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        updtDt;

    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the refTableNm
     */
    public String getRefTableNm() {
        return refTableNm;
    }

    /**
     * @param refTableNm the refTableNm to set
     */
    public void setRefTableNm(String refTableNm) {
        this.refTableNm = refTableNm;
    }

    /**
     * @return the refKeyNm
     */
    public String getRefKeyNm() {
        return refKeyNm;
    }

    /**
     * @param refKeyNm the refKeyNm to set
     */
    public void setRefKeyNm(String refKeyNm) {
        this.refKeyNm = refKeyNm;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }

    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }

    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }

    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }

    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

    /**
     * @return the flagYn
     */
    public String getFlagYn() {
        return flagYn;
    }

    /**
     * @param flagYn the flagYn to set
     */
    public void setFlagYn(String flagYn) {
        this.flagYn = flagYn;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CarLineInfoVO [seq=" + seq + ", dlrCd=" + dlrCd + ", pltCd=" + pltCd + ", refTableNm=" + refTableNm
                + ", refKeyNm=" + refKeyNm + ", carlineCd=" + carlineCd + ", carlineNm=" + carlineNm + ", modelCd="
                + modelCd + ", modelNm=" + modelNm + ", flagYn=" + flagYn + ", regUsrId=" + regUsrId + ", regDt="
                + regDt + ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt + "]";
    }




}
