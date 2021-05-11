package chn.bhmc.dms.ser.cmm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderVO.java
 * @Description : RO마스터 VO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.    KyungMok Kim     최초 생성
 * </pre>
 */

public class RepairOrderIfVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4651575618460040542L;

    /**
    * 딜러코드
    **/
    @JsonProperty("DLR_CD")
    private String dlrCd;

    /**
    * RO문서번호
    **/
    @JsonProperty("RO_DOC_NO")
    private String roDocNo;

    /**
    * RO유형
    **/
    @JsonProperty("RO_TP")
    private String roTpNm;

    /**
    * 차대번호
    **/
    @JsonProperty("VIN_NO")
    private String vinNo;

    /**
    * 차량등록번호
    **/
    @JsonProperty("CAR_REG_NO")
    private String carRegNo;


    /**
    * 차량소유자ID
    **/
    @JsonProperty("CAR_OWNER_ID")
    private String carOwnerId;

    /**
    * 차량소유자명
    **/
    @JsonProperty("CAR_OWNER_NM")
    private String carOwnerNm;

    /**
    * 운전자ID
    **/
    @JsonProperty("DRIVER_ID")
    private String driverId;

    /**
    * 운전자명
    **/
    @JsonProperty("DRIVER_NM")
    private String driverNm;

    /**
    * 주행거리값
    **/
    @JsonProperty("RUN_DIST_VAL")
    private String runDistVal;

    /**
     * 최종 주행거리값
     **/
    @JsonProperty("LAST_RUN_DIST_VAL")
    private String lastRunDistVal;


    /**
    * 원RO번호
    **/
    @JsonProperty("BASE_RO_NO")
    private String baseRoNo;

    /**
    * RO상태코드
    **/
    @JsonProperty("RO_STAT_CD")
    private String roStatCd;

    /**
    * RO발행일자
    **/
    @JsonProperty("RO_DT")
    private String roDt;

    /**
     * RO그룹번호
     **/
    @JsonProperty("RO_GRP_NO")
    private String roGrpNo;

    /**
     * RO시작일자
     **/
    @JsonProperty("RO_START_DT")
    private String roStartDt;

    /**
     * RO종료일자
     **/
    @JsonProperty("RO_END_DT")
    private String roEndDt;

    /**
     * RO상태코드명
     **/
    @JsonProperty("TEMP1")
    private String roStatNm;

    /**
     * 차종명
     **/
    @JsonProperty("TEMP2")
    private String carlineNm;

    /**
     * 모델명
     **/
    @JsonProperty("TEMP3")
    private String modelNm;

    /**
     * RO발행자
     **/
    @JsonProperty("TEMP4")
    private String regUsrNm;

    /**
     * RO수정일자
     **/
    @JsonProperty("TEMP5")
    private String roUpdtDt;

    /**
     * 정산번호
     **/
    @JsonProperty("TEMP6")
    private String calcDocNo;

    /**
     * 정산등록일자
     **/
    @JsonProperty("TEMP7")
    private String calcRegDt;

    /**
     * 정산확정일자
     **/
    @JsonProperty("TEMP8")
    private String calcDt;

    /**
      * 정산자
     **/
    @JsonProperty("TEMP9")
    private String calcPrsnNm;

    /**
     * 지불완료여부
    **/
    @JsonProperty("TEMP10")
    private String paymYnNm;

    /**
     * 정산확정자
    **/
    @JsonProperty("TEMP11")
    private String calcCompUsrNm;

    /**
     * RO인쇄일자
    **/
    @JsonProperty("TEMP12")
    private String roPrintDt;


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
    public String getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(String runDistVal) {
        this.runDistVal = runDistVal;
    }

    /**
     * @return the lastRunDistVal
     */
    public String getLastRunDistVal() {
        return lastRunDistVal;
    }

    /**
     * @param lastRunDistVal the lastRunDistVal to set
     */
    public void setLastRunDistVal(String lastRunDistVal) {
        this.lastRunDistVal = lastRunDistVal;
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
     * @return the roDt
     */
    public String getRoDt() {
        return roDt;
    }

    /**
     * @param roDt the roDt to set
     */
    public void setRoDt(String roDt) {
        this.roDt = roDt;
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
     * @return the roStartDt
     */
    public String getRoStartDt() {
        return roStartDt;
    }

    /**
     * @param roStartDt the roStartDt to set
     */
    public void setRoStartDt(String roStartDt) {
        this.roStartDt = roStartDt;
    }

    /**
     * @return the roEndDt
     */
    public String getRoEndDt() {
        return roEndDt;
    }

    /**
     * @param roEndDt the roEndDt to set
     */
    public void setRoEndDt(String roEndDt) {
        this.roEndDt = roEndDt;
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
     * @return the roPrintDt
     */
    public String getRoPrintDt() {
        return roPrintDt;
    }

    /**
     * @param roPrintDt the roPrintDt to set
     */
    public void setRoPrintDt(String roPrintDt) {
        this.roPrintDt = roPrintDt;
    }

    /**
     * @return the roUpdtDt
     */
    public String getRoUpdtDt() {
        return roUpdtDt;
    }

    /**
     * @param roUpdtDt the roUpdtDt to set
     */
    public void setRoUpdtDt(String roUpdtDt) {
        this.roUpdtDt = roUpdtDt;
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
     * @return the calcRegDt
     */
    public String getCalcRegDt() {
        return calcRegDt;
    }

    /**
     * @param calcRegDt the calcRegDt to set
     */
    public void setCalcRegDt(String calcRegDt) {
        this.calcRegDt = calcRegDt;
    }

    /**
     * @return the calcDt
     */
    public String getCalcDt() {
        return calcDt;
    }

    /**
     * @param calcDt the calcDt to set
     */
    public void setCalcDt(String calcDt) {
        this.calcDt = calcDt;
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
     * @return the paymYnNm
     */
    public String getPaymYnNm() {
        return paymYnNm;
    }

    /**
     * @param paymYnNm the paymYnNm to set
     */
    public void setPaymYnNm(String paymYnNm) {
        this.paymYnNm = paymYnNm;
    }

}