package chn.bhmc.dms.bat.par.ism.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 현재고계산 VO
 *
 * @ClassName   : StockInOutCalcVO.java
 * @Description : StockInOutCalcVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class BatStockInOutCalcVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3974860811306749868L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 센터코드
     */
    private String pltCd;

    /**
     * 창고코드
     */
    private String strgeCd;

    /**
     * 부품번호
     */
    private String itemCd;

    /**
     * 최근입출고일자 수정여부
     */
    private String rectGrGiDtUpdtYn;

    /**
     * 수불입출고유형
     */
    private String mvtGrGiTp;

    /**
     * 취소수불여부
     */
    private String cnclMvtYn;

    /**
     * 재고상태(가용/예약/보류등)
     */
    private String stockSt;

    /**
     * 재고계산구분자
     */
    private String calcTp;

    /**
     * 대여여부
     */
    private String rentType;

    /**
     * 보증가계산여부
     */
    private String grtePrcChkYn;

    /**
     * 수량
     */
    private double qty = 0.0;

    /**
     * 재고금액
     */
    private double stockAmt = 0.0;

    /**
     * 재고금액(세금미포함)
     */
    private double stockTaxDdctAmt = 0.0;

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
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
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
     * @return the rectGrGiDtUpdtYn
     */
    public String getRectGrGiDtUpdtYn() {
        return rectGrGiDtUpdtYn;
    }

    /**
     * @param rectGrGiDtUpdtYn the rectGrGiDtUpdtYn to set
     */
    public void setRectGrGiDtUpdtYn(String rectGrGiDtUpdtYn) {
        this.rectGrGiDtUpdtYn = rectGrGiDtUpdtYn;
    }

    /**
     * @return the mvtGrGiTp
     */
    public String getMvtGrGiTp() {
        return mvtGrGiTp;
    }

    /**
     * @param mvtGrGiTp the mvtGrGiTp to set
     */
    public void setMvtGrGiTp(String mvtGrGiTp) {
        this.mvtGrGiTp = mvtGrGiTp;
    }

    /**
     * @return the cnclMvtYn
     */
    public String getCnclMvtYn() {
        return cnclMvtYn;
    }

    /**
     * @param cnclMvtYn the cnclMvtYn to set
     */
    public void setCnclMvtYn(String cnclMvtYn) {
        this.cnclMvtYn = cnclMvtYn;
    }

    /**
     * @return the stockSt
     */
    public String getStockSt() {
        return stockSt;
    }

    /**
     * @param stockSt the stockSt to set
     */
    public void setStockSt(String stockSt) {
        this.stockSt = stockSt;
    }

    /**
     * @return the calcTp
     */
    public String getCalcTp() {
        return calcTp;
    }

    /**
     * @param calcTp the calcTp to set
     */
    public void setCalcTp(String calcTp) {
        this.calcTp = calcTp;
    }

    /**
     * @return the rentType
     */
    public String getRentType() {
        return rentType;
    }

    /**
     * @param rentType the rentType to set
     */
    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    /**
     * @return the grtePrcChkYn
     */
    public String getGrtePrcChkYn() {
        return grtePrcChkYn;
    }

    /**
     * @param grtePrcChkYn the grtePrcChkYn to set
     */
    public void setGrtePrcChkYn(String grtePrcChkYn) {
        this.grtePrcChkYn = grtePrcChkYn;
    }

    /**
     * @return the qty
     */
    public double getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(double qty) {
        this.qty = qty;
    }

    /**
     * @return the stockAmt
     */
    public double getStockAmt() {
        return stockAmt;
    }

    /**
     * @param stockAmt the stockAmt to set
     */
    public void setStockAmt(double stockAmt) {
        this.stockAmt = stockAmt;
    }

    /**
     * @return the stockTaxDdctAmt
     */
    public double getStockTaxDdctAmt() {
        return stockTaxDdctAmt;
    }

    /**
     * @param stockTaxDdctAmt the stockTaxDdctAmt to set
     */
    public void setStockTaxDdctAmt(double stockTaxDdctAmt) {
        this.stockTaxDdctAmt = stockTaxDdctAmt;
    }

}
