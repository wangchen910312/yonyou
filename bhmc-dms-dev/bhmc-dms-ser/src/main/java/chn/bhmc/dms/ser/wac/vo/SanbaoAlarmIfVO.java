package chn.bhmc.dms.ser.wac.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoAlarmVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 1.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class SanbaoAlarmIfVO extends BaseVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4960241774246446690L;

    /**
     * 차대번호
     */
    @JsonProperty("VIN_NO")
    private String vinNo;

    /**
     * 차대번호1
     */
    @JsonProperty("VIN_NO1")
    private String vinNo1;

    /**
     * 차대번호1
     */
    @JsonProperty("VIN_NO2")
    private String vinNo2;

    /**
     * 판매딜러 코드
     */
    @JsonProperty("SALE_DLR_CD")
    private String saleDlrCd;

   
    @JsonProperty("DLR_CD")
    private String dlrCd;
	

	/**
     * 판매딜러 명칭
     */
    @JsonProperty("SALE_DLR_NM")
    private String saleDlrNm;

    /**
     * 보증수리일자
     */
    @JsonProperty("WART_DT")
    private String wartDt;


    /**
     * 판매일자
     */
    @JsonProperty("SALE_DT")
    private String saleDt;

    /**
     * 생산일자
     */
    @JsonProperty("CRE_DT")
    private String creDt;

    /**
     * 삼포 남은 기간
     */
    @JsonProperty("SANBAO_REMAIN_DAY")
    private String sanbaoRemainDay;

    /**
     * 삼보 보증기간 년도
     */
    @JsonProperty("SANBAO_WART_PRID")
    private String sanbaoWartPrid;

    /**
     * 삼포대상여부
     */
    @JsonProperty("SANBAO_WART_YN")
    private String sanbaoWartYn;

    /**
     * 삼보 보증기간 주행거리
     */
    @JsonProperty("SANBAO_WART_RUN_DIST_VAL")
    private String sanbaoWartRunDistVal;

    /**
     * 삼보 보증 잔여 기간
     */
    @JsonProperty("SANBAO_WART_RM_PRID")
    private String sanbaoWartRmPrid;

    /**
     * 삼보 보증 잔여 주행거리
     */
    @JsonProperty("SANBAO_WART_RM_RUN_DIST_VAL")
    private String sanbaoWartRmRunDistVal;

    /**
     * 신차보증 기간(일)
     */
    @JsonProperty("NEW_CAR_WART_PRID")
    private String newCarWartPrid;

    /**
     * 신차보증 주행거리
     */
    @JsonProperty("NEW_CAR_WART_RUN_DIST_VAL")
    private String newCarWartRunDistVal;

    /**
     * 신차보증 잔여기간
     */
    @JsonProperty("NEW_CAR_WART_RM_PRID")
    private String newCarWartRmPrid;

    /**
     * 신차보증 잔여 주행거리
     */
    @JsonProperty("NEW_CAR_WART_RM_RUN_DIST_VAL")
    private String newCarWartRmRunDistVal;

    /**
     * 작업일수초과 적용기준
     */
    @JsonProperty("WORK_OVER_PRID")
    private String workOverPrid;

    /**
     * 작업일수 초과 남은 일수
     */
    @JsonProperty("WORK_OVER_RM_PRID")
    private String workOverRmPrid;

    /**
     * 신차 보증 여부
     */
    @JsonProperty("NEW_CAR_WART_YN")
    private String newCarWartYn;

    /**
     * 작업일수 초과 여부
     */
    @JsonProperty("WORK_OVER_YN")
    private String workOverYn;

    /**
     * 삼보 보증 알람 여부
     */
    @JsonProperty("SANBAO_WART_ALARM_YN")
    private String sanbaoWartAlarmYn;

    /**
     * 신차 보증 알람 여부
     */
    @JsonProperty("NEW_CAR_WART_ALARM_YN")
    private String newCarWartAlarmYn;

    /**
     * 작업일수 초과 알람 여부
     */
    @JsonProperty("WORK_OVER_ALARM_YN")
    private String workOverAlarmYn;

    /**
     * 작업일자
     */
    @JsonProperty("WORK_DAY")
    private String workDay;


    /**
     * 작업일수 알람조건
     */
    @JsonProperty("WORK_OVER_ALARM_TERM")
    private String workOverAlarmTerm;

    /**
     * 신차 알람조건
     */
    @JsonProperty("NEW_CAR_WART_ALARM_TERM")
    private String newCarWartAlarmTerm;

    /**
     * 삼포 알람 조건
     */
    @JsonProperty("SANBAO_WART_ALARM_TERM")
    private String sanbaoWartAlarmTerm;

    /**
     * 현재 주행거리
     */
    @JsonProperty("RUN_DIST_VAL")
    private String runDistVal;

    

    
    public String getDlrCd() {
		return dlrCd;
	}

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
     * @return the vinNo1
     */
    public String getVinNo1() {
        return vinNo1;
    }

    /**
     * @param vinNo1 the vinNo1 to set
     */
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }

    /**
     * @return the vinNo2
     */
    public String getVinNo2() {
        return vinNo2;
    }

    /**
     * @param vinNo2 the vinNo2 to set
     */
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
    }

    /**
     * @return the saleDlrCd
     */
    public String getSaleDlrCd() {
        return saleDlrCd;
    }

    /**
     * @param saleDlrCd the saleDlrCd to set
     */
    public void setSaleDlrCd(String saleDlrCd) {
        this.saleDlrCd = saleDlrCd;
    }

    /**
     * @return the saleDlrNm
     */
    public String getSaleDlrNm() {
        return saleDlrNm;
    }

    /**
     * @param saleDlrNm the saleDlrNm to set
     */
    public void setSaleDlrNm(String saleDlrNm) {
        this.saleDlrNm = saleDlrNm;
    }

    /**
     * @return the wartDt
     */
    public String getWartDt() {
        return wartDt;
    }

    /**
     * @param wartDt the wartDt to set
     */
    public void setWartDt(String wartDt) {
        this.wartDt = wartDt;
    }

    /**
     * @return the saleDt
     */
    public String getSaleDt() {
        return saleDt;
    }

    /**
     * @param saleDt the saleDt to set
     */
    public void setSaleDt(String saleDt) {
        this.saleDt = saleDt;
    }

    /**
     * @return the creDt
     */
    public String getCreDt() {
        return creDt;
    }

    /**
     * @param creDt the creDt to set
     */
    public void setCreDt(String creDt) {
        this.creDt = creDt;
    }

    /**
     * @return the sanbaoRemainDay
     */
    public String getSanbaoRemainDay() {
        return sanbaoRemainDay;
    }

    /**
     * @param sanbaoRemainDay the sanbaoRemainDay to set
     */
    public void setSanbaoRemainDay(String sanbaoRemainDay) {
        this.sanbaoRemainDay = sanbaoRemainDay;
    }

    /**
     * @return the sanbaoWartPrid
     */
    public String getSanbaoWartPrid() {
        return sanbaoWartPrid;
    }

    /**
     * @param sanbaoWartPrid the sanbaoWartPrid to set
     */
    public void setSanbaoWartPrid(String sanbaoWartPrid) {
        this.sanbaoWartPrid = sanbaoWartPrid;
    }

    /**
     * @return the sanbaoWartYn
     */
    public String getSanbaoWartYn() {
        return sanbaoWartYn;
    }

    /**
     * @param sanbaoWartYn the sanbaoWartYn to set
     */
    public void setSanbaoWartYn(String sanbaoWartYn) {
        this.sanbaoWartYn = sanbaoWartYn;
    }

    /**
     * @return the sanbaoWartRunDistVal
     */
    public String getSanbaoWartRunDistVal() {
        return sanbaoWartRunDistVal;
    }

    /**
     * @param sanbaoWartRunDistVal the sanbaoWartRunDistVal to set
     */
    public void setSanbaoWartRunDistVal(String sanbaoWartRunDistVal) {
        this.sanbaoWartRunDistVal = sanbaoWartRunDistVal;
    }

    /**
     * @return the sanbaoWartRmPrid
     */
    public String getSanbaoWartRmPrid() {
        return sanbaoWartRmPrid;
    }

    /**
     * @param sanbaoWartRmPrid the sanbaoWartRmPrid to set
     */
    public void setSanbaoWartRmPrid(String sanbaoWartRmPrid) {
        this.sanbaoWartRmPrid = sanbaoWartRmPrid;
    }

    /**
     * @return the sanbaoWartRmRunDistVal
     */
    public String getSanbaoWartRmRunDistVal() {
        return sanbaoWartRmRunDistVal;
    }

    /**
     * @param sanbaoWartRmRunDistVal the sanbaoWartRmRunDistVal to set
     */
    public void setSanbaoWartRmRunDistVal(String sanbaoWartRmRunDistVal) {
        this.sanbaoWartRmRunDistVal = sanbaoWartRmRunDistVal;
    }

    /**
     * @return the newCarWartPrid
     */
    public String getNewCarWartPrid() {
        return newCarWartPrid;
    }

    /**
     * @param newCarWartPrid the newCarWartPrid to set
     */
    public void setNewCarWartPrid(String newCarWartPrid) {
        this.newCarWartPrid = newCarWartPrid;
    }

    /**
     * @return the newCarWartRunDistVal
     */
    public String getNewCarWartRunDistVal() {
        return newCarWartRunDistVal;
    }

    /**
     * @param newCarWartRunDistVal the newCarWartRunDistVal to set
     */
    public void setNewCarWartRunDistVal(String newCarWartRunDistVal) {
        this.newCarWartRunDistVal = newCarWartRunDistVal;
    }

    /**
     * @return the newCarWartRmPrid
     */
    public String getNewCarWartRmPrid() {
        return newCarWartRmPrid;
    }

    /**
     * @param newCarWartRmPrid the newCarWartRmPrid to set
     */
    public void setNewCarWartRmPrid(String newCarWartRmPrid) {
        this.newCarWartRmPrid = newCarWartRmPrid;
    }

    /**
     * @return the newCarWartRmRunDistVal
     */
    public String getNewCarWartRmRunDistVal() {
        return newCarWartRmRunDistVal;
    }

    /**
     * @param newCarWartRmRunDistVal the newCarWartRmRunDistVal to set
     */
    public void setNewCarWartRmRunDistVal(String newCarWartRmRunDistVal) {
        this.newCarWartRmRunDistVal = newCarWartRmRunDistVal;
    }

    /**
     * @return the workOverPrid
     */
    public String getWorkOverPrid() {
        return workOverPrid;
    }

    /**
     * @param workOverPrid the workOverPrid to set
     */
    public void setWorkOverPrid(String workOverPrid) {
        this.workOverPrid = workOverPrid;
    }

    /**
     * @return the workOverRmPrid
     */
    public String getWorkOverRmPrid() {
        return workOverRmPrid;
    }

    /**
     * @param workOverRmPrid the workOverRmPrid to set
     */
    public void setWorkOverRmPrid(String workOverRmPrid) {
        this.workOverRmPrid = workOverRmPrid;
    }

    /**
     * @return the newCarWartYn
     */
    public String getNewCarWartYn() {
        return newCarWartYn;
    }

    /**
     * @param newCarWartYn the newCarWartYn to set
     */
    public void setNewCarWartYn(String newCarWartYn) {
        this.newCarWartYn = newCarWartYn;
    }

    /**
     * @return the workOverYn
     */
    public String getWorkOverYn() {
        return workOverYn;
    }

    /**
     * @param workOverYn the workOverYn to set
     */
    public void setWorkOverYn(String workOverYn) {
        this.workOverYn = workOverYn;
    }

    /**
     * @return the sanbaoWartAlarmYn
     */
    public String getSanbaoWartAlarmYn() {
        return sanbaoWartAlarmYn;
    }

    /**
     * @param sanbaoWartAlarmYn the sanbaoWartAlarmYn to set
     */
    public void setSanbaoWartAlarmYn(String sanbaoWartAlarmYn) {
        this.sanbaoWartAlarmYn = sanbaoWartAlarmYn;
    }

    /**
     * @return the newCarWartAlarmYn
     */
    public String getNewCarWartAlarmYn() {
        return newCarWartAlarmYn;
    }

    /**
     * @param newCarWartAlarmYn the newCarWartAlarmYn to set
     */
    public void setNewCarWartAlarmYn(String newCarWartAlarmYn) {
        this.newCarWartAlarmYn = newCarWartAlarmYn;
    }

    /**
     * @return the workOverAlarmYn
     */
    public String getWorkOverAlarmYn() {
        return workOverAlarmYn;
    }

    /**
     * @param workOverAlarmYn the workOverAlarmYn to set
     */
    public void setWorkOverAlarmYn(String workOverAlarmYn) {
        this.workOverAlarmYn = workOverAlarmYn;
    }

    /**
     * @return the workDay
     */
    public String getWorkDay() {
        return workDay;
    }

    /**
     * @param workDay the workDay to set
     */
    public void setWorkDay(String workDay) {
        this.workDay = workDay;
    }

    /**
     * @return the workOverAlarmTerm
     */
    public String getWorkOverAlarmTerm() {
        return workOverAlarmTerm;
    }

    /**
     * @param workOverAlarmTerm the workOverAlarmTerm to set
     */
    public void setWorkOverAlarmTerm(String workOverAlarmTerm) {
        this.workOverAlarmTerm = workOverAlarmTerm;
    }

    /**
     * @return the newCarWartAlarmTerm
     */
    public String getNewCarWartAlarmTerm() {
        return newCarWartAlarmTerm;
    }

    /**
     * @param newCarWartAlarmTerm the newCarWartAlarmTerm to set
     */
    public void setNewCarWartAlarmTerm(String newCarWartAlarmTerm) {
        this.newCarWartAlarmTerm = newCarWartAlarmTerm;
    }

    /**
     * @return the sanbaoWartAlarmTerm
     */
    public String getSanbaoWartAlarmTerm() {
        return sanbaoWartAlarmTerm;
    }

    /**
     * @param sanbaoWartAlarmTerm the sanbaoWartAlarmTerm to set
     */
    public void setSanbaoWartAlarmTerm(String sanbaoWartAlarmTerm) {
        this.sanbaoWartAlarmTerm = sanbaoWartAlarmTerm;
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


}
