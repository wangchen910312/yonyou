package chn.bhmc.dms.sal.bto.vo;

import java.io.Serializable;

public class BuyPredictedQuantityMngmntVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

    private String makeDt;
    private Integer month3Qty;
    private Integer month2Qty;
    private Integer month1Qty;
    private Integer avrgQty;
    private Integer stockQty;
    private Integer transQty;
    private Integer ordInitQty;
    private Integer notyetOrdInitQty;
    private Integer sumQty;
    private Integer forcSalQty;
    private Integer soldSalQty;
    private Integer contSalQty;
    private Integer forcAftSalQty;
    private Integer monthGapSalQty;
    private Integer cntlSalQty;
    private Integer aftSalQty;
    private String updtUsrId;
    private String dlrCd;

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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the makeDt
     */
    public String getMakeDt() {
        return makeDt;
    }
    /**
     * @return the month3Qty
     */
    public Integer getMonth3Qty() {
        return month3Qty;
    }
    /**
     * @return the month2Qty
     */
    public Integer getMonth2Qty() {
        return month2Qty;
    }
    /**
     * @return the month1Qty
     */
    public Integer getMonth1Qty() {
        return month1Qty;
    }
    /**
     * @return the avrgQty
     */
    public Integer getAvrgQty() {
        return avrgQty;
    }
    /**
     * @return the stockQty
     */
    public Integer getStockQty() {
        return stockQty;
    }
    /**
     * @return the transQty
     */
    public Integer getTransQty() {
        return transQty;
    }
    /**
     * @return the ordInitQty
     */
    public Integer getOrdInitQty() {
        return ordInitQty;
    }
    /**
     * @return the notyetOrdInitQty
     */
    public Integer getNotyetOrdInitQty() {
        return notyetOrdInitQty;
    }
    /**
     * @return the sumQty
     */
    public Integer getSumQty() {
        return sumQty;
    }
    /**
     * @return the forcSalQty
     */
    public Integer getForcSalQty() {
        return forcSalQty;
    }
    /**
     * @return the soldSalQty
     */
    public Integer getSoldSalQty() {
        return soldSalQty;
    }
    /**
     * @return the contSalQty
     */
    public Integer getContSalQty() {
        return contSalQty;
    }
    /**
     * @return the forcAftSalQty
     */
    public Integer getForcAftSalQty() {
        return forcAftSalQty;
    }
    /**
     * @return the monthGapSalQty
     */
    public Integer getMonthGapSalQty() {
        return monthGapSalQty;
    }
    /**
     * @return the cntlSalQty
     */
    public Integer getCntlSalQty() {
        return cntlSalQty;
    }
    /**
     * @return the aftSalQty
     */
    public Integer getAftSalQty() {
        return aftSalQty;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param makeDt the makeDt to set
     */
    public void setMakeDt(String makeDt) {
        this.makeDt = makeDt;
    }
    /**
     * @param month3Qty the month3Qty to set
     */
    public void setMonth3Qty(Integer month3Qty) {
        this.month3Qty = month3Qty;
    }
    /**
     * @param month2Qty the month2Qty to set
     */
    public void setMonth2Qty(Integer month2Qty) {
        this.month2Qty = month2Qty;
    }
    /**
     * @param month1Qty the month1Qty to set
     */
    public void setMonth1Qty(Integer month1Qty) {
        this.month1Qty = month1Qty;
    }
    /**
     * @param avrgQty the avrgQty to set
     */
    public void setAvrgQty(Integer avrgQty) {
        this.avrgQty = avrgQty;
    }
    /**
     * @param stockQty the stockQty to set
     */
    public void setStockQty(Integer stockQty) {
        this.stockQty = stockQty;
    }
    /**
     * @param transQty the transQty to set
     */
    public void setTransQty(Integer transQty) {
        this.transQty = transQty;
    }
    /**
     * @param ordInitQty the ordInitQty to set
     */
    public void setOrdInitQty(Integer ordInitQty) {
        this.ordInitQty = ordInitQty;
    }
    /**
     * @param notyetOrdInitQty the notyetOrdInitQty to set
     */
    public void setNotyetOrdInitQty(Integer notyetOrdInitQty) {
        this.notyetOrdInitQty = notyetOrdInitQty;
    }
    /**
     * @param sumQty the sumQty to set
     */
    public void setSumQty(Integer sumQty) {
        this.sumQty = sumQty;
    }
    /**
     * @param forcSalQty the forcSalQty to set
     */
    public void setForcSalQty(Integer forcSalQty) {
        this.forcSalQty = forcSalQty;
    }
    /**
     * @param soldSalQty the soldSalQty to set
     */
    public void setSoldSalQty(Integer soldSalQty) {
        this.soldSalQty = soldSalQty;
    }
    /**
     * @param contSalQty the contSalQty to set
     */
    public void setContSalQty(Integer contSalQty) {
        this.contSalQty = contSalQty;
    }
    /**
     * @param forcAftSalQty the forcAftSalQty to set
     */
    public void setForcAftSalQty(Integer forcAftSalQty) {
        this.forcAftSalQty = forcAftSalQty;
    }
    /**
     * @param monthGapSalQty the monthGapSalQty to set
     */
    public void setMonthGapSalQty(Integer monthGapSalQty) {
        this.monthGapSalQty = monthGapSalQty;
    }
    /**
     * @param cntlSalQty the cntlSalQty to set
     */
    public void setCntlSalQty(Integer cntlSalQty) {
        this.cntlSalQty = cntlSalQty;
    }
    /**
     * @param aftSalQty the aftSalQty to set
     */
    public void setAftSalQty(Integer aftSalQty) {
        this.aftSalQty = aftSalQty;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

}