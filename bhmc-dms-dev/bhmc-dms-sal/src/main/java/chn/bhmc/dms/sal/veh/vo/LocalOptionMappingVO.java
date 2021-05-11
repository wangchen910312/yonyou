package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import able.com.vo.SearchVO;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class LocalOptionMappingVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2910737838424233713L;

    private String dlrCd;           // 딜러코드
    private String carlineCd;       // 차량코드
    private String carlineNm;       // 차량명
    private String carlineEnNm;     // 차량영어명
    private String modelCd;         // 모델코드
    private String modelNm;         // 모델명
    private String modelEnNm;       // 모델영어명
    private String optionCd;        // 옵션cd
    private String optionNm;        // 옵션명
    private String useYn;           // 사용여부
    private String regUsrId;          //등록자ID

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;             //등록일자

    private String updtUsrId;         //수정자ID

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;            //수정일자

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
     * @return the carlineEnNm
     */
    public String getCarlineEnNm() {
        return carlineEnNm;
    }
    /**
     * @param carlineEnNm the carlineEnNm to set
     */
    public void setCarlineEnNm(String carlineEnNm) {
        this.carlineEnNm = carlineEnNm;
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
     * @return the modelEnNm
     */
    public String getModelEnNm() {
        return modelEnNm;
    }
    /**
     * @param modelEnNm the modelEnNm to set
     */
    public void setModelEnNm(String modelEnNm) {
        this.modelEnNm = modelEnNm;
    }
    /**
     * @return the optionCd
     */
    public String getOptionCd() {
        return optionCd;
    }
    /**
     * @param optionCd the optionCd to set
     */
    public void setOptionCd(String optionCd) {
        this.optionCd = optionCd;
    }
    /**
     * @return the optionNm
     */
    public String getOptionNm() {
        return optionNm;
    }
    /**
     * @param optionNm the optionNm to set
     */
    public void setOptionNm(String optionNm) {
        this.optionNm = optionNm;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
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
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "LocalOptionMappingVO [dlrCd=" + dlrCd + ", carlineCd=" + carlineCd + ", carlineNm=" + carlineNm
                + ", carlineEnNm=" + carlineEnNm + ", modelCd=" + modelCd + ", modelNm=" + modelNm + ", modelEnNm="
                + modelEnNm + ", optionCd=" + optionCd + ", optionNm=" + optionNm + ", useYn=" + useYn + ", regUsrId="
                + regUsrId + ", regDt=" + regDt + ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt
                + ", getFirstIndex()=" + getFirstIndex() + ", getLastIndex()=" + getLastIndex()
                + ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", getPageIndex()=" + getPageIndex()
                + ", getSearchType()=" + getSearchType() + ", getPageUnit()=" + getPageUnit() + ", getPageSize()="
                + getPageSize() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
                + super.toString() + "]";
    }

}
