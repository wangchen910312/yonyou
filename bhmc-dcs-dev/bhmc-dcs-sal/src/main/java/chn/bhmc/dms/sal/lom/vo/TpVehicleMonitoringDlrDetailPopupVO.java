package chn.bhmc.dms.sal.lom.vo;

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
 * @ClassName   : TpVehicleMonitoringDlrDetailPopupVO
 * @Description : 운송내역 상세조회 팝업 VO
 * @author Kim Jin Suk
 * @since 2016. 7. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 29.     Kim Jin Suk          최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="uploadTimestamp"  , mesgKey="sal.lbl.uploadTimestamp")
   ,@ValidField(field="vinNo"            , mesgKey="sal.lbl.vinNo")
   ,@ValidField(field="uploadSeq"        , mesgKey="sal.lbl.uploadSeq")
   ,@ValidField(field="uploadDt"         , mesgKey="sal.lbl.uploadDt")
   ,@ValidField(field="uploadHm"         , mesgKey="sal.lbl.uploadHm")
   ,@ValidField(field="dstbCmpNm"        , mesgKey="sal.lbl.dstbCmpNm")
   ,@ValidField(field="trsfCarNo"        , mesgKey="sal.lbl.trsfCarNo")
   ,@ValidField(field="trsfLocCd"        , mesgKey="sal.lbl.trsfLocCd")
   ,@ValidField(field="trsfStatCd"       , mesgKey="sal.lbl.trsfStatCd")
   ,@ValidField(field="driverNm"         , mesgKey="sal.lbl.driverNm")
   ,@ValidField(field="driverTelNo"      , mesgKey="sal.lbl.driverTelNo")
   ,@ValidField(field="preAlrtNtceCont"  , mesgKey="sal.lbl.preAlrtNtceCont")
   ,@ValidField(field="carRegNo"         , mesgKey="sal.lbl.carRegNo")
   ,@ValidField(field="dstbCmpDlDt"      , mesgKey="sal.lbl.dstbCmpDlDt")
})
public class TpVehicleMonitoringDlrDetailPopupVO extends BaseVO {

   /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3642702465951804053L;

/**
    * 업로드타임스탬프
    **/
   private  String            uploadTimestamp;

   /**
    * 차대번호
    **/
   private  String            vinNo;

   /**
    * 업로드일련번호
    **/
   private  String            uploadSeq;

   /**
    * 업로드일자
    **/
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date              uploadDt;

   /**
    * 업로드시간
    **/
   private  String            uploadHm;

   /**
    * 물류회사명
    **/
   private  String            dstbCmpNm;

   /**
    * 운송차량번호
    **/
   private  String            trsfCarNo;

   /**
    * 운송위치코드
    **/
   private  String            trsfLocCd;

   /**
    * 운송상태코드
    **/
   private  String            trsfStatCd;

   /**
    * 운전자명
    **/
   private  String            driverNm;

   /**
    * 운전자전화번호
    **/
   private  String            driverTelNo;

   /**
    * 조기경보통지내용
    **/
   private  String            preAlrtNtceCont;

   /**
    * 차량등록번호
    **/
   private  String            carRegNo;

   /**
    * 물류회사납품일자
    **/
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date              dstbCmpDlDt;

    /**
     * @return the uploadTimestamp
     */
    public String getUploadTimestamp() {
        return uploadTimestamp;
    }

    /**
     * @param uploadTimestamp the uploadTimestamp to set
     */
    public void setUploadTimestamp(String uploadTimestamp) {
        this.uploadTimestamp = uploadTimestamp;
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
     * @return the uploadSeq
     */
    public String getUploadSeq() {
        return uploadSeq;
    }

    /**
     * @param uploadSeq the uploadSeq to set
     */
    public void setUploadSeq(String uploadSeq) {
        this.uploadSeq = uploadSeq;
    }

    /**
     * @return the uploadDt
     */
    public Date getUploadDt() {
        return uploadDt;
    }

    /**
     * @param uploadDt the uploadDt to set
     */
    public void setUploadDt(Date uploadDt) {
        this.uploadDt = uploadDt;
    }

    /**
     * @return the uploadHm
     */
    public String getUploadHm() {
        return uploadHm;
    }

    /**
     * @param uploadHm the uploadHm to set
     */
    public void setUploadHm(String uploadHm) {
        this.uploadHm = uploadHm;
    }

    /**
     * @return the dstbCmpNm
     */
    public String getDstbCmpNm() {
        return dstbCmpNm;
    }

    /**
     * @param dstbCmpNm the dstbCmpNm to set
     */
    public void setDstbCmpNm(String dstbCmpNm) {
        this.dstbCmpNm = dstbCmpNm;
    }

    /**
     * @return the trsfCarNo
     */
    public String getTrsfCarNo() {
        return trsfCarNo;
    }

    /**
     * @param trsfCarNo the trsfCarNo to set
     */
    public void setTrsfCarNo(String trsfCarNo) {
        this.trsfCarNo = trsfCarNo;
    }

    /**
     * @return the trsfLocCd
     */
    public String getTrsfLocCd() {
        return trsfLocCd;
    }

    /**
     * @param trsfLocCd the trsfLocCd to set
     */
    public void setTrsfLocCd(String trsfLocCd) {
        this.trsfLocCd = trsfLocCd;
    }

    /**
     * @return the trsfStatCd
     */
    public String getTrsfStatCd() {
        return trsfStatCd;
    }

    /**
     * @param trsfStatCd the trsfStatCd to set
     */
    public void setTrsfStatCd(String trsfStatCd) {
        this.trsfStatCd = trsfStatCd;
    }

    /**
     * @return the driverNm
     */
    public String getDriverNm() {
        return driverNm;
    }

    /**
     * @param driverNm the driverNm to set
     */
    public void setDriverNm(String driverNm) {
        this.driverNm = driverNm;
    }

    /**
     * @return the driverTelNo
     */
    public String getDriverTelNo() {
        return driverTelNo;
    }

    /**
     * @param driverTelNo the driverTelNo to set
     */
    public void setDriverTelNo(String driverTelNo) {
        this.driverTelNo = driverTelNo;
    }

    /**
     * @return the preAlrtNtceCont
     */
    public String getPreAlrtNtceCont() {
        return preAlrtNtceCont;
    }

    /**
     * @param preAlrtNtceCont the preAlrtNtceCont to set
     */
    public void setPreAlrtNtceCont(String preAlrtNtceCont) {
        this.preAlrtNtceCont = preAlrtNtceCont;
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
     * @return the dstbCmpDlDt
     */
    public Date getDstbCmpDlDt() {
        return dstbCmpDlDt;
    }

    /**
     * @param dstbCmpDlDt the dstbCmpDlDt to set
     */
    public void setDstbCmpDlDt(Date dstbCmpDlDt) {
        this.dstbCmpDlDt = dstbCmpDlDt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}