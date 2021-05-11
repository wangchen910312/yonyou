package chn.bhmc.dms.sal.svo.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AskHelpCarPopupApplyVO
 * @Description : 구원차/대부차 차량 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.02.24      Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"      , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="usrId"      , mesgKey="sal.lbl.usrId")
   ,@ValidField(field="reqNo"      , mesgKey="sal.lbl.reqNo")
   ,@ValidField(field="reqSeq"     , mesgKey="sal.lbl.reqSeq")
   ,@ValidField(field="carlineCd"  , mesgKey="sal.lbl.carlineCd")
   ,@ValidField(field="modelCd"    , mesgKey="sal.lbl.modelCd")
   ,@ValidField(field="ocnCd"      , mesgKey="sal.lbl.ocnCd")
   ,@ValidField(field="extColorCd" , mesgKey="sal.lbl.extColorCd")
   ,@ValidField(field="intColorCd" , mesgKey="sal.lbl.intColorCd")
   ,@ValidField(field="spcCarQty"  , mesgKey="sal.lbl.spcCarQty")
   ,@ValidField(field="ordNo"      , mesgKey="sal.lbl.ordNo")
   ,@ValidField(field="befOrdNo"   , mesgKey="sal.lbl.befOrdNo")
   ,@ValidField(field="updtUsrId"  , mesgKey="sal.lbl.updtUsrId")
   })
public class AskHelpCarPopupCarVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2119951693058019781L;

    /**
     * 딜러코드
     **/
    private  String      dlrCd;
    private  String      dlrNm;

    /**
     * 사용자ID
     **/
    private  String      usrId;
    private  String      usrNm;

    /**
     * 요청번호
     **/
    private  int         reqNo;

    /**
     * 요청일련번호
     **/
    private  String      reqSeq;

    /**
     * 차종코드
     **/
    private  String      carlineCd;
    private  String      carlineNm;

    /**
     * 모델코드
     **/
    private  String      modelCd;
    private  String      modelNm;

    //차관코드
    private  String      fscpModtpCd;

    /**
     * OCN코드
     **/
    private  String      ocnCd;
    private  String      ocnNm;

    /**
     * 외장색상코드
     **/
    private  String      extColorCd;
    private  String      extColorNm;

    /**
     * 내장색상코드
     **/
    private  String      intColorCd;
    private  String      intColorNm;

    /**
     * 특수차량수량
     **/
    private  int         spcCarQty;

    /**
     * 오더번호
     **/
    private  String      ordNo;

    /**
     * 이전오더번호
     **/
    private  String      befOrdNo;

    /**
     * 차량유형 설명
     */
    private  String      policyCont;
    private  long        seq;

    /**
     * 수정자id
     */
    private  String      updtUsrId;

    /**
     * 차량유형
     */
    private  String      tpCd;

    /**
     * 상태
     */
    private String approveCd;

    /**
     * 오더년월
     */
    private String ordYyMmDt;

    /**
     * 오더주기
     */
    private String ordPrid;

    /**
     * 차관코드
     */
    private String fscCd;
    private String fscNm;

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
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the reqNo
     */
    public int getReqNo() {
        return reqNo;
    }

    /**
     * @param reqNo the reqNo to set
     */
    public void setReqNo(int reqNo) {
        this.reqNo = reqNo;
    }

    /**
     * @return the reqSeq
     */
    public String getReqSeq() {
        return reqSeq;
    }

    /**
     * @param reqSeq the reqSeq to set
     */
    public void setReqSeq(String reqSeq) {
        this.reqSeq = reqSeq;
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
     * @return the spcCarQty
     */
    public int getSpcCarQty() {
        return spcCarQty;
    }

    /**
     * @param spcCarQty the spcCarQty to set
     */
    public void setSpcCarQty(int spcCarQty) {
        this.spcCarQty = spcCarQty;
    }

    /**
     * @return the ordNo
     */
    public String getOrdNo() {
        return ordNo;
    }

    /**
     * @param ordNo the ordNo to set
     */
    public void setOrdNo(String ordNo) {
        this.ordNo = ordNo;
    }

    /**
     * @return the befOrdNo
     */
    public String getBefOrdNo() {
        return befOrdNo;
    }

    /**
     * @param befOrdNo the befOrdNo to set
     */
    public void setBefOrdNo(String befOrdNo) {
        this.befOrdNo = befOrdNo;
    }

    /**
     * @return the policyCont
     */
    public String getPolicyCont() {
        return policyCont;
    }

    /**
     * @param policyCont the policyCont to set
     */
    public void setPolicyCont(String policyCont) {
        this.policyCont = policyCont;
    }

    /**
     * @return the seq
     */
    public long getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(long seq) {
        this.seq = seq;
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
     * @return the tpCd
     */
    public String getTpCd() {
        return tpCd;
    }

    /**
     * @param tpCd the tpCd to set
     */
    public void setTpCd(String tpCd) {
        this.tpCd = tpCd;
    }

    /**
     * @return the approveCd
     */
    public String getApproveCd() {
        return approveCd;
    }

    /**
     * @param approveCd the approveCd to set
     */
    public void setApproveCd(String approveCd) {
        this.approveCd = approveCd;
    }

    /**
     * @return the ordYyMmDt
     */
    public String getOrdYyMmDt() {
        return ordYyMmDt;
    }

    /**
     * @param ordYyMmDt the ordYyMmDt to set
     */
    public void setOrdYyMmDt(String ordYyMmDt) {
        this.ordYyMmDt = ordYyMmDt;
    }

    /**
     * @return the ordPrid
     */
    public String getOrdPrid() {
        return ordPrid;
    }

    /**
     * @param ordPrid the ordPrid to set
     */
    public void setOrdPrid(String ordPrid) {
        this.ordPrid = ordPrid;
    }


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
     * @return the fscCd
     */
    public String getFscCd() {
        return fscCd;
    }

    /**
     * @param fscCd the fscCd to set
     */
    public void setFscCd(String fscCd) {
        this.fscCd = fscCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
