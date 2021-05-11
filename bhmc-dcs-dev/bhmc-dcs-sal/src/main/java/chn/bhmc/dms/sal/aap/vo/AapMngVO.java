package chn.bhmc.dms.sal.aap.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AapMngVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.       Kim yewon             최초 생성
 *
 * </pre>
 */

public class AapMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date aapDt;                                 //대행일자
    private String aapWrkDstinCd;                       //대행업무구분코드
    private Double seq;                                 //일련번호
    private String vinNo;                               //차대번호
    private String carlineCd;                           //차종코드
    private String carlineNm;                           //차종명
    private String modelCd;                             //모델코드
    private String modelNm;                             //모델명
    private String ocnCd;                               //OCN코드
    private String ocnNm;                               //OCN명
    private String carRegNo;                            //차량등록번호
    private String aapEmpNm;                            //대행자명
    private Double cstAmt;                              //원가금액
    private Double profitAmt;                           //수익금액
    private Double aapAmt;                              //대행금액
    private String regUsrId;                            //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                 //등록일자
    private String updtUsrId;                           //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                //수정일자





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
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the aapDt
     */
    public Date getAapDt() {
        return aapDt;
    }
    /**
     * @param aapDt the aapDt to set
     */
    public void setAapDt(Date aapDt) {
        this.aapDt = aapDt;
    }
    /**
     * @return the aapWrkDstinCd
     */
    public String getAapWrkDstinCd() {
        return aapWrkDstinCd;
    }
    /**
     * @param aapWrkDstinCd the aapWrkDstinCd to set
     */
    public void setAapWrkDstinCd(String aapWrkDstinCd) {
        this.aapWrkDstinCd = aapWrkDstinCd;
    }
    /**
     * @return the seq
     */
    public Double getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(Double seq) {
        this.seq = seq;
    }
    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
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
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }
    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }
    /**
     * @return the aapEmpNm
     */
    public String getAapEmpNm() {
        return aapEmpNm;
    }
    /**
     * @param aapEmpNm the aapEmpNm to set
     */
    public void setAapEmpNm(String aapEmpNm) {
        this.aapEmpNm = aapEmpNm;
    }
    /**
     * @return the cstAmt
     */
    public Double getCstAmt() {
        return cstAmt;
    }
    /**
     * @param cstAmt the cstAmt to set
     */
    public void setCstAmt(Double cstAmt) {
        this.cstAmt = cstAmt;
    }
    /**
     * @return the profitAmt
     */
    public Double getProfitAmt() {
        return profitAmt;
    }
    /**
     * @param profitAmt the profitAmt to set
     */
    public void setProfitAmt(Double profitAmt) {
        this.profitAmt = profitAmt;
    }
    /**
     * @return the aapAmt
     */
    public Double getAapAmt() {
        return aapAmt;
    }
    /**
     * @param aapAmt the aapAmt to set
     */
    public void setAapAmt(Double aapAmt) {
        this.aapAmt = aapAmt;
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
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
