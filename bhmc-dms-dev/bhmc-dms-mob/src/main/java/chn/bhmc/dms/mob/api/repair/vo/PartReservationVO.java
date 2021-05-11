package chn.bhmc.dms.mob.api.repair.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationVO.java
 * @Description : 부품예약 마스터 VO
 * @author KyungMok Kim
 * @since 2016. 5. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.    KyungMok Kim     최초 생성
 * </pre>
 */

public class PartReservationVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1942811430480678404L;

    /**
     * PREFIX_ID(PRE)
     **/
    private String preFixId;

    /**
    * 부품예약문서번호
    **/
    @NotEmpty
    private String parResvDocNo;

    /**
    * 딜러코드
    **/
    @NotEmpty
    private String dlrCd;

    /**
    * 차대번호
    **/
    //VIN_NO
    private String vinNo;

    /**
    * 차량등록번호
    **/
    //CAR_REG_NO
    private String carRegNo;

    /**
    * 엔진번호
    **/
    //ENGIN_NO
    private String enginNo;

    /**
    * 차량소유자ID
    **/
    //CAR_OWNER_ID
    private String carOwnerId;

    /**
    * 차량소유자명
    **/
    //CAR_OWNER_NM
    private String carOwnerNm;

    /**
    * 운전자ID
    **/
    //DRIVER_ID
    private String driverId;

    /**
    * 운전자명
    **/
    //DRIVER_NM
    private String driverNm;

    /**
     * 운전자 핸드폰
     **/
    private String driverHpNo;

    /**
    * 부품예약일자
    **/
    //PAR_RESV_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date parResvDt;

    /**
    * 부품예약상태코드
    **/
    //PAR_RESV_STAT_CD
    private String parResvStatCd;

    /**
     * 부품예약상태명
     **/
    //PAR_RESV_STAT_CD
    private String parResvStatNm;

    /**
     * 부품예류상태명
     **/
    private String parReadyStatCdNm;

    /**
    * 실제주문일자
    **/
    //REAL_ORD_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realOrdDt;

    /**
    * 예정도착일자
    **/
    //SCHE_ARRY_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date scheArryDt;

    /**
    * 실제도착일자
    **/
    //REAL_ARRY_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realArryDt;

    /**
    * 도착알람일자
    **/
    //ARRY_ALRT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arryAlrtDt;

    /**
    * 부품예약비고
    **/
    //PAR_RESV_REMARK
    private String parResvRemark;

    /**
    * 취소사유코드
    **/
    //CANC_REASON_CD
    private String cancReasonCd;

    /**
    * 취소사유명
    **/
    //CANC_REASON_CD_NM
    private String cancReasonNm;

    /**
    * 취소사유내용
    **/
    //CANC_REASON_CONT
    private String cancReasonCont;

    private String custRemark;

    /**
     * 원인코드1
     */
    private String cauCd1;
    /**
     * 원인코드명1
     */
    private String cauNm1;
    /**
     * 현상코드1
     */
    private String phenCd1;
    /**
     * 현상코드1
     */
    private String phenNm1;
    /**
     * 원인코드2
     */
    private String cauCd2;
    /**
     * 원인코드명2
     */
    private String cauNm2;
    /**
     * 현상코드2
     */
    private String phenCd2;
    /**
     * 현상코드2
     */
    private String phenNm2;
    /**
     * 선수금
     */
    private double preAmt;

    /**
     * 부품예약유형
     */
    private String parResvTp;

    /**
     * 부품예약유형명
     */
    private String parResvTpNm;

    /**
     * 차종명
     */
    private String carlineNm;

    /**
     * 모델명
     */
    private String modelNm;

    private int carRunDistVal;

    /**
     * 예약품목수량
     */
    private int itemCdQty;

    /**
     * 부품금액
     **/
     private Double parAmt;

     /**
     * 기타금액
     **/
     private Double etcAmt;

     /**
     * 할인금액
     **/
     private Double dcAmt;

     /**
     * 합계금액
     **/
     private Double sumAmt;

     private int reqQty;

     private String regUsrNm;

     /**
      * 예약완료시간
      */
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date confirmParDt;

     private String confirmParUsrNm;

     /**
      * 취소일자
      **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date cancParResvDt;

     /**
      * 취소자
      **/
     private String cancParUsrNm;

     /**
      * 변경자
      **/
     //UPDT_USR_NM
     private String updtUsrNm;

     /**
      * 부품예약프린트일자
      **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date parResvPrintDt;

     /**
      * 프린트여부
      **/
     private String printYn;

     /**
      * 부품예약알람일자
      **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date parResvAlarmDt;

     /**
      * 부품예약알람자ID
      **/
     private String parResvAlarmId;

     /**
      * 알람여부
      **/
     private String alarmYn;


    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the reqQty
     */
    public int getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(int reqQty) {
        this.reqQty = reqQty;
    }

    /**
     * @return the parAmt
     */
    public Double getParAmt() {
        return parAmt;
    }

    /**
     * @param parAmt the parAmt to set
     */
    public void setParAmt(Double parAmt) {
        this.parAmt = parAmt;
    }

    /**
     * @return the etcAmt
     */
    public Double getEtcAmt() {
        return etcAmt;
    }

    /**
     * @param etcAmt the etcAmt to set
     */
    public void setEtcAmt(Double etcAmt) {
        this.etcAmt = etcAmt;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the sumAmt
     */
    public Double getSumAmt() {
        return sumAmt;
    }

    /**
     * @param sumAmt the sumAmt to set
     */
    public void setSumAmt(Double sumAmt) {
        this.sumAmt = sumAmt;
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
     * @return the carRunDistVal
     */
    public int getCarRunDistVal() {
        return carRunDistVal;
    }

    /**
     * @param carRunDistVal the carRunDistVal to set
     */
    public void setCarRunDistVal(int carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }

    /**
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }

    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }

    /**
     * @return the parResvDocNo
     */
    public String getParResvDocNo() {
        return parResvDocNo;
    }

    /**
     * @param parResvDocNo the parResvDocNo to set
     */
    public void setParResvDocNo(String parResvDocNo) {
        this.parResvDocNo = parResvDocNo;
    }

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
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }

    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }

    /**
     * @return the carOwnerId
     */
    public String getCarOwnerId() {
        return carOwnerId;
    }

    /**
     * @param carOwnerId the carOwnerId to set
     */
    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    /**
     * @return the carOwnerNm
     */
    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    /**
     * @param carOwnerNm the carOwnerNm to set
     */
    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }

    /**
     * @return the driverId
     */
    public String getDriverId() {
        return driverId;
    }

    /**
     * @param driverId the driverId to set
     */
    public void setDriverId(String driverId) {
        this.driverId = driverId;
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
     * @return the driverHpNo
     */
    public String getDriverHpNo() {
        return driverHpNo;
    }

    /**
     * @param driverHpNo the driverHpNo to set
     */
    public void setDriverHpNo(String driverHpNo) {
        this.driverHpNo = driverHpNo;
    }

    /**
     * @return the parResvDt
     */
    public Date getParResvDt() {
        return parResvDt;
    }

    /**
     * @param parResvDt the parResvDt to set
     */
    public void setParResvDt(Date parResvDt) {
        this.parResvDt = parResvDt;
    }

    /**
     * @return the parResvStatCd
     */
    public String getParResvStatCd() {
        return parResvStatCd;
    }

    /**
     * @param parResvStatCd the parResvStatCd to set
     */
    public void setParResvStatCd(String parResvStatCd) {
        this.parResvStatCd = parResvStatCd;
    }

    /**
     * @return the realOrdDt
     */
    public Date getRealOrdDt() {
        return realOrdDt;
    }

    /**
     * @param realOrdDt the realOrdDt to set
     */
    public void setRealOrdDt(Date realOrdDt) {
        this.realOrdDt = realOrdDt;
    }

    /**
     * @return the scheArryDt
     */
    public Date getScheArryDt() {
        return scheArryDt;
    }

    /**
     * @param scheArryDt the scheArryDt to set
     */
    public void setScheArryDt(Date scheArryDt) {
        this.scheArryDt = scheArryDt;
    }

    /**
     * @return the realArryDt
     */
    public Date getRealArryDt() {
        return realArryDt;
    }

    /**
     * @param realArryDt the realArryDt to set
     */
    public void setRealArryDt(Date realArryDt) {
        this.realArryDt = realArryDt;
    }

    /**
     * @return the arryAlrtDt
     */
    public Date getArryAlrtDt() {
        return arryAlrtDt;
    }

    /**
     * @param arryAlrtDt the arryAlrtDt to set
     */
    public void setArryAlrtDt(Date arryAlrtDt) {
        this.arryAlrtDt = arryAlrtDt;
    }

    /**
     * @return the parResvRemark
     */
    public String getParResvRemark() {
        return parResvRemark;
    }

    /**
     * @param parResvRemark the parResvRemark to set
     */
    public void setParResvRemark(String parResvRemark) {
        this.parResvRemark = parResvRemark;
    }

    /**
     * @return the cancReasonCd
     */
    public String getCancReasonCd() {
        return cancReasonCd;
    }

    /**
     * @param cancReasonCd the cancReasonCd to set
     */
    public void setCancReasonCd(String cancReasonCd) {
        this.cancReasonCd = cancReasonCd;
    }

    /**
     * @return the cancReasonNm
     */
    public String getCancReasonNm() {
        return cancReasonNm;
    }

    /**
     * @param cancReasonNm the cancReasonNm to set
     */
    public void setCancReasonNm(String cancReasonNm) {
        this.cancReasonNm = cancReasonNm;
    }

    /**
     * @return the cancReasonCont
     */
    public String getCancReasonCont() {
        return cancReasonCont;
    }

    /**
     * @param cancReasonCont the cancReasonCont to set
     */
    public void setCancReasonCont(String cancReasonCont) {
        this.cancReasonCont = cancReasonCont;
    }

    /**
     * @return the custRemark
     */
    public String getCustRemark() {
        return custRemark;
    }

    /**
     * @param custRemark the custRemark to set
     */
    public void setCustRemark(String custRemark) {
        this.custRemark = custRemark;
    }

    /**
     * @return the cauCd1
     */
    public String getCauCd1() {
        return cauCd1;
    }

    /**
     * @param cauCd1 the cauCd1 to set
     */
    public void setCauCd1(String cauCd1) {
        this.cauCd1 = cauCd1;
    }

    /**
     * @return the cauNm1
     */
    public String getCauNm1() {
        return cauNm1;
    }

    /**
     * @param cauNm1 the cauNm1 to set
     */
    public void setCauNm1(String cauNm1) {
        this.cauNm1 = cauNm1;
    }

    /**
     * @return the phenCd1
     */
    public String getPhenCd1() {
        return phenCd1;
    }

    /**
     * @param phenCd1 the phenCd1 to set
     */
    public void setPhenCd1(String phenCd1) {
        this.phenCd1 = phenCd1;
    }

    /**
     * @return the phenNm1
     */
    public String getPhenNm1() {
        return phenNm1;
    }

    /**
     * @param phenNm1 the phenNm1 to set
     */
    public void setPhenNm1(String phenNm1) {
        this.phenNm1 = phenNm1;
    }

    /**
     * @return the cauCd2
     */
    public String getCauCd2() {
        return cauCd2;
    }

    /**
     * @param cauCd2 the cauCd2 to set
     */
    public void setCauCd2(String cauCd2) {
        this.cauCd2 = cauCd2;
    }

    /**
     * @return the cauNm2
     */
    public String getCauNm2() {
        return cauNm2;
    }

    /**
     * @param cauNm2 the cauNm2 to set
     */
    public void setCauNm2(String cauNm2) {
        this.cauNm2 = cauNm2;
    }

    /**
     * @return the phenCd2
     */
    public String getPhenCd2() {
        return phenCd2;
    }

    /**
     * @param phenCd2 the phenCd2 to set
     */
    public void setPhenCd2(String phenCd2) {
        this.phenCd2 = phenCd2;
    }

    /**
     * @return the phenNm2
     */
    public String getPhenNm2() {
        return phenNm2;
    }

    /**
     * @param phenNm2 the phenNm2 to set
     */
    public void setPhenNm2(String phenNm2) {
        this.phenNm2 = phenNm2;
    }

    /**
     * @return the parResvTp
     */
    public String getParResvTp() {
        return parResvTp;
    }

    /**
     * @param parResvTp the parResvTp to set
     */
    public void setParResvTp(String parResvTp) {
        this.parResvTp = parResvTp;
    }


    public String getParResvTpNm() {
        return parResvTpNm;
    }

    public void setParResvTpNm(String parResvTpNm) {
        this.parResvTpNm = parResvTpNm;
    }

    /**
     * @return the preAmt
     */
    public double getPreAmt() {
        return preAmt;
    }

    /**
     * @param preAmt the preAmt to set
     */
    public void setPreAmt(double preAmt) {
        this.preAmt = preAmt;
    }

    /**
     * @return the parResvStatNm
     */
    public String getParResvStatNm() {
        return parResvStatNm;
    }

    /**
     * @param parResvStatNm the parResvStatNm to set
     */
    public void setParResvStatNm(String parResvStatNm) {
        this.parResvStatNm = parResvStatNm;
    }

    /**
     * @return the confirmParDt
     */
    public Date getConfirmParDt() {
        return confirmParDt;
    }

    /**
     * @param confirmParDt the confirmParDt to set
     */
    public void setConfirmParDt(Date confirmParDt) {
        this.confirmParDt = confirmParDt;
    }

    /**
     * @return the confirmParUsrNm
     */
    public String getConfirmParUsrNm() {
        return confirmParUsrNm;
    }

    /**
     * @param confirmParUsrNm the confirmParUsrNm to set
     */
    public void setConfirmParUsrNm(String confirmParUsrNm) {
        this.confirmParUsrNm = confirmParUsrNm;
    }

    /**
     * @return the cancParResvDt
     */
    public Date getCancParResvDt() {
        return cancParResvDt;
    }

    /**
     * @param cancParResvDt the cancParResvDt to set
     */
    public void setCancParResvDt(Date cancParResvDt) {
        this.cancParResvDt = cancParResvDt;
    }

    /**
     * @return the cancParUsrNm
     */
    public String getCancParUsrNm() {
        return cancParUsrNm;
    }

    /**
     * @param cancParUsrNm the cancParUsrNm to set
     */
    public void setCancParUsrNm(String cancParUsrNm) {
        this.cancParUsrNm = cancParUsrNm;
    }

    /**
     * @return the parReadyStatCdNm
     */
    public String getParReadyStatCdNm() {
        return parReadyStatCdNm;
    }

    /**
     * @param parReadyStatCdNm the parReadyStatCdNm to set
     */
    public void setParReadyStatCdNm(String parReadyStatCdNm) {
        this.parReadyStatCdNm = parReadyStatCdNm;
    }

    /**
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }

    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }

    /**
     * @return the itemCdQty
     */
    public int getItemCdQty() {
        return itemCdQty;
    }

    /**
     * @param itemCdQty the itemCdQty to set
     */
    public void setItemCdQty(int itemCdQty) {
        this.itemCdQty = itemCdQty;
    }

    /**
     * @return the parResvPrintDt
     */
    public Date getParResvPrintDt() {
        return parResvPrintDt;
    }

    /**
     * @param parResvPrintDt the parResvPrintDt to set
     */
    public void setParResvPrintDt(Date parResvPrintDt) {
        this.parResvPrintDt = parResvPrintDt;
    }

    /**
     * @return the printYn
     */
    public String getPrintYn() {
        return printYn;
    }

    /**
     * @param printYn the printYn to set
     */
    public void setPrintYn(String printYn) {
        this.printYn = printYn;
    }

    /**
     * @return the parResvAlarmDt
     */
    public Date getParResvAlarmDt() {
        return parResvAlarmDt;
    }

    /**
     * @param parResvAlarmDt the parResvAlarmDt to set
     */
    public void setParResvAlarmDt(Date parResvAlarmDt) {
        this.parResvAlarmDt = parResvAlarmDt;
    }

    /**
     * @return the parResvAlarmId
     */
    public String getParResvAlarmId() {
        return parResvAlarmId;
    }

    /**
     * @param parResvAlarmId the parResvAlarmId to set
     */
    public void setParResvAlarmId(String parResvAlarmId) {
        this.parResvAlarmId = parResvAlarmId;
    }

    /**
     * @return the alarmYn
     */
    public String getAlarmYn() {
        return alarmYn;
    }

    /**
     * @param alarmYn the alarmYn to set
     */
    public void setAlarmYn(String alarmYn) {
        this.alarmYn = alarmYn;
    }

}