package chn.bhmc.dms.par.dlm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * 수불유형 VO
 *
 * @ClassName   : EndingStockVO.java
 * @Description : EndingStockVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee     최초 생성
 * </pre>
 */

public class EndingStockVO {

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 집계년월
     */
    @NotEmpty
    private String yyyymm;

    /**
     * 센터코드
     */
    @NotEmpty
    private String pltCd;

    /**
     * 창고코드
     */
    @NotEmpty
    private String strgeCd;

    /**
     * 부품번호
     */
    @NotEmpty
    private String itemCd;

    /**
     * 총재고
     */
    @NotEmpty
    private double stockQty;

    /**
     * 가용재고
     */
    @NotEmpty
    private double avlbQty;

    /**
     * 예약재고
     */
    @NotEmpty
    private double resvQtu;

    /**
     * 보류재고
     */
    @NotEmpty
    private double clamQty;

    /**
     * 표준단가
     */
    @NotEmpty
    private double stdPrc;

    /**
     * 표준금액
     */
    @NotEmpty
    private double stdAmt;

    /**
     * 생성자ID
     */
    @NotEmpty
    private String regUsrId;

    /**
     * 생성일시
     */
    @NotEmpty
    private Date regDt;

    /**
     * 수정자ID
     */
    @NotEmpty
    private String updtUsrId;

    /**
     * 수정일시
     */
    @NotEmpty
    private Date updtDt;


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
     * @return the yyyymm
     */
    public String getYyyymm() {
        return yyyymm;
    }

    /**
     * @param yyyymm the yyyymm to set
     */
    public void setYyyymm(String yyyymm) {
        this.yyyymm = yyyymm;
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
     * @return the avlbQty
     */
    public double getAvlbQty() {
        return avlbQty;
    }

    /**
     * @param avlbQty the avlbQty to set
     */
    public void setAvlbQty(double avlbQty) {
        this.avlbQty = avlbQty;
    }

    /**
     * @return the resvQtu
     */
    public double getResvQtu() {
        return resvQtu;
    }

    /**
     * @param resvQtu the resvQtu to set
     */
    public void setResvQtu(double resvQtu) {
        this.resvQtu = resvQtu;
    }

    /**
     * @return the clamQty
     */
    public double getClamQty() {
        return clamQty;
    }

    /**
     * @param clamQty the clamQty to set
     */
    public void setClamQty(double clamQty) {
        this.clamQty = clamQty;
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
     * @return the stdAmt
     */
    public double getStdAmt() {
        return stdAmt;
    }

    /**
     * @param stdAmt the stdAmt to set
     */
    public void setStdAmt(double stdAmt) {
        this.stdAmt = stdAmt;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

}
