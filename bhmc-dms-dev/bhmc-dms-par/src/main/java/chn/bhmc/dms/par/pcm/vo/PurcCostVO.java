package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 구매소요량 계산 VO
 *
 * @ClassName   : PurcCostVO.java
 * @Description : PurcCostVO Class
 * @author In Bo Shim
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="itemNm", mesgKey="par.lbl.itemNm")
    ,@ValidField(field="itemCdSgst", mesgKey="par.lbl.itemCdSgst")
    ,@ValidField(field="endYn", mesgKey="par.lbl.endYn")
    ,@ValidField(field="stockUnitCd", mesgKey="par.lbl.stockUnitCd")
    ,@ValidField(field="purcCqtyCalcYn", mesgKey="par.lbl.purcCqtyCalcYn")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="bpNm", mesgKey="par.lbl.bpNm")
    ,@ValidField(field="unitCd", mesgKey="par.lbl.unitCd")
    ,@ValidField(field="stdDt", mesgKey="par.lbl.stdDt")
    ,@ValidField(field="purcSgstQty", mesgKey="par.lbl.purcSgstQty")
    ,@ValidField(field="sftyStockQty", mesgKey="par.lbl.sftyStockQty")
    ,@ValidField(field="psntStockQty", mesgKey="par.lbl.psntStockQty")
    ,@ValidField(field="grScheQty", mesgKey="par.lbl.grScheQty")
    ,@ValidField(field="giScheQty", mesgKey="par.lbl.giScheQty")
    ,@ValidField(field="minPurcQty", mesgKey="par.lbl.minPurcQty")
    ,@ValidField(field="trsfQty", mesgKey="par.lbl.trsfQty")
    ,@ValidField(field="purcOrdRegYn", mesgKey="par.lbl.purcOrdRegYn")
    ,@ValidField(field="targYn", mesgKey="par.lbl.targYn")
   })
public class PurcCostVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4929450154094873019L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 품목코드
     */
    @NotEmpty
    private String itemCd;

    /**
     * 구매제시 품목코드
     */
    @NotEmpty
    private String itemCdSgst;

    /**
     * 품목명
     */
    @NotEmpty
    private String itemNm;

    /**
     * 종료여부
     */
    @NotEmpty
    private String endYn;

    /**
     * 재고단위코드
     */
    @NotEmpty
    private String stockUnitCd;

    /**
     * 구매소요량계산여부
     */
    @NotEmpty
    private String purcCqtyCalcYn;

    /**
     * 공급처코드
     */
    @NotEmpty
    private String bpCd;

    /**
     * 공급처명
     */
    @NotEmpty
    private String bpNm;

    /**
     * 재고단위코드
     */
    @NotEmpty
    private String unitCd;

    /**
     * 기준일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date stdDt;

    /**
     * 구매제시수량
     */
    @NotEmpty
    private double purcSgstQty;

    /**
     * 안전재고수량
     */
    @NotEmpty
    private double sftyStockQty;

    /**
     * 현재고수량
     */
    @NotEmpty
    private double psntStockQty;

    /**
     * 입고예정수량
    */
    @NotEmpty
    private double grScheQty;

    /**
     * 출고예정수량
     */
    @NotEmpty
    private double giScheQty;

    /**
     * 최소구매수량
     */
    @NotEmpty
    private double minPurcQty;

    /**
     * 운송수량
     */
    @NotEmpty
    private double trsfQty;

    /**
     * 구매오더등록여부
     */
    @NotEmpty
    private String purcOrdRegYn;

    /**
     * 대상여부
     */
    @NotEmpty
    private String targYn;

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
     * @return the itemCdSgst
     */
    public String getItemCdSgst() {
        return itemCdSgst;
    }

    /**
     * @param itemCdSgst the itemCdSgst to set
     */
    public void setItemCdSgst(String itemCdSgst) {
        this.itemCdSgst = itemCdSgst;
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
     * @return the endYn
     */
    public String getEndYn() {
        return endYn;
    }

    /**
     * @param endYn the endYn to set
     */
    public void setEndYn(String endYn) {
        this.endYn = endYn;
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
     * @return the purcCqtyCalcYn
     */
    public String getPurcCqtyCalcYn() {
        return purcCqtyCalcYn;
    }

    /**
     * @param purcCqtyCalcYn the purcCqtyCalcYn to set
     */
    public void setPurcCqtyCalcYn(String purcCqtyCalcYn) {
        this.purcCqtyCalcYn = purcCqtyCalcYn;
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
     * @return the unitCd
     */
    public String getUnitCd() {
        return unitCd;
    }

    /**
     * @param unitCd the unitCd to set
     */
    public void setUnitCd(String unitCd) {
        this.unitCd = unitCd;
    }

    /**
     * @return the stdDt
     */
    public Date getStdDt() {
        return stdDt;
    }

    /**
     * @param stdDt the stdDt to set
     */
    public void setStdDt(Date stdDt) {
        this.stdDt = stdDt;
    }

    /**
     * @return the purcSgstQty
     */
    public double getPurcSgstQty() {
        return purcSgstQty;
    }

    /**
     * @param purcSgstQty the purcSgstQty to set
     */
    public void setPurcSgstQty(double purcSgstQty) {
        this.purcSgstQty = purcSgstQty;
    }

    /**
     * @return the sftyStockQty
     */
    public double getSftyStockQty() {
        return sftyStockQty;
    }

    /**
     * @param sftyStockQty the sftyStockQty to set
     */
    public void setSftyStockQty(double sftyStockQty) {
        this.sftyStockQty = sftyStockQty;
    }

    /**
     * @return the psntStockQty
     */
    public double getPsntStockQty() {
        return psntStockQty;
    }

    /**
     * @param psntStockQty the psntStockQty to set
     */
    public void setPsntStockQty(double psntStockQty) {
        this.psntStockQty = psntStockQty;
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
     * @return the minPurcQty
     */
    public double getMinPurcQty() {
        return minPurcQty;
    }

    /**
     * @param minPurcQty the minPurcQty to set
     */
    public void setMinPurcQty(double minPurcQty) {
        this.minPurcQty = minPurcQty;
    }

    /**
     * @return the trsfQty
     */
    public double getTrsfQty() {
        return trsfQty;
    }

    /**
     * @param trsfQty the trsfQty to set
     */
    public void setTrsfQty(double trsfQty) {
        this.trsfQty = trsfQty;
    }

    /**
     * @return the purcOrdRegYn
     */
    public String getPurcOrdRegYn() {
        return purcOrdRegYn;
    }

    /**
     * @param purcOrdRegYn the purcOrdRegYn to set
     */
    public void setPurcOrdRegYn(String purcOrdRegYn) {
        this.purcOrdRegYn = purcOrdRegYn;
    }

    /**
     * @return the targYn
     */
    public String getTargYn() {
        return targYn;
    }

    /**
     * @param targYn the targYn to set
     */
    public void setTargYn(String targYn) {
        this.targYn = targYn;
    }
}
