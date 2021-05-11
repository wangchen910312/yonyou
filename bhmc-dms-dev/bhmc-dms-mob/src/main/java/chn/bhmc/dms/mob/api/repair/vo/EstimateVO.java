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
 * @ClassName : EstimateVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since   author description
 * =========== ============= ===========================
 * 2016. 4. 25.  Kwon Ki Hyun  최초 생성
 * </pre>
 */

public class EstimateVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
    */
    private static final long serialVersionUID = 3840258449781191072L;

    /**
     * PREFIX
     **/
    private String preFixId;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    /**
    * 견적문서번호
    **/
    @NotEmpty
    private String estDocNo;

    /**
    * RO유형
    **/
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
    * 견적일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date estDt;

    /**
    * 정산상태코드
    **/
    private String estStatCd;

    /**
     * 정산상태코드명
     **/
    private String estStatNm;

    /**
    * 정산비고
    **/
    private String estRemark;

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

    /**
     * 메인연락시간
     **/
    private String mainCtnoDtTp;

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
      * 차종명
      */
     private String carlineNm;

     /**
      * 모델명
      */
     private String modelNm;

     private int carRunDistVal;

    /**
     * 기타할인코드
     */
    private String etcDcCd;

    /**
     * 기타할인일련번호
     */
    private int etcDcSeq;

     /**
     * 작성자
     */
    private String regUsrNm;

    /**
     * RO 작성자
     */
    private String roUsrNm;

    /**
     * 차종모델
     */
    private String ltsModelCd;

    /**
     * 견적취소자 ID
     */
    private String estCancId;

    /**
     * 견적취소자명
     */
    private String estCancNm;

    /**
     * 견적취소내용
     */
    private String estCancReasonCont;
    /**
     * 견적취소코드
     */
    private String estCancReasonCd;
    /**
     * 견적취소코드명
     */
    private String estCancReasonNm;
    /**
     * 견적취소일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private String estCancDt;
    /**
     * 견적출력일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private String estPrintDt;

     /**
     * 절사금액
     **/
    private Double wonUnitCutAmt;

    /**
     * 제로절사금액
     **/
    private Double demicPointCutAmt;

    /**
     * 수납금액
     */
    private Double paymAmt;


    /**
     * 미수금액
     **/
    private Double npayAmt;

    /**
     * RO상태명
     **/
    private String roStatNm;

    /**
     * RO유형명
     **/
    private String roTpNm;

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
     * @return the estDocNo
     */
    public String getEstDocNo() {
        return estDocNo;
    }

    /**
     * @param estDocNo the estDocNo to set
     */
    public void setEstDocNo(String estDocNo) {
        this.estDocNo = estDocNo;
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
     * @return the estDt
     */
    public Date getEstDt() {
        return estDt;
    }

    /**
     * @param estDt the estDt to set
     */
    public void setEstDt(Date estDt) {
        this.estDt = estDt;
    }

    /**
     * @return the estStatCd
     */
    public String getEstStatCd() {
        return estStatCd;
    }

    /**
     * @param estStatCd the estStatCd to set
     */
    public void setEstStatCd(String estStatCd) {
        this.estStatCd = estStatCd;
    }

    /**
     * @return the estRemark
     */
    public String getEstRemark() {
        return estRemark;
    }

    /**
     * @param estRemark the estRemark to set
     */
    public void setEstRemark(String estRemark) {
        this.estRemark = estRemark;
    }

    /**
     * @return the expcChkDt
     */
    public Date getExpcChkDt() {
        return expcChkDt;
    }

    /**
     * @param expcChkDt the expcChkDt to set
     */
    public void setExpcChkDt(Date expcChkDt) {
        this.expcChkDt = expcChkDt;
    }

    /**
     * @return the expcChkRunDistVal
     */
    public int getExpcChkRunDistVal() {
        return expcChkRunDistVal;
    }

    /**
     * @param expcChkRunDistVal the expcChkRunDistVal to set
     */
    public void setExpcChkRunDistVal(int expcChkRunDistVal) {
        this.expcChkRunDistVal = expcChkRunDistVal;
    }

    /**
     * @return the mainCtnoTp
     */
    public String getMainCtnoTp() {
        return mainCtnoTp;
    }

    /**
     * @param mainCtnoTp the mainCtnoTp to set
     */
    public void setMainCtnoTp(String mainCtnoTp) {
        this.mainCtnoTp = mainCtnoTp;
    }

    /**
     * @return the mainCtnoDtTp
     */
    public String getMainCtnoDtTp() {
        return mainCtnoDtTp;
    }

    /**
     * @param mainCtnoDtTp the mainCtnoDtTp to set
     */
    public void setMainCtnoDtTp(String mainCtnoDtTp) {
        this.mainCtnoDtTp = mainCtnoDtTp;
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

    public String getLtsModelCd() {
        return ltsModelCd;
    }

    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    public String getEstCancId() {
        return estCancId;
    }

    public void setEstCancId(String estCancId) {
        this.estCancId = estCancId;
    }

    public String getEstCancReasonCont() {
        return estCancReasonCont;
    }

    public void setEstCancReasonCont(String estCancReasonCont) {
        this.estCancReasonCont = estCancReasonCont;
    }

    public String getEstCancReasonCd() {
        return estCancReasonCd;
    }

    public void setEstCancReasonCd(String estCancReasonCd) {
        this.estCancReasonCd = estCancReasonCd;
    }

    public String getEstCancDt() {
        return estCancDt;
    }

    public void setEstCancDt(String estCancDt) {
        this.estCancDt = estCancDt;
    }

    public String getEstPrintDt() {
        return estPrintDt;
    }

    public void setEstPrintDt(String estPrintDt) {
        this.estPrintDt = estPrintDt;
    }

    public String getEstStatNm() {
        return estStatNm;
    }

    public void setEstStatNm(String estStatNm) {
        this.estStatNm = estStatNm;
    }

    public String getEstCancReasonNm() {
        return estCancReasonNm;
    }

    public void setEstCancReasonNm(String estCancReasonNm) {
        this.estCancReasonNm = estCancReasonNm;
    }

    public String getRoUsrNm() {
        return roUsrNm;
    }

    public void setRoUsrNm(String roUsrNm) {
        this.roUsrNm = roUsrNm;
    }

    public String getEstCancNm() {
        return estCancNm;
    }

    public void setEstCancNm(String estCancNm) {
        this.estCancNm = estCancNm;
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

    /**
     * @return the roStatNm
     */
    public String getRoStatNm() {
        return roStatNm;
    }

    /**
     * @param roStatNm the roStatNm to set
     */
    public void setRoStatNm(String roStatNm) {
        this.roStatNm = roStatNm;
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

}
