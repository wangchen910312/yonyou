package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleOcnVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Bong
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.       Bong                최초 생성
 * </pre>
 */

public class VehicleOcnVO   extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1399747584097454136L;
    private String dlrCd;               // 딜러코드
    private String carlineCd;           // 차종코드
    private String carlineNm;           // 차종명
    private String carlineEnNm;         // 차종영문명
    private String ocnCd;           // 승/상용구분
    private String ocnNm;           // 승/상용구분
    private String optionCd;           // 승/상용구분
    private String optionNm;           // 승/상용구분

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;             // 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;               // 종료일자

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




}
