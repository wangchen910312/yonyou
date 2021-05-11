package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

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

public class SanbaoAlarmVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6496202141784683951L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 차대번호
     */
    private String vinNo;

    /**
     * 차대번호1
     */
    private String vinNo1;


    /**
     * 차대번호1
     */
    private String vinNo2;

    /**
     * 판매딜러 코드
     */
    private String saleDlrCd;

    /**
     * 판매딜러 명칭
     */
    private String saleDlrNm;

    /**
     * 보증수리일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartDt;


    /**
     * 판매일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleDt;

    /**
     * 생산일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creDt;


    /**
     * 삼보 보증기간 년도
     */
    private String sanbaoWartPrid;

    /**
     * 삼포대상여부
     */
    private String sanbaoWartYn;

    /**
     * 삼보 보증기간 주행거리
     */
    private String sanbaoWartRunDistVal;

    /**
     * 삼보 보증 잔여 기간
     */
    private String sanbaoWartRmPrid;

    /**
     * 삼보 보증 잔여 주행거리
     */
    private String sanbaoWartRmRunDistVal;

    /**
     * 신차보증 기간(일)
     */
    private String newCarWartPrid;

    /**
     * 신차보증 주행거리
     */
    private String newCarWartRunDistVal;

    /**
     * 신차보증 잔여기간
     */
    private String newCarWartRmPrid;

    /**
     * 신차보증 잔여 주행거리
     */
    private String newCarWartRmRunDistVal;

    /**
     * 작업일수초과 적용기준
     */
    private String workOverPrid;

    /**
     * 작업일수 초과 남은 일수
     */
    private String workOverRmPrid;

    /**
     * 신차 보증 여부
     */
    private String newCarWartYn;

    /**
     * 작업일수 초과 여부
     */
    private String workOverYn;

    /**
     * 신차 보증 알람 여부
     */
    private String newCarWartAlarmYn;

    /**
     * 작업일수 초과 알람 여부
     */
    private String workOverAlarmYn;

    /**
     * 삼포 남은 기간
     */
    private String sanbaoRemainDay;

    /**
     * 작업일자
     */
    private String workDay;

    /**
     * 삼포 알람여부
     */
    private String sanbaoWartAlarmYn;

    /**
     * 작업일수 알람조건
     */
    private String workOverAlarmTerm;

    /**
     * 신차 알람조건
     */
    private String newCarWartAlarmTerm;

    /**
     * 삼포 알람 조건
     */
    private String sanbaoWartAlarmTerm;

    /**
     * 현재 주행거리
     */
    private int runDistVal;

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
    public Date getWartDt() {
        return wartDt;
    }

    /**
     * @param wartDt the wartDt to set
     */
    public void setWartDt(Date wartDt) {
        this.wartDt = wartDt;
    }

    /**
     * @return the saleDt
     */
    public Date getSaleDt() {
        return saleDt;
    }

    /**
     * @param saleDt the saleDt to set
     */
    public void setSaleDt(Date saleDt) {
        this.saleDt = saleDt;
    }

    /**
     * @return the creDt
     */
    public Date getCreDt() {
        return creDt;
    }

    /**
     * @param creDt the creDt to set
     */
    public void setCreDt(Date creDt) {
        this.creDt = creDt;
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
    public int getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }




}
