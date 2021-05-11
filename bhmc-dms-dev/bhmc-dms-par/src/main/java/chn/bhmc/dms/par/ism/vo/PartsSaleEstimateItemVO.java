package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleEstimateItemVO.java
 * @Description : PartsSaleEstimateItemVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

public class PartsSaleEstimateItemVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 부품판매오더번호
     **/
    private String estimateDocNo;

    /**
     * 부품판매오더라인번호
     **/
    private int estimateDocLineNo;

    /**
     * 견적상태코드
     **/
    private String statCd;

    /**
     * 오더일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date estimateDt;

    /**
     * 판매유형
     **/
    private String saleTp;

    /**
     * 고객유형
     **/
    private String custTp;


    /**
     * 고객코드
     **/
    private String custNo;

    /**
     * 고객명
     **/
    private String custNm;


    /**
     * SA_ID
     **/
    private String saId;

    /**
     * SA_NM
     **/
    private String saNm;

    /**
     * SAL_PRSN_ID
     **/
    private String salPrsnId;

    /**
     * SAL_PRSN_NM
     **/
    private String salPrsnNm;

    /**
     * 총금액
     **/
    private Double totAmt;

    /**
     * 품목상태코드
     **/
    private String itemStatCd;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 설치예정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date eqipExpcDt;

    /**
     * 할인율
     **/
    private Double dcRate;

    /**
     * 단가
     **/
    private Double prc;

    /**
     * 금액
     **/
    private Double amt;

    /**
     * 할인금액
     **/
    private Double dcAmt;

    /**
     * 단위코드
     **/
    private String unitCd;

    /**
     * 단가유형
     **/
    private String prcTp;

    /**
     * 부품유형
     **/
    private String itemDstinCd;

    /**
     * 출고창고
     **/
    private String giStrgeCd;

    /**
     * 출고로케이션
     **/
    private String giLocCd;

    /**
     * 로케이션
     **/
    private String locCd;

    /**
     * 패키지
     **/
    private String pkgItemCd;

    /**
     * 패키지명
     **/
    private String pkgItemNm;


    /**
     * 장면수량
     **/
    private Double stockQty;

    /**
     * 견적수량
     **/
    private Double estimateQty;

    /**
     * 가용수량
     **/
    private Double avlbStockQty;

    /**
     * 예류수량
     **/
    private Double resvStockQty;

    /**
     * 차입수량
     **/
    private Double borrowQty;

    /**
     * 차출수량
     **/
    private Double rentQty;

    /**
     * 세금공제금액
     **/
    private Double taxDdctAmt;

    /**
     * 세금액
     **/
    private Double taxAmt;

    /**
     * VIN번호
     **/
    private String vinNo;

    /**
     * 차량등록번호
     **/
    private String carRegNo;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the estimateDocNo
     */
    public String getEstimateDocNo() {
        return estimateDocNo;
    }

    /**
     * @param estimateDocNo the estimateDocNo to set
     */
    public void setEstimateDocNo(String estimateDocNo) {
        this.estimateDocNo = estimateDocNo;
    }

    /**
     * @return the estimateDocLineNo
     */
    public int getEstimateDocLineNo() {
        return estimateDocLineNo;
    }

    /**
     * @param estimateDocLineNo the estimateDocLineNo to set
     */
    public void setEstimateDocLineNo(int estimateDocLineNo) {
        this.estimateDocLineNo = estimateDocLineNo;
    }

    /**
     * @return the itemStatCd
     */
    public String getItemStatCd() {
        return itemStatCd;
    }

    /**
     * @param itemStatCd the itemStatCd to set
     */
    public void setItemStatCd(String itemStatCd) {
        this.itemStatCd = itemStatCd;
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
     * @return the eqipExpcDt
     */
    public Date getEqipExpcDt() {
        return eqipExpcDt;
    }

    /**
     * @param eqipExpcDt the eqipExpcDt to set
     */
    public void setEqipExpcDt(Date eqipExpcDt) {
        this.eqipExpcDt = eqipExpcDt;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the prc
     */
    public Double getPrc() {
        return prc;
    }

    /**
     * @param prc the prc to set
     */
    public void setPrc(Double prc) {
        this.prc = prc;
    }

    /**
     * @return the amt
     */
    public Double getAmt() {
        return amt;
    }

    /**
     * @param amt the amt to set
     */
    public void setAmt(Double amt) {
        this.amt = amt;
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
     * @return the estimateQty
     */
    public Double getEstimateQty() {
        return estimateQty;
    }

    /**
     * @param estimateQty the estimateQty to set
     */
    public void setEstimateQty(Double estimateQty) {
        this.estimateQty = estimateQty;
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
     * @return the prcTp
     */
    public String getPrcTp() {
        return prcTp;
    }

    /**
     * @param prcTp the prcTp to set
     */
    public void setPrcTp(String prcTp) {
        this.prcTp = prcTp;
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
     * @return the avlbStockQty
     */
    public Double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(Double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
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
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }

    /**
     * @return the estimateDt
     */
    public Date getEstimateDt() {
        return estimateDt;
    }

    /**
     * @param estimateDt the estimateDt to set
     */
    public void setEstimateDt(Date estimateDt) {
        this.estimateDt = estimateDt;
    }

    /**
     * @return the saleTp
     */
    public String getSaleTp() {
        return saleTp;
    }

    /**
     * @param saleTp the saleTp to set
     */
    public void setSaleTp(String saleTp) {
        this.saleTp = saleTp;
    }

    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }

    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }

    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the saId
     */
    public String getSaId() {
        return saId;
    }

    /**
     * @param saId the saId to set
     */
    public void setSaId(String saId) {
        this.saId = saId;
    }

    /**
     * @return the saNm
     */
    public String getSaNm() {
        return saNm;
    }

    /**
     * @param saNm the saNm to set
     */
    public void setSaNm(String saNm) {
        this.saNm = saNm;
    }

    /**
     * @return the salPrsnId
     */
    public String getSalPrsnId() {
        return salPrsnId;
    }

    /**
     * @param salPrsnId the salPrsnId to set
     */
    public void setSalPrsnId(String salPrsnId) {
        this.salPrsnId = salPrsnId;
    }

    /**
     * @return the salPrsnNm
     */
    public String getSalPrsnNm() {
        return salPrsnNm;
    }

    /**
     * @param salPrsnNm the salPrsnNm to set
     */
    public void setSalPrsnNm(String salPrsnNm) {
        this.salPrsnNm = salPrsnNm;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the taxDdctAmt
     */
    public Double getTaxDdctAmt() {
        return taxDdctAmt;
    }

    /**
     * @param taxDdctAmt the taxDdctAmt to set
     */
    public void setTaxDdctAmt(Double taxDdctAmt) {
        this.taxDdctAmt = taxDdctAmt;
    }

    /**
     * @return the taxAmt
     */
    public Double getTaxAmt() {
        return taxAmt;
    }

    /**
     * @param taxAmt the taxAmt to set
     */
    public void setTaxAmt(Double taxAmt) {
        this.taxAmt = taxAmt;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
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
     * @return the pkgItemCd
     */
    public String getPkgItemCd() {
        return pkgItemCd;
    }

    /**
     * @param pkgItemCd the pkgItemCd to set
     */
    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the giLocCd
     */
    public String getGiLocCd() {
        return giLocCd;
    }

    /**
     * @param giLocCd the giLocCd to set
     */
    public void setGiLocCd(String giLocCd) {
        this.giLocCd = giLocCd;
    }

    /**
     * @return the pkgItemNm
     */
    public String getPkgItemNm() {
        return pkgItemNm;
    }

    /**
     * @param pkgItemNm the pkgItemNm to set
     */
    public void setPkgItemNm(String pkgItemNm) {
        this.pkgItemNm = pkgItemNm;
    }

    /**
     * @return the stockQty
     */
    public Double getStockQty() {
        return stockQty;
    }

    /**
     * @param stockQty the stockQty to set
     */
    public void setStockQty(Double stockQty) {
        this.stockQty = stockQty;
    }

    /**
     * @return the resvStockQty
     */
    public Double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(Double resvStockQty) {
        this.resvStockQty = resvStockQty;
    }

    /**
     * @return the borrowQty
     */
    public Double getBorrowQty() {
        return borrowQty;
    }

    /**
     * @param borrowQty the borrowQty to set
     */
    public void setBorrowQty(Double borrowQty) {
        this.borrowQty = borrowQty;
    }

    /**
     * @return the rentQty
     */
    public Double getRentQty() {
        return rentQty;
    }

    /**
     * @param rentQty the rentQty to set
     */
    public void setRentQty(Double rentQty) {
        this.rentQty = rentQty;
    }



}
