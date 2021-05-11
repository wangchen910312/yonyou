package chn.bhmc.dms.ser.rev.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReservationReceiptVO.java
 * @Description : 예약마스터 VO
 * @author KyungMok Kim
 * @since 2016. 2. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 5.    KyungMok Kim     최초 생성
 * </pre>
 */

public class ReservationReceiptVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3423466103804954203L;

    /**
     * PREFIX
     **/
    private String preFixId;

    /**
    * 예약문서번호
    **/
    private String resvDocNo;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    /**
    * 차대번호
    **/
    private String vinNo;

    /**
    * 차량등록번호
    **/
    private String carRegNo;

    /**
    * 엔진시리얼번호
    **/
    private String enginNo;

    /**
    * 차량소유자ID
    **/
    private String carOwnerId;

    /**
    * 차량소유자명
    **/
    private String carOwnerNm;

    /**
    * 운전자ID
    **/
    private String driverId;

    /**
    * 운전자명
    **/
    private String driverNm;

    /**
     * 운전자 휴대폰
     **/
    private String driverHpNo;

    /**
    * 예약유형
    **/
    private String resvTp;

    /**
     * 예약유형
     **/
    private String resvTpNm;

    /**
    * 예약일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resvDt;

    /**
    * 베이번호
    **/
    private String bayNo;

    /**
     * 베이이름
     **/
     private String bayNm;

    /**
    * TECMANID
    **/
    private String tecId;

    /**
    * TECMAN명
    **/
    private String tecNm;

    /**
    * SAID
    **/
    private String saId;

    /**
    * SA명
    **/
    private String saNm;

    /**
    * 희망예약일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date hopeResvDt;

    /**
    * 서비스예약시작일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serResvStartDt;

    /**
    * 서비스예약종료일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serResvEndDt;

    /**
     * 서비스예약시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resvStartDt;

    /**
     * 서비스예약종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resvEndDt;

    /**
    * 부품금액
    **/
    private Double parAmt;

    /**
    * 공임금액
    **/
    private Double lbrAmt;

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

    /**
    * 부가가치세금액
    **/
    private Double vatAmt;

    /**
    * 총합금액
    **/
    private Double totAmt;

    /**
    * 예치금액
    **/
    private Double balAmt;

    /**
    * 예약상태코드
    **/
    private String resvStatCd;

    /**
     * 예약상태코드
     **/
     private String resvStatCdNm;

    /**
    * 고객비고
    **/
    private String custRemark;

    /**
    * 취소사유코드
    **/
    private String cancReasonCd;

    /**
    * 취소사유내용
    **/
    private String cancReasonCont;

    /**
     * 취소일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date cancResvDt;

     /**
      * 취소자
      **/
     private String cancUsrNm;

    /**
    * 거리단위코드
    **/
    private String distUnitCd;

    /**
    * 방문차량수령시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitCarReceiveDt;

    /**
    * 방문차량수령연계인명
    **/
    private String vsitCarReceiveIfNm;

    /**
    * 방문차량수령연락처번호
    **/
    private String vsitCarReceiveCinoNo;

    /**
    * 방문차량수령주소명
    **/
    private String vsitCarReceiveAddrNm;

    /**
    * 차량수령일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carReceiveDt;

    /**
    * 방문인도연계인명
    **/
    private String vsitDlIfNm;

    /**
    * 방문인도연락처번호
    **/
    private String vsitDlCinoNo;

    /**
    * 방문인도주소명
    **/
    private String vsitDlAddrNm;

    /**
    * 방문일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitDt;

    /**
    * 방문연계인명
    **/
    private String vsitIfNm;

    /**
    * 방문연락처번호
    **/
    private String vsitCinoNo;

    /**
    * 방문주소명
    **/
    private String vsitAddrNm;

    /**
     * 예약불가 구분(01 or null:예약, 02:캘린더)
     */
    private String noResvTp;

    /**
     * RO그룹번호
     */
    private String roGrpNo;
    private String fmsId; //fms唯一标识
    private String  ResvWbTp;//维保类型
    private String resvContacts; //预约联系人
    private String resvPhone;//预约联系人电话
    /**
     * 차량접수일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carAcceptDt;

    /**
    * 사전점검번호
    **/
    private String diagDocNo;

    /**
    * 사전점검시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preChkDt;

    /**
    * 예약접수상태
    **/
    private String resvReptStatCd;

    /**
    * 예약서비스비고
    **/
    private String resvRemark;

    /**
    * 수령담당자명
    **/
    private String receivePrsnNm;

    /**
    * 수령출동일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiveMoveDt;

    /**
    * 수령출동주행거리값
    **/
    private int receiveMoveRunDistVal;

    /**
    * 수령차량복귀일자
    **/
    private Date receiveCarReturnDt;

    /**
    * 수령복귀주행거리값
    **/
    private int receiveReturnRunDistVal;

    /**
    * 배송담당자명
    **/
    private String dlPrsnNm;

    /**
    * 배송출동일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlMoveDt;

    /**
    * 배송출동주행거리값
    **/
    private int dlMoveRunDistVal;

    /**
    * 배송차복귀일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlCarReturnDt;

    /**
    * 배송복귀주행거리값
    **/
    private int dlReturnRunDistVal;

    /**
    * 방문서비스비고
    **/
    private String vsitSerRemark;

    /**
    * 현장도착일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date siteArrvDt;

    /**
    * 현장출발일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date siteStartDt;

    /**
    * 서비스복귀일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serReturnDt;

    /**
    * 방문서비스유형
    **/
    private String vsitSerTp;

    /**
    * 방문서비스차량ID
    **/
    private String vsitSerCarId;

    /**
    * 방문서비스차량명
    **/
    private String vsitSerCarNm;

    /**
    * 방문출동주행거리값
    **/
    private int vsitMoveRunDistVal;

    /**
    * 방문복귀주행거리값
    **/
    private int vsitReturnRunDistVal;

    /**
    * 인도서비스비고
    **/
    private String dlSerRemark;

    /**
     * 예약대기
     */
    private int aqty;

    /**
     * 예약준수
     */
    private int bqty;

    /**
     * 예약late
     */
    private int cqty;

    /**
     * 예약no show
     */
    private int dqty;

    /**
     * 예약취소
     */
    private int eqty;

    /**
     * 예약접수자
     */
    private String regUsrNm;

    /**
     * 예약수정자
     */
    private String updtUsrNm;

    /**
     * 차종명
     */
    private String carlineNm;

    /**
     * 모델명
     */
    private String modelNm;

    private int carRunDistVal;

    private String carId;

    private String kanbanStat;

    /**
     * 서비스예약 알람설정(A:자동, M:수동)
     */
    private String resvSerAlramCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 예약완료시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmDt;

    private String confirmUsrNm;

    /**
     * 예약프린트시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resvPrintDt;

    /**
     * 프린트여부
     */
    private String printYn;

    /**
     * 예약알람시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resvAlramDt;

    /**
     * 예약알람자ID
     */
    private String resvAlramUsrId;

    /**
     * 예약알람자명
     */
    private String resvAlramUsrNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date optDt;//状态变化时间（用于给fms传输）

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
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }

    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
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
     * @return the resvTp
     */
    public String getResvTp() {
        return resvTp;
    }

    /**
     * @param resvTp the resvTp to set
     */
    public void setResvTp(String resvTp) {
        this.resvTp = resvTp;
    }



    public String getResvTpNm() {
        return resvTpNm;
    }

    public void setResvTpNm(String resvTpNm) {
        this.resvTpNm = resvTpNm;
    }

    /**
     * @return the resvDt
     */
    public Date getResvDt() {
        return resvDt;
    }

    /**
     * @param resvDt the resvDt to set
     */
    public void setResvDt(Date resvDt) {
        this.resvDt = resvDt;
    }

    /**
     * @return the bayNo
     */
    public String getBayNo() {
        return bayNo;
    }

    /**
     * @param bayNo the bayNo to set
     */
    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
    }

    /**
     * @return the bayNm
     */
    public String getBayNm() {
        return bayNm;
    }

    /**
     * @param bayNm the bayNm to set
     */
    public void setBayNm(String bayNm) {
        this.bayNm = bayNm;
    }

    /**
     * @return the tecId
     */
    public String getTecId() {
        return tecId;
    }

    /**
     * @param tecId the tecId to set
     */
    public void setTecId(String tecId) {
        this.tecId = tecId;
    }

    /**
     * @return the tecNm
     */
    public String getTecNm() {
        return tecNm;
    }

    /**
     * @param tecNm the tecNm to set
     */
    public void setTecNm(String tecNm) {
        this.tecNm = tecNm;
    }

    /**
     * @return the saId
     */
    public String getSaId() {
        return saId;
    }

    /**
     * @param saId the saId to set
     */
    public void setSaId(String saId) {
        this.saId = saId;
    }

    /**
     * @return the saNm
     */
    public String getSaNm() {
        return saNm;
    }

    /**
     * @param saNm the saNm to set
     */
    public void setSaNm(String saNm) {
        this.saNm = saNm;
    }

    /**
     * @return the hopeResvDt
     */
    public Date getHopeResvDt() {
        return hopeResvDt;
    }

    /**
     * @param hopeResvDt the hopeResvDt to set
     */
    public void setHopeResvDt(Date hopeResvDt) {
        this.hopeResvDt = hopeResvDt;
    }

    /**
     * @return the serResvStartDt
     */
    public Date getSerResvStartDt() {
        return serResvStartDt;
    }

    /**
     * @param serResvStartDt the serResvStartDt to set
     */
    public void setSerResvStartDt(Date serResvStartDt) {
        this.serResvStartDt = serResvStartDt;
    }

    /**
     * @return the serResvEndDt
     */
    public Date getSerResvEndDt() {
        return serResvEndDt;
    }

    /**
     * @param serResvEndDt the serResvEndDt to set
     */
    public void setSerResvEndDt(Date serResvEndDt) {
        this.serResvEndDt = serResvEndDt;
    }


    public Date getResvStartDt() {
        return resvStartDt;
    }

    public void setResvStartDt(Date resvStartDt) {
        this.resvStartDt = resvStartDt;
    }

    public Date getResvEndDt() {
        return resvEndDt;
    }

    public void setResvEndDt(Date resvEndDt) {
        this.resvEndDt = resvEndDt;
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
     * @return the lbrAmt
     */
    public Double getLbrAmt() {
        return lbrAmt;
    }

    /**
     * @param lbrAmt the lbrAmt to set
     */
    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
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
     * @return the vatAmt
     */
    public Double getVatAmt() {
        return vatAmt;
    }

    /**
     * @param vatAmt the vatAmt to set
     */
    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the balAmt
     */
    public Double getBalAmt() {
        return balAmt;
    }

    /**
     * @param balAmt the balAmt to set
     */
    public void setBalAmt(Double balAmt) {
        this.balAmt = balAmt;
    }

    /**
     * @return the resvStatCd
     */
    public String getResvStatCd() {
        return resvStatCd;
    }

    /**
     * @param resvStatCd the resvStatCd to set
     */
    public void setResvStatCd(String resvStatCd) {
        this.resvStatCd = resvStatCd;
    }

    /**
     * @return the resvStatCdNm
     */
    public String getResvStatCdNm() {
        return resvStatCdNm;
    }

    /**
     * @param resvStatCdNm the resvStatCdNm to set
     */
    public void setResvStatCdNm(String resvStatCdNm) {
        this.resvStatCdNm = resvStatCdNm;
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
     * @return the distUnitCd
     */
    public String getDistUnitCd() {
        return distUnitCd;
    }

    /**
     * @param distUnitCd the distUnitCd to set
     */
    public void setDistUnitCd(String distUnitCd) {
        this.distUnitCd = distUnitCd;
    }

    /**
     * @return the vsitCarReceiveDt
     */
    public Date getVsitCarReceiveDt() {
        return vsitCarReceiveDt;
    }

    /**
     * @param vsitCarReceiveDt the vsitCarReceiveDt to set
     */
    public void setVsitCarReceiveDt(Date vsitCarReceiveDt) {
        this.vsitCarReceiveDt = vsitCarReceiveDt;
    }

    /**
     * @return the vsitCarReceiveIfNm
     */
    public String getVsitCarReceiveIfNm() {
        return vsitCarReceiveIfNm;
    }

    /**
     * @param vsitCarReceiveIfNm the vsitCarReceiveIfNm to set
     */
    public void setVsitCarReceiveIfNm(String vsitCarReceiveIfNm) {
        this.vsitCarReceiveIfNm = vsitCarReceiveIfNm;
    }

    /**
     * @return the vsitCarReceiveCinoNo
     */
    public String getVsitCarReceiveCinoNo() {
        return vsitCarReceiveCinoNo;
    }

    /**
     * @param vsitCarReceiveCinoNo the vsitCarReceiveCinoNo to set
     */
    public void setVsitCarReceiveCinoNo(String vsitCarReceiveCinoNo) {
        this.vsitCarReceiveCinoNo = vsitCarReceiveCinoNo;
    }

    /**
     * @return the vsitCarReceiveAddrNm
     */
    public String getVsitCarReceiveAddrNm() {
        return vsitCarReceiveAddrNm;
    }

    /**
     * @param vsitCarReceiveAddrNm the vsitCarReceiveAddrNm to set
     */
    public void setVsitCarReceiveAddrNm(String vsitCarReceiveAddrNm) {
        this.vsitCarReceiveAddrNm = vsitCarReceiveAddrNm;
    }

    /**
     * @return the carReceiveDt
     */
    public Date getCarReceiveDt() {
        return carReceiveDt;
    }

    /**
     * @param carReceiveDt the carReceiveDt to set
     */
    public void setCarReceiveDt(Date carReceiveDt) {
        this.carReceiveDt = carReceiveDt;
    }

    /**
     * @return the vsitDlIfNm
     */
    public String getVsitDlIfNm() {
        return vsitDlIfNm;
    }

    /**
     * @param vsitDlIfNm the vsitDlIfNm to set
     */
    public void setVsitDlIfNm(String vsitDlIfNm) {
        this.vsitDlIfNm = vsitDlIfNm;
    }

    /**
     * @return the vsitDlCinoNo
     */
    public String getVsitDlCinoNo() {
        return vsitDlCinoNo;
    }

    /**
     * @param vsitDlCinoNo the vsitDlCinoNo to set
     */
    public void setVsitDlCinoNo(String vsitDlCinoNo) {
        this.vsitDlCinoNo = vsitDlCinoNo;
    }

    /**
     * @return the vsitDlAddrNm
     */
    public String getVsitDlAddrNm() {
        return vsitDlAddrNm;
    }

    /**
     * @param vsitDlAddrNm the vsitDlAddrNm to set
     */
    public void setVsitDlAddrNm(String vsitDlAddrNm) {
        this.vsitDlAddrNm = vsitDlAddrNm;
    }

    /**
     * @return the vsitDt
     */
    public Date getVsitDt() {
        return vsitDt;
    }

    /**
     * @param vsitDt the vsitDt to set
     */
    public void setVsitDt(Date vsitDt) {
        this.vsitDt = vsitDt;
    }

    /**
     * @return the vsitIfNm
     */
    public String getVsitIfNm() {
        return vsitIfNm;
    }

    /**
     * @param vsitIfNm the vsitIfNm to set
     */
    public void setVsitIfNm(String vsitIfNm) {
        this.vsitIfNm = vsitIfNm;
    }

    /**
     * @return the vsitCinoNo
     */
    public String getVsitCinoNo() {
        return vsitCinoNo;
    }

    /**
     * @param vsitCinoNo the vsitCinoNo to set
     */
    public void setVsitCinoNo(String vsitCinoNo) {
        this.vsitCinoNo = vsitCinoNo;
    }

    /**
     * @return the vsitAddrNm
     */
    public String getVsitAddrNm() {
        return vsitAddrNm;
    }

    /**
     * @param vsitAddrNm the vsitAddrNm to set
     */
    public void setVsitAddrNm(String vsitAddrNm) {
        this.vsitAddrNm = vsitAddrNm;
    }

    /**
     * @return the noResvTp
     */
    public String getNoResvTp() {
        return noResvTp;
    }

    /**
     * @param noResvTp the noResvTp to set
     */
    public void setNoResvTp(String noResvTp) {
        this.noResvTp = noResvTp;
    }

    /**
     * @return the roGrpNo
     */
    public String getRoGrpNo() {
        return roGrpNo;
    }

    /**
     * @param roGrpNo the roGrpNo to set
     */
    public void setRoGrpNo(String roGrpNo) {
        this.roGrpNo = roGrpNo;
    }

    /**
     * @return the carAcceptDt
     */
    public Date getCarAcceptDt() {
        return carAcceptDt;
    }

    /**
     * @param carAcceptDt the carAcceptDt to set
     */
    public void setCarAcceptDt(Date carAcceptDt) {
        this.carAcceptDt = carAcceptDt;
    }

    /**
     * @return the diagDocNo
     */
    public String getDiagDocNo() {
        return diagDocNo;
    }

    /**
     * @param diagDocNo the diagDocNo to set
     */
    public void setDiagDocNo(String diagDocNo) {
        this.diagDocNo = diagDocNo;
    }

    /**
     * @return the preChkDt
     */
    public Date getPreChkDt() {
        return preChkDt;
    }

    /**
     * @param preChkDt the preChkDt to set
     */
    public void setPreChkDt(Date preChkDt) {
        this.preChkDt = preChkDt;
    }

    /**
     * @return the resvReptStatCd
     */
    public String getResvReptStatCd() {
        return resvReptStatCd;
    }

    /**
     * @param resvReptStatCd the resvReptStatCd to set
     */
    public void setResvReptStatCd(String resvReptStatCd) {
        this.resvReptStatCd = resvReptStatCd;
    }

    /**
     * @return the resvRemark
     */
    public String getResvRemark() {
        return resvRemark;
    }

    /**
     * @param resvRemark the resvRemark to set
     */
    public void setResvRemark(String resvRemark) {
        this.resvRemark = resvRemark;
    }

    /**
     * @return the receivePrsnNm
     */
    public String getReceivePrsnNm() {
        return receivePrsnNm;
    }

    /**
     * @param receivePrsnNm the receivePrsnNm to set
     */
    public void setReceivePrsnNm(String receivePrsnNm) {
        this.receivePrsnNm = receivePrsnNm;
    }

    /**
     * @return the receiveMoveDt
     */
    public Date getReceiveMoveDt() {
        return receiveMoveDt;
    }

    /**
     * @param receiveMoveDt the receiveMoveDt to set
     */
    public void setReceiveMoveDt(Date receiveMoveDt) {
        this.receiveMoveDt = receiveMoveDt;
    }

    /**
     * @return the receiveMoveRunDistVal
     */
    public int getReceiveMoveRunDistVal() {
        return receiveMoveRunDistVal;
    }

    /**
     * @param receiveMoveRunDistVal the receiveMoveRunDistVal to set
     */
    public void setReceiveMoveRunDistVal(int receiveMoveRunDistVal) {
        this.receiveMoveRunDistVal = receiveMoveRunDistVal;
    }

    /**
     * @return the receiveCarReturnDt
     */
    public Date getReceiveCarReturnDt() {
        return receiveCarReturnDt;
    }

    /**
     * @param receiveCarReturnDt the receiveCarReturnDt to set
     */
    public void setReceiveCarReturnDt(Date receiveCarReturnDt) {
        this.receiveCarReturnDt = receiveCarReturnDt;
    }

    /**
     * @return the receiveReturnRunDistVal
     */
    public int getReceiveReturnRunDistVal() {
        return receiveReturnRunDistVal;
    }

    /**
     * @param receiveReturnRunDistVal the receiveReturnRunDistVal to set
     */
    public void setReceiveReturnRunDistVal(int receiveReturnRunDistVal) {
        this.receiveReturnRunDistVal = receiveReturnRunDistVal;
    }

    /**
     * @return the dlPrsnNm
     */
    public String getDlPrsnNm() {
        return dlPrsnNm;
    }

    /**
     * @param dlPrsnNm the dlPrsnNm to set
     */
    public void setDlPrsnNm(String dlPrsnNm) {
        this.dlPrsnNm = dlPrsnNm;
    }

    /**
     * @return the dlMoveDt
     */
    public Date getDlMoveDt() {
        return dlMoveDt;
    }

    /**
     * @param dlMoveDt the dlMoveDt to set
     */
    public void setDlMoveDt(Date dlMoveDt) {
        this.dlMoveDt = dlMoveDt;
    }

    /**
     * @return the dlMoveRunDistVal
     */
    public int getDlMoveRunDistVal() {
        return dlMoveRunDistVal;
    }

    /**
     * @param dlMoveRunDistVal the dlMoveRunDistVal to set
     */
    public void setDlMoveRunDistVal(int dlMoveRunDistVal) {
        this.dlMoveRunDistVal = dlMoveRunDistVal;
    }

    /**
     * @return the dlCarReturnDt
     */
    public Date getDlCarReturnDt() {
        return dlCarReturnDt;
    }

    /**
     * @param dlCarReturnDt the dlCarReturnDt to set
     */
    public void setDlCarReturnDt(Date dlCarReturnDt) {
        this.dlCarReturnDt = dlCarReturnDt;
    }

    /**
     * @return the dlReturnRunDistVal
     */
    public int getDlReturnRunDistVal() {
        return dlReturnRunDistVal;
    }

    /**
     * @param dlReturnRunDistVal the dlReturnRunDistVal to set
     */
    public void setDlReturnRunDistVal(int dlReturnRunDistVal) {
        this.dlReturnRunDistVal = dlReturnRunDistVal;
    }

    /**
     * @return the vsitSerRemark
     */
    public String getVsitSerRemark() {
        return vsitSerRemark;
    }

    /**
     * @param vsitSerRemark the vsitSerRemark to set
     */
    public void setVsitSerRemark(String vsitSerRemark) {
        this.vsitSerRemark = vsitSerRemark;
    }

    /**
     * @return the siteArrvDt
     */
    public Date getSiteArrvDt() {
        return siteArrvDt;
    }

    /**
     * @param siteArrvDt the siteArrvDt to set
     */
    public void setSiteArrvDt(Date siteArrvDt) {
        this.siteArrvDt = siteArrvDt;
    }

    /**
     * @return the siteStartDt
     */
    public Date getSiteStartDt() {
        return siteStartDt;
    }

    /**
     * @param siteStartDt the siteStartDt to set
     */
    public void setSiteStartDt(Date siteStartDt) {
        this.siteStartDt = siteStartDt;
    }

    /**
     * @return the serReturnDt
     */
    public Date getSerReturnDt() {
        return serReturnDt;
    }

    /**
     * @param serReturnDt the serReturnDt to set
     */
    public void setSerReturnDt(Date serReturnDt) {
        this.serReturnDt = serReturnDt;
    }

    /**
     * @return the vsitSerTp
     */
    public String getVsitSerTp() {
        return vsitSerTp;
    }

    /**
     * @param vsitSerTp the vsitSerTp to set
     */
    public void setVsitSerTp(String vsitSerTp) {
        this.vsitSerTp = vsitSerTp;
    }

    /**
     * @return the vsitSerCarId
     */
    public String getVsitSerCarId() {
        return vsitSerCarId;
    }

    /**
     * @param vsitSerCarId the vsitSerCarId to set
     */
    public void setVsitSerCarId(String vsitSerCarId) {
        this.vsitSerCarId = vsitSerCarId;
    }

    /**
     * @return the vsitSerCarNm
     */
    public String getVsitSerCarNm() {
        return vsitSerCarNm;
    }

    /**
     * @param vsitSerCarNm the vsitSerCarNm to set
     */
    public void setVsitSerCarNm(String vsitSerCarNm) {
        this.vsitSerCarNm = vsitSerCarNm;
    }

    /**
     * @return the vsitMoveRunDistVal
     */
    public int getVsitMoveRunDistVal() {
        return vsitMoveRunDistVal;
    }

    /**
     * @param vsitMoveRunDistVal the vsitMoveRunDistVal to set
     */
    public void setVsitMoveRunDistVal(int vsitMoveRunDistVal) {
        this.vsitMoveRunDistVal = vsitMoveRunDistVal;
    }

    /**
     * @return the vsitReturnRunDistVal
     */
    public int getVsitReturnRunDistVal() {
        return vsitReturnRunDistVal;
    }

    /**
     * @param vsitReturnRunDistVal the vsitReturnRunDistVal to set
     */
    public void setVsitReturnRunDistVal(int vsitReturnRunDistVal) {
        this.vsitReturnRunDistVal = vsitReturnRunDistVal;
    }

    /**
     * @return the dlSerRemark
     */
    public String getDlSerRemark() {
        return dlSerRemark;
    }

    /**
     * @param dlSerRemark the dlSerRemark to set
     */
    public void setDlSerRemark(String dlSerRemark) {
        this.dlSerRemark = dlSerRemark;
    }

    /**
     * @return the aqty
     */
    public int getAqty() {
        return aqty;
    }

    /**
     * @param aqty the aqty to set
     */
    public void setAqty(int aqty) {
        this.aqty = aqty;
    }

    /**
     * @return the bqty
     */
    public int getBqty() {
        return bqty;
    }

    /**
     * @param bqty the bqty to set
     */
    public void setBqty(int bqty) {
        this.bqty = bqty;
    }

    /**
     * @return the cqty
     */
    public int getCqty() {
        return cqty;
    }

    /**
     * @param cqty the cqty to set
     */
    public void setCqty(int cqty) {
        this.cqty = cqty;
    }

    /**
     * @return the dqty
     */
    public int getDqty() {
        return dqty;
    }

    /**
     * @param dqty the dqty to set
     */
    public void setDqty(int dqty) {
        this.dqty = dqty;
    }

    /**
     * @return the eqty
     */
    public int getEqty() {
        return eqty;
    }

    /**
     * @param eqty the eqty to set
     */
    public void setEqty(int eqty) {
        this.eqty = eqty;
    }

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
     * @return the kanbanStat
     */
    public String getKanbanStat() {
        return kanbanStat;
    }

    /**
     * @param kanbanStat the kanbanStat to set
     */
    public void setKanbanStat(String kanbanStat) {
        this.kanbanStat = kanbanStat;
    }

    /**
     * @return the resvSerAlramCd
     */
    public String getResvSerAlramCd() {
        return resvSerAlramCd;
    }

    /**
     * @param resvSerAlramCd the resvSerAlramCd to set
     */
    public void setResvSerAlramCd(String resvSerAlramCd) {
        this.resvSerAlramCd = resvSerAlramCd;
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

    /**
     * @return the cancResvDt
     */
    public Date getCancResvDt() {
        return cancResvDt;
    }

    /**
     * @param cancResvDt the cancResvDt to set
     */
    public void setCancResvDt(Date cancResvDt) {
        this.cancResvDt = cancResvDt;
    }

    /**
     * @return the cancUsrNm
     */
    public String getCancUsrNm() {
        return cancUsrNm;
    }

    /**
     * @param cancUsrNm the cancUsrNm to set
     */
    public void setCancUsrNm(String cancUsrNm) {
        this.cancUsrNm = cancUsrNm;
    }

    /**
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }

    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
    }

    /**
     * @return the confirmUsrNm
     */
    public String getConfirmUsrNm() {
        return confirmUsrNm;
    }

    /**
     * @param confirmUsrNm the confirmUsrNm to set
     */
    public void setConfirmUsrNm(String confirmUsrNm) {
        this.confirmUsrNm = confirmUsrNm;
    }

    /**
     * @return the resvPrintDt
     */
    public Date getResvPrintDt() {
        return resvPrintDt;
    }

    /**
     * @param resvPrintDt the resvPrintDt to set
     */
    public void setResvPrintDt(Date resvPrintDt) {
        this.resvPrintDt = resvPrintDt;
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
     * @return the resvAlramDt
     */
    public Date getResvAlramDt() {
        return resvAlramDt;
    }

    /**
     * @param resvAlramDt the resvAlramDt to set
     */
    public void setResvAlramDt(Date resvAlramDt) {
        this.resvAlramDt = resvAlramDt;
    }

    /**
     * @return the resvAlramUsrId
     */
    public String getResvAlramUsrId() {
        return resvAlramUsrId;
    }

    /**
     * @param resvAlramUsrId the resvAlramUsrId to set
     */
    public void setResvAlramUsrId(String resvAlramUsrId) {
        this.resvAlramUsrId = resvAlramUsrId;
    }

    /**
     * @return the resvAlramUsrNm
     */
    public String getResvAlramUsrNm() {
        return resvAlramUsrNm;
    }

    /**
     * @param resvAlramUsrNm the resvAlramUsrNm to set
     */
    public void setResvAlramUsrNm(String resvAlramUsrNm) {
        this.resvAlramUsrNm = resvAlramUsrNm;
    }

	

	public String getFmsId() {
		return fmsId;
	}

	public void setFmsId(String fmsId) {
		this.fmsId = fmsId;
	}

	public String getResvWbTp() {
		return ResvWbTp;
	}

	public void setResvWbTp(String resvWbTp) {
		ResvWbTp = resvWbTp;
	}

	public String getResvContacts() {
		return resvContacts;
	}

	public void setResvContacts(String resvContacts) {
		this.resvContacts = resvContacts;
	}

	public String getResvPhone() {
		return resvPhone;
	}

	public void setResvPhone(String resvPhone) {
		this.resvPhone = resvPhone;
	}

	public Date getOptDt() {
		return optDt;
	}

	public void setOptDt(Date optDt) {
		this.optDt = optDt;
	}

}