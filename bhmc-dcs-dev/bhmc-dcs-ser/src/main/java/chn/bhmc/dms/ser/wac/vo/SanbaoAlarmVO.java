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
    private static final long serialVersionUID = -6655963323231306050L;

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

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public String getVinNo1() {
        return vinNo1;
    }

    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }

    public String getVinNo2() {
        return vinNo2;
    }

    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
    }

    public String getSaleDlrCd() {
        return saleDlrCd;
    }

    public void setSaleDlrCd(String saleDlrCd) {
        this.saleDlrCd = saleDlrCd;
    }

    public String getSaleDlrNm() {
        return saleDlrNm;
    }

    public void setSaleDlrNm(String saleDlrNm) {
        this.saleDlrNm = saleDlrNm;
    }

    public Date getWartDt() {
        return wartDt;
    }

    public void setWartDt(Date wartDt) {
        this.wartDt = wartDt;
    }

    public Date getSaleDt() {
        return saleDt;
    }

    public void setSaleDt(Date saleDt) {
        this.saleDt = saleDt;
    }

    public Date getCreDt() {
        return creDt;
    }

    public void setCreDt(Date creDt) {
        this.creDt = creDt;
    }

    public String getSanbaoWartPrid() {
        return sanbaoWartPrid;
    }

    public void setSanbaoWartPrid(String sanbaoWartPrid) {
        this.sanbaoWartPrid = sanbaoWartPrid;
    }

    public String getSanbaoWartYn() {
        return sanbaoWartYn;
    }

    public void setSanbaoWartYn(String sanbaoWartYn) {
        this.sanbaoWartYn = sanbaoWartYn;
    }

    public String getSanbaoWartRunDistVal() {
        return sanbaoWartRunDistVal;
    }

    public void setSanbaoWartRunDistVal(String sanbaoWartRunDistVal) {
        this.sanbaoWartRunDistVal = sanbaoWartRunDistVal;
    }

    public String getSanbaoWartRmPrid() {
        return sanbaoWartRmPrid;
    }

    public void setSanbaoWartRmPrid(String sanbaoWartRmPrid) {
        this.sanbaoWartRmPrid = sanbaoWartRmPrid;
    }

    public String getSanbaoWartRmRunDistVal() {
        return sanbaoWartRmRunDistVal;
    }

    public void setSanbaoWartRmRunDistVal(String sanbaoWartRmRunDistVal) {
        this.sanbaoWartRmRunDistVal = sanbaoWartRmRunDistVal;
    }

    public String getNewCarWartPrid() {
        return newCarWartPrid;
    }

    public void setNewCarWartPrid(String newCarWartPrid) {
        this.newCarWartPrid = newCarWartPrid;
    }

    public String getNewCarWartRunDistVal() {
        return newCarWartRunDistVal;
    }

    public void setNewCarWartRunDistVal(String newCarWartRunDistVal) {
        this.newCarWartRunDistVal = newCarWartRunDistVal;
    }

    public String getNewCarWartRmPrid() {
        return newCarWartRmPrid;
    }

    public void setNewCarWartRmPrid(String newCarWartRmPrid) {
        this.newCarWartRmPrid = newCarWartRmPrid;
    }

    public String getNewCarWartRmRunDistVal() {
        return newCarWartRmRunDistVal;
    }

    public void setNewCarWartRmRunDistVal(String newCarWartRmRunDistVal) {
        this.newCarWartRmRunDistVal = newCarWartRmRunDistVal;
    }

    public String getWorkOverPrid() {
        return workOverPrid;
    }

    public void setWorkOverPrid(String workOverPrid) {
        this.workOverPrid = workOverPrid;
    }

    public String getWorkOverRmPrid() {
        return workOverRmPrid;
    }

    public void setWorkOverRmPrid(String workOverRmPrid) {
        this.workOverRmPrid = workOverRmPrid;
    }

    public String getNewCarWartYn() {
        return newCarWartYn;
    }

    public void setNewCarWartYn(String newCarWartYn) {
        this.newCarWartYn = newCarWartYn;
    }

    public String getWorkOverYn() {
        return workOverYn;
    }

    public void setWorkOverYn(String workOverYn) {
        this.workOverYn = workOverYn;
    }

    public String getNewCarWartAlarmYn() {
        return newCarWartAlarmYn;
    }

    public void setNewCarWartAlarmYn(String newCarWartAlarmYn) {
        this.newCarWartAlarmYn = newCarWartAlarmYn;
    }

    public String getWorkOverAlarmYn() {
        return workOverAlarmYn;
    }

    public void setWorkOverAlarmYn(String workOverAlarmYn) {
        this.workOverAlarmYn = workOverAlarmYn;
    }

    public String getSanbaoRemainDay() {
        return sanbaoRemainDay;
    }

    public void setSanbaoRemainDay(String sanbaoRemainDay) {
        this.sanbaoRemainDay = sanbaoRemainDay;
    }

    public String getWorkDay() {
        return workDay;
    }

    public void setWorkDay(String workDay) {
        this.workDay = workDay;
    }

    public String getSanbaoWartAlarmYn() {
        return sanbaoWartAlarmYn;
    }

    public void setSanbaoWartAlarmYn(String sanbaoWartAlarmYn) {
        this.sanbaoWartAlarmYn = sanbaoWartAlarmYn;
    }

    public String getWorkOverAlarmTerm() {
        return workOverAlarmTerm;
    }

    public void setWorkOverAlarmTerm(String workOverAlarmTerm) {
        this.workOverAlarmTerm = workOverAlarmTerm;
    }

    public String getNewCarWartAlarmTerm() {
        return newCarWartAlarmTerm;
    }

    public void setNewCarWartAlarmTerm(String newCarWartAlarmTerm) {
        this.newCarWartAlarmTerm = newCarWartAlarmTerm;
    }

    public String getSanbaoWartAlarmTerm() {
        return sanbaoWartAlarmTerm;
    }

    public void setSanbaoWartAlarmTerm(String sanbaoWartAlarmTerm) {
        this.sanbaoWartAlarmTerm = sanbaoWartAlarmTerm;
    }

    public int getRunDistVal() {
        return runDistVal;
    }

    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }
     
    

}
