package chn.bhmc.dms.cmm.mig.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigNdmsComInitLogVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MigNdmsComInitLogVO implements Serializable {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2424508841330851197L;

    /**
     * 프로세스 ID
     */
    private String pid;

    /**
     * 시작시간
     */
    private Date startTime;

    /**
     * 종료시간
     */
    private Date endTime;

    /**
     * 소스목록수
     */
    private int srcCnt;

    /**
     * 타켓목록수
     */
    private int targetCnt;

    /**
     * 상태코드
     * 'S':성공
     * 'F':실패
     */
    private String statCd;

    /**
     * 프로세스 실행정보
     */
    private String pmsg;

    /**
     * 프로세스명
     */
    private String pnm;

    /**
     * 번호
     */
    private int seqNo;

    /**
     * 경과시간(초)
     */
    private int elapsedTime;

    /**
     * 용량 (초)
     */
    private double bytes;

    /**
     * 용량 (초)
     */
    private String detailPnm;

    /**
     * @return the pid
     */
    public String getPid() {
        return pid;
    }
    /**
     * @param pid the pid to set
     */
    public void setPid(String pid) {
        this.pid = pid;
    }
    /**
     * @return the startTime
     */
    public Date getStartTime() {
        return startTime;
    }
    /**
     * @param startTime the startTime to set
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
    /**
     * @return the endTime
     */
    public Date getEndTime() {
        return endTime;
    }
    /**
     * @param endTime the endTime to set
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
    /**
     * @return the srcCnt
     */
    public int getSrcCnt() {
        return srcCnt;
    }
    /**
     * @param srcCnt the srcCnt to set
     */
    public void setSrcCnt(int srcCnt) {
        this.srcCnt = srcCnt;
    }
    /**
     * @return the targetCnt
     */
    public int getTargetCnt() {
        return targetCnt;
    }
    /**
     * @param targetCnt the targetCnt to set
     */
    public void setTargetCnt(int targetCnt) {
        this.targetCnt = targetCnt;
    }
    /**
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }
    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }
    /**
     * @return the pmsg
     */
    public String getPmsg() {
        return pmsg;
    }
    /**
     * @param pmsg the pmsg to set
     */
    public void setPmsg(String pmsg) {
        this.pmsg = pmsg;
    }
    /**
     * @return the pnm
     */
    public String getPnm() {
        return pnm;
    }
    /**
     * @param pnm the pnm to set
     */
    public void setPnm(String pnm) {
        this.pnm = pnm;
    }
    /**
     * @return the seqNo
     */
    public int getSeqNo() {
        return seqNo;
    }
    /**
     * @param seqNo the seqNo to set
     */
    public void setSeqNo(int seqNo) {
        this.seqNo = seqNo;
    }
    /**
     * @return the elapsedTime
     */
    public int getElapsedTime() {
        return elapsedTime;
    }
    /**
     * @param elapsedTime the elapsedTime to set
     */
    public void setElapsedTime(int elapsedTime) {
        this.elapsedTime = elapsedTime;
    }
    /**
     * @return the bytes
     */
    public double getBytes() {
        return bytes;
    }
    /**
     * @param bytes the bytes to set
     */
    public void setBytes(double bytes) {
        this.bytes = bytes;
    }
    /**
     * @return the detailPnm
     */
    public String getDetailPnm() {
        return detailPnm;
    }
    /**
     * @param detailPnm the detailPnm to set
     */
    public void setDetailPnm(String detailPnm) {
        this.detailPnm = detailPnm;
    }
}
