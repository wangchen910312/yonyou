package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
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
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

public class VehicleSearchVO extends SearchVO{
    private static final long serialVersionUID = -6023274259297438078L;

    private String carlineCd;           // 차종코드
    private String carlineNm;           // 차종명
    private String modelCd;             // 모델코드
    private String modelNm;             // 모델명
    private String ocnCd;               // OCN코드
    private String optionCd;            // 옵션코드
    private String option;              // 옵션(코드 혹은 명)

    private String pcDstinCd;           // 승/상용구분
    private String useYn;               // 사용여부
    private String vin;               	// VIN
    private String carId;				// 차량ID
    private String sFscCd;
    private String sModelCd;             // 모델코드

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;             // 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;               // 종료일자
    private String fscCd;

    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
    /**
     * @return the sFscCd
     */
    public String getsFscCd() {
        return sFscCd;
    }
    /**
     * @param sFscCd the sFscCd to set
     */
    public void setsFscCd(String sFscCd) {
        this.sFscCd = sFscCd;
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
     * @return the option
     */
    public String getOption() {
        return option;
    }
    /**
     * @param option the option to set
     */
    public void setOption(String option) {
        this.option = option;
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
     * @return the pcDstinCd
     */
    public String getPcDstinCd() {
        return pcDstinCd;
    }
    /**
     * @param pcDstinCd the pcDstinCd to set
     */
    public void setPcDstinCd(String pcDstinCd) {
        this.pcDstinCd = pcDstinCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @param vin the vin to set
     */
    public void setVin(String vin) {
        this.vin = vin;
    }
    /**
     * @return the vin
     */
    public String getVin() {
        return vin;
    }
    /**
     * @return the carId
     */
	public String getCarId() {
		return carId;
	}
	/**
     * @param carId the carId to set
     */
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getFscCd() {
		return fscCd;
	}
	public void setFscCd(String fscCd) {
		this.fscCd = fscCd;
	}
	
}
