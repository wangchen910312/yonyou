package chn.bhmc.dms.sal.bto.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

public class BuyPredictedQuantityMngmntDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7243850391611269809L;

    private   String   dlrCd;
    private   String   carlineCd;
    private   String   carlineNm;
    private   String   modelCd;
    private   String   modelNm;
    private   String   ocnCd;
    private   String   ocnNm;
    private   String   extColorCd;
    private   String   extColorNm;
    private   String   intColorCd;
    private   String   intColorNm;
    private   int      monthCont;              // 당월 판매수량
    private   int      monthContB1;            // 전월 판매수량
    private   int      monthContB2;            // 2달전 판매수량
    private   int      monthContB3;            // 3달전 판매수량
    private   int      averageCont;            // 전3개월 평균 판매수량
    private   int      noAssign;               // 미배정 주문수량
    private   int      assign;                 // 주문수량
    private   int      stockCnt;               // 재고수량
    private   int      posiStockCnt;           // 판매가능재고수량
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
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
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
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the monthCont
     */
    public int getMonthCont() {
        return monthCont;
    }
    /**
     * @param monthCont the monthCont to set
     */
    public void setMonthCont(int monthCont) {
        this.monthCont = monthCont;
    }
    /**
     * @return the monthContB1
     */
    public int getMonthContB1() {
        return monthContB1;
    }
    /**
     * @param monthContB1 the monthContB1 to set
     */
    public void setMonthContB1(int monthContB1) {
        this.monthContB1 = monthContB1;
    }
    /**
     * @return the monthContB2
     */
    public int getMonthContB2() {
        return monthContB2;
    }
    /**
     * @param monthContB2 the monthContB2 to set
     */
    public void setMonthContB2(int monthContB2) {
        this.monthContB2 = monthContB2;
    }
    /**
     * @return the monthContB3
     */
    public int getMonthContB3() {
        return monthContB3;
    }
    /**
     * @param monthContB3 the monthContB3 to set
     */
    public void setMonthContB3(int monthContB3) {
        this.monthContB3 = monthContB3;
    }
    /**
     * @return the averageCont
     */
    public int getAverageCont() {
        return averageCont;
    }
    /**
     * @param averageCont the averageCont to set
     */
    public void setAverageCont(int averageCont) {
        this.averageCont = averageCont;
    }
    /**
     * @return the noAssign
     */
    public int getNoAssign() {
        return noAssign;
    }
    /**
     * @param noAssign the noAssign to set
     */
    public void setNoAssign(int noAssign) {
        this.noAssign = noAssign;
    }
    /**
     * @return the assign
     */
    public int getAssign() {
        return assign;
    }
    /**
     * @param assign the assign to set
     */
    public void setAssign(int assign) {
        this.assign = assign;
    }
    /**
     * @return the stockCnt
     */
    public int getStockCnt() {
        return stockCnt;
    }
    /**
     * @param stockCnt the stockCnt to set
     */
    public void setStockCnt(int stockCnt) {
        this.stockCnt = stockCnt;
    }
    /**
     * @return the posiStockCnt
     */
    public int getPosiStockCnt() {
        return posiStockCnt;
    }
    /**
     * @param posiStockCnt the posiStockCnt to set
     */
    public void setPosiStockCnt(int posiStockCnt) {
        this.posiStockCnt = posiStockCnt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}