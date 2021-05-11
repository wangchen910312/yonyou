package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
/**
 * 재고실사 VO
 *
 * @ClassName   : ItemMovingAvgPrcVO.java
 * @Description : ItemMovingAvgPrcVO Class
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

public class ItemMovingAvgPrcVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 218491767419593775L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 부품번호
     **/
    private String itemCd;

    /**
     * 창고코드
     **/
    private String strgeCd;

    /**
     * 발생일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date genDt;

    /**
     * SEQ(히스토리용)
     **/
    private int seq;

    /**
     * 총수량
     **/
    private Double totQty;

    /**
     * 이동평균가격
     **/
    private Double movingAvgPrc;

    /**
     * 이동평균가격(세금미포함)
     **/
    private Double movingAvgTaxDdctPrc;

    /**
     * 이동평균가격(세금제외)
     **/
    private Double taxDdctPrc;



    /**
     * 이전 발생일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date befGenDt;

    /**
     * 이전 총수량
     **/
    private Double befTotQty;

    /**
     * 이전 이동평균가격
     **/
    private Double befMovingAvgPrc;


    /**
     * 이전 이동평균가격(세금 미포함)
     **/
    private Double befMovingAvgTaxDdctPrc;

    /**
     * BMP 구매원가.
     **/
    private Double bmpPurcPrc = 0.0;

    /**
     * BMP 구매가.(세금포함)
     **/
    private Double salePrcAmt = 0.0;

    /**
     * BWMS 보증가.
     **/
    private Double grtePrc = 0.0;

    /**
     * 세율.
     **/
    private Double taxRate;

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
     * @return the genDt
     */
    public Date getGenDt() {
        return genDt;
    }

    /**
     * @param genDt the genDt to set
     */
    public void setGenDt(Date genDt) {
        this.genDt = genDt;
    }

    /**
     * @return the totQty
     */
    public Double getTotQty() {
        return totQty;
    }

    /**
     * @param totQty the totQty to set
     */
    public void setTotQty(Double totQty) {
        this.totQty = totQty;
    }

    /**
     * @return the movingAvgPrc
     */
    public Double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(Double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the befGenDt
     */
    public Date getBefGenDt() {
        return befGenDt;
    }

    /**
     * @param befGenDt the befGenDt to set
     */
    public void setBefGenDt(Date befGenDt) {
        this.befGenDt = befGenDt;
    }

    /**
     * @return the befTotQty
     */
    public Double getBefTotQty() {
        return befTotQty;
    }

    /**
     * @param befTotQty the befTotQty to set
     */
    public void setBefTotQty(Double befTotQty) {
        this.befTotQty = befTotQty;
    }

    /**
     * @return the befMovingAvgPrc
     */
    public Double getBefMovingAvgPrc() {
        return befMovingAvgPrc;
    }

    /**
     * @param befMovingAvgPrc the befMovingAvgPrc to set
     */
    public void setBefMovingAvgPrc(Double befMovingAvgPrc) {
        this.befMovingAvgPrc = befMovingAvgPrc;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the bmpPurcPrc
     */
    public Double getBmpPurcPrc() {
        return bmpPurcPrc;
    }

    /**
     * @param bmpPurcPrc the bmpPurcPrc to set
     */
    public void setBmpPurcPrc(Double bmpPurcPrc) {
        this.bmpPurcPrc = bmpPurcPrc;
    }

    /**
     * @return the salePrcAmt
     */
    public Double getSalePrcAmt() {
        return salePrcAmt;
    }

    /**
     * @param salePrcAmt the salePrcAmt to set
     */
    public void setSalePrcAmt(Double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
    }

    /**
     * @return the grtePrc
     */
    public Double getGrtePrc() {
        return grtePrc;
    }

    /**
     * @param grtePrc the grtePrc to set
     */
    public void setGrtePrc(Double grtePrc) {
        this.grtePrc = grtePrc;
    }

    /**
     * @return the taxDdctPrc
     */
    public Double getTaxDdctPrc() {
        return taxDdctPrc;
    }

    /**
     * @param taxDdctPrc the taxDdctPrc to set
     */
    public void setTaxDdctPrc(Double taxDdctPrc) {
        this.taxDdctPrc = taxDdctPrc;
    }

    /**
     * @return the movingAvgTaxDdctPrc
     */
    public Double getMovingAvgTaxDdctPrc() {
        return movingAvgTaxDdctPrc;
    }

    /**
     * @param movingAvgTaxDdctPrc the movingAvgTaxDdctPrc to set
     */
    public void setMovingAvgTaxDdctPrc(Double movingAvgTaxDdctPrc) {
        this.movingAvgTaxDdctPrc = movingAvgTaxDdctPrc;
    }

    /**
     * @return the befMovingAvgTaxDdctPrc
     */
    public Double getBefMovingAvgTaxDdctPrc() {
        return befMovingAvgTaxDdctPrc;
    }

    /**
     * @param befMovingAvgTaxDdctPrc the befMovingAvgTaxDdctPrc to set
     */
    public void setBefMovingAvgTaxDdctPrc(Double befMovingAvgTaxDdctPrc) {
        this.befMovingAvgTaxDdctPrc = befMovingAvgTaxDdctPrc;
    }

    /**
     * @return the taxRate
     */
    public Double getTaxRate() {
        return taxRate;
    }

    /**
     * @param taxRate the taxRate to set
     */
    public void setTaxRate(Double taxRate) {
        this.taxRate = taxRate;
    }

}
