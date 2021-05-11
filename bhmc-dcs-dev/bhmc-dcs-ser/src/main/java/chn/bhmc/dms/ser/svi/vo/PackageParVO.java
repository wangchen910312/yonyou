package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 작업Package 부품 VO
 * </pre>
 *
 * @ClassName   : PackageParVO.java
 * @Description : 작업Package 부품 VO.
 * @author Yin Xueyuan
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class PackageParVO extends BaseVO {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3180530769489320030L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * package 품목코드
     */
    @NotEmpty
    private String pkgItemCd;

    /**
     *  라인번호
     */
    private String lineNo;

    /**
     *  부품번호
     */
    private String itemCd;

    /**
     *  품목명
     */
    private String itemNm;

    /**
     *  부품수량
     */
    private double itemQty;

    /**
     *  부품단위
     */
    private String itemUnitCd;

    private String stockUnitCd;

    /**
     *  부품단가
     */
    private double itemPrc;

    /**
     *  부품판매단가
     */
    private double salePrcAmt;

    /**
     *  부품금액
     */
    private double itemAmt;

    /**
     *  입고창고
     */
    private String grStrgeCd;

    /**
     *  출고창고
     */
    private String giStrgeCd;

    /**
     *  패키지상세할인율
     */
    private Double pkgDetlDcRate;

    /**
     *  패키지상세할인단가
     */
    private Double pkgDetlDcPrc;

    /**
     *  패키지상세할인액
     */
    private Double pkgDetlDcAmt;

    /**
     *  금액
     */
    private Double pkgDetlDcTot;

    /**
     *  사용여부
     */
    private String useYn;

    /**
     *  가용재고
     */
    private double avlbStockQty;

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
     * @return the pkgItemCd
     */
    public String getPkgItemCd() {
        return pkgItemCd;
    }

    /**
     * @param pkgItemCd the pkgItemCd to set
     */
    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the lineNo
     */
    public String getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(String lineNo) {
        this.lineNo = lineNo;
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
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the itemQty
     */
    public double getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(double itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the itemUnitCd
     */
    public String getItemUnitCd() {
        return itemUnitCd;
    }

    /**
     * @param itemUnitCd the itemUnitCd to set
     */
    public void setItemUnitCd(String itemUnitCd) {
        this.itemUnitCd = itemUnitCd;
    }

    /**
     * @return the stockUnitCd
     */
    public String getStockUnitCd() {
        return stockUnitCd;
    }

    /**
     * @param stockUnitCd the stockUnitCd to set
     */
    public void setStockUnitCd(String stockUnitCd) {
        this.stockUnitCd = stockUnitCd;
    }

    /**
     * @return the itemPrc
     */
    public double getItemPrc() {
        return itemPrc;
    }

    /**
     * @param itemPrc the itemPrc to set
     */
    public void setItemPrc(double itemPrc) {
        this.itemPrc = itemPrc;
    }

    /**
     * @return the salePrcAmt
     */
    public double getSalePrcAmt() {
        return salePrcAmt;
    }

    /**
     * @param salePrcAmt the salePrcAmt to set
     */
    public void setSalePrcAmt(double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
    }

    /**
     * @return the itemAmt
     */
    public double getItemAmt() {
        return itemAmt;
    }

    /**
     * @param itemAmt the itemAmt to set
     */
    public void setItemAmt(double itemAmt) {
        this.itemAmt = itemAmt;
    }

    /**
     * @return the grStrgeCd
     */
    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    /**
     * @param grStrgeCd the grStrgeCd to set
     */
    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
    }

    /**
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    /**
     * @return the pkgDetlDcRate
     */
    public Double getPkgDetlDcRate() {
        return pkgDetlDcRate;
    }

    /**
     * @param pkgDetlDcRate the pkgDetlDcRate to set
     */
    public void setPkgDetlDcRate(Double pkgDetlDcRate) {
        this.pkgDetlDcRate = pkgDetlDcRate;
    }

    /**
     * @return the pkgDetlDcPrc
     */
    public Double getPkgDetlDcPrc() {
        return pkgDetlDcPrc;
    }

    /**
     * @param pkgDetlDcPrc the pkgDetlDcPrc to set
     */
    public void setPkgDetlDcPrc(Double pkgDetlDcPrc) {
        this.pkgDetlDcPrc = pkgDetlDcPrc;
    }

    /**
     * @return the pkgDetlDcAmt
     */
    public Double getPkgDetlDcAmt() {
        return pkgDetlDcAmt;
    }

    /**
     * @param pkgDetlDcAmt the pkgDetlDcAmt to set
     */
    public void setPkgDetlDcAmt(Double pkgDetlDcAmt) {
        this.pkgDetlDcAmt = pkgDetlDcAmt;
    }

    /**
     * @return the pkgDetlDcTot
     */
    public Double getPkgDetlDcTot() {
        return pkgDetlDcTot;
    }

    /**
     * @param pkgDetlDcTot the pkgDetlDcTot to set
     */
    public void setPkgDetlDcTot(Double pkgDetlDcTot) {
        this.pkgDetlDcTot = pkgDetlDcTot;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the avlbStockQty
     */
    public double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
    }
}
