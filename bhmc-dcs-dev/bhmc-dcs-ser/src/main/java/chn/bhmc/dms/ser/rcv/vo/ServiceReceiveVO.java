package chn.bhmc.dms.ser.rcv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveVO.java
 * @Description : 수납마스터 VO
 * @author YIN XUEYUAN
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.    YIN XUEYUAN     최초 생성
 * </pre>
 */

public class ServiceReceiveVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4261304248646080095L;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    /**
     * 수납문서번호
     **/
    private String rcvDocNo;

    /**
    * 정산문서번호
    **/
    private String calcDocNo;

    /**
    * RO유형
    **/
    private String roTp;

    /**
     * RO유형
     **/
     private String roTpNm;

    /**
    * RO문서번호
    **/
    private String roDocNo;

    /**
    * RO그룹번호
    **/
    private String roGrpNo;

    /**
    * 예약문서번호
    **/
    private String resvDocNo;

    /**
    * 사전점검번호
    **/
    private String diagDocNo;

    /**
    * 사전점검일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preChkDt;

    /**
    * 원RO번호
    **/
    private String baseRoNo;

    /**
    * 보험신청번호
    **/
    private String incReqNo;

    /**
    * 고객비고
    **/
    private String custRemark;

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
    * 예약일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resvDt;

    /**
    * 주행거리값
    **/
    private int runDistVal;

    /**
    * 공임정산금액
    **/
    private Double lbrCalcAmt;

    /**
    * 공임할인율
    **/
    private Double lbrDcRate;

    /**
    * 공임할인금액
    **/
    private Double lbrDcAmt;

    /**
    * 공임BM포인트사용금액
    **/
    private Double lbrBmPointUseAmt;

    /**
    * 공임포인트사용금액
    **/
    private Double lbrPointUseAmt;

    /**
    * 공임기타할인금액
    **/
    private Double lbrEtcDcAmt;

    /**
    * 공임정산합계금액
    **/
    private Double lbrCalcSumAmt;

    /**
    * 부품정산금액
    **/
    private Double parCalcAmt;

    /**
    * 부품할인율
    **/
    private Double parDcRate;

    /**
    * 부품할인금액
    **/
    private Double parDcAmt;

    /**
    * 부품BM포인트사용금액
    **/
    private Double parBmPointUseAmt;

    /**
    * 부품포인트사용금액
    **/
    private Double parPointUseAmt;

    /**
    * 부품기타할인금액
    **/
    private Double parEtcDcAmt;

    /**
    * 부품정산합계금액
    **/
    private Double parCalcSumAmt;

    /**
    * 기타정산금액
    **/
    private Double etcCalcAmt;

    /**
    * 기타할인율
    **/
    private Double etcDcRate;

    /**
    * 기타할인금액
    **/
    private Double etcDcAmt;

    /**
    * 기타BM포인트사용금액
    **/
    private Double etcBmPointUseAmt;

    /**
    * 기타포인트사용금액
    **/
    private Double etcPointUseAmt;

    /**
    * 기타다른할인금액
    **/
    private Double etcOtherDcAmt;

    /**
    * 기타정산합계금액
    **/
    private Double etcCalcSumAmt;

    /**
    * 정산총금액
    **/
    private Double calcTotAmt;

    /**
    * 할인총율
    **/
    private Double dcTotRate;

    /**
    * 할인총금액
    **/
    private Double dcTotAmt;

    /**
    * BM포인트총금액
    **/
    private Double bmPointTotAmt;

    /**
    * 포인트총금액
    **/
    private Double pointTotAmt;

    /**
    * 기타총금액
    **/
    private Double etcTotAmt;

    /**
    * 최종정산총금액
    **/
    private Double lastCalcTotAmt;

    /**
    * 정산일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcDt;

    /**
    * 정산상태코드
    **/
    private String calcStatCd;

    /**
     * RO일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roDt;

    /**
     * 정산담당자ID
     **/
    private String calcPrsnId;

    /**
     * 정산담당자명
     **/
    private String calcPrsnNm;

    /**
     * 정비부품구분코드
     */
    private String serParDstinCd;

    /**
     * 고객유형
     */
    private String custTp;

    /** DETAIL SE_0560T 컬럼 **/


     /**
     * 정산하위문서번호
     **/
     private String rcvSubDocNo;

     /**
     * 지불유형
     **/
     private String paymTp;

     /**
      * 지불유형명
      **/
     private String paymTpNm;

     /**
     * 지불자명
     **/
     private String paymUsrNm;

     /**
     * 지불기간
     **/
     private String paymPrid;

     /**
      * 지불기간명
      **/
     private String paymPridNm;

     /**
     * 지불방법
     **/
     private String paymMthCd;

     /**
      * 지불방법
      **/
      private String rcvHisPaymMthCd;

     /**
      * 지불방법
      **/
     private String paymMthNm;

     /**
      * 지불방법
      **/
      private String rcvHisPaymMthCdNm;

     /**
     * 지불금액
     **/
     private Double paymAmt;

     private String paymRemark;

     /**
     * 수납금액
     **/
     private Double rcvAmt;

     /**
     * 수납완성일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date rcvCpltDt;

     /**
     * 미수금액
     **/
     private Double npayAmt;

     /**
     * 미수확인일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date npayChkDt;

     /**
     * 영수증번호
     **/
     private String rcptNo;

     /**
     * 영수증일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date rcptDt;

     /**
     * 수납비고
     **/
     private String rcvRemark;

     /**
      * 수납상태코드
      **/
     private String rcvStatCd;

     /**
      * 수납상태명
      **/
     private String rcvStatNm;

     /**
     * 수납취소여부
     **/
     private String rcvCancYn;

     /**
     * 수납취소일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date rcvCancDt;

     /**
     * 수납취소ID
     **/
     private String rcvCancId;

     /**
     * 환불금액
     **/
     private Double refdAmt;

     /**
     * 환불일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date refdDt;

     /**
     * 환불담당자명
     **/
     private String refdPrsnNm;

     /**
     * 환불비고
     **/
     private String refdRemark;

     /**
      * 결재자코드
      **/
     private String paymCd;

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
      * 영수증유형
      **/
     private String rcptTp;

     /**
      * 영수증유형명
      **/
     private String rcptTpNm;

     /**
      * 영수증유형
      **/
     private String rcvHisRcptTp;

     /**
      * 영수증유형명
      **/
     private String rcvHisRcptTpNm;

     /**
      * 절사금액
      **/
     private Double wonUnitCutAmt;

     /**
      * 제로절사금액
      **/
     private Double demicPointCutAmt;

     /**
      * 할인권한코드
      **/
     private String dcPermCd;

     /**
      * 할인율
      **/
     private Double dcRate;

     /**
      * 할인금액
      **/
     private Double dcAmt;

     /**
      * 예치금액
      **/
     private Double balAmt;

     /**
      * 선수금액
      **/
     private Double preAmt;

     /**
      * 지불자코드
      **/
     private String paymUsrId;

     /**
      * 할인권한명
      **/
     private String dcPermNm;

     /**
      * 정산금액
      **/
     private double calcAmt;

     /**
      * 쿠폰번호
      **/
     private String cupnNo;

     /**
      * 쿠폰가격
      **/
     private Double cupnAmt;

     /**
      * 차종명
      */
     private String carlineNm;

     /**
      * 모델명
      */
     private String modelNm;

     /**
      * 청산완료여부
      */
     private String paymYn;

     /**
      * 청산완료여부명
      */
     private String paymYnNm;

     /**
     * 청산완료일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date paymYnDt;

     /**
      * 수납 히스토리 일자
      **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date rcvHistRegDt;

     /**
      * 수납 등록 일자
      **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date rcvRegDt;

     private int carRunDistVal;

     /**
      * 수납이력 상태
      */
     private String rcvHistStatNm;

     /**
      * 지불방식명
      */
     private String paymMthCdNm;

     /**
     * 수납이력금액
     **/
     private Double rcvHistAmt;

     /**
      * 수납자
      */
     private String regUsrNm;

     /**
      * RO 접수자
      */
     private String roRegUsrNm;

     /**
      * 정산 접수자
      */
     private String calcRegUsrNm;

     /**
      * 정산 완료자
      */
     private String calcCompUsrNm;


     /**
     * 수납완료이력일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date rcvCpltHistDt;

     /**
      * 인도주행거리값
      **/
     private int giRunDistVal;

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
     * @return the rcvDocNo
     */
    public String getRcvDocNo() {
        return rcvDocNo;
    }

    /**
     * @param rcvDocNo the rcvDocNo to set
     */
    public void setRcvDocNo(String rcvDocNo) {
        this.rcvDocNo = rcvDocNo;
    }

    /**
     * @return the calcDocNo
     */
    public String getCalcDocNo() {
        return calcDocNo;
    }

    /**
     * @param calcDocNo the calcDocNo to set
     */
    public void setCalcDocNo(String calcDocNo) {
        this.calcDocNo = calcDocNo;
    }

    /**
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    /**
     * @return the roTpNm
     */
    public String getRoTpNm() {
        return roTpNm;
    }

    /**
     * @param roTpNm the roTpNm to set
     */
    public void setRoTpNm(String roTpNm) {
        this.roTpNm = roTpNm;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
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
     * @return the baseRoNo
     */
    public String getBaseRoNo() {
        return baseRoNo;
    }

    /**
     * @param baseRoNo the baseRoNo to set
     */
    public void setBaseRoNo(String baseRoNo) {
        this.baseRoNo = baseRoNo;
    }

    /**
     * @return the incReqNo
     */
    public String getIncReqNo() {
        return incReqNo;
    }

    /**
     * @param incReqNo the incReqNo to set
     */
    public void setIncReqNo(String incReqNo) {
        this.incReqNo = incReqNo;
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
     * @return the runDistVal
     */
    public int getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }

    /**
     * @return the lbrCalcAmt
     */
    public Double getLbrCalcAmt() {
        return lbrCalcAmt;
    }

    /**
     * @param lbrCalcAmt the lbrCalcAmt to set
     */
    public void setLbrCalcAmt(Double lbrCalcAmt) {
        this.lbrCalcAmt = lbrCalcAmt;
    }

    /**
     * @return the lbrDcRate
     */
    public Double getLbrDcRate() {
        return lbrDcRate;
    }

    /**
     * @param lbrDcRate the lbrDcRate to set
     */
    public void setLbrDcRate(Double lbrDcRate) {
        this.lbrDcRate = lbrDcRate;
    }

    /**
     * @return the lbrDcAmt
     */
    public Double getLbrDcAmt() {
        return lbrDcAmt;
    }

    /**
     * @param lbrDcAmt the lbrDcAmt to set
     */
    public void setLbrDcAmt(Double lbrDcAmt) {
        this.lbrDcAmt = lbrDcAmt;
    }

    /**
     * @return the lbrBmPointUseAmt
     */
    public Double getLbrBmPointUseAmt() {
        return lbrBmPointUseAmt;
    }

    /**
     * @param lbrBmPointUseAmt the lbrBmPointUseAmt to set
     */
    public void setLbrBmPointUseAmt(Double lbrBmPointUseAmt) {
        this.lbrBmPointUseAmt = lbrBmPointUseAmt;
    }

    /**
     * @return the lbrPointUseAmt
     */
    public Double getLbrPointUseAmt() {
        return lbrPointUseAmt;
    }

    /**
     * @param lbrPointUseAmt the lbrPointUseAmt to set
     */
    public void setLbrPointUseAmt(Double lbrPointUseAmt) {
        this.lbrPointUseAmt = lbrPointUseAmt;
    }

    /**
     * @return the lbrEtcDcAmt
     */
    public Double getLbrEtcDcAmt() {
        return lbrEtcDcAmt;
    }

    /**
     * @param lbrEtcDcAmt the lbrEtcDcAmt to set
     */
    public void setLbrEtcDcAmt(Double lbrEtcDcAmt) {
        this.lbrEtcDcAmt = lbrEtcDcAmt;
    }

    /**
     * @return the lbrCalcSumAmt
     */
    public Double getLbrCalcSumAmt() {
        return lbrCalcSumAmt;
    }

    /**
     * @param lbrCalcSumAmt the lbrCalcSumAmt to set
     */
    public void setLbrCalcSumAmt(Double lbrCalcSumAmt) {
        this.lbrCalcSumAmt = lbrCalcSumAmt;
    }

    /**
     * @return the parCalcAmt
     */
    public Double getParCalcAmt() {
        return parCalcAmt;
    }

    /**
     * @param parCalcAmt the parCalcAmt to set
     */
    public void setParCalcAmt(Double parCalcAmt) {
        this.parCalcAmt = parCalcAmt;
    }

    /**
     * @return the parDcRate
     */
    public Double getParDcRate() {
        return parDcRate;
    }

    /**
     * @param parDcRate the parDcRate to set
     */
    public void setParDcRate(Double parDcRate) {
        this.parDcRate = parDcRate;
    }

    /**
     * @return the parDcAmt
     */
    public Double getParDcAmt() {
        return parDcAmt;
    }

    /**
     * @param parDcAmt the parDcAmt to set
     */
    public void setParDcAmt(Double parDcAmt) {
        this.parDcAmt = parDcAmt;
    }

    /**
     * @return the parBmPointUseAmt
     */
    public Double getParBmPointUseAmt() {
        return parBmPointUseAmt;
    }

    /**
     * @param parBmPointUseAmt the parBmPointUseAmt to set
     */
    public void setParBmPointUseAmt(Double parBmPointUseAmt) {
        this.parBmPointUseAmt = parBmPointUseAmt;
    }

    /**
     * @return the parPointUseAmt
     */
    public Double getParPointUseAmt() {
        return parPointUseAmt;
    }

    /**
     * @param parPointUseAmt the parPointUseAmt to set
     */
    public void setParPointUseAmt(Double parPointUseAmt) {
        this.parPointUseAmt = parPointUseAmt;
    }

    /**
     * @return the parEtcDcAmt
     */
    public Double getParEtcDcAmt() {
        return parEtcDcAmt;
    }

    /**
     * @param parEtcDcAmt the parEtcDcAmt to set
     */
    public void setParEtcDcAmt(Double parEtcDcAmt) {
        this.parEtcDcAmt = parEtcDcAmt;
    }

    /**
     * @return the parCalcSumAmt
     */
    public Double getParCalcSumAmt() {
        return parCalcSumAmt;
    }

    /**
     * @param parCalcSumAmt the parCalcSumAmt to set
     */
    public void setParCalcSumAmt(Double parCalcSumAmt) {
        this.parCalcSumAmt = parCalcSumAmt;
    }

    /**
     * @return the etcCalcAmt
     */
    public Double getEtcCalcAmt() {
        return etcCalcAmt;
    }

    /**
     * @param etcCalcAmt the etcCalcAmt to set
     */
    public void setEtcCalcAmt(Double etcCalcAmt) {
        this.etcCalcAmt = etcCalcAmt;
    }

    /**
     * @return the etcDcRate
     */
    public Double getEtcDcRate() {
        return etcDcRate;
    }

    /**
     * @param etcDcRate the etcDcRate to set
     */
    public void setEtcDcRate(Double etcDcRate) {
        this.etcDcRate = etcDcRate;
    }

    /**
     * @return the etcDcAmt
     */
    public Double getEtcDcAmt() {
        return etcDcAmt;
    }

    /**
     * @param etcDcAmt the etcDcAmt to set
     */
    public void setEtcDcAmt(Double etcDcAmt) {
        this.etcDcAmt = etcDcAmt;
    }

    /**
     * @return the etcBmPointUseAmt
     */
    public Double getEtcBmPointUseAmt() {
        return etcBmPointUseAmt;
    }

    /**
     * @param etcBmPointUseAmt the etcBmPointUseAmt to set
     */
    public void setEtcBmPointUseAmt(Double etcBmPointUseAmt) {
        this.etcBmPointUseAmt = etcBmPointUseAmt;
    }

    /**
     * @return the etcPointUseAmt
     */
    public Double getEtcPointUseAmt() {
        return etcPointUseAmt;
    }

    /**
     * @param etcPointUseAmt the etcPointUseAmt to set
     */
    public void setEtcPointUseAmt(Double etcPointUseAmt) {
        this.etcPointUseAmt = etcPointUseAmt;
    }

    /**
     * @return the etcOtherDcAmt
     */
    public Double getEtcOtherDcAmt() {
        return etcOtherDcAmt;
    }

    /**
     * @param etcOtherDcAmt the etcOtherDcAmt to set
     */
    public void setEtcOtherDcAmt(Double etcOtherDcAmt) {
        this.etcOtherDcAmt = etcOtherDcAmt;
    }

    /**
     * @return the etcCalcSumAmt
     */
    public Double getEtcCalcSumAmt() {
        return etcCalcSumAmt;
    }

    /**
     * @param etcCalcSumAmt the etcCalcSumAmt to set
     */
    public void setEtcCalcSumAmt(Double etcCalcSumAmt) {
        this.etcCalcSumAmt = etcCalcSumAmt;
    }

    /**
     * @return the calcTotAmt
     */
    public Double getCalcTotAmt() {
        return calcTotAmt;
    }

    /**
     * @param calcTotAmt the calcTotAmt to set
     */
    public void setCalcTotAmt(Double calcTotAmt) {
        this.calcTotAmt = calcTotAmt;
    }

    /**
     * @return the dcTotRate
     */
    public Double getDcTotRate() {
        return dcTotRate;
    }

    /**
     * @param dcTotRate the dcTotRate to set
     */
    public void setDcTotRate(Double dcTotRate) {
        this.dcTotRate = dcTotRate;
    }

    /**
     * @return the dcTotAmt
     */
    public Double getDcTotAmt() {
        return dcTotAmt;
    }

    /**
     * @param dcTotAmt the dcTotAmt to set
     */
    public void setDcTotAmt(Double dcTotAmt) {
        this.dcTotAmt = dcTotAmt;
    }

    /**
     * @return the bmPointTotAmt
     */
    public Double getBmPointTotAmt() {
        return bmPointTotAmt;
    }

    /**
     * @param bmPointTotAmt the bmPointTotAmt to set
     */
    public void setBmPointTotAmt(Double bmPointTotAmt) {
        this.bmPointTotAmt = bmPointTotAmt;
    }

    /**
     * @return the pointTotAmt
     */
    public Double getPointTotAmt() {
        return pointTotAmt;
    }

    /**
     * @param pointTotAmt the pointTotAmt to set
     */
    public void setPointTotAmt(Double pointTotAmt) {
        this.pointTotAmt = pointTotAmt;
    }

    /**
     * @return the etcTotAmt
     */
    public Double getEtcTotAmt() {
        return etcTotAmt;
    }

    /**
     * @param etcTotAmt the etcTotAmt to set
     */
    public void setEtcTotAmt(Double etcTotAmt) {
        this.etcTotAmt = etcTotAmt;
    }

    /**
     * @return the lastCalcTotAmt
     */
    public Double getLastCalcTotAmt() {
        return lastCalcTotAmt;
    }

    /**
     * @param lastCalcTotAmt the lastCalcTotAmt to set
     */
    public void setLastCalcTotAmt(Double lastCalcTotAmt) {
        this.lastCalcTotAmt = lastCalcTotAmt;
    }

    /**
     * @return the calcDt
     */
    public Date getCalcDt() {
        return calcDt;
    }

    /**
     * @param calcDt the calcDt to set
     */
    public void setCalcDt(Date calcDt) {
        this.calcDt = calcDt;
    }

    /**
     * @return the calcStatCd
     */
    public String getCalcStatCd() {
        return calcStatCd;
    }

    /**
     * @param calcStatCd the calcStatCd to set
     */
    public void setCalcStatCd(String calcStatCd) {
        this.calcStatCd = calcStatCd;
    }

    /**
     * @return the roDt
     */
    public Date getRoDt() {
        return roDt;
    }

    /**
     * @param roDt the roDt to set
     */
    public void setRoDt(Date roDt) {
        this.roDt = roDt;
    }

    /**
     * @return the calcPrsnId
     */
    public String getCalcPrsnId() {
        return calcPrsnId;
    }

    /**
     * @param calcPrsnId the calcPrsnId to set
     */
    public void setCalcPrsnId(String calcPrsnId) {
        this.calcPrsnId = calcPrsnId;
    }

    /**
     * @return the calcPrsnNm
     */
    public String getCalcPrsnNm() {
        return calcPrsnNm;
    }

    /**
     * @param calcPrsnNm the calcPrsnNm to set
     */
    public void setCalcPrsnNm(String calcPrsnNm) {
        this.calcPrsnNm = calcPrsnNm;
    }

    /**
     * @return the serParDstinCd
     */
    public String getSerParDstinCd() {
        return serParDstinCd;
    }

    /**
     * @param serParDstinCd the serParDstinCd to set
     */
    public void setSerParDstinCd(String serParDstinCd) {
        this.serParDstinCd = serParDstinCd;
    }

    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }

    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }

    /**
     * @return the rcvSubDocNo
     */
    public String getRcvSubDocNo() {
        return rcvSubDocNo;
    }

    /**
     * @param rcvSubDocNo the rcvSubDocNo to set
     */
    public void setRcvSubDocNo(String rcvSubDocNo) {
        this.rcvSubDocNo = rcvSubDocNo;
    }

    /**
     * @return the paymTp
     */
    public String getPaymTp() {
        return paymTp;
    }

    /**
     * @param paymTp the paymTp to set
     */
    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }

    /**
     * @return the paymUsrNm
     */
    public String getPaymUsrNm() {
        return paymUsrNm;
    }

    /**
     * @param paymUsrNm the paymUsrNm to set
     */
    public void setPaymUsrNm(String paymUsrNm) {
        this.paymUsrNm = paymUsrNm;
    }

    /**
     * @return the paymPrid
     */
    public String getPaymPrid() {
        return paymPrid;
    }

    /**
     * @param paymPrid the paymPrid to set
     */
    public void setPaymPrid(String paymPrid) {
        this.paymPrid = paymPrid;
    }

    /**
     * @return the paymMthCd
     */
    public String getPaymMthCd() {
        return paymMthCd;
    }

    /**
     * @param paymMthCd the paymMthCd to set
     */
    public void setPaymMthCd(String paymMthCd) {
        this.paymMthCd = paymMthCd;
    }

    /**
     * @return the paymAmt
     */
    public Double getPaymAmt() {
        return paymAmt;
    }

    /**
     * @param paymAmt the paymAmt to set
     */
    public void setPaymAmt(Double paymAmt) {
        this.paymAmt = paymAmt;
    }

    /**
     * @return the paymRemark
     */
    public String getPaymRemark() {
        return paymRemark;
    }

    /**
     * @param paymRemark the paymRemark to set
     */
    public void setPaymRemark(String paymRemark) {
        this.paymRemark = paymRemark;
    }

    /**
     * @return the rcvAmt
     */
    public Double getRcvAmt() {
        return rcvAmt;
    }

    /**
     * @param rcvAmt the rcvAmt to set
     */
    public void setRcvAmt(Double rcvAmt) {
        this.rcvAmt = rcvAmt;
    }

    /**
     * @return the rcvCpltDt
     */
    public Date getRcvCpltDt() {
        return rcvCpltDt;
    }

    /**
     * @param rcvCpltDt the rcvCpltDt to set
     */
    public void setRcvCpltDt(Date rcvCpltDt) {
        this.rcvCpltDt = rcvCpltDt;
    }

    /**
     * @return the npayAmt
     */
    public Double getNpayAmt() {
        return npayAmt;
    }

    /**
     * @param npayAmt the npayAmt to set
     */
    public void setNpayAmt(Double npayAmt) {
        this.npayAmt = npayAmt;
    }

    /**
     * @return the npayChkDt
     */
    public Date getNpayChkDt() {
        return npayChkDt;
    }

    /**
     * @param npayChkDt the npayChkDt to set
     */
    public void setNpayChkDt(Date npayChkDt) {
        this.npayChkDt = npayChkDt;
    }

    /**
     * @return the rcptNo
     */
    public String getRcptNo() {
        return rcptNo;
    }

    /**
     * @param rcptNo the rcptNo to set
     */
    public void setRcptNo(String rcptNo) {
        this.rcptNo = rcptNo;
    }

    /**
     * @return the rcptDt
     */
    public Date getRcptDt() {
        return rcptDt;
    }

    /**
     * @param rcptDt the rcptDt to set
     */
    public void setRcptDt(Date rcptDt) {
        this.rcptDt = rcptDt;
    }

    /**
     * @return the rcvRemark
     */
    public String getRcvRemark() {
        return rcvRemark;
    }

    /**
     * @param rcvRemark the rcvRemark to set
     */
    public void setRcvRemark(String rcvRemark) {
        this.rcvRemark = rcvRemark;
    }

    /**
     * @return the rcvStatCd
     */
    public String getRcvStatCd() {
        return rcvStatCd;
    }

    /**
     * @param rcvStatCd the rcvStatCd to set
     */
    public void setRcvStatCd(String rcvStatCd) {
        this.rcvStatCd = rcvStatCd;
    }



    public String getRcvStatNm() {
        return rcvStatNm;
    }

    public void setRcvStatNm(String rcvStatNm) {
        this.rcvStatNm = rcvStatNm;
    }

    /**
     * @return the rcvCancYn
     */
    public String getRcvCancYn() {
        return rcvCancYn;
    }

    /**
     * @param rcvCancYn the rcvCancYn to set
     */
    public void setRcvCancYn(String rcvCancYn) {
        this.rcvCancYn = rcvCancYn;
    }

    /**
     * @return the rcvCancDt
     */
    public Date getRcvCancDt() {
        return rcvCancDt;
    }

    /**
     * @param rcvCancDt the rcvCancDt to set
     */
    public void setRcvCancDt(Date rcvCancDt) {
        this.rcvCancDt = rcvCancDt;
    }

    /**
     * @return the rcvCancId
     */
    public String getRcvCancId() {
        return rcvCancId;
    }

    /**
     * @param rcvCancId the rcvCancId to set
     */
    public void setRcvCancId(String rcvCancId) {
        this.rcvCancId = rcvCancId;
    }

    /**
     * @return the refdAmt
     */
    public Double getRefdAmt() {
        return refdAmt;
    }

    /**
     * @param refdAmt the refdAmt to set
     */
    public void setRefdAmt(Double refdAmt) {
        this.refdAmt = refdAmt;
    }

    /**
     * @return the refdDt
     */
    public Date getRefdDt() {
        return refdDt;
    }

    /**
     * @param refdDt the refdDt to set
     */
    public void setRefdDt(Date refdDt) {
        this.refdDt = refdDt;
    }

    /**
     * @return the refdPrsnNm
     */
    public String getRefdPrsnNm() {
        return refdPrsnNm;
    }

    /**
     * @param refdPrsnNm the refdPrsnNm to set
     */
    public void setRefdPrsnNm(String refdPrsnNm) {
        this.refdPrsnNm = refdPrsnNm;
    }

    /**
     * @return the refdRemark
     */
    public String getRefdRemark() {
        return refdRemark;
    }

    /**
     * @param refdRemark the refdRemark to set
     */
    public void setRefdRemark(String refdRemark) {
        this.refdRemark = refdRemark;
    }

    /**
     * @return the paymCd
     */
    public String getPaymCd() {
        return paymCd;
    }

    /**
     * @param paymCd the paymCd to set
     */
    public void setPaymCd(String paymCd) {
        this.paymCd = paymCd;
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
     * @return the rcptTp
     */
    public String getRcptTp() {
        return rcptTp;
    }

    /**
     * @param rcptTp the rcptTp to set
     */
    public void setRcptTp(String rcptTp) {
        this.rcptTp = rcptTp;
    }

    /**
     * @return the wonUnitCutAmt
     */
    public Double getWonUnitCutAmt() {
        return wonUnitCutAmt;
    }

    /**
     * @param wonUnitCutAmt the wonUnitCutAmt to set
     */
    public void setWonUnitCutAmt(Double wonUnitCutAmt) {
        this.wonUnitCutAmt = wonUnitCutAmt;
    }

    /**
     * @return the demicPointCutAmt
     */
    public Double getDemicPointCutAmt() {
        return demicPointCutAmt;
    }

    /**
     * @param demicPointCutAmt the demicPointCutAmt to set
     */
    public void setDemicPointCutAmt(Double demicPointCutAmt) {
        this.demicPointCutAmt = demicPointCutAmt;
    }

    /**
     * @return the dcPermCd
     */
    public String getDcPermCd() {
        return dcPermCd;
    }

    /**
     * @param dcPermCd the dcPermCd to set
     */
    public void setDcPermCd(String dcPermCd) {
        this.dcPermCd = dcPermCd;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
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
     * @return the preAmt
     */
    public Double getPreAmt() {
        return preAmt;
    }

    /**
     * @param preAmt the preAmt to set
     */
    public void setPreAmt(Double preAmt) {
        this.preAmt = preAmt;
    }

    /**
     * @return the paymUsrId
     */
    public String getPaymUsrId() {
        return paymUsrId;
    }

    /**
     * @param paymUsrId the paymUsrId to set
     */
    public void setPaymUsrId(String paymUsrId) {
        this.paymUsrId = paymUsrId;
    }

    /**
     * @return the dcPermNm
     */
    public String getDcPermNm() {
        return dcPermNm;
    }

    /**
     * @param dcPermNm the dcPermNm to set
     */
    public void setDcPermNm(String dcPermNm) {
        this.dcPermNm = dcPermNm;
    }

    /**
     * @return the calcAmt
     */
    public double getCalcAmt() {
        return calcAmt;
    }

    /**
     * @param calcAmt the calcAmt to set
     */
    public void setCalcAmt(double calcAmt) {
        this.calcAmt = calcAmt;
    }

    /**
     * @return the cupnNo
     */
    public String getCupnNo() {
        return cupnNo;
    }

    /**
     * @param cupnNo the cupnNo to set
     */
    public void setCupnNo(String cupnNo) {
        this.cupnNo = cupnNo;
    }

    /**
     * @return the cupnAmt
     */
    public Double getCupnAmt() {
        return cupnAmt;
    }

    /**
     * @param cupnAmt the cupnAmt to set
     */
    public void setCupnAmt(Double cupnAmt) {
        this.cupnAmt = cupnAmt;
    }

    public String getPaymYn() {
        return paymYn;
    }

    public void setPaymYn(String paymYn) {
        this.paymYn = paymYn;
    }

    public String getPaymYnNm() {
        return paymYnNm;
    }

    public void setPaymYnNm(String paymYnNm) {
        this.paymYnNm = paymYnNm;
    }

    public String getPaymTpNm() {
        return paymTpNm;
    }

    public void setPaymTpNm(String paymTpNm) {
        this.paymTpNm = paymTpNm;
    }

    public String getPaymPridNm() {
        return paymPridNm;
    }

    public void setPaymPridNm(String paymPridNm) {
        this.paymPridNm = paymPridNm;
    }

    public String getPaymMthNm() {
        return paymMthNm;
    }

    public void setPaymMthNm(String paymMthNm) {
        this.paymMthNm = paymMthNm;
    }

    public String getRcptTpNm() {
        return rcptTpNm;
    }

    public void setRcptTpNm(String rcptTpNm) {
        this.rcptTpNm = rcptTpNm;
    }

    public String getRcvHistStatNm() {
        return rcvHistStatNm;
    }

    public void setRcvHistStatNm(String rcvHistStatNm) {
        this.rcvHistStatNm = rcvHistStatNm;
    }

    public String getPaymMthCdNm() {
        return paymMthCdNm;
    }

    public void setPaymMthCdNm(String paymMthCdNm) {
        this.paymMthCdNm = paymMthCdNm;
    }

    public Double getRcvHistAmt() {
        return rcvHistAmt;
    }

    public void setRcvHistAmt(Double rcvHistAmt) {
        this.rcvHistAmt = rcvHistAmt;
    }

    public Date getRcvCpltHistDt() {
        return rcvCpltHistDt;
    }

    public void setRcvCpltHistDt(Date rcvCpltHistDt) {
        this.rcvCpltHistDt = rcvCpltHistDt;
    }

    public String getRegUsrNm() {
        return regUsrNm;
    }

    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    public String getRoRegUsrNm() {
        return roRegUsrNm;
    }

    public void setRoRegUsrNm(String roRegUsrNm) {
        this.roRegUsrNm = roRegUsrNm;
    }

    public String getCalcRegUsrNm() {
        return calcRegUsrNm;
    }

    public void setCalcRegUsrNm(String calcRegUsrNm) {
        this.calcRegUsrNm = calcRegUsrNm;
    }

    public Date getPaymYnDt() {
        return paymYnDt;
    }

    public void setPaymYnDt(Date paymYnDt) {
        this.paymYnDt = paymYnDt;
    }

    public Date getRcvHistRegDt() {
        return rcvHistRegDt;
    }

    public void setRcvHistRegDt(Date rcvHistRegDt) {
        this.rcvHistRegDt = rcvHistRegDt;
    }

    public Date getRcvRegDt() {
        return rcvRegDt;
    }

    public void setRcvRegDt(Date rcvRegDt) {
        this.rcvRegDt = rcvRegDt;
    }

    /**
     * @return the rcvHisPaymMthCd
     */
    public String getRcvHisPaymMthCd() {
        return rcvHisPaymMthCd;
    }

    /**
     * @param rcvHisPaymMthCd the rcvHisPaymMthCd to set
     */
    public void setRcvHisPaymMthCd(String rcvHisPaymMthCd) {
        this.rcvHisPaymMthCd = rcvHisPaymMthCd;
    }

    /**
     * @return the rcvHisPaymMthCdNm
     */
    public String getRcvHisPaymMthCdNm() {
        return rcvHisPaymMthCdNm;
    }

    /**
     * @param rcvHisPaymMthCdNm the rcvHisPaymMthCdNm to set
     */
    public void setRcvHisPaymMthCdNm(String rcvHisPaymMthCdNm) {
        this.rcvHisPaymMthCdNm = rcvHisPaymMthCdNm;
    }

    /**
     * @return the rcvHisRcptTp
     */
    public String getRcvHisRcptTp() {
        return rcvHisRcptTp;
    }

    /**
     * @param rcvHisRcptTp the rcvHisRcptTp to set
     */
    public void setRcvHisRcptTp(String rcvHisRcptTp) {
        this.rcvHisRcptTp = rcvHisRcptTp;
    }

    /**
     * @return the rcvHisRcptTpNm
     */
    public String getRcvHisRcptTpNm() {
        return rcvHisRcptTpNm;
    }

    /**
     * @param rcvHisRcptTpNm the rcvHisRcptTpNm to set
     */
    public void setRcvHisRcptTpNm(String rcvHisRcptTpNm) {
        this.rcvHisRcptTpNm = rcvHisRcptTpNm;
    }

    /**
     * @return the calcCompUsrNm
     */
    public String getCalcCompUsrNm() {
        return calcCompUsrNm;
    }

    /**
     * @param calcCompUsrNm the calcCompUsrNm to set
     */
    public void setCalcCompUsrNm(String calcCompUsrNm) {
        this.calcCompUsrNm = calcCompUsrNm;
    }

    /**
     * @return the giRunDistVal
     */
    public int getGiRunDistVal() {
        return giRunDistVal;
    }

    /**
     * @param giRunDistVal the giRunDistVal to set
     */
    public void setGiRunDistVal(int giRunDistVal) {
        this.giRunDistVal = giRunDistVal;
    }

}