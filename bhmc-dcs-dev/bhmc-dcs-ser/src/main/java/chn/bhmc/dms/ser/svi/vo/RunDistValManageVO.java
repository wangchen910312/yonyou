package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RunDistValManageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 13.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class RunDistValManageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7263137465660266120L;
    /**
     * 딜러코드
     */
    private String dlrCd;
    /**
     * RO 번호
     */
    private String roDocNo;

    /**
     * 차량번호
     */
    private String carRegNo;

    /**
     * RO 일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roDt;

    /**
     * VIN NO
     */
    private String vinNo;
    /**
     * 주행거리
     */
    private int runDistVal;
    /**
     * 최종주행거리
     */
    private int lastRunDistVal;
    /**
     * 방문자
     */
    private String carOwnerNm;
    /**
     * 운전자
     */
    private String driverNm;
    /**
     * RO 상태
     */
    private String roStatCd;
    /**
     * RO 타입
     */
    private String roTp;

    private String roTpNm;
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
     * @return the lastRunDistVal
     */
    public int getLastRunDistVal() {
        return lastRunDistVal;
    }
    /**
     * @param lastRunDistVal the lastRunDistVal to set
     */
    public void setLastRunDistVal(int lastRunDistVal) {
        this.lastRunDistVal = lastRunDistVal;
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


}
