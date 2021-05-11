 package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockViewVO
 * @Description : 재고조회 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"            , mesgKey="sal.lbl.dlrCd")
    ,@ValidField(field="carId"            , mesgKey="sal.lbl.carId")
   ,@ValidField(field="stockDt"          , mesgKey="sal.lbl.stockDt")
   ,@ValidField(field="vinNo"            , mesgKey="sal.lbl.vinNo")
   ,@ValidField(field="carlineCd"        , mesgKey="sal.lbl.carlineCd")
   ,@ValidField(field="modelCd"          , mesgKey="sal.lbl.modelCd")
   ,@ValidField(field="ocnCd"            , mesgKey="sal.lbl.ocnCd")
   ,@ValidField(field="extColorCd"       , mesgKey="sal.lbl.extColorCd")
   ,@ValidField(field="intColorCd"       , mesgKey="sal.lbl.intColorCd")
   ,@ValidField(field="carStatCd"        , mesgKey="sal.lbl.carStatCd")
   ,@ValidField(field="strgeCd"          , mesgKey="sal.lbl.strgeCd")
   ,@ValidField(field="locCd"            , mesgKey="sal.lbl.locCd")
   ,@ValidField(field="manufactYyMmDt"   , mesgKey="sal.lbl.manufactYyMmDt")
   ,@ValidField(field="grDt"             , mesgKey="sal.lbl.grDt")
   ,@ValidField(field="stockAgingCnt"    , mesgKey="sal.lbl.stockAgingCnt")
   ,@ValidField(field="confirmYn"        , mesgKey="sal.lbl.confirmYn")
   ,@ValidField(field="stockStatCd"      , mesgKey="sal.lbl.stockStatCd")
   ,@ValidField(field="photoFilePathNm"  , mesgKey="sal.lbl.photoFilePathNm")
   ,@ValidField(field="fileDocNo"        , mesgKey="sal.lbl.fileDocNo")
   ,@ValidField(field="remark"           , mesgKey="sal.lbl.remark")

})
public class StockDueVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2437199245867403702L;


    /**
     * 딜러코드
     **/
    private  String            dlrCd;

    /**
     * 차량ID
     **/
    private  String            carId;

    /**
     * 재고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              stockDt;

    /**
     * 차대번호
     **/
    private  String            vinNo;

    /**
     * 차종코드
     **/
    private  String            carlineCd;
    private  String            carlineNm;

    /**
     * 모델코드
     **/
    private  String            modelCd;
    private  String            modelNm;

    /**
     * OCN코드
     **/
    private  String            ocnCd;
    private  String            ocnNm;

    /**
     * 외장색상코드
     **/
    private  String            extColorCd;
    private  String            extColorNm;

    /**
     * 내장색상코드
     **/
    private  String            intColorCd;
    private  String            intColorNm;

    /**
     * 차량상태코드
     **/
    private  String            carStatCd;
    private  String            carStatNm;

    /**
     * 창고코드
     **/
    private  String            strgeCd;
    private  String            strgeNm;

    /**
     * 위치코드
     **/
    private  String            locCd;
    private  String            locNm;

    /**
     * 제작년월일자
     **/
    private  String            manufactYyMmDt;

    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              grDt;
    
    /**
     * 사인오프일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              signoffDt;

    /**
     * 공장출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              pltGiDt;
    
    /**
     * 재고월령수
     **/
    private  int               stockAgingCnt;

    /**
     * 확인여부
     **/
    private  String            confirmYn;

    /**
     * 재고상태코드
     **/
    private  String            stockStatCd;

    /**
     * 사진파일명
     **/
    private  String            photoFilePathNm;

    /**
     * 첨부파일문서번호
     **/
    private  String            fileDocNo;
    /**
     * 첨부파일 파일번호
     */
    private  String            fileNo;

    /**
     * 비고
     **/
    private  String            remark;

    /**
     * 총수
     */
    private int carTot;

    /**
     * 완료
     */
    private int conY;

    /**
     * 미완료
     */
    private int conN;

    /**
     * 바코드 번호
     */
    private String barcodeNo;

    
    
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

    /**
     * @return the stockDt
     */
    public Date getStockDt() {
        return stockDt;
    }

    /**
     * @param stockDt the stockDt to set
     */
    public void setStockDt(Date stockDt) {
        this.stockDt = stockDt;
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
     * @return the carStatNm
     */
    public String getCarStatNm() {
        return carStatNm;
    }

    /**
     * @param carStatNm the carStatNm to set
     */
    public void setCarStatNm(String carStatNm) {
        this.carStatNm = carStatNm;
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
     * @return the strgeNm
     */
    public String getStrgeNm() {
        return strgeNm;
    }

    /**
     * @param strgeNm the strgeNm to set
     */
    public void setStrgeNm(String strgeNm) {
        this.strgeNm = strgeNm;
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
     * @return the locNm
     */
    public String getLocNm() {
        return locNm;
    }

    /**
     * @param locNm the locNm to set
     */
    public void setLocNm(String locNm) {
        this.locNm = locNm;
    }

    /**
     * @return the manufactYyMmDt
     */
    public String getManufactYyMmDt() {
        return manufactYyMmDt;
    }

    /**
     * @param manufactYyMmDt the manufactYyMmDt to set
     */
    public void setManufactYyMmDt(String manufactYyMmDt) {
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
     * @return the signoffDt
     */
    public Date getSignoffDt() {
        return signoffDt;
    }

    /**
     * @param signoffDt the signoffDt to set
     */
    public void setSignoffDt(Date signoffDt) {
        this.signoffDt = signoffDt;
    }

    /**
     * @return the pltGiDt
     */
    public Date getPltGiDt() {
        return pltGiDt;
    }

    /**
     * @param pltGiDt the pltGiDt to set
     */
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
    }

    /**
     * @return the stockAgingCnt
     */
    public int getStockAgingCnt() {
        return stockAgingCnt;
    }

    /**
     * @param stockAgingCnt the stockAgingCnt to set
     */
    public void setStockAgingCnt(int stockAgingCnt) {
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
     * @return the stockStatCd
     */
    public String getStockStatCd() {
        return stockStatCd;
    }

    /**
     * @param stockStatCd the stockStatCd to set
     */
    public void setStockStatCd(String stockStatCd) {
        this.stockStatCd = stockStatCd;
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
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }

    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }

    /**
     * @return the fileNo
     */
    public String getFileNo() {
        return fileNo;
    }

    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the carTot
     */
    public int getCarTot() {
        return carTot;
    }

    /**
     * @param carTot the carTot to set
     */
    public void setCarTot(int carTot) {
        this.carTot = carTot;
    }

    /**
     * @return the conY
     */
    public int getConY() {
        return conY;
    }

    /**
     * @param conY the conY to set
     */
    public void setConY(int conY) {
        this.conY = conY;
    }

    /**
     * @return the conN
     */
    public int getConN() {
        return conN;
    }

    /**
     * @param conN the conN to set
     */
    public void setConN(int conN) {
        this.conN = conN;
    }

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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}