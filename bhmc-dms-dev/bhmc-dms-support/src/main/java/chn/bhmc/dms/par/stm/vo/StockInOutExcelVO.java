package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 현재고 Excel VO
 *
 * @ClassName   : StockInOutExcelVO.java
 * @Description : StockInOutExcelVO Class
 * @author Ju Won Lee
 * @since 2016. 12. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 18.     In Bo Shim     최초 생성
 * </pre>
 */

public class StockInOutExcelVO{

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
     * 창고명
     */
    private String strgeNm;

    /**
     * 로케이션
     **/
    private String locCd;

    /**
     * 로케이션명
     **/
    private String locNm;

    /**
     * 로케이션 마이그
     **/
    private String locCdMig;

    /**
     * 부품번호
     */
    private String itemCd;

    /**
     * 부품명
     */
    private String itemNm;

    /**
     * 장면재고
     */
    private double stockQty;

    /**
     * 가용재고
     */
    private double avlbStockQty;

    /**
     * 예류재고
     */
    private double resvStockQty;

    /**
     * 차입수량
     */
    private double borrowQty;

    /**
     * 대여수량
     */
    private double rentQty;

    /**
     * 입고예정수량
     */
    private double grScheQty;

    /**
     * 출고예정수량
     */
    private double giScheQty;

    /**
     * 재고단위코드
     */
    private String stockUnitCd;

    /**
     * 품목구분코드
     */
    private String itemDstinCd;

    /**
     * 품목구분명
     */
    private String itemDstinNm;

    /**
     * ABC CLASS
     */
    private String abcInd;

    /***
     * 차종코드
     */
    private String carlineCd;

    /***
     * 차형코드
     */
    private String modelCd;

    /**
     * 재고통재여부
     **/
    private  String stockLockYn;

    /**
     * 공급상코드
     */
    private String spyrCd;

    /**
     * 공급상명
     */
    private String spyrNm;

    /**
     * 거래처코드
     */
    private String bpCd;

    /**
     * 거래처명
     */
    private String bpNm;

    /**
     * 거래처유형
     */
    private String bpTp;

    /**
     * 거래처유형명
     */
    private String bpTpNm;

    /**
     * 구매단가
     */
    private double purcPrc;

    /**
     * 이동평균가격
     */
    private double movingAvgPrc;

    /**
     * 이동평균가격(세금미포함)
     */
    private double movingAvgTaxDdctPrc;

    /**
     * 재고금액(이평가 * 단가)
     */
    private double stockAmt;

    /**
     * 재고금액(PT_0301T)
     */
    private double realStockAmt;

    /**
     * 재고금액(세금미포함)
     */
    private double stockTaxDdctAmt;

    /**
     * 재고금액(PT_0301T , 세금미포함)
     */
    private double realStockTaxDdctAmt;

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
     * 세금공제소매가격
     */
    private double taxDdctRetlPrc;

    /**
     * 세금공제도매가격
     */
    private double taxDdctWhslPrc;

    /**
     * 세금공제보험가격
     */
    private double taxDdctIncPrc;

    /**
     * 세금공제보증가격
     */
    private double taxDdctGrtePrc;

    /**
     * 도색여부
     */
    private String paintYn;

    /**
     * 도색여부명
     */
    private String paintYnNm;

