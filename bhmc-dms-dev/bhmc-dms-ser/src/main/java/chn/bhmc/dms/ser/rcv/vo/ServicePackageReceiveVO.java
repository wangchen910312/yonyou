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

public class ServicePackageReceiveVO extends BaseVO {

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
    * RO문서번호
    **/
    private String roDocNo;

    /**
    * RO그룹번호
    **/
    private String roGrpNo;

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
    * 정산일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcDt;

    /**
     * 수납상태코드
     **/
    private String rcvStatCd;

    /**
     * 지불유형
     **/
    private String paymTp;

    /**
     * 지불자명
     **/
    private String paymUsrNm;

    /**
     * 정산하위문서번호
     **/
    private String rcvSubDocNo;

    /**
     * 수납금액
     **/
    private Double rcvAmt;

    /**
     * 실수금액
     **/
    private Double paymAmt;

    /**
     * 미수금액
     **/
    private Double npayAmt;

    /**
     * 정산담당자ID
     **/
    private String calcPrsnId;

    /**
     * 정산담당자명
     **/
    private String calcPrsnNm;

    /**
     * 영수증번호
     **/
     private String rcptNo;

     /**
      * 영수증유형
      **/
     private String rcptTp;

     /**
      * 정비부품구분코드
      */
     private String serParDstinCd;

     /**
      * 고객유형
      */
     private String custTp;

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

}