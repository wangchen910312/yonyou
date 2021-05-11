package chn.bhmc.dms.sal.trm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FundStatusSearchVO
 * @Description : 자금현황 조회 VO
 * @author Kim Jin Suk
 * @since 2016. 8. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 22.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class FundStatusSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4317676398205989274L;

    private String sDlrCd;
    private String sYyMmDd;

    private String sYy;

    private String sMm;

    private String sDd;
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
     * @return the sYyMmDd
     */
    public String getsYyMmDd() {
        return sYyMmDd;
    }
    /**
     * @param sYyMmDd the sYyMmDd to set
     */
    public void setsYyMmDd(String sYyMmDd) {
        this.sYyMmDd = sYyMmDd;
    }
    /**
     * @return the sYy
     */
    public String getsYy() {
        return sYy;
    }
    /**
     * @param sYy the sYy to set
     */
    public void setsYy(String sYy) {
        this.sYy = sYy;
    }
    /**
     * @return the sMm
     */
    public String getsMm() {
        return sMm;
    }
    /**
     * @param sMm the sMm to set
     */
    public void setsMm(String sMm) {
        this.sMm = sMm;
    }
    /**
     * @return the sDd
     */
    public String getsDd() {
        return sDd;
    }
    /**
     * @param sDd the sDd to set
     */
    public void setsDd(String sDd) {
        this.sDd = sDd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
