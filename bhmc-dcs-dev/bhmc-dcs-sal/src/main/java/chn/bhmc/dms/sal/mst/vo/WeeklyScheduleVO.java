package chn.bhmc.dms.sal.mst.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class WeeklyScheduleVO  extends BaseSearchVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String btoYyMmDt;          // 년월
	private String btoCnt;             // 주차

	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date weekStartDt;
	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date weekEndDt;
	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date weekFstStockDt;
	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pfpExamDt;
	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date befWeekDt;

    private String crePlanApplyYyMmDt;      // 생산계획 적용 년월일자
    private String crePlanApplyCnt;         // 생산계획적용차수

    /**
     * @return the btoYyMmDt
     */
    public String getBtoYyMmDt() {
        return btoYyMmDt;
    }
    /**
     * @param btoYyMmDt the btoYyMmDt to set
     */
    public void setBtoYyMmDt(String btoYyMmDt) {
        this.btoYyMmDt = btoYyMmDt;
    }
    /**
     * @return the btoCnt
     */
    public String getBtoCnt() {
        return btoCnt;
    }
    /**
     * @param btoCnt the btoCnt to set
     */
    public void setBtoCnt(String btoCnt) {
        this.btoCnt = btoCnt;
    }
    /**
     * @return the weekStartDt
     */
    public Date getWeekStartDt() {
        return weekStartDt;
    }
    /**
     * @param weekStartDt the weekStartDt to set
     */
    public void setWeekStartDt(Date weekStartDt) {
        this.weekStartDt = weekStartDt;
    }
    /**
     * @return the weekEndDt
     */
    public Date getWeekEndDt() {
        return weekEndDt;
    }
    /**
     * @param weekEndDt the weekEndDt to set
     */
    public void setWeekEndDt(Date weekEndDt) {
        this.weekEndDt = weekEndDt;
    }
    /**
     * @return the weekFstStockDt
     */
    public Date getWeekFstStockDt() {
        return weekFstStockDt;
    }
    /**
     * @param weekFstStockDt the weekFstStockDt to set
     */
    public void setWeekFstStockDt(Date weekFstStockDt) {
        this.weekFstStockDt = weekFstStockDt;
    }
    /**
     * @return the pfpExamDt
     */
    public Date getPfpExamDt() {
        return pfpExamDt;
    }
    /**
     * @param pfpExamDt the pfpExamDt to set
     */
    public void setPfpExamDt(Date pfpExamDt) {
        this.pfpExamDt = pfpExamDt;
    }
    /**
     * @return the befWeekDt
     */
    public Date getBefWeekDt() {
        return befWeekDt;
    }
    /**
     * @param befWeekDt the befWeekDt to set
     */
    public void setBefWeekDt(Date befWeekDt) {
        this.befWeekDt = befWeekDt;
    }
    /**
     * @return the crePlanApplyYyMmDt
     */
    public String getCrePlanApplyYyMmDt() {
        return crePlanApplyYyMmDt;
    }
    /**
     * @param crePlanApplyYyMmDt the crePlanApplyYyMmDt to set
     */
    public void setCrePlanApplyYyMmDt(String crePlanApplyYyMmDt) {
        this.crePlanApplyYyMmDt = crePlanApplyYyMmDt;
    }
    /**
     * @return the crePlanApplyCnt
     */
    public String getCrePlanApplyCnt() {
        return crePlanApplyCnt;
    }
    /**
     * @param crePlanApplyCnt the crePlanApplyCnt to set
     */
    public void setCrePlanApplyCnt(String crePlanApplyCnt) {
        this.crePlanApplyCnt = crePlanApplyCnt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}

