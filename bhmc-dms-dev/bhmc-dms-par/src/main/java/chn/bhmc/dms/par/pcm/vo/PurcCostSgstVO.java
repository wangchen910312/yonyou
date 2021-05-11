package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 구매제시 VO
 *
 * @ClassName   : PurcCostSgstVO.java
 * @Description : PurcCostSgstVO Class
 * @author In Bo Shim
 * @since 2016. 2. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 4.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="itemNm", mesgKey="par.lbl.itemNm")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="bpNm", mesgKey="par.lbl.bpNm")
    ,@ValidField(field="stdDt", mesgKey="par.lbl.stdDt")
    ,@ValidField(field="purcSgstQty", mesgKey="par.lbl.purcSgstQty")
    ,@ValidField(field="unitCd", mesgKey="par.lbl.unitCd")
    ,@ValidField(field="sftyStockQty", mesgKey="par.lbl.sftyStockQty")
    ,@ValidField(field="psntStockQty", mesgKey="par.lbl.psntStockQty")
    ,@ValidField(field="grScheQty", mesgKey="par.lbl.grScheQty")
    ,@ValidField(field="giScheQty", mesgKey="par.lbl.giScheQty")
    ,@ValidField(field="minPurcQty", mesgKey="par.lbl.minPurcQty")
    ,@ValidField(field="trsfQty", mesgKey="par.lbl.trsfQty")
    ,@ValidField(field="purcOrdRegYn", mesgKey="par.lbl.purcOrdRegYn")
    ,@ValidField(field="targYn", mesgKey="par.lbl.targYn")
})
public class PurcCostSgstVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1676762880956804405L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd = "";

    /**
     * 센터코드
     **/
    @NotEmpty
    private String pltCd = "";

    /**
     * 부품코드
     **/
    @NotEmpty
    private String itemCd = "";

    /**
     * 부품명
     **/
    @NotEmpty
    private String itemNm = "";

    /**
     * 공급처코드
     **/
    @NotEmpty
    private String bpCd = "";

    /**
     * 공급처명
     **/
    @NotEmpty
    private String bpNm = "";

    /**
     * 공급처유형
     **/
    private String bpTp = "";

    /**
     * 기준일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date stdDt;

    /**
     * 구매제시수량
     **/
    @NotNull
    private double purcSgstQty = 0.0;

    /**
     * 단위코드
     **/
    @NotEmpty
    private String unitCd = "";

    /**
     * 안전재고수량
     **/
    @NotNull
    private double sftyStockQty = 0.0;

    /**
     * 재산출 안전재고수량
     **/
    private double orgSftyStockQty = 0.0;

    /**
     * 현재고수량
     **/
    @NotNull
    private  double psntStockQty = 0.0;

    /**
     * 입고예정수량
     **/
    @NotNull
    private double grScheQty = 0.0;

    /**
     * 출고예정수량
     **/
    @NotNull
    private double giScheQty = 0.0;

    /**
     * 최소구매수량
     **/
    @NotNull
    private double minPurcQty = 0.0;

    /**
     * 운송수량
     **/
    @NotNull
    private double trsfQty = 0.0;

    /**
     * 구매단가
     **/
    private double purcPrc;

    /**
     * 구매리드타임
     **/
    private int purcLeadHm;

    /**
     * ABC CLASS
     **/
    private String abcInd;

    /**
     * ITEM_DSTIN_CD
     **/
    private String itemDstinCd;

    /**
     * 차종
     **/
    private String carlineCd;

    /**
     * 입고창고
     **/
    private String grStrgeCd;

    /**
     * 로케이션
     **/
    private String locCd;

    /**
     * 구매오더등록여부
     **/
    @NotEmpty
    private String purcOrdRegYn = "";

    /**
     * 대상여부
     **/
    @NotEmpty
    private String targYn = "";

    /**
     * 가용재고
     **/
    private double avlbStockQty = 0.0;

    /**
     * 예약수량
     **/
    private double resvStockQty = 0.0;

    /**
     * 보류수량
     **/
    private double clamStockQty = 0.0;

    /**
     * 차입수량
     **/
    private double borrowQty = 0.0;

    /**
     * 대여수량
     **/
    private double rentQty = 0.0;

    /**
     * 재고수량
     **/
    private double stockQty = 0.0;

    /**
     * 3개월평균수요
     **/
    private double mm3AvgDmndQty = 0.0;

    /**
     * 6개월평균수요
     **/
    private double mm6AvgDmndQty = 0.0;

    /**
     * 12평균수요
     **/
    private double mm12AvgDmndQty = 0.0;

    /**
     * 평균편차반영율
     **/
    private double stdrdStockApplyRate = 0.0;

    /**
     * 총수요량
     **/
    private double totDmndQty = 0.0;

    /**
     * 가중치부여총수요량
     **/
    private double wgtAddTotDmndQty = 0.0;

    /**
     * 평균편차량
     **/
    private double avgDvsQty = 0.0;

    /**
     * 평균편차반영율
     **/
    private double avgDvsRflRate = 0.0;

    /**
     * 부품특성코드
     **/
    private String parSpecCd;

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
     * @return the orgSftyStockQty
     */
    public double getOrgSftyStockQty() {
        return orgSftyStockQty;
    }

    /**
     * @param orgSftyStockQty the orgSftyStockQty to set
     */
    public void setOrgSftyStockQty(double orgSftyStockQty) {
        this.orgSftyStockQty = orgSftyStockQty;
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
     * @return the purcLeadHm
     */
    public int getPurcLeadHm() {
        return purcLeadHm;
    }

    /**
     * @param purcLeadHm the purcLeadHm to set
     */
    public void setPurcLeadHm(int purcLeadHm) {
        this.purcLeadHm = purcLeadHm;
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
     * @return the mm3AvgDmndQty
     */
    public double getMm3AvgDmndQty() {
        return mm3AvgDmndQty;
    }

    /**
     * @param mm3AvgDmndQty the mm3AvgDmndQty to set
     */
    public void setMm3AvgDmndQty(double mm3AvgDmndQty) {
        this.mm3AvgDmndQty = mm3AvgDmndQty;
    }

    /**
     * @return the mm6AvgDmndQty
     */
    public double getMm6AvgDmndQty() {
        return mm6AvgDmndQty;
    }

    /**
     * @param mm6AvgDmndQty the mm6AvgDmndQty to set
     */
    public void setMm6AvgDmndQty(double mm6AvgDmndQty) {
        this.mm6AvgDmndQty = mm6AvgDmndQty;
    }

    /**
     * @return the mm12AvgDmndQty
     */
    public double getMm12AvgDmndQty() {
        return mm12AvgDmndQty;
    }

    /**
     * @param mm12AvgDmndQty the mm12AvgDmndQty to set
     */
    public void setMm12AvgDmndQty(double mm12AvgDmndQty) {
        this.mm12AvgDmndQty = mm12AvgDmndQty;
    }

    /**
     * @return the stdrdStockApplyRate
     */
    public double getStdrdStockApplyRate() {
        return stdrdStockApplyRate;
    }

    /**
     * @param stdrdStockApplyRate the stdrdStockApplyRate to set
     */
    public void setStdrdStockApplyRate(double stdrdStockApplyRate) {
        this.stdrdStockApplyRate = stdrdStockApplyRate;
    }

    /**
     * @return the totDmndQty
     */
    public double getTotDmndQty() {
        return totDmndQty;
    }

    /**
     * @param totDmndQty the totDmndQty to set
     */
    public void setTotDmndQty(double totDmndQty) {
        this.totDmndQty = totDmndQty;
    }

    /**
     * @return the wgtAddTotDmndQty
     */
    public double getWgtAddTotDmndQty() {
        return wgtAddTotDmndQty;
    }

    /**
     * @param wgtAddTotDmndQty the wgtAddTotDmndQty to set
     */
    public void setWgtAddTotDmndQty(double wgtAddTotDmndQty) {
        this.wgtAddTotDmndQty = wgtAddTotDmndQty;
    }

    /**
     * @return the avgDvsQty
     */
    public double getAvgDvsQty() {
        return avgDvsQty;
    }

    /**
     * @param avgDvsQty the avgDvsQty to set
     */
    public void setAvgDvsQty(double avgDvsQty) {
        this.avgDvsQty = avgDvsQty;
    }

    /**
     * @return the avgDvsRflRate
     */
    public double getAvgDvsRflRate() {
        return avgDvsRflRate;
    }

    /**
     * @param avgDvsRflRate the avgDvsRflRate to set
     */
    public void setAvgDvsRflRate(double avgDvsRflRate) {
        this.avgDvsRflRate = avgDvsRflRate;
    }

    /**
     * @return the parSpecCd
     */
    public String getParSpecCd() {
        return parSpecCd;
    }

    /**
     * @param parSpecCd the parSpecCd to set
     */
    public void setParSpecCd(String parSpecCd) {
        this.parSpecCd = parSpecCd;
    }
}
