package chn.bhmc.dms.sal.acc.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 용품 마스터
 *
 * @author HG Lee
 * @since 2017. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.18           HG Lee            최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="sal.lbl.dlrCd")
   })
public class AccessoryMasterVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -3189555272645858466L;
    
    private String drlCd;
    private String grStrgeCd;
    private String itemCd;
    private String itemNm;
    private String itemEnNm;
    private String itemDstinCd;
    private String itemGrpCd;
    private String useYn;
    private String startDt;
    private String endDt;
    private String preItemCd;
    private String giStrgeCd;
    private String stockUnit;
    private String stockVal;
    private String minPurcQty;
    private String bpCd;
    private String bpNm;
    private String pointYn;
    private String stockPrsnId;
    private String purcPrsnId;
    private String installPrice;
    private String salePrice;
    private String fileNo;
    private String fileDocNo;
    private String fineNm;
    private String fileUploadDt;
    private String remark;
    private String regUsrId;
    private Date regDt;
    private String updtUsrId;
    private Date updtDt;
    private String invcDocNo;
    private String invcStatCd;
    private String aprrvDt;
    private String arrvDt;
    private String factoryCd;
    private String invcTotAmt;
    private String invcCostAmt;
    private String vatAm;
    private String vatRate;
    private String invcQty;
    private String incCostAmt;
    private String incCostVat;
    private String avgCostAmt;
    private String avgVat;
    private String itemAprrvDt;
    private String sGoodsHouse;
    private String sGoodsCd;
    private String sGoodsName;
    private String sGoodsGubun;
    private String sGrDtFrom;
    private String sGrDtTo;
    private String sGiDtFrom;
    private String sGiDtTo;
    private String sBpCd;

    /**
     * @return the sGrDtTo
     */
    public String getsGrDtTo() {
        return sGrDtTo;
    }
    /**
     * @param sGrDtTo the sGrDtTo to set
     */
    public void setsGrDtTo(String sGrDtTo) {
        this.sGrDtTo = sGrDtTo;
    }
    /**
     * @return the sGiDtTo
     */
    public String getsGiDtTo() {
        return sGiDtTo;
    }
    /**
     * @param sGiDtTo the sGiDtTo to set
     */
    public void setsGiDtTo(String sGiDtTo) {
        this.sGiDtTo = sGiDtTo;
    }
    /**
     * @return the sGoodsHouse
     */
    public String getsGoodsHouse() {
        return sGoodsHouse;
    }
    /**
     * @param sGoodsHouse the sGoodsHouse to set
     */
    public void setsGoodsHouse(String sGoodsHouse) {
        this.sGoodsHouse = sGoodsHouse;
    }
    /**
     * @return the sGoodsCd
     */
    public String getsGoodsCd() {
        return sGoodsCd;
    }
    /**
     * @param sGoodsCd the sGoodsCd to set
     */
    public void setsGoodsCd(String sGoodsCd) {
        this.sGoodsCd = sGoodsCd;
    }
    /**
     * @return the sGoodsName
     */
    public String getsGoodsName() {
        return sGoodsName;
    }
    /**
     * @param sGoodsName the sGoodsName to set
     */
    public void setsGoodsName(String sGoodsName) {
        this.sGoodsName = sGoodsName;
    }
    /**
     * @return the sGoodsGubun
     */
    public String getsGoodsGubun() {
        return sGoodsGubun;
    }
    /**
     * @param sGoodsGubun the sGoodsGubun to set
     */
    public void setsGoodsGubun(String sGoodsGubun) {
        this.sGoodsGubun = sGoodsGubun;
    }
    /**
     * @return the sGrDtFrom
     */
    public String getsGrDtFrom() {
        return sGrDtFrom;
    }
    /**
     * @param sGrDtFrom the sGrDtFrom to set
     */
    public void setsGrDtFrom(String sGrDtFrom) {
        this.sGrDtFrom = sGrDtFrom;
    }
    /**
     * @return the sGiDtFrom
     */
    public String getsGiDtFrom() {
        return sGiDtFrom;
    }
    /**
     * @param sGiDtFrom the sGiDtFrom to set
     */
    public void setsGiDtFrom(String sGiDtFrom) {
        this.sGiDtFrom = sGiDtFrom;
    }
    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }
    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }
    /**
     * @return the invcQty
     */
    public String getInvcQty() {
        return invcQty;
    }
    /**
     * @param invcQty the invcQty to set
     */
    public void setInvcQty(String invcQty) {
        this.invcQty = invcQty;
    }
    /**
     * @return the incCostAmt
     */
    public String getIncCostAmt() {
        return incCostAmt;
    }
    /**
     * @param incCostAmt the incCostAmt to set
     */
    public void setIncCostAmt(String incCostAmt) {
        this.incCostAmt = incCostAmt;
    }
    /**
     * @return the incCostVat
     */
    public String getIncCostVat() {
        return incCostVat;
    }
    /**
     * @param incCostVat the incCostVat to set
     */
    public void setIncCostVat(String incCostVat) {
        this.incCostVat = incCostVat;
    }
    /**
     * @return the avgCostAmt
     */
    public String getAvgCostAmt() {
        return avgCostAmt;
    }
    /**
     * @param avgCostAmt the avgCostAmt to set
     */
    public void setAvgCostAmt(String avgCostAmt) {
        this.avgCostAmt = avgCostAmt;
    }
    /**
     * @return the avgVat
     */
    public String getAvgVat() {
        return avgVat;
    }
    /**
     * @param avgVat the avgVat to set
     */
    public void setAvgVat(String avgVat) {
        this.avgVat = avgVat;
    }
    /**
     * @return the itemAprrvDt
     */
    public String getItemAprrvDt() {
        return itemAprrvDt;
    }
    /**
     * @param itemAprrvDt the itemAprrvDt to set
     */
    public void setItemAprrvDt(String itemAprrvDt) {
        this.itemAprrvDt = itemAprrvDt;
    }
    /**
     * @return the invcDocNo
     */
    public String getInvcDocNo() {
        return invcDocNo;
    }
    /**
     * @param invcDocNo the invcDocNo to set
     */
    public void setInvcDocNo(String invcDocNo) {
        this.invcDocNo = invcDocNo;
    }
    /**
     * @return the invcStatCd
     */
    public String getInvcStatCd() {
        return invcStatCd;
    }
    /**
     * @param invcStatCd the invcStatCd to set
     */
    public void setInvcStatCd(String invcStatCd) {
        this.invcStatCd = invcStatCd;
    }
    /**
     * @return the aprrvDt
     */
    public String getAprrvDt() {
        return aprrvDt;
    }
    /**
     * @param aprrvDt the aprrvDt to set
     */
    public void setAprrvDt(String aprrvDt) {
        this.aprrvDt = aprrvDt;
    }
    /**
     * @return the arrvDt
     */
    public String getArrvDt() {
        return arrvDt;
    }
    /**
     * @param arrvDt the arrvDt to set
     */
    public void setArrvDt(String arrvDt) {
        this.arrvDt = arrvDt;
    }
    /**
     * @return the factoryCd
     */
    public String getFactoryCd() {
        return factoryCd;
    }
    /**
     * @param factoryCd the factoryCd to set
     */
    public void setFactoryCd(String factoryCd) {
        this.factoryCd = factoryCd;
    }
    /**
     * @return the invcTotAmt
     */
    public String getInvcTotAmt() {
        return invcTotAmt;
    }
    /**
     * @param invcTotAmt the invcTotAmt to set
     */
    public void setInvcTotAmt(String invcTotAmt) {
        this.invcTotAmt = invcTotAmt;
    }
    /**
     * @return the invcCostAmt
     */
    public String getInvcCostAmt() {
        return invcCostAmt;
    }
    /**
     * @param invcCostAmt the invcCostAmt to set
     */
    public void setInvcCostAmt(String invcCostAmt) {
        this.invcCostAmt = invcCostAmt;
    }
    /**
     * @return the vatAm
     */
    public String getVatAm() {
        return vatAm;
    }
    /**
     * @param vatAm the vatAm to set
     */
    public void setVatAm(String vatAm) {
        this.vatAm = vatAm;
    }
    /**
     * @return the vatRate
     */
    public String getVatRate() {
        return vatRate;
    }
    /**
     * @param vatRate the vatRate to set
     */
    public void setVatRate(String vatRate) {
        this.vatRate = vatRate;
    }
    /**
     * @return the drlCd
     */
    public String getDrlCd() {
        return drlCd;
    }
    /**
     * @param drlCd the drlCd to set
     */
    public void setDrlCd(String drlCd) {
        this.drlCd = drlCd;
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
     * @return the itemGrpCd
     */
    public String getItemGrpCd() {
        return itemGrpCd;
    }
    /**
     * @param itemGrpCd the itemGrpCd to set
     */
    public void setItemGrpCd(String itemGrpCd) {
        this.itemGrpCd = itemGrpCd;
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
     * @return the startDt
     */
    public String getStartDt() {
        return startDt;
    }
    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }
    /**
     * @return the endDt
     */
    public String getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }
    /**
     * @return the preItemCd
     */
    public String getPreItemCd() {
        return preItemCd;
    }
    /**
     * @param preItemCd the preItemCd to set
     */
    public void setPreItemCd(String preItemCd) {
        this.preItemCd = preItemCd;
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
     * @return the stockUnit
     */
    public String getStockUnit() {
        return stockUnit;
    }
    /**
     * @param stockUnit the stockUnit to set
     */
    public void setStockUnit(String stockUnit) {
        this.stockUnit = stockUnit;
    }
    /**
     * @return the stockVal
     */
    public String getStockVal() {
        return stockVal;
    }
    /**
     * @param stockVal the stockVal to set
     */
    public void setStockVal(String stockVal) {
        this.stockVal = stockVal;
    }
    /**
     * @return the minPurcQty
     */
    public String getMinPurcQty() {
        return minPurcQty;
    }
    /**
     * @param minPurcQty the minPurcQty to set
     */
    public void setMinPurcQty(String minPurcQty) {
        this.minPurcQty = minPurcQty;
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
     * @return the pointYn
     */
    public String getPointYn() {
        return pointYn;
    }
    /**
     * @param pointYn the pointYn to set
     */
    public void setPointYn(String pointYn) {
        this.pointYn = pointYn;
    }
    /**
     * @return the stockPrsnId
     */
    public String getStockPrsnId() {
        return stockPrsnId;
    }
    /**
     * @param stockPrsnId the stockPrsnId to set
     */
    public void setStockPrsnId(String stockPrsnId) {
        this.stockPrsnId = stockPrsnId;
    }
    /**
     * @return the purcPrsnId
     */
    public String getPurcPrsnId() {
        return purcPrsnId;
    }
    /**
     * @param purcPrsnId the purcPrsnId to set
     */
    public void setPurcPrsnId(String purcPrsnId) {
        this.purcPrsnId = purcPrsnId;
    }
    /**
     * @return the installPrice
     */
    public String getInstallPrice() {
        return installPrice;
    }
    /**
     * @param installPrice the installPrice to set
     */
    public void setInstallPrice(String installPrice) {
        this.installPrice = installPrice;
    }
    /**
     * @return the salePrice
     */
    public String getSalePrice() {
        return salePrice;
    }
    /**
     * @param salePrice the salePrice to set
     */
    public void setSalePrice(String salePrice) {
        this.salePrice = salePrice;
    }
    /**
     * @return the fileNo
     */
    public String getFileNo() {
        return fileNo;
    }
    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }
    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }
    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }
    /**
     * @return the fineNm
     */
    public String getFineNm() {
        return fineNm;
    }
    /**
     * @param fineNm the fineNm to set
     */
    public void setFineNm(String fineNm) {
        this.fineNm = fineNm;
    }
    /**
     * @return the fileUploadDt
     */
    public String getFileUploadDt() {
        return fileUploadDt;
    }
    /**
     * @param fileUploadDt the fileUploadDt to set
     */
    public void setFileUploadDt(String fileUploadDt) {
        this.fileUploadDt = fileUploadDt;
    }
    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }
    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
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