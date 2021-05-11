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
 * @ClassName   : VehicleVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.    Kang Seok Han     최초 생성
 * </pre>
 */

public class VehicleColorVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String carlineCd;           // 차종코드
    private String carlineNm;           // 차종명
    private String modelCd;             // 모델코드
    private String modelNm;             // 모델명
    private String extColorCd;          // 외장색코드
    private String extColorNm;          // 외장색명
    private String extColorEnNm;        // 외장색영문명
    private String extColorCdNm;          // 외장색코드

    private String intColorCd;          // 내장색코드
    private String intColorNm;          // 내장색명
    private String intColorEnNm;        // 내장색영문명
    private String intColorCdNm;          // 내장색코드
    private String colorTp;             // 색상유형
    private String twoToneYn;           // 투톤칼라
    private String useYn;               // 사용여부
    private String regUsrId;            // 등록자id
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                 // 등록일자
    private String updtUsrId;           // 수정자id
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                // 수정일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;               // 적용시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;                 // 적용종료일자

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
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the intColorEnNm
     */
    public String getIntColorEnNm() {
        return intColorEnNm;
    }
    /**
     * @param intColorEnNm the intColorEnNm to set
     */
    public void setIntColorEnNm(String intColorEnNm) {
        this.intColorEnNm = intColorEnNm;
    }

    /**
     * @return the intColorCdNm
     */
    public String getIntColorCdNm() {
        return intColorCdNm;
    }
    /**
     * @param intColorCdNm the intColorCdNm to set
     */
    public void setIntColorCdNm(String intColorCdNm) {
        this.intColorCdNm = intColorCdNm;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the extColorEnNm
     */
    public String getExtColorEnNm() {
        return extColorEnNm;
    }
    /**
     * @param extColorEnNm the extColorEnNm to set
     */
    public void setExtColorEnNm(String extColorEnNm) {
        this.extColorEnNm = extColorEnNm;
    }
    /**
     * @return the extColorCdNm
     */
    public String getExtColorCdNm() {
        return extColorCdNm;
    }
    /**
     * @param extColorCdNm the extColorCdNm to set
     */
    public void setExtColorCdNm(String extColorCdNm) {
        this.extColorCdNm = extColorCdNm;
    }
    /**
     * @return the colorTp
     */
    public String getColorTp() {
        return colorTp;
    }
    /**
     * @param colorTp the colorTp to set
     */
    public void setColorTp(String colorTp) {
        this.colorTp = colorTp;
    }
    /**
     * @return the twoToneYn
     */
    public String getTwoToneYn() {
        return twoToneYn;
    }
    /**
     * @param twoToneYn the twoToneYn to set
     */
    public void setTwoToneYn(String twoToneYn) {
        this.twoToneYn = twoToneYn;
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




}
