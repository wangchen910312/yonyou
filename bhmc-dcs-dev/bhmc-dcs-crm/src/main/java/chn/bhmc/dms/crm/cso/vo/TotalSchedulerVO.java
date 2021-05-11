package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TotalSchedulerVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kang Seok Han     최초 생성
 * </pre>
 */

public class TotalSchedulerVO {


    private  String          totalSchedulerSeq;
    private  String          schedulerSeq;          // 내방, 시승, 영업활동의 각각의 seq
    private  String          schedulerTp;           // 내방(01), 시승(02), 영업활동(03)
    private  String          salesActiveTpCd;       // 영업활동유형
    private  String          schedulerStat;         // 상태
    private  String          title;
    private  Date            start;
    private  Date            end;
    private  String          custNm;
    private  String          scNm;
    private  String          scId;                  // 스케즐러에서 아이디로 필터링 하기 때문에 있어야함..



    /**
     * @return the totalSchedulerSeq
     */
    public String getTotalSchedulerSeq() {
        return totalSchedulerSeq;
    }
    /**
     * @param totalSchedulerSeq the totalSchedulerSeq to set
     */
    public void setTotalSchedulerSeq(String totalSchedulerSeq) {
        this.totalSchedulerSeq = totalSchedulerSeq;
    }
    /**
     * @return the schedulerSeq
     */
    public String getSchedulerSeq() {
        return schedulerSeq;
    }
    /**
     * @param schedulerSeq the schedulerSeq to set
     */
    public void setSchedulerSeq(String schedulerSeq) {
        this.schedulerSeq = schedulerSeq;
    }
    /**
     * @return the schedulerTp
     */
    public String getSchedulerTp() {
        return schedulerTp;
    }
    /**
     * @param schedulerTp the schedulerTp to set
     */
    public void setSchedulerTp(String schedulerTp) {
        this.schedulerTp = schedulerTp;
    }
    /**
     * @return the salesActiveTpCd
     */
    public String getSalesActiveTpCd() {
        return salesActiveTpCd;
    }
    /**
     * @param salesActiveTpCd the salesActiveTpCd to set
     */
    public void setSalesActiveTpCd(String salesActiveTpCd) {
        this.salesActiveTpCd = salesActiveTpCd;
    }
    /**
     * @return the schedulerStat
     */
    public String getSchedulerStat() {
        return schedulerStat;
    }
    /**
     * @param schedulerStat the schedulerStat to set
     */
    public void setSchedulerStat(String schedulerStat) {
        this.schedulerStat = schedulerStat;
    }
    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }
    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }
    /**
     * @return the start
     */
    public Date getStart() {
        return start;
    }
    /**
     * @param start the start to set
     */
    public void setStart(Date start) {
        this.start = start;
    }
    /**
     * @return the end
     */
    public Date getEnd() {
        return end;
    }
    /**
     * @param end the end to set
     */
    public void setEnd(Date end) {
        this.end = end;
    }
    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the scNm
     */
    public String getScNm() {
        return scNm;
    }
    /**
     * @param scNm the scNm to set
     */
    public void setScNm(String scNm) {
        this.scNm = scNm;
    }

    /**
     * @return the scId
     */
    public String getScId() {
        return scId;
    }
    /**
     * @param scId the scId to set
     */
    public void setScId(String scId) {
        this.scId = scId;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "TotalSchedulerVO [totalSchedulerSeq=" + totalSchedulerSeq + ", schedulerSeq=" + schedulerSeq
                + ", schedulerTp=" + schedulerTp + ", salesActiveTpCd=" + salesActiveTpCd + ", schedulerStat="
                + schedulerStat + ", title=" + title + ", start=" + start + ", end=" + end + ", custNm=" + custNm
                + ", scNm=" + scNm + ", scId=" + scId + "]";
    }

}