    /**
     * 대기기간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date stayDt;

    /**
     * 대기일자
     */
    private int stayDay = 0;

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
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }

    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
    }

    /**
     * @return the locNm
     */
    public String getLocNm() {
        return locNm;
    }

    /**
     * @param locNm the locNm to set
     */
    public void setLocNm(String locNm) {
        this.locNm = locNm;
    }

    /**
     * @return the locCdMig
     */
    public String getLocCdMig() {
        return locCdMig;
    }

    /**
     * @param locCdMig the locCdMig to set
     */
    public void setLocCdMig(String locCdMig) {
        this.locCdMig = locCdMig;
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
     * @return the stockQty
     */
    public double getStockQty() {
        return stockQty;
    }

    /**
     * @param stockQty the stockQty to set
     */
    public void setStockQty(double stockQty) {
        this.stockQty = stockQty;
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
     * @return the itemDstinNm
     */
    public String getItemDstinNm() {
        return itemDstinNm;
    }

    /**
     * @param itemDstinNm the itemDstinNm to set
     */
    public void setItemDstinNm(String itemDstinNm) {
        this.itemDstinNm = itemDstinNm;
    }

    /**
     * @return the abcInd
     */
    public String getAbcInd() {
        return abcInd;
    }

    /**
     * @param abcInd the abcInd to set
     */
    public void setAbcInd(String abcInd) {
        this.abcInd = abcInd;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }

    /**
     * @return the stockLockYn
     */
    public String getStockLockYn() {
        return stockLockYn;
    }

    /**
     * @param stockLockYn the stockLockYn to set
     */
    public void setStockLockYn(String stockLockYn) {
        this.stockLockYn = stockLockYn;
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
     * @return the spyrNm
     */
    public String getSpyrNm() {
        return spyrNm;
    }

    /**
     * @param spyrNm the spyrNm to set
     */
    public void setSpyrNm(String spyrNm) {
        this.spyrNm = spyrNm;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
    }

    /**
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
    }

    /**
     * @return the bpTpNm
     */
    public String getBpTpNm() {
        return bpTpNm;
    }

    /**
     * @param bpTpNm the bpTpNm to set
     */
    public void setBpTpNm(String bpTpNm) {
        this.bpTpNm = bpTpNm;
    }

    /**
     * @return the purcPrc
     */
    public double getPurcPrc() {
        return purcPrc;
    }

    /**
     * @param purcPrc the purcPrc to set
     */
    public void setPurcPrc(double purcPrc) {
        this.purcPrc = purcPrc;
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
     * @return the taxDdctRetlPrc
     */
    public double getTaxDdctRetlPrc() {
        return taxDdctRetlPrc;
    }

    /**
     * @param taxDdctRetlPrc the taxDdctRetlPrc to set
     */
    public void setTaxDdctRetlPrc(double taxDdctRetlPrc) {
        this.taxDdctRetlPrc = taxDdctRetlPrc;
    }

    /**
     * @return the taxDdctWhslPrc
     */
    public double getTaxDdctWhslPrc() {
        return taxDdctWhslPrc;
    }

    /**
     * @param taxDdctWhslPrc the taxDdctWhslPrc to set
     */
    public void setTaxDdctWhslPrc(double taxDdctWhslPrc) {
        this.taxDdctWhslPrc = taxDdctWhslPrc;
    }

    /**
     * @return the taxDdctIncPrc
     */
    public double getTaxDdctIncPrc() {
        return taxDdctIncPrc;
    }

    /**
     * @param taxDdctIncPrc the taxDdctIncPrc to set
     */
    public void setTaxDdctIncPrc(double taxDdctIncPrc) {
        this.taxDdctIncPrc = taxDdctIncPrc;
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
     * @return the paintYn
     */
    public String getPaintYn() {
        return paintYn;
    }

    /**
     * @param paintYn the paintYn to set
     */
    public void setPaintYn(String paintYn) {
        this.paintYn = paintYn;
    }

    /**
     * @return the paintYnNm
     */
    public String getPaintYnNm() {
        return paintYnNm;
    }

    /**
     * @param paintYnNm the paintYnNm to set
     */
    public void setPaintYnNm(String paintYnNm) {
        this.paintYnNm = paintYnNm;
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
     * @return the stayDt
     */
    public Date getStayDt() {
        return stayDt;
    }

    /**
     * @param stayDt the stayDt to set
     */
    public void setStayDt(Date stayDt) {
        this.stayDt = stayDt;
    }

    /**
     * @return the stayDay
     */
    public int getStayDay() {
        return stayDay;
    }

    /**
     * @param stayDay the stayDay to set
     */
    public void setStayDay(int stayDay) {
        this.stayDay = stayDay;
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

    /**
     * @return the realStockAmt
     */
    public double getRealStockAmt() {
        return realStockAmt;
    }

    /**
     * @param realStockAmt the realStockAmt to set
     */
    public void setRealStockAmt(double realStockAmt) {
        this.realStockAmt = realStockAmt;
    }

    /**
     * @return the realStockTaxDdctAmtc
     */
    public double getRealStockTaxDdctAmt() {
        return realStockTaxDdctAmt;
    }

    /**
     * @param realStockTaxDdctAmtc the realStockTaxDdctAmtc to set
     */
    public void setRealStockTaxDdctAmt(double realStockTaxDdctAmt) {
        this.realStockTaxDdctAmt = realStockTaxDdctAmt;
    }


}
