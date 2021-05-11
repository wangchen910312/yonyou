 package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InventoryDueDiligenceVO
 * @Description : 재고실사 VO
 * @author Bong
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.       Bong                최초 생성
 * </pre>
 */

public class InventoryDueDiligenceVO extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8732621645085505171L;

    private String stockDdYyMm;              //재고실사년월일자
    private String stockDdDstinCd;           //재고실사구분코드
    private String seq;                      //일련번호
    private String vinNo;                    //차대번호
    private String carlineCd;                //차종
    private String carlineNm;
    private String modelCd;                  //모델
    private String modelNm;
    private String ocnCd;                    //OCN
    private String ocnNm;
    private String extColorCd;               //외장색
    private String extColorNm;
    private String intColorCd;               //내장색
    private String intColorNm;
    private String carStatCd;                //재고상태
    private String strgeCd;                  //창고
    private String locCd;                    //위치
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date manufactYyMmDt;           //생산년월
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;                       //입고일자
    private String stockAgingCnt;            //재고연령
    private String confirmYn;                //확인여부
    private String photoFilePathNm;          //사진파일경로
    private String updtUsrId;
    private String barcodeNo;


    /**
     * @return the barcodeNo
     */
    public String getBarcodeNo() {
        return barcodeNo;
    }
    /**
     * @param barcodeNo the barcodeNo to set
     */
    public void setBarcodeNo(String barcodeNo) {
        this.barcodeNo = barcodeNo;
    }
    /**
     * @return the stockDdYyMm
     */
    public String getStockDdYyMm() {
        return stockDdYyMm;
    }
    /**
     * @param stockDdYyMm the stockDdYyMm to set
     */
    public void setStockDdYyMm(String stockDdYyMm) {
        this.stockDdYyMm = stockDdYyMm;
    }
    /**
     * @return the stockDdDstinCd
     */
    public String getStockDdDstinCd() {
        return stockDdDstinCd;
    }
    /**
     * @param stockDdDstinCd the stockDdDstinCd to set
     */
    public void setStockDdDstinCd(String stockDdDstinCd) {
        this.stockDdDstinCd = stockDdDstinCd;
    }
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
     * @return the carStatCd
     */
    public String getCarStatCd() {
        return carStatCd;
    }
    /**
     * @param carStatCd the carStatCd to set
     */
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
    }
    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }
    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }
    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }
    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
    }
    /**
     * @return the manufactYyMmDt
     */
    public Date getManufactYyMmDt() {
        return manufactYyMmDt;
    }
    /**
     * @param manufactYyMmDt the manufactYyMmDt to set
     */
    public void setManufactYyMmDt(Date manufactYyMmDt) {
        this.manufactYyMmDt = manufactYyMmDt;
    }
    /**
     * @return the grDt
     */
    public Date getGrDt() {
        return grDt;
    }
    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(Date grDt) {
        this.grDt = grDt;
    }
    /**
     * @return the stockAgingCnt
     */
    public String getStockAgingCnt() {
        return stockAgingCnt;
    }
    /**
     * @param stockAgingCnt the stockAgingCnt to set
     */
    public void setStockAgingCnt(String stockAgingCnt) {
        this.stockAgingCnt = stockAgingCnt;
    }
    /**
     * @return the confirmYn
     */
    public String getConfirmYn() {
        return confirmYn;
    }
    /**
     * @param confirmYn the confirmYn to set
     */
    public void setConfirmYn(String confirmYn) {
        this.confirmYn = confirmYn;
    }
    /**
     * @return the photoFilePathNm
     */
    public String getPhotoFilePathNm() {
        return photoFilePathNm;
    }
    /**
     * @param photoFilePathNm the photoFilePathNm to set
     */
    public void setPhotoFilePathNm(String photoFilePathNm) {
        this.photoFilePathNm = photoFilePathNm;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}