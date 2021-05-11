package chn.bhmc.dms.sal.acc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemStockVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Kang Seok Han     최초 생성
 * </pre>
 */

public class AccessoryItemStockVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8103103460560991009L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 플랜트코드
     */
    private String pltCd;

    /**
     * 창고코드
     */
    private String strgeCd;

    private String grStrgeCd;

    /**
     * 용품코드
     */
    private String itemCd;

    /**
     * 용품명
     */
    private String itemNm;

    /**
     * 용품영문명
     */
    private String itemEnNm;

    /**
     * 용품유형
     */
    private String etcCd1;


    /**
     * 재고단위
     */
    private String stockUnitCd;

    /**
     * 브랜드
     */
    private String brandCd;

    /**
     * 공급상구분
     */
    private String spyrCd;

    /**
     * 거래처구분
     */
    private String bpTp;

    /**
     * 거래처코드
     */
    private String bpCd;

    /**
     * 거래처명
     */
    private String bpNm;

    /**
     * 생산공장
     */
    private String etc1;

    /**
     * 설치비
     */
    private String etc2;

    /**
     * 포인트상품
     */
    private String etcCd2;

    /**
     * 딜러포인트
     */
    private int etc4;


    /**
     * 가용재고
     */
    private double avlbStockQty;

    /**
     * 원가(이동평균가)
     */
    private double movingAvgPrc;

    /**
     * 재고금액
     */
    private double stockAmt;

    /**
     * 소매가격
     */
    private double retlPrc;

    /**
     * 도매가격
     */
    private double whslPrc;

    /**
     * 세금공제소매가격
     */
    private double taxDdctRetlPrc;

    /**
     * 세금공제도매가격
     */
    private double taxDdctWhslPrc;

    /**
     * 소매가세금비율
     */
    private double retlAddTaxRate;

    /**
     * 도매가가세금비율
     */
    private double whslAddTaxRate;

    /**
     * 최근구매가
     */
    private double purcPrc;

    /**
     * 최근입고일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastGrDt;

    /**
     * 최근입고가
     */
    private double lastGrAmt;

    /**
     * 최근출고일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastGiDt;

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
     * @return the itemEnNm
     */
    public String getItemEnNm() {
        return itemEnNm;
    }

    /**
     * @param itemEnNm the itemEnNm to set
     */
    public void setItemEnNm(String itemEnNm) {
        this.itemEnNm = itemEnNm;
    }

    /**
     * @return the etcCd1
     */
    public String getEtcCd1() {
        return etcCd1;
    }

    /**
     * @param etcCd1 the etcCd1 to set
     */
    public void setEtcCd1(String etcCd1) {
        this.etcCd1 = etcCd1;
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
     * @return the etc1
     */
    public String getEtc1() {
        return etc1;
    }

    /**
     * @param etc1 the etc1 to set
     */
    public void setEtc1(String etc1) {
        this.etc1 = etc1;
    }

    /**
     * @return the etc2
     */
    public String getEtc2() {
        return etc2;
    }

    /**
     * @param etc2 the etc2 to set
     */
    public void setEtc2(String etc2) {
        this.etc2 = etc2;
    }

    /**
     * @return the etcCd2
     */
    public String getEtcCd2() {
        return etcCd2;
    }

    /**
     * @param etcCd2 the etcCd2 to set
     */
    public void setEtcCd2(String etcCd2) {
        this.etcCd2 = etcCd2;
    }

    /**
     * @return the etc4
     */
    public int getEtc4() {
        return etc4;
    }

    /**
     * @param etc4 the etc4 to set
     */
    public void setEtc4(int etc4) {
        this.etc4 = etc4;
    }

  
    

    public double getAvlbStockQty() {
		return avlbStockQty;
	}

	public void setAvlbStockQty(double avlbStockQty) {
		this.avlbStockQty = avlbStockQty;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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
     * @return the retlAddTaxRate
     */
    public double getRetlAddTaxRate() {
        return retlAddTaxRate;
    }

    /**
     * @param retlAddTaxRate the retlAddTaxRate to set
     */
    public void setRetlAddTaxRate(double retlAddTaxRate) {
        this.retlAddTaxRate = retlAddTaxRate;
    }

    /**
     * @return the whslAddTaxRate
     */
    public double getWhslAddTaxRate() {
        return whslAddTaxRate;
    }

    /**
     * @param whslAddTaxRate the whslAddTaxRate to set
     */
    public void setWhslAddTaxRate(double whslAddTaxRate) {
        this.whslAddTaxRate = whslAddTaxRate;
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
     * @return the lastGrDt
     */
    public Date getLastGrDt() {
        return lastGrDt;
    }

    /**
     * @param lastGrDt the lastGrDt to set
     */
    public void setLastGrDt(Date lastGrDt) {
        this.lastGrDt = lastGrDt;
    }

    /**
     * @return the lastGrAmt
     */
    public double getLastGrAmt() {
        return lastGrAmt;
    }

    /**
     * @param lastGrAmt the lastGrAmt to set
     */
    public void setLastGrAmt(double lastGrAmt) {
        this.lastGrAmt = lastGrAmt;
    }

    /**
     * @return the lastGiDt
     */
    public Date getLastGiDt() {
        return lastGiDt;
    }

    /**
     * @param lastGiDt the lastGiDt to set
     */
    public void setLastGiDt(Date lastGiDt) {
        this.lastGiDt = lastGiDt;
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


}
