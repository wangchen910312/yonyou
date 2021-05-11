package chn.bhmc.dms.mob.api.sales.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DayFundStatusSearchVO
 * @Description : 일자금현황 조회 VO
 * @author Kim Jin Suk
 * @since 2016. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class DayFundStatusSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3088555491919219789L;

    private String sYyMmDd;
    private String sDlrCd;

    private String sCarlineCd;
    private String sModelCd;
    private String sOcnCd;
    private String sExtColorCd;
    private String sIntColorCd;
    private String sOrdTpCd;

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
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }
    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }
    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
    /**
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }
    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }
    /**
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }
    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }
    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }
    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sOrdTpCd
     */
    public String getsOrdTpCd() {
        return sOrdTpCd;
    }
    /**
     * @param sOrdTpCd the sOrdTpCd to set
     */
    public void setsOrdTpCd(String sOrdTpCd) {
        this.sOrdTpCd = sOrdTpCd;
    }
}
