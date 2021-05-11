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
	private String sAdmSaId;
	private String sAdmSaNm;


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

}
