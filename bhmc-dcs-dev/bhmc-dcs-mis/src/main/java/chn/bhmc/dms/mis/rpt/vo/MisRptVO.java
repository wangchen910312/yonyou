package chn.bhmc.dms.mis.rpt.vo;

/**
 * <pre>
 * [DCS] 경영관리 레포트
 * </pre>
 *
 * @ClassName   : MisRptVO.java
 * @Description : [DCS] 경영관리 레포트
 * @author chibeom.song
 * @since 2017. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 11.     chibeom.song     최초 생성
 * </pre>
 */

public class MisRptVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    // 조회조건
    private String sSrartYyMm;
    private String sEndYyMm;
    private String sKpi;
    private String sSdptCd;
    private String sOfficeCd;
    private String sDealerCd;

    private String sdptCd;          // 사업부코드
    private String sdptNm;          // 사업부명
    private String officeCd;        // 사무소코드
    private String officeNm;        // 사무소명
    private String dlrCd;           // 딜러코드
    private String dlrNm;           // 딜러명

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
     * @return the sKpi
     */
    public String getsKpi() {
        return sKpi;
    }
    /**
     * @param sKpi the sKpi to set
     */
    public void setsKpi(String sKpi) {
        this.sKpi = sKpi;
    }
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
     * @return the sDealerCd
     */
    public String getsDealerCd() {
        return sDealerCd;
    }
    /**
     * @param sDealerCd the sDealerCd to set
     */
    public void setsDealerCd(String sDealerCd) {
        this.sDealerCd = sDealerCd;
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
     * @return the sdptNm
     */
    public String getSdptNm() {
        return sdptNm;
    }
    /**
     * @param sdptNm the sdptNm to set
     */
    public void setSdptNm(String sdptNm) {
        this.sdptNm = sdptNm;
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
     * @return the officeNm
     */
    public String getOfficeNm() {
        return officeNm;
    }
    /**
     * @param officeNm the officeNm to set
     */
    public void setOfficeNm(String officeNm) {
        this.officeNm = officeNm;
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

}
