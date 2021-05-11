package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

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
     * package 품목코드
     */
    @NotEmpty
    private String pkgItemNm;

    /**
     * 패키지 문서번호
     */
    private int pkgDocNo;

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
     *  창고코드
     */
    private String strgeCd;

    private String strgeNm;

    /**
     *  브랜드
     */
    private String brandCd;

    /**
     *  부품수량
     */
    private double itemQty;

    /**
     *  부품단위
     */
    private String itemUnitCd;

    /**
     *  재고단위
     */
    private String stockUnitCd;

    /**
     *  부품단가
     */
    private double itemPrc;

    /**
     *  부품금액
     */
    private double itemAmt;

    /**
     *  부품판매단가
     */
    private double itemSalePrc;

    /**
     *  부품판매금액
     */
    private double salePrcAmt;

    /**
     *  이동평균금액
     */
    private double movingAvgPrc;

    /**
     *  이동평균금액
     */
    private double movingAvgTaxDdctPrc;

    /**
     *  입고창고
     */
    private String grStrgeCd;

    /**
     *  품목구분
     */
    private String itemDstinCd;

    /**
     * 공급상구분
     */
    private String spyrCd;

    /**
     *  모델
     */
    private String ltsModelCd;

    /**
     *  모델명
     */
    private String ltsModelNm;

    /**
     *  출고창고
     */
    private String giStrgeCd;

    /**
     *  출고로케이션
     */
    private String giLocCd;

    /**
     *  출고로케이션
     */
    private String giLocNm;

    /**
     *  패키지상세할인율
     */
    private Double pkgDetlDcRate;

    /**
     *  패키지상세할인단가
     */
    private Double pkgDetlDcPrc;

    /**
     *  패키지상세금액
     */
    private Double pkgDetlTotAmt;

    /**
     *  패키지상세할인액
     */
    private Double pkgDetlDcAmt;

    /**
     *  할인전 총금액
     */
    private Double pkgTotAmt;

    /**
     *  할인금액
     */
    private Double pkgDcAmt;

    /**
     *  할인 후 총 금액
     */
    private Double pkgDcTotAmt;

    /**
     *  금액
     */
    private Double pkgDetlDcTot;

    /**
     *  패키지 상세 할인 후 총 금액
     */
    private Double pkgDetlDcTotAmt;

    /**
     * 소매가격
     */
    private double retlPrc;

    /**
     * 도매가격
     */
    private double whslPrc;

    /**
     * 보험가격
     */
    private double incPrc;

    /**
     * 보증가격
     */
    private double grtePrc;

    /**
     *  사용여부
     */
    private String useYn;

    /**
     *  실재고(실재고+예류)
     */
    private double totStockQty = 0.0;

    /**
     *  장면재고(실재고+예류-차입+차출)
     */
    private double strgeStockQty = 0.0;

    /**
     *  가용재고
     */
    private double avlbStockQty = 0.0;

    /**
     *  예약재고
     */
    private double resvStockQty = 0.0;

    /**
     *  클레임재고
     */
    private double clamStockQty = 0.0;

    /**
     *  차입수량
     */
    private double borrowQty = 0.0;

    /**
     *  차출수량
     */
    private double rentQty = 0.0;

    /**
     *  출고예정수량
     */
    private double grScheQty = 0.0;

    /**
     *  입고예정수량
     */
    private double giScheQty = 0.0;

    /**
     * 패키지 유효시작일자
     */
    private Date pkgStartDt;

    /**
     * 패키지 유효종료일자
     */
    private Date pkgEndDt;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private String pkgUpdtDtStr;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private String updtDtStr;

    /**
     *  부품원가
     */
    private double taxDdctGrtePrc;

    /**
     *  부품원가
     */
    private double markUp;

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
     * @return the pkgDocNo
     */
    public int getPkgDocNo() {
        return pkgDocNo;
    }

    /**
     * @param pkgDocNo the pkgDocNo to set
     */
    public void setPkgDocNo(int pkgDocNo) {
        this.pkgDocNo = pkgDocNo;
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
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
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
     * @return the itemSalePrc
     */
    public double getItemSalePrc() {
        return itemSalePrc;
    }

    /**
     * @param itemSalePrc the itemSalePrc to set
     */
    public void setItemSalePrc(double itemSalePrc) {
        this.itemSalePrc = itemSalePrc;
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
     * @return the movingAvgPrc
     */
    public double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }


    /**
     * @return the movingAvgTaxDdctPrc
     */
    public double getMovingAvgTaxDdctPrc() {
        return movingAvgTaxDdctPrc;
    }

    /**
     * @param movingAvgTaxDdctPrc the movingAvgTaxDdctPrc to set
     */
    public void setMovingAvgTaxDdctPrc(double movingAvgTaxDdctPrc) {
        this.movingAvgTaxDdctPrc = movingAvgTaxDdctPrc;
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
     * @return the spyrCd
     */
    public String getSpyrCd() {
        return spyrCd;
    }

    /**
     * @param spyrCd the spyrCd to set
     */
    public void setSpyrCd(String spyrCd) {
        this.spyrCd = spyrCd;
    }

    /**
     * @return the ltsModelCd
     */
    public String getLtsModelCd() {
        return ltsModelCd;
    }

    /**
     * @param ltsModelCd the ltsModelCd to set
     */
    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    /**
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }

    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
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
     * @return the pkgDetlTotAmt
     */
    public Double getPkgDetlTotAmt() {
        return pkgDetlTotAmt;
    }

    /**
     * @param pkgDetlTotAmt the pkgDetlTotAmt to set
     */
    public void setPkgDetlTotAmt(Double pkgDetlTotAmt) {
        this.pkgDetlTotAmt = pkgDetlTotAmt;
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
     * @return the pkgTotAmt
     */
    public Double getPkgTotAmt() {
        return pkgTotAmt;
    }

    /**
     * @param pkgTotAmt the pkgTotAmt to set
     */
    public void setPkgTotAmt(Double pkgTotAmt) {
        this.pkgTotAmt = pkgTotAmt;
    }

    /**
     * @return the pkgDcAmt
     */
    public Double getPkgDcAmt() {
        return pkgDcAmt;
    }

    /**
     * @param pkgDcAmt the pkgDcAmt to set
     */
    public void setPkgDcAmt(Double pkgDcAmt) {
        this.pkgDcAmt = pkgDcAmt;
    }

    /**
     * @return the pkgDcTotAmt
     */
    public Double getPkgDcTotAmt() {
        return pkgDcTotAmt;
    }

    /**
     * @param pkgDcTotAmt the pkgDcTotAmt to set
     */
    public void setPkgDcTotAmt(Double pkgDcTotAmt) {
        this.pkgDcTotAmt = pkgDcTotAmt;
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
     * @return the pkgDetlDcTotAmt
     */
    public Double getPkgDetlDcTotAmt() {
        return pkgDetlDcTotAmt;
    }

    /**
     * @param pkgDetlDcTotAmt the pkgDetlDcTotAmt to set
     */
    public void setPkgDetlDcTotAmt(Double pkgDetlDcTotAmt) {
        this.pkgDetlDcTotAmt = pkgDetlDcTotAmt;
    }

    /**
     * @return the retlPrc
     */
    public double getRetlPrc() {
        return retlPrc;
    }

    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(double retlPrc) {
        this.retlPrc = retlPrc;
    }

    /**
     * @return the whslPrc
     */
    public double getWhslPrc() {
        return whslPrc;
    }

    /**
     * @param whslPrc the whslPrc to set
     */
    public void setWhslPrc(double whslPrc) {
        this.whslPrc = whslPrc;
    }

    /**
     * @return the incPrc
     */
    public double getIncPrc() {
        return incPrc;
    }

    /**
     * @param incPrc the incPrc to set
     */
    public void setIncPrc(double incPrc) {
        this.incPrc = incPrc;
    }

    /**
     * @return the grtePrc
     */
    public double getGrtePrc() {
        return grtePrc;
    }

    /**
     * @param grtePrc the grtePrc to set
     */
    public void setGrtePrc(double grtePrc) {
        this.grtePrc = grtePrc;
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
     * @return the totStockQty
     */
    public double getTotStockQty() {
        return totStockQty;
    }

    /**
     * @param totStockQty the totStockQty to set
     */
    public void setTotStockQty(double totStockQty) {
        this.totStockQty = totStockQty;
    }

    /**
     * @return the strgeStockQty
     */
    public double getStrgeStockQty() {
        return strgeStockQty;
    }

    /**
     * @param strgeStockQty the strgeStockQty to set
     */
    public void setStrgeStockQty(double strgeStockQty) {
        this.strgeStockQty = strgeStockQty;
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

    /**
     * @return the resvStockQty
     */
    public double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(double resvStockQty) {
        this.resvStockQty = resvStockQty;
    }

    /**
     * @return the clamStockQty
     */
    public double getClamStockQty() {
        return clamStockQty;
    }

    /**
     * @param clamStockQty the clamStockQty to set
     */
    public void setClamStockQty(double clamStockQty) {
        this.clamStockQty = clamStockQty;
    }

    /**
     * @return the borrowQty
     */
    public double getBorrowQty() {
        return borrowQty;
    }

    /**
     * @param borrowQty the borrowQty to set
     */
    public void setBorrowQty(double borrowQty) {
        this.borrowQty = borrowQty;
    }

    /**
     * @return the rentQty
     */
    public double getRentQty() {
        return rentQty;
    }

    /**
     * @param rentQty the rentQty to set
     */
    public void setRentQty(double rentQty) {
        this.rentQty = rentQty;
    }

    /**
     * @return the grScheQty
     */
    public double getGrScheQty() {
        return grScheQty;
    }

    /**
     * @param grScheQty the grScheQty to set
     */
    public void setGrScheQty(double grScheQty) {
        this.grScheQty = grScheQty;
    }

    /**
     * @return the giScheQty
     */
    public double getGiScheQty() {
        return giScheQty;
    }

    /**
     * @param giScheQty the giScheQty to set
     */
    public void setGiScheQty(double giScheQty) {
        this.giScheQty = giScheQty;
    }

    /**
     * @return the pkgStartDt
     */
    public Date getPkgStartDt() {
        return pkgStartDt;
    }

    /**
     * @param pkgStartDt the pkgStartDt to set
     */
    public void setPkgStartDt(Date pkgStartDt) {
        this.pkgStartDt = pkgStartDt;
    }

    /**
     * @return the pkgEndDt
     */
    public Date getPkgEndDt() {
        return pkgEndDt;
    }

    /**
     * @param pkgEndDt the pkgEndDt to set
     */
    public void setPkgEndDt(Date pkgEndDt) {
        this.pkgEndDt = pkgEndDt;
    }

    /**
     * @return the pkgItemNm
     */
    public String getPkgItemNm() {
        return pkgItemNm;
    }

    /**
     * @param pkgItemNm the pkgItemNm to set
     */
    public void setPkgItemNm(String pkgItemNm) {
        this.pkgItemNm = pkgItemNm;
    }

    /**
     * @return the giLocCd
     */
    public String getGiLocCd() {
        return giLocCd;
    }

    /**
     * @param giLocCd the giLocCd to set
     */
    public void setGiLocCd(String giLocCd) {
        this.giLocCd = giLocCd;
    }

    /**
     * @return the giLocNm
     */
    public String getGiLocNm() {
        return giLocNm;
    }

    /**
     * @param giLocNm the giLocNm to set
     */
    public void setGiLocNm(String giLocNm) {
        this.giLocNm = giLocNm;
    }

    /**
     * @return the pkgUpdtDtStr
     */
    public String getPkgUpdtDtStr() {
        return pkgUpdtDtStr;
    }

    /**
     * @param pkgUpdtDtStr the pkgUpdtDtStr to set
     */
    public void setPkgUpdtDtStr(String pkgUpdtDtStr) {
        this.pkgUpdtDtStr = pkgUpdtDtStr;
    }

    /**
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }

    /**
     * @return the strgeNm
     */
    public String getStrgeNm() {
        return strgeNm;
    }

    /**
     * @param strgeNm the strgeNm to set
     */
    public void setStrgeNm(String strgeNm) {
        this.strgeNm = strgeNm;
    }

    /**
     * @return the taxDdctGrtePrc
     */
    public double getTaxDdctGrtePrc() {
        return taxDdctGrtePrc;
    }

    /**
     * @param taxDdctGrtePrc the taxDdctGrtePrc to set
     */
    public void setTaxDdctGrtePrc(double taxDdctGrtePrc) {
        this.taxDdctGrtePrc = taxDdctGrtePrc;
    }

    /**
     * @return the markUp
     */
    public double getMarkUp() {
        return markUp;
    }

    /**
     * @param markUp the markUp to set
     */
    public void setMarkUp(double markUp) {
        this.markUp = markUp;
    }

}
