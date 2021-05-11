package chn.bhmc.dms.ser.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehOfReseveInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class VehOfReseveInfoVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2117808378893791961L;

    public String dlrCd; //딜러코드

    public String vinNo; //차대번호

    public String resvDocNo; // 예약번호

    public String roGrpNo; //ro group no

    @JsonDeserialize(using=JsonDateDeserializer.class)
    public Date serResvStartDt; // 예약시작일자
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    public Date resvDt; // 예약접수일자

    @JsonDeserialize(using=JsonDateDeserializer.class)
    public Date serResvEndDt; //예약종료일자

    public String carOwnerId; //차량운전자 ID

    public String carOwnerNm;//차량운전자 명

    public String driverId; //차량운전자ID

    public String driverNm;//차량운전자명

    public String diagDocNo;//사전점검번호

    public String roDocNo;//RO번호

    public String roStatCd;//RO 상태

    public String roTp;// RO유형

    public String resvTp;

    public String resvStatCd;

    public String carRegNo;

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

}
