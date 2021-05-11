package chn.bhmc.dms.mob.api.part.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsVenderSalPriceTargetExcelVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.     In Bo Shim     최초 생성
 * </pre>
 */

public class PartsVenderSalPriceTargetExcelDownVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5601958877748598191L;

    /**
     * 부품번호
     */
    private String itemCd;

    /**
     * 부품명
     */
    private String itemNm;

    /**
     * 재고창고코드
     */
    private String strgeCd;

    /**
     * 부품창고코드
     */
    private String grStrgeCd;

    /**
     * 위치코드
     */
    private String locCd;

    /**
     * 차종
     **/
    private String carlineCd;

    /**
     * ABC CLASS
     **/
    private String abcInd;

    /**
     * 품목구분코드
     **/
    private String itemDstinCd;

    /**
     * 거래처명
     */
    private String bpNm;

    /**
     * 기준가(BMP)
     */
    private double bmpOpnPrc;

    /**
     * 재고원가
     */
    private double stockGiPrc;

    /**
     * 구매단가금액
     */
    private double purcPrc;

    /**
     * 최근입고가격
     */
    private double rectGiPrc;

    /**
     * 이동평균가
     */
    private double movingAvgPrc;

    /**
     * 기준가격
     */
    private double stdPrc;

    /**
     * 기준가격코드
     */
    private String stdPrcCd;

    /**
     * 소매가격
     */
    private double retlPrc;

    /**
     * 소매추가세금율
     */
    private double retlAddTaxRate;

    /**
     * 도매가격
     */
    private double whslPrc;

    /**
     * 도매추가세금율
     */
    private double whslAddTaxRate;

    /**
     * 보험가격
     */
    private double incPrc;

    /**
     * 보험추가세금율
     */
    private double incAddTaxRate;

    /**
     * 보증가격
     */
    private double grtePrc;

    /**
     * 보증추가세금율
     */
    private double grteAddTaxRate;

    /**
     * 수정자
     */
    private String updtUsrNm;

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
     * @return the bmpOpnPrc
     */
    public double getBmpOpnPrc() {
        return bmpOpnPrc;
    }

    /**
     * @param bmpOpnPrc the bmpOpnPrc to set
     */
    public void setBmpOpnPrc(double bmpOpnPrc) {
        this.bmpOpnPrc = bmpOpnPrc;
    }

    /**
     * @return the stockGiPrc
     */
    public double getStockGiPrc() {
        return stockGiPrc;
    }

    /**
     * @param stockGiPrc the stockGiPrc to set
     */
    public void setStockGiPrc(double stockGiPrc) {
        this.stockGiPrc = stockGiPrc;
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
     * @return the rectGiPrc
     */
    public double getRectGiPrc() {
        return rectGiPrc;
    }

    /**
     * @param rectGiPrc the rectGiPrc to set
     */
    public void setRectGiPrc(double rectGiPrc) {
        this.rectGiPrc = rectGiPrc;
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
     * @return the stdPrc
     */
    public double getStdPrc() {
        return stdPrc;
    }

    /**
     * @param stdPrc the stdPrc to set
     */
    public void setStdPrc(double stdPrc) {
        this.stdPrc = stdPrc;
    }

    /**
     * @return the stdPrcCd
     */
    public String getStdPrcCd() {
        return stdPrcCd;
    }

    /**
     * @param stdPrcCd the stdPrcCd to set
     */
    public void setStdPrcCd(String stdPrcCd) {
        this.stdPrcCd = stdPrcCd;
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
     * @return the incAddTaxRate
     */
    public double getIncAddTaxRate() {
        return incAddTaxRate;
    }

    /**
     * @param incAddTaxRate the incAddTaxRate to set
     */
    public void setIncAddTaxRate(double incAddTaxRate) {
        this.incAddTaxRate = incAddTaxRate;
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
     * @return the grteAddTaxRate
     */
    public double getGrteAddTaxRate() {
        return grteAddTaxRate;
    }

    /**
     * @param grteAddTaxRate the grteAddTaxRate to set
     */
    public void setGrteAddTaxRate(double grteAddTaxRate) {
        this.grteAddTaxRate = grteAddTaxRate;
    }

    /**
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }

    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }
}
