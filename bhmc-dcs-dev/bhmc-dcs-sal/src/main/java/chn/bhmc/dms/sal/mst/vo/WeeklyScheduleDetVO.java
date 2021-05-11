package chn.bhmc.dms.sal.mst.vo;

import java.io.Serializable;

public class WeeklyScheduleDetVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String btoWrkTp;
	private String startDt;
	private String startTime;
    private String endDt;
    private String endTime;
    private String operStatCd;



    /**
     * @return the btoWrkTp
     */
    public String getBtoWrkTp() {
        return btoWrkTp;
    }



    /**
     * @param btoWrkTp the btoWrkTp to set
     */
    public void setBtoWrkTp(String btoWrkTp) {
        this.btoWrkTp = btoWrkTp;
    }



    /**
     * @return the startDt
     */
    public String getStartDt() {
        return startDt;
    }



    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }



    /**
     * @return the startTime
     */
    public String getStartTime() {
        return startTime;
    }



    /**
     * @param startTime the startTime to set
     */
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }



    /**
     * @return the endDt
     */
    public String getEndDt() {
        return endDt;
    }



    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }



    /**
     * @return the endTime
     */
    public String getEndTime() {
        return endTime;
    }



    /**
     * @param endTime the endTime to set
     */
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }



    /**
     * @return the operStatCd
     */
    public String getOperStatCd() {
        return operStatCd;
    }



    /**
     * @param operStatCd the operStatCd to set
     */
    public void setOperStatCd(String operStatCd) {
        this.operStatCd = operStatCd;
    }



    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}

