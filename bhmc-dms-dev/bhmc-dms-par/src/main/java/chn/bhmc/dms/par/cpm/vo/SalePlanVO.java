package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 판매계획 VO
 *
 * @ClassName   : SalePlanVO.java
 * @Description : SalePlanVO Class
 * @author In Bo Shim
 * @since 2016. 8. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 15.     In Bo Shim     최초 생성
 * </pre>
 */

public class SalePlanVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 235838929117710323L;

    /**
     * 딜러번호
     **/
    private String dlrCd = "";

    /**
     * 회사구분코드
     **/
    private String cmpDstinCd = "";

    /**
     * 년월일자
     **/
    private String yyMm = "";

    /**
     * 일일자
     **/
    private String ddDt = "";

    /**
     * 판매유형
     **/
    private String saleTp = "";

    /**
     * 판매계획금액
     **/
    private Double salePlanAmt = 0.0;

    /**
     * 부품구분코드
     **/
    private String itemDstinCd = "";

    /**
     * 임무구분코드
     **/
    private String dstDstinCd = "";

    /**
     * 임무구분유형
     **/
    private String dstDstinTp = "";

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
     * @return the cmpDstinCd
     */
    public String getCmpDstinCd() {
        return cmpDstinCd;
    }

    /**
     * @param cmpDstinCd the cmpDstinCd to set
     */
    public void setCmpDstinCd(String cmpDstinCd) {
        this.cmpDstinCd = cmpDstinCd;
    }

    /**
     * @return the yyMm
     */
    public String getYyMm() {
        return yyMm;
    }

    /**
     * @param yyMm the yyMm to set
     */
    public void setYyMm(String yyMm) {
        this.yyMm = yyMm;
    }

    /**
     * @return the ddDt
     */
    public String getDdDt() {
        return ddDt;
    }

    /**
     * @param ddDt the ddDt to set
     */
    public void setDdDt(String ddDt) {
        this.ddDt = ddDt;
    }

    /**
     * @return the saleTp
     */
    public String getSaleTp() {
        return saleTp;
    }

    /**
     * @param saleTp the saleTp to set
     */
    public void setSaleTp(String saleTp) {
        this.saleTp = saleTp;
    }

    /**
     * @return the salePlanAmt
     */
    public Double getSalePlanAmt() {
        return salePlanAmt;
    }

    /**
     * @param salePlanAmt the salePlanAmt to set
     */
    public void setSalePlanAmt(Double salePlanAmt) {
        this.salePlanAmt = salePlanAmt;
    }

    /**
     * @return the itemDstinCd
     */
    public String getItemDstinCd() {
        return itemDstinCd;
    }

    /**
     * @param itemDstinCd the itemDstinCd to set
     */
    public void setItemDstinCd(String itemDstinCd) {
        this.itemDstinCd = itemDstinCd;
    }

    /**
     * @return the dstDstinCd
     */
    public String getDstDstinCd() {
        return dstDstinCd;
    }

    /**
     * @param dstDstinCd the dstDstinCd to set
     */
    public void setDstDstinCd(String dstDstinCd) {
        this.dstDstinCd = dstDstinCd;
    }

    /**
     * @return the dstDstinTp
     */
    public String getDstDstinTp() {
        return dstDstinTp;
    }

    /**
     * @param dstDstinTp the dstDstinTp to set
     */
    public void setDstDstinTp(String dstDstinTp) {
        this.dstDstinTp = dstDstinTp;
    }

}
