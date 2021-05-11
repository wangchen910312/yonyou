package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 판매계획 검색 VO
 *
 * @ClassName   : SalePlanSearchVO.java
 * @Description : SalePlanSearchVO Class
 * @author In Bo Shim
 * @since 2016. 7. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 15.     In Bo Shim     최초 생성
 * </pre>
 */
public class SalePlanSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2501163610225205145L;

    /**
     * 딜러번호
     **/
    private String sDlrCd = "";

    /**
     * 판매유형
     **/
    private String sSaleTp = "";

    /**
     * 부품유형
     **/
    private String sItemDstinCd = "";

    /**
     * 임무구분코드
     **/
    private String sDstDstinCd = "";

    /**
     * 임무구분유형
     **/
    private String sDstDstinTp = "";

    /**
     * 년
     **/
    private String sYy = "";

    /**
     * 작년
     **/
    private String sLastYy = "";

    /**
     * 월
     **/
    private String sMm = "";

    /**
     * 년월
     **/
    private String sYyMm = "";

    /**
     * 부품번호
     **/
    private String sItemCd = "";

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
     * @return the sSaleTp
     */
    public String getsSaleTp() {
        return sSaleTp;
    }

    /**
     * @param sSaleTp the sSaleTp to set
     */
    public void setsSaleTp(String sSaleTp) {
        this.sSaleTp = sSaleTp;
    }

    /**
     * @return the sItemDstinCd
     */
    public String getsItemDstinCd() {
        return sItemDstinCd;
    }

    /**
     * @param sItemDstinCd the sItemDstinCd to set
     */
    public void setsItemDstinCd(String sItemDstinCd) {
        this.sItemDstinCd = sItemDstinCd;
    }

    /**
     * @return the sDstDstinCd
     */
    public String getsDstDstinCd() {
        return sDstDstinCd;
    }

    /**
     * @param sDstDstinCd the sDstDstinCd to set
     */
    public void setsDstDstinCd(String sDstDstinCd) {
        this.sDstDstinCd = sDstDstinCd;
    }

    /**
     * @return the sDstDstinTp
     */
    public String getsDstDstinTp() {
        return sDstDstinTp;
    }

    /**
     * @param sDstDstinTp the sDstDstinTp to set
     */
    public void setsDstDstinTp(String sDstDstinTp) {
        this.sDstDstinTp = sDstDstinTp;
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
     * @return the sLastYy
     */
    public String getsLastYy() {
        return sLastYy;
    }

    /**
     * @param sLastYy the sLastYy to set
     */
    public void setsLastYy(String sLastYy) {
        this.sLastYy = sLastYy;
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
     * @return the sYyMm
     */
    public String getsYyMm() {
        return sYyMm;
    }

    /**
     * @param sYyMm the sYyMm to set
     */
    public void setsYyMm(String sYyMm) {
        this.sYyMm = sYyMm;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

}
