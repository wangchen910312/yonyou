package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 판매집계 VO.
 *
 * @ClassName   : SaleSummaryVO.java
 * @Description : SaleSummaryVO Class
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

public class SaleSummaryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7451905873560072188L;

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
     * 판매품목수량
     **/
    private double saleItemQty = 0.0;

    /**
     * 판매수량
     **/
    private double saleQty = 0.0;

    /**
     * 판매금액
     **/
    private double saleAmt = 0.0;

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
     * @return the saleItemQty
     */
    public double getSaleItemQty() {
        return saleItemQty;
    }

    /**
     * @param saleItemQty the saleItemQty to set
     */
    public void setSaleItemQty(double saleItemQty) {
        this.saleItemQty = saleItemQty;
    }

    /**
     * @return the saleQty
     */
    public double getSaleQty() {
        return saleQty;
    }

    /**
     * @param saleQty the saleQty to set
     */
    public void setSaleQty(double saleQty) {
        this.saleQty = saleQty;
    }

    /**
     * @return the saleAmt
     */
    public double getSaleAmt() {
        return saleAmt;
    }

    /**
     * @param saleAmt the saleAmt to set
     */
    public void setSaleAmt(double saleAmt) {
        this.saleAmt = saleAmt;
    }
}
