package chn.bhmc.dms.sal.veh.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * @ClassName   : VehicleOcnSubInfoIfVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Jin Suk
 * @since 2018. 03. 05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 03. 05.    KimJinSuk               최초 생성
 * </pre>
 */

public class VehicleOcnSubInfoIfVO  implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2587400593113294770L;

    @JsonProperty("CARLINE_CD")
    private String carlineCd;           // 차종코드

    @JsonProperty("OCN_CD")
    private String ocnCd;               // OCN코드

    @JsonProperty("CARLINE_NM")
    private String carlineNm;           // 차종명

    @JsonProperty("FSC_NM")
    private String fscNm;               // 차관명

    @JsonProperty("OPTION_CD")
    private String optionCd;           // 세부옵션 코드

    @JsonProperty("OPTION_NM")
    private String optionNm;           // 세부옵션 명

    @JsonProperty("GRADE_CD")
    private String gradeCd;

    @JsonProperty("START_DT")
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;             // 시작일자

    @JsonProperty("END_DT")
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;               // 종료일자

    @JsonProperty("REG_USR_ID")
    private String regUsrId;         // 등록자 아이디

    @JsonProperty("REG_DT")
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;             // 등록일자

    @JsonProperty("UPDT_USR_ID")
    private String updtUsrId;       // 수정자 아이디

    @JsonProperty("UPDT_DT")
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;        // 수정일자

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
     * @return the fscNm
     */
    public String getFscNm() {
        return fscNm;
    }

    /**
     * @param fscNm the fscNm to set
     */
    public void setFscNm(String fscNm) {
        this.fscNm = fscNm;
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
     * @return the gradeCd
     */
    public String getGradeCd() {
        return gradeCd;
    }

    /**
     * @param gradeCd the gradeCd to set
     */
    public void setGradeCd(String gradeCd) {
        this.gradeCd = gradeCd;
    }

    /**
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
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