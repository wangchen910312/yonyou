package chn.bhmc.dms.sal.rpt.vo;

/**
 * <pre>
 * [DMS] 판매 레포트
 * </pre>
 *
 * @ClassName   : SalesReportVO.java
 * @Description : [DMS] 판매 레포트
 * @author chibeom.song
 * @since 2017. 1. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 24.   chibeom.song     최초 생성
 * </pre>
 */

public class SalesReportVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    // 조회조건
    private String sSrartYyMm;
    private String sEndYyMm;

    private String sDlrCd;

    /**
     * @return the sSrartYyMm
     */
    public String getsSrartYyMm() {
        return sSrartYyMm;
    }

    /**
     * @param sSrartYyMm the sSrartYyMm to set
     */
    public void setsSrartYyMm(String sSrartYyMm) {
        this.sSrartYyMm = sSrartYyMm;
    }

    /**
     * @return the sEndYyMm
     */
    public String getsEndYyMm() {
        return sEndYyMm;
    }

    /**
     * @param sEndYyMm the sEndYyMm to set
     */
    public void setsEndYyMm(String sEndYyMm) {
        this.sEndYyMm = sEndYyMm;
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


}
