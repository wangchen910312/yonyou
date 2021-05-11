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

public class VehicleVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String carlineCd;           // 차종코드
    private String carlineNm;           // 차종명
    private String carlineCdNm;         // 차종명([코드]명)
    private String carlineEnNm;         // 차종영문명
    private String pcDstinCd;           // 승/상용구분
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;             // 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;               // 종료일자
    private String useYn;               // 사용여부
    private String regUsrId;            // 등록자id
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;               // 등록일자
    private String updtUsrId;           // 수정자id
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;              // 수정일자

    //모델
    private String modelCd;             // 모델코드
    private String modelNm;             // 모델명
    private String modelCdNm;           // 모델명([코드]명)
    private String modelEnNm;           // 모델영문
    private String ocnCd;               // OCN코드
    private String ocnNm;               // OCN명
    private String ocnCdNm;             // OCN명([코드]명)
    private String pcDstinTp;           // 승/상용구분
    private String salePsbYn;           // 판매가능여부

    //옵션
    private String optionCd;            // 옵션코드
    private String optionNm;            // 옵션명
    private String optionCdNm;          // 옵션명([코드]명)
    private String optionEnNm;          // 옵션영문명


    //모델별 OCN 가격
    private Double whPrc;               // 도매가격
    private Double msPrc;               // 소매가격

    private String vin;          // VIN
    private String licenseno;          // 차량 번호
    private String brand;          // 브랜드

    private String img;               // 이미지 img
    private String bstatus;               // 상태

    private String fscpModtpCd;
    private String filler2DstinTp;

    /**
     * @return the fscpModtpCd
     */
    public String getFscpModtpCd() {
        return fscpModtpCd;
    }
    /**
     * @param fscpModtpCd the fscpModtpCd to set
     */
    public void setFscpModtpCd(String fscpModtpCd) {
        this.fscpModtpCd = fscpModtpCd;
    }
    /**
     * @return the filler2DstinTp
     */
    public String getFiller2DstinTp() {
        return filler2DstinTp;
    }
    /**
     * @param filler2DstinTp the filler2DstinTp to set
     */
    public void setFiller2DstinTp(String filler2DstinTp) {
        this.filler2DstinTp = filler2DstinTp;
    }
    /**
     * @return the ocnCdNm
     */
    public String getOcnCdNm() {
        return ocnCdNm;
    }
    /**
     * @param ocnCdNm the ocnCdNm to set
     */
    public void setOcnCdNm(String ocnCdNm) {
        this.ocnCdNm = ocnCdNm;
    }
    /**
     * @return the modelCdNm
     */
    public String getModelCdNm() {
        return modelCdNm;
    }
    /**
     * @param modelCdNm the modelCdNm to set
     */
    public void setModelCdNm(String modelCdNm) {
        this.modelCdNm = modelCdNm;
    }
    /**
     * @return the optionCdNm
     */
    public String getOptionCdNm() {
        return optionCdNm;
    }
    /**
     * @param optionCdNm the optionCdNm to set
     */
    public void setOptionCdNm(String optionCdNm) {
        this.optionCdNm = optionCdNm;
    }
    /**
     * @return the carlineCdNm
     */
    public String getCarlineCdNm() {
        return carlineCdNm;
    }
    /**
     * @param carlineCdNm the carlineCdNm to set
     */
    public void setCarlineCdNm(String carlineCdNm) {
        this.carlineCdNm = carlineCdNm;
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
     * @return the pcDstinTp
     */
    public String getPcDstinTp() {
        return pcDstinTp;
    }
    /**
     * @param pcDstinTp the pcDstinTp to set
     */
    public void setPcDstinTp(String pcDstinTp) {
        this.pcDstinTp = pcDstinTp;
    }
    /**
     * @return the salePsbYn
     */
    public String getSalePsbYn() {
        return salePsbYn;
    }
    /**
     * @param salePsbYn the salePsbYn to set
     */
    public void setSalePsbYn(String salePsbYn) {
        this.salePsbYn = salePsbYn;
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
     * @return the optionEnNm
     */
    public String getOptionEnNm() {
        return optionEnNm;
    }
    /**
     * @param optionEnNm the optionEnNm to set
     */
    public void setOptionEnNm(String optionEnNm) {
        this.optionEnNm = optionEnNm;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the whPrc
     */
    public Double getWhPrc() {
        return whPrc;
    }
    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(Double whPrc) {
        this.whPrc = whPrc;
    }
    /**
     * @return the msPrc
     */
    public Double getMsPrc() {
        return msPrc;
    }
    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(Double msPrc) {
        this.msPrc = msPrc;
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
     * @param licenseno the licenseno to set
     */
    public void setLicenseno(String licenseno) {
        this.licenseno = licenseno;
    }
    /**
     * @return the licenseno
     */
    public String getLicenseno() {
        return licenseno;
    }
    /**
     * @param brand the brand to set
     */
    public void setBrand(String brand) {
        this.brand = brand;
    }
    /**
     * @return the brand
     */
    public String getBrand() {
        return brand;
    }
    /**
     * @param img the img to set
     */
    public void setImg(String img) {
        this.img = img;
    }
    /**
     * @return the img
     */
    public String getImg() {
        return img;
    }
    /**
     * @param bstatus the bstatus to set
     */
    public void setBstatus(String bstatus) {
        this.bstatus = bstatus;
    }
    /**
     * @return the bstatus
     */
    public String getBstatus() {
        return bstatus;
    }



}
