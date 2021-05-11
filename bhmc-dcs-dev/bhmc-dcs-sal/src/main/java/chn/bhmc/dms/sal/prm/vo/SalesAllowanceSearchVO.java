package chn.bhmc.dms.sal.prm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesAllowanceSearchVO
 * @Description : Sales Allowance 목록
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.26      Kim Jin Suk      최초 생성
 * </pre>
 */

public class SalesAllowanceSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5850604422045868504L;

    private String sDlrCd;
    private String sDlDt;
    private String sPromotionCd;

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
     * @return the sDlDt
     */
    public String getsDlDt() {
        return sDlDt;
    }
    /**
     * @param sDlDt the sDlDt to set
     */
    public void setsDlDt(String sDlDt) {
        this.sDlDt = sDlDt;
    }
    /**
     * @return the sPromotionCd
     */
    public String getsPromotionCd() {
        return sPromotionCd;
    }
    /**
     * @param sPromotionCd the sPromotionCd to set
     */
    public void setsPromotionCd(String sPromotionCd) {
        this.sPromotionCd = sPromotionCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
