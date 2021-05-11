package chn.bhmc.dms.cmm.mig.vo;

import java.io.Serializable;
import java.sql.Date;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MgrProcLogVO.java
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

public class MigProcLogVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5926437737059034004L;

    /**
     * 프로시저명
     */
    private String procName;

    /**
     * 테이블명
     */
    private String tableName;

    /**
     * 시작일시
     */
    private Date startDate;

    /**
     * 종료일시
     */
    private Date endDate;

    /**
     * 소스 목록수
     */
    private long srcCnt;

    /**
     * 적용 목록수
     */
    private long procCnt;

    /**
     * 성공여부
     */
    private String successFlag;

    /**
     * 수행시간(초)
     */
    private long procSecond;

    /**
     * 비고
     */
    private String etcInfo;

    /**
     * 삭제 목록수
     */
    private long delCnt;

    /**
     * 대상딜러코드
     */
    private String tgtDlrCd;

    /**
     * @return the procName
     */
    public String getProcName() {
        return procName;
    }

    /**
     * @param procName the procName to set
     */
    public void setProcName(String procName) {
        this.procName = procName;
    }

    /**
     * @return the tableName
     */
    public String getTableName() {
        return tableName;
    }

    /**
     * @param tableName the tableName to set
     */
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    /**
     * @return the startDate
     */
    public Date getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
     * @return the srcCnt
     */
    public long getSrcCnt() {
        return srcCnt;
    }

    /**
     * @param srcCnt the srcCnt to set
     */
    public void setSrcCnt(long srcCnt) {
        this.srcCnt = srcCnt;
    }

    /**
     * @return the procCnt
     */
    public long getProcCnt() {
        return procCnt;
    }

    /**
     * @param procCnt the procCnt to set
     */
    public void setProcCnt(long procCnt) {
        this.procCnt = procCnt;
    }

    /**
     * @return the successFlag
     */
    public String getSuccessFlag() {
        return successFlag;
    }

    /**
     * @param successFlag the successFlag to set
     */
    public void setSuccessFlag(String successFlag) {
        this.successFlag = successFlag;
    }

    /**
     * @return the procSecond
     */
    public long getProcSecond() {
        return procSecond;
    }

    /**
     * @param procSecond the procSecond to set
     */
    public void setProcSecond(long procSecond) {
        this.procSecond = procSecond;
    }

    /**
     * @return the etcInfo
     */
    public String getEtcInfo() {
        return etcInfo;
    }

    /**
     * @param etcInfo the etcInfo to set
     */
    public void setEtcInfo(String etcInfo) {
        this.etcInfo = etcInfo;
    }

    /**
     * @return the delCnt
     */
    public long getDelCnt() {
        return delCnt;
    }

    /**
     * @param delCnt the delCnt to set
     */
    public void setDelCnt(long delCnt) {
        this.delCnt = delCnt;
    }

    /**
     * @return the tgtDlrCd
     */
    public String getTgtDlrCd() {
        return tgtDlrCd;
    }

    /**
     * @param tgtDlrCd the tgtDlrCd to set
     */
    public void setTgtDlrCd(String tgtDlrCd) {
        this.tgtDlrCd = tgtDlrCd;
    }
}
