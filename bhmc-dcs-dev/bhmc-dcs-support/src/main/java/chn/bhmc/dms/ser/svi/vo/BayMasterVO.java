package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayMasterVO.java
 * @Description : Bay마스터 VO
 * @author KyungMok Kim
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.    KyungMok Kim     최초 생성
 * </pre>
 */

public class BayMasterVO extends BaseVO {

    private static final long serialVersionUID = -4691080138511732369L;

    private String dlrCd;          // 딜러코드
    private String bayNo;          // Bay 번호
    private String bayNm;          // Bay 내역
    private String rpirTp;         // 수리유형
    private String bayTp;          // Bay 구분
    private String useYn;          // 사용여부
    private String strgeCd;        // 창고코드
    private String strgeNm;        // 창고명
    private String bayLocCd;       // Bay 위치코드
    private String bayLocNm;       // Bay 위치명
    private String admSaId;        // SA관리ID
    private String admSaNm;        // SA관리명
    private String vrYn;           // 가상여부
    private String eqmCd;          // 설비코드
    private String eqmNm;          // 설비명

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
     * @return the bayNo
     */
    public String getBayNo() {
        return bayNo;
    }
    /**
     * @param bayNo the bayNo to set
     */
    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
    }
    /**
     * @return the bayNm
     */
    public String getBayNm() {
        return bayNm;
    }
    /**
     * @param bayNm the bayNm to set
     */
    public void setBayNm(String bayNm) {
        this.bayNm = bayNm;
    }
    /**
     * @return the rpirTp
     */
    public String getRpirTp() {
        return rpirTp;
    }
    /**
     * @param rpirTp the rpirTp to set
     */
    public void setRpirTp(String rpirTp) {
        this.rpirTp = rpirTp;
    }
    /**
     * @return the bayTp
     */
    public String getBayTp() {
        return bayTp;
    }
    /**
     * @param bayTp the bayTp to set
     */
    public void setBayTp(String bayTp) {
        this.bayTp = bayTp;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }
    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }
    /**
     * @return the strgeNm
     */
    public String getStrgeNm() {
        return strgeNm;
    }
    /**
     * @param strgeNm the strgeNm to set
     */
    public void setStrgeNm(String strgeNm) {
        this.strgeNm = strgeNm;
    }
    /**
     * @return the bayLocCd
     */
    public String getBayLocCd() {
        return bayLocCd;
    }
    /**
     * @param bayLocCd the bayLocCd to set
     */
    public void setBayLocCd(String bayLocCd) {
        this.bayLocCd = bayLocCd;
    }
    /**
     * @return the bayLocNm
     */
    public String getBayLocNm() {
        return bayLocNm;
    }
    /**
     * @param bayLocNm the bayLocNm to set
     */
    public void setBayLocNm(String bayLocNm) {
        this.bayLocNm = bayLocNm;
    }
    /**
     * @return the admSaId
     */
    public String getAdmSaId() {
        return admSaId;
    }
    /**
     * @param admSaId the admSaId to set
     */
    public void setAdmSaId(String admSaId) {
        this.admSaId = admSaId;
    }
    /**
     * @return the admSaNm
     */
    public String getAdmSaNm() {
        return admSaNm;
    }
    /**
     * @param admSaNm the admSaNm to set
     */
    public void setAdmSaNm(String admSaNm) {
        this.admSaNm = admSaNm;
    }
    /**
     * @return the vrYn
     */
    public String getVrYn() {
        return vrYn;
    }
    /**
     * @param vrYn the vrYn to set
     */
    public void setVrYn(String vrYn) {
        this.vrYn = vrYn;
    }
    /**
     * @return the eqmCd
     */
    public String getEqmCd() {
        return eqmCd;
    }
    /**
     * @param eqmCd the eqmCd to set
     */
    public void setEqmCd(String eqmCd) {
        this.eqmCd = eqmCd;
    }
    /**
     * @return the eqmNm
     */
    public String getEqmNm() {
        return eqmNm;
    }
    /**
     * @param eqmNm the eqmNm to set
     */
    public void setEqmNm(String eqmNm) {
        this.eqmNm = eqmNm;
    }

}
