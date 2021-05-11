package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayManageSearchVO.java
 * @Description : BayManageSearchVO
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

public class BayManageSearchVO extends SearchVO {

	private static final long serialVersionUID = -6579755691883848482L;

	private String sDlrCd;
	private String sBayNo;
	private String sBayNm;
	private String sAdmSaId;
	private String sAdmSaNm;
	private String sRpirTp;
	private String bpYn;
	private String sBayStatCd;
	private String sSysNo;
	private String sTecId;
	private String sVrYn;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @return the sBayNo
     */
    public String getsBayNo() {
        return sBayNo;
    }
    /**
     * @param sBayNo the sBayNo to set
     */
    public void setsBayNo(String sBayNo) {
        this.sBayNo = sBayNo;
    }
    /**
     * @return the sAdmSaId
     */
    public String getsAdmSaId() {
        return sAdmSaId;
    }
    /**
     * @param sAdmSaId the sAdmSaId to set
     */
    public void setsAdmSaId(String sAdmSaId) {
        this.sAdmSaId = sAdmSaId;
    }
    /**
     * @return the sAdmSaNm
     */
    public String getsAdmSaNm() {
        return sAdmSaNm;
    }
    /**
     * @param sAdmSaNm the sAdmSaNm to set
     */
    public void setsAdmSaNm(String sAdmSaNm) {
        this.sAdmSaNm = sAdmSaNm;
    }
    /**
     * @return the sRpirTp
     */
    public String getsRpirTp() {
        return sRpirTp;
    }
    /**
     * @param sRpirTp the sRpirTp to set
     */
    public void setsRpirTp(String sRpirTp) {
        this.sRpirTp = sRpirTp;
    }
    /**
     * @return the bpYn
     */
    public String getBpYn() {
        return bpYn;
    }
    /**
     * @param bpYn the bpYn to set
     */
    public void setBpYn(String bpYn) {
        this.bpYn = bpYn;
    }
    public String getsBayNm() {
        return sBayNm;
    }
    public void setsBayNm(String sBayNm) {
        this.sBayNm = sBayNm;
    }
    public String getsBayStatCd() {
        return sBayStatCd;
    }
    public void setsBayStatCd(String sBayStatCd) {
        this.sBayStatCd = sBayStatCd;
    }
    /**
     * @return the sSysNo
     */
    public String getsSysNo() {
        return sSysNo;
    }
    /**
     * @param sSysNo the sSysNo to set
     */
    public void setsSysNo(String sSysNo) {
        this.sSysNo = sSysNo;
    }
    /**
     * @return the sTecId
     */
    public String getsTecId() {
        return sTecId;
    }
    /**
     * @param sTecId the sTecId to set
     */
    public void setsTecId(String sTecId) {
        this.sTecId = sTecId;
    }
    /**
     * @return the sVrYn
     */
    public String getsVrYn() {
        return sVrYn;
    }
    /**
     * @param sVrYn the sVrYn to set
     */
    public void setsVrYn(String sVrYn) {
        this.sVrYn = sVrYn;
    }

}
