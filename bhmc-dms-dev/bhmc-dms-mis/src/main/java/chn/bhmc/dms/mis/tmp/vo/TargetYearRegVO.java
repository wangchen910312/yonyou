package chn.bhmc.dms.mis.tmp.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * [제조사] 년간 목표 등록
 * </pre>
 *
 * @ClassName   : TatgetYearRegVO.java
 * @Description : [제조사] 년간 목표 등록
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

public class TargetYearRegVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6171496097952742619L;

    // 조회조건
    private String sSdptCd;          // 사업부코드
    private String sOfficeCd;        // 사무소코드

    // 데이터
    private String inputStandard;   // 입력기준
    private String goalYy;          // 목표년도
    private String sdptCd;          // 사업부코드
    private String officeCd;        // 사무소코드
    private String dlrCd;           // 딜러코드
    private String carLineCd;       // 차종코드
    private String goalPrefVal;     // 목표설정값
    private String prefTp;          // 설정유형
    private String prefTpNm;        // 설정유형
    private String delYn;           // 삭제여부
    private String regUsrId;        // 등록자ID
    private Date regDt;             // 등록일자
    private String updtUsrId;       // 수정자ID
    private Date updtDt;            // 수정일자
    /**
     * @return the sSdptCd
     */
    public String getsSdptCd() {
        return sSdptCd;
    }
    /**
     * @param sSdptCd the sSdptCd to set
     */
    public void setsSdptCd(String sSdptCd) {
        this.sSdptCd = sSdptCd;
    }
    /**
     * @return the sOfficeCd
     */
    public String getsOfficeCd() {
        return sOfficeCd;
    }
    /**
     * @param sOfficeCd the sOfficeCd to set
     */
    public void setsOfficeCd(String sOfficeCd) {
        this.sOfficeCd = sOfficeCd;
    }
    /**
     * @return the inputStandard
     */
    public String getInputStandard() {
        return inputStandard;
    }
    /**
     * @param inputStandard the inputStandard to set
     */
    public void setInputStandard(String inputStandard) {
        this.inputStandard = inputStandard;
    }
    /**
     * @return the goalYy
     */
    public String getGoalYy() {
        return goalYy;
    }
    /**
     * @param goalYy the goalYy to set
     */
    public void setGoalYy(String goalYy) {
        this.goalYy = goalYy;
    }
    /**
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }
    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }
    /**
     * @return the officeCd
     */
    public String getOfficeCd() {
        return officeCd;
    }
    /**
     * @param officeCd the officeCd to set
     */
    public void setOfficeCd(String officeCd) {
        this.officeCd = officeCd;
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
     * @return the carLineCd
     */
    public String getCarLineCd() {
        return carLineCd;
    }
    /**
     * @param carLineCd the carLineCd to set
     */
    public void setCarLineCd(String carLineCd) {
        this.carLineCd = carLineCd;
    }
    /**
     * @return the goalPrefVal
     */
    public String getGoalPrefVal() {
        return goalPrefVal;
    }
    /**
     * @param goalPrefVal the goalPrefVal to set
     */
    public void setGoalPrefVal(String goalPrefVal) {
        this.goalPrefVal = goalPrefVal;
    }
    /**
     * @return the prefTp
     */
    public String getPrefTp() {
        return prefTp;
    }
    /**
     * @param prefTp the prefTp to set
     */
    public void setPrefTp(String prefTp) {
        this.prefTp = prefTp;
    }
    /**
     * @return the prefTpNm
     */
    public String getPrefTpNm() {
        return prefTpNm;
    }
    /**
     * @param prefTpNm the prefTpNm to set
     */
    public void setPrefTpNm(String prefTpNm) {
        this.prefTpNm = prefTpNm;
    }
    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }
    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
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
