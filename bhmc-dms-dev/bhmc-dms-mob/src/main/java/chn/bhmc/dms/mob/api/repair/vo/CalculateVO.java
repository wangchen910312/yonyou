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
 * @ClassName   : CalculateVO.java
 * @Description : 정산마스터 VO
 * @author KyungMok Kim
 * @since 2016. 3. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 19.    KyungMok Kim     최초 생성
 * </pre>
 */

public class CalculateVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7325462090670403418L;

    /**
     * PREFIX
     **/
    private String preFixId;

    /**
    * 딜러코드
    **/
    @NotEmpty
    private String dlrCd;

    /**
    * 정산문서번호
    **/
    @NotEmpty
    private String calcDocNo;

    /**
    * RO유형
    **/
    @NotEmpty
    private String roTp;

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
    private Double etcBmPointUseAmt = 0.0;

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
     * 수납금액
     **/
    private Double paymAmt;

    /**
     * 미수금액
     **/
    private Double npayAmt;

    /**
    * 정산완료일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcDt;

    /**
    * 정산상태코드
    **/
    private String calcStatCd;

    /**
    * 정산비고
    **/
    private String calcRemark;

    /**
    * 의견비고
    **/
    private String opnRemark;

    /**
    * 방문취소원인내용
    **/
    private String vsitCancCauCont;

    /**
    * 정산취소여부
    **/
    private String calcCancYn;

    /**
    * 정산취소일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcCancDt;

    /**
    * 정산취소ID
    **/
    private String calcCancId;

    /**
    * 정산취소명
    **/
    private String calcCancNm;

    /**
     * 정산취소 사유 코드
     */
    //CALC_CANC_REASON_CONT
    private String calcCancReasonCd;

    /**
     * 정산취소 사유
     */
    //CALC_CANC_REASON_CONT
    private String calcCancReasonCont;

    /**
    * 방문차량수량일자
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
    private String vsitCarReceiveCtnoNo;

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
    private String vsitDlCtnoNo;

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
    private String vsitCtnoNo;

    /**
    * 방문주소명
    **/
    private String vsitAddrNm;

    /**
    * 수납번호
    **/
    private String rcvDocNo;

    /**
    * 수납상태
    **/
    private String rcvStatCd;

    /**
     * 예정점검일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcChkDt;

    /**
     * 정비예정 주행거리
     **/
    private int expcChkRunDistVal;

    /**
     * 메인연락방식
     **/
    private String mainCtnoTp;
    private String mainCtnoTpNm;

    /**
     * 메인연락시간
     **/
    private String mainCtnoDtTp;
    private String mainCtnoDtTpNm;

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
     * SA ID
     */
    private String saId;

    /**
     * SA명
     */
    private String saNm;

    /**
     * 정비부품구분코드
     */
    private String serParDstinCd;

    /**
     * 고객유형
     */
    private String custTp;

     /**
     * RO일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date roDt;

     /**
      * CAR_ID
      **/
     private String carId;

     /**
      * 품질검사 코드
      */
     private String qtTestMthCd;

     /**
      * 품질검사 상태
      */
     private String qtTestStatCd;

     /**
      * 다음보양 기준 월
      */
     private String nextFreeMonth;

     /**
      * 다음보양 주행거리
      */
     private String nextFreeRunDistVal;

     /**
      * RO상태
      */
     private String roStatCd;

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
     * 작성자
     */
    private String regUsrNm;
    /**
     * 수정자
     */
    private String updtUsrNm;

    /**
     * 기타할인코드
     */
    private String etcDcCd;

    /**
     * 기타할인일련번호
     */
    private int etcDcSeq;

    private String goodwillYn;

    /**
     * 정산상태명
     */
    private String calcStatNm;

    /**
     * RO유형명
     */
    private String roTpNm;

    /**
     * 자체RO유형명
     */
    private String dlrRoTpNm;

    /**
     * 취소원인명
     */
    private String calcCancReasonNm;

    private String roUsrNm;

     /**
     * 절사금액
     **/
    private Double wonUnitCutAmt;

    /**
     * 제로절사금액
     **/
    private Double demicPointCutAmt;

    /**
     * 실수금액
     **/
    private Double rcvAmt;


   /**
    * 정산등록일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 정산수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
    * 정산프린트일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcPrintDt;

    /**
     * 수납완료여부
     */
    private String paymYn;
    private String paymYnNm;

    /**
     * 정산완료자ID
     */
    private String calcCompUsrId;

    /**
     * 정산완료자명
     */
    private String calcCompUsrNm;

    /**
     * PDI 여부
     */
    private String pdiYn;

    /**
     * 공임BM쿠폰사용금액
     */
    private Double lbrBmCupnUseAmt;

    /**
     * 부품BM쿠폰사용금액
     */
    private Double parBmCupnUseAmt;

    /**
     * 기타BM쿠폰사용금액
     */
    private Double etcBmCupnUseAmt;

    /**
     * BM쿠폰총금액
     */
    private Double bmCupnTotAmt;

    /**
     * 인도주행거리값
     **/
    private int giRunDistVal;

    /**
     * 정산취소 토탈금액
     **/
    private Double calcCancTotAmt;

    private Double calcAmt;

    private String driverHpNo;

    /**
     * 이동평균단가
     **/
    private Double movingAvgPrc;

    /**
     * 이동평균금액
     **/
    private Double movingAvgAmt;

    /**
     * BM쿠폰번호
     **/
    private String bmCupnNo;

    /**
     * BM쿠폰명칭
     **/
    private String bmCupnNm;

    /**
     * BM캠페인명칭
     **/
    private String bmAtvtTp;

    /**
     * BM쿠폰금액
     **/
    private Double bmCupnAmt;

    /**
     * BM쿠폰조정금액
     **/
    private Double bmCupnChangeAmt;



    public String getGoodwillYn() {
        return goodwillYn;
    }

    public void setGoodwillYn(String goodwillYn) {
        this.goodwillYn = goodwillYn;
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
     * @return the calcRemark
     */
    public String getCalcRemark() {
        return calcRemark;
    }

    /**
     * @param calcRemark the calcRemark to set
     */
    public void setCalcRemark(String calcRemark) {
        this.calcRemark = calcRemark;
    }

    /**
     * @return the opnRemark
     */
    public String getOpnRemark() {
        return opnRemark;
    }

    /**
     * @param opnRemark the opnRemark to set
     */
    public void setOpnRemark(String opnRemark) {
        this.opnRemark = opnRemark;
    }

    /**
     * @return the vsitCancCauCont
     */
    public String getVsitCancCauCont() {
        return vsitCancCauCont;
    }

    /**
     * @param vsitCancCauCont the vsitCancCauCont to set
     */
    public void setVsitCancCauCont(String vsitCancCauCont) {
        this.vsitCancCauCont = vsitCancCauCont;
    }

    /**
     * @return the calcCancYn
     */
    public String getCalcCancYn() {
        return calcCancYn;
    }

    /**
     * @param calcCancYn the calcCancYn to set
     */
    public void setCalcCancYn(String calcCancYn) {
        this.calcCancYn = calcCancYn;
    }

    /**
     * @return the calcCancDt
     */
    public Date getCalcCancDt() {
        return calcCancDt;
    }

    /**
     * @param calcCancDt the calcCancDt to set
     */
    public void setCalcCancDt(Date calcCancDt) {
        this.calcCancDt = calcCancDt;
    }

    /**
     * @return the calcCancId
     */
    public String getCalcCancId() {
        return calcCancId;
    }

    /**
     * @param calcCancId the calcCancId to set
     */
    public void setCalcCancId(String calcCancId) {
        this.calcCancId = calcCancId;
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
     * @return the vsitCarReceiveCtnoNo
     */
    public String getVsitCarReceiveCtnoNo() {
        return vsitCarReceiveCtnoNo;
    }

    /**
     * @param vsitCarReceiveCtnoNo the vsitCarReceiveCtnoNo to set
     */
    public void setVsitCarReceiveCtnoNo(String vsitCarReceiveCtnoNo) {
        this.vsitCarReceiveCtnoNo = vsitCarReceiveCtnoNo;
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
     * @return the vsitDlCtnoNo
     */
    public String getVsitDlCtnoNo() {
        return vsitDlCtnoNo;
    }

    /**
     * @param vsitDlCtnoNo the vsitDlCtnoNo to set
     */
    public void setVsitDlCtnoNo(String vsitDlCtnoNo) {
        this.vsitDlCtnoNo = vsitDlCtnoNo;
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
     * @return the vsitCtnoNo
     */
    public String getVsitCtnoNo() {
        return vsitCtnoNo;
    }

    /**
     * @param vsitCtnoNo the vsitCtnoNo to set
     */
    public void setVsitCtnoNo(String vsitCtnoNo) {
        this.vsitCtnoNo = vsitCtnoNo;
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

    public Date getExpcChkDt() {
        return expcChkDt;
    }

    public void setExpcChkDt(Date expcChkDt) {
        this.expcChkDt = expcChkDt;
    }


    public String getMainCtnoTp() {
        return mainCtnoTp;
    }

    public void setMainCtnoTp(String mainCtnoTp) {
        this.mainCtnoTp = mainCtnoTp;
    }

    public String getMainCtnoDtTp() {
        return mainCtnoDtTp;
    }

    public void setMainCtnoDtTp(String mainCtnoDtTp) {
        this.mainCtnoDtTp = mainCtnoDtTp;
    }

    public int getExpcChkRunDistVal() {
        return expcChkRunDistVal;
    }

    public void setExpcChkRunDistVal(int expcChkRunDistVal) {
        this.expcChkRunDistVal = expcChkRunDistVal;
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
     * @return the qtTestMthCd
     */
    public String getQtTestMthCd() {
        return qtTestMthCd;
    }

    /**
     * @param qtTestMthCd the qtTestMthCd to set
     */
    public void setQtTestMthCd(String qtTestMthCd) {
        this.qtTestMthCd = qtTestMthCd;
    }

    /**
     * @return the qtTestStatCd
     */
    public String getQtTestStatCd() {
        return qtTestStatCd;
    }

    /**
     * @param qtTestStatCd the qtTestStatCd to set
     */
    public void setQtTestStatCd(String qtTestStatCd) {
        this.qtTestStatCd = qtTestStatCd;
    }

    /**
     * @return the nextFreeMonth
     */
    public String getNextFreeMonth() {
        return nextFreeMonth;
    }

    /**
     * @param nextFreeMonth the nextFreeMonth to set
     */
    public void setNextFreeMonth(String nextFreeMonth) {
        this.nextFreeMonth = nextFreeMonth;
    }

    /**
     * @return the nextFreeRunDistVal
     */
    public String getNextFreeRunDistVal() {
        return nextFreeRunDistVal;
    }

    /**
     * @param nextFreeRunDistVal the nextFreeRunDistVal to set
     */
    public void setNextFreeRunDistVal(String nextFreeRunDistVal) {
        this.nextFreeRunDistVal = nextFreeRunDistVal;
    }

    /**
     * @return the roStatCd
     */
    public String getRoStatCd() {
        return roStatCd;
    }

    /**
     * @param roStatCd the roStatCd to set
     */
    public void setRoStatCd(String roStatCd) {
        this.roStatCd = roStatCd;
    }

    /**
     * @return the etcDcCd
     */
    public String getEtcDcCd() {
        return etcDcCd;
    }

    /**
     * @param etcDcCd the etcDcCd to set
     */
    public void setEtcDcCd(String etcDcCd) {
        this.etcDcCd = etcDcCd;
    }

    /**
     * @return the etcDcSeq
     */
    public int getEtcDcSeq() {
        return etcDcSeq;
    }

    /**
     * @param etcDcSeq the etcDcSeq to set
     */
    public void setEtcDcSeq(int etcDcSeq) {
        this.etcDcSeq = etcDcSeq;
    }

    public Date getCalcPrintDt() {
        return calcPrintDt;
    }

    public void setCalcPrintDt(Date calcPrintDt) {
        this.calcPrintDt = calcPrintDt;
    }

    public String getCalcCancReasonCd() {
        return calcCancReasonCd;
    }

    public void setCalcCancReasonCd(String calcCancReasonCd) {
        this.calcCancReasonCd = calcCancReasonCd;
    }

    public String getCalcCancReasonCont() {
        return calcCancReasonCont;
    }

    public void setCalcCancReasonCont(String calcCancReasonCont) {
        this.calcCancReasonCont = calcCancReasonCont;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    public Date getUpdtDt() {
        return updtDt;
    }

    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    public String getUpdtUsrNm() {
        return updtUsrNm;
    }

    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }

    public String getCalcStatNm() {
        return calcStatNm;
    }

    public void setCalcStatNm(String calcStatNm) {
        this.calcStatNm = calcStatNm;
    }

    public String getRoTpNm() {
        return roTpNm;
    }

    public void setRoTpNm(String roTpNm) {
        this.roTpNm = roTpNm;
    }

    public String getCalcCancReasonNm() {
        return calcCancReasonNm;
    }

    public void setCalcCancReasonNm(String calcCancReasonNm) {
        this.calcCancReasonNm = calcCancReasonNm;
    }

    public String getCalcCancNm() {
        return calcCancNm;
    }

    public void setCalcCancNm(String calcCancNm) {
        this.calcCancNm = calcCancNm;
    }

    public String getRoUsrNm() {
        return roUsrNm;
    }

    public void setRoUsrNm(String roUsrNm) {
        this.roUsrNm = roUsrNm;
    }

    public Double getWonUnitCutAmt() {
        return wonUnitCutAmt;
    }

    public void setWonUnitCutAmt(Double wonUnitCutAmt) {
        this.wonUnitCutAmt = wonUnitCutAmt;
    }

    public Double getDemicPointCutAmt() {
        return demicPointCutAmt;
    }

    public void setDemicPointCutAmt(Double demicPointCutAmt) {
        this.demicPointCutAmt = demicPointCutAmt;
    }

    public Double getPaymAmt() {
        return paymAmt;
    }

    public void setPaymAmt(Double paymAmt) {
        this.paymAmt = paymAmt;
    }

    public Double getNpayAmt() {
        return npayAmt;
    }

    public void setNpayAmt(Double npayAmt) {
        this.npayAmt = npayAmt;
    }

    public String getPaymYn() {
        return paymYn;
    }

    public void setPaymYn(String paymYn) {
        this.paymYn = paymYn;
    }

    public Double getRcvAmt() {
        return rcvAmt;
    }

    public void setRcvAmt(Double rcvAmt) {
        this.rcvAmt = rcvAmt;
    }

    public String getPaymYnNm() {
        return paymYnNm;
    }

    public void setPaymYnNm(String paymYnNm) {
        this.paymYnNm = paymYnNm;
    }

    public String getCalcCompUsrId() {
        return calcCompUsrId;
    }

    public void setCalcCompUsrId(String calcCompUsrId) {
        this.calcCompUsrId = calcCompUsrId;
    }

    public String getCalcCompUsrNm() {
        return calcCompUsrNm;
    }

    public void setCalcCompUsrNm(String calcCompUsrNm) {
        this.calcCompUsrNm = calcCompUsrNm;
    }

    /**
     * @return the pdiYn
     */
    public String getPdiYn() {
        return pdiYn;
    }

    /**
     * @param pdiYn the pdiYn to set
     */
    public void setPdiYn(String pdiYn) {
        this.pdiYn = pdiYn;
    }

    /**
     * @return the lbrBmCupnUseAmt
     */
    public Double getLbrBmCupnUseAmt() {
        return lbrBmCupnUseAmt;
    }

    /**
     * @param lbrBmCupnUseAmt the lbrBmCupnUseAmt to set
     */
    public void setLbrBmCupnUseAmt(Double lbrBmCupnUseAmt) {
        this.lbrBmCupnUseAmt = lbrBmCupnUseAmt;
    }

    /**
     * @return the parBmCupnUseAmt
     */
    public Double getParBmCupnUseAmt() {
        return parBmCupnUseAmt;
    }

    /**
     * @param parBmCupnUseAmt the parBmCupnUseAmt to set
     */
    public void setParBmCupnUseAmt(Double parBmCupnUseAmt) {
        this.parBmCupnUseAmt = parBmCupnUseAmt;
    }

    /**
     * @return the etcBmCupnUseAmt
     */
    public Double getEtcBmCupnUseAmt() {
        return etcBmCupnUseAmt;
    }

    /**
     * @param etcBmCupnUseAmt the etcBmCupnUseAmt to set
     */
    public void setEtcBmCupnUseAmt(Double etcBmCupnUseAmt) {
        this.etcBmCupnUseAmt = etcBmCupnUseAmt;
    }

    /**
     * @return the bmCupnTotAmt
     */
    public Double getBmCupnTotAmt() {
        return bmCupnTotAmt;
    }

    /**
     * @param bmCupnTotAmt the bmCupnTotAmt to set
     */
    public void setBmCupnTotAmt(Double bmCupnTotAmt) {
        this.bmCupnTotAmt = bmCupnTotAmt;
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

    /**
     * @return the calcCancTotAmt
     */
    public Double getCalcCancTotAmt() {
        return calcCancTotAmt;
    }

    /**
     * @param calcCancTotAmt the calcCancTotAmt to set
     */
    public void setCalcCancTotAmt(Double calcCancTotAmt) {
        this.calcCancTotAmt = calcCancTotAmt;
    }

    /**
     * @return the calcAmt
     */
    public Double getCalcAmt() {
        return calcAmt;
    }

    /**
     * @param calcAmt the calcAmt to set
     */
    public void setCalcAmt(Double calcAmt) {
        this.calcAmt = calcAmt;
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
     * @param dlrRoTpNm the dlrRoTpNm to set
     */
    public void setDlrRoTpNm(String dlrRoTpNm) {
        this.dlrRoTpNm = dlrRoTpNm;
    }

    /**
     * @return the dlrRoTpNm
     */
    public String getDlrRoTpNm() {
        return dlrRoTpNm;
    }

    /**
     * @return the movingAvgPrc
     */
    public Double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(Double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the movingAvgAmt
     */
    public Double getMovingAvgAmt() {
        return movingAvgAmt;
    }

    /**
     * @param movingAvgAmt the movingAvgAmt to set
     */
    public void setMovingAvgAmt(Double movingAvgAmt) {
        this.movingAvgAmt = movingAvgAmt;
    }

    /**
     * @return the bmCupnNo
     */
    public String getBmCupnNo() {
        return bmCupnNo;
    }

    /**
     * @param bmCupnNo the bmCupnNo to set
     */
    public void setBmCupnNo(String bmCupnNo) {
        this.bmCupnNo = bmCupnNo;
    }

    /**
     * @return the bmCupnNm
     */
    public String getBmCupnNm() {
        return bmCupnNm;
    }

    /**
     * @param bmCupnNm the bmCupnNm to set
     */
    public void setBmCupnNm(String bmCupnNm) {
        this.bmCupnNm = bmCupnNm;
    }

    /**
     * @return the bmAtvtTp
     */
    public String getBmAtvtTp() {
        return bmAtvtTp;
    }

    /**
     * @param bmAtvtTp the bmAtvtTp to set
     */
    public void setBmAtvtTp(String bmAtvtTp) {
        this.bmAtvtTp = bmAtvtTp;
    }

    /**
     * @return the bmCupnAmt
     */
    public Double getBmCupnAmt() {
        return bmCupnAmt;
    }

    /**
     * @param bmCupnAmt the bmCupnAmt to set
     */
    public void setBmCupnAmt(Double bmCupnAmt) {
        this.bmCupnAmt = bmCupnAmt;
    }

    /**
     * @return the bmCupnChangeAmt
     */
    public Double getBmCupnChangeAmt() {
        return bmCupnChangeAmt;
    }

    /**
     * @param bmCupnChangeAmt the bmCupnChangeAmt to set
     */
    public void setBmCupnChangeAmt(Double bmCupnChangeAmt) {
        this.bmCupnChangeAmt = bmCupnChangeAmt;
    }

    /**
     * @param mainCtnoTpNm the mainCtnoTpNm to set
     */
    public void setMainCtnoTpNm(String mainCtnoTpNm) {
        this.mainCtnoTpNm = mainCtnoTpNm;
    }

    /**
     * @return the mainCtnoTpNm
     */
    public String getMainCtnoTpNm() {
        return mainCtnoTpNm;
    }

    /**
     * @param mainCtnoDtTpNm the mainCtnoDtTpNm to set
     */
    public void setMainCtnoDtTpNm(String mainCtnoDtTpNm) {
        this.mainCtnoDtTpNm = mainCtnoDtTpNm;
    }

    /**
     * @return the mainCtnoDtTpNm
     */
    public String getMainCtnoDtTpNm() {
        return mainCtnoDtTpNm;
    }

}