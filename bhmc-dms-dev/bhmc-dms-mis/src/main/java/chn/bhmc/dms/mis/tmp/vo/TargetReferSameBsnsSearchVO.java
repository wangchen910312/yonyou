package chn.bhmc.dms.mis.tmp.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * [제조사] 동종업계 참조
 * </pre>
 *
 * @ClassName   : TargetReferSameBsnsSearchVO.java
 * @Description : [제조사] 동종업계 참조
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetReferSameBsnsSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    private String sReferYearDt;             // 참조년
    private String sReferMonthDt;            // 참조월
    private String sReferYearMonth;          // 등록년월

    private String dlrCd;                    // 딜러코드
    private String dlrNm;                    // 딜러명

    private String regUsrId;            // 등록자ID
    private Date regDt;                 // 등록일자
    private String updtUsrId;           // 수정자ID
    private Date updtDt;                // 수정일자


    /**
     * @return the sReferYearDt
     */
    public String getsReferYearDt() {
        return sReferYearDt;
    }
    /**
     * @param sReferYearDt the sReferYearDt to set
     */
    public void setsReferYearDt(String sReferYearDt) {
        this.sReferYearDt = sReferYearDt;
    }
    /**
     * @return the sReferMonthDt
     */
    public String getsReferMonthDt() {
        return sReferMonthDt;
    }
    /**
     * @param sReferMonthDt the sReferMonthDt to set
     */
    public void setsReferMonthDt(String sReferMonthDt) {
        this.sReferMonthDt = sReferMonthDt;
    }
    /**
     * @return the sReferYearMonth
     */
    public String getsReferYearMonth() {
        return sReferYearMonth;
    }
    /**
     * @param sReferYearMonth the sReferYearMonth to set
     */
    public void setsReferYearMonth(String sReferYearMonth) {
        this.sReferYearMonth = sReferYearMonth;
    }
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
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

}
