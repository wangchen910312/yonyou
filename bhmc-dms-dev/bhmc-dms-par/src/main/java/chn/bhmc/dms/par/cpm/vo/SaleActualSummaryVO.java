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

public class SaleActualSummaryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1538121320618153555L;

    /**
     * 딜러번호
     **/
    private String dlrCd = "";

    /**
     * 회사구분코드
     **/
    private String cmpDstinCd = "";

    /**
     * 판매년월일자
     **/
    private String saleYyMm = "";

    /**
     * 품목코드
     **/
    private String itemCd = "";

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
     * @return the saleYyMm
     */
    public String getSaleYyMm() {
        return saleYyMm;
    }

    /**
     * @param saleYyMm the saleYyMm to set
     */
    public void setSaleYyMm(String saleYyMm) {
        this.saleYyMm = saleYyMm;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
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
