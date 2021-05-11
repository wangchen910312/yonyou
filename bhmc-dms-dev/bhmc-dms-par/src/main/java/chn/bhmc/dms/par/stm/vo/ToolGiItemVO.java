package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleOrdItemVO.java
 * @Description : PartsSaleOrdItemVO.class
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

public class ToolGiItemVO extends BaseVO {

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
     * 거래처(타딜러)
     **/
    private String bpCd;

    /**
     * 거래처(타딜러)
     **/
    private String bpNm;

    /**
     * 취소여부
     **/
    private String cancYn;

    /**
     * 품목코드
     **/
    //ITEM_CD
    private String itemCd;

    /**
     * 품목코드
     **/
    //ITEM_CD
    private String itemNm;

    /**
     * 반환수량
     **/
    //RETURN_QTY
    private Double returnQty;

    /**
     * 기반환수량
     **/
    //PRE_RETURN_QTY
    private Double preReturnQty;

    /**
     * 폐기수량
     **/
    //DISUSE_QTY
    private Double disuseQty;

    /**
     * 폐기날짜
     **/
    //DISUSE_QTY
    private Date disuseDt;

    /**
     * 재고수량
     **/
    //STOCK_QTY
    private Double stockQty;

    /**
     * 수량
     **/
    //QTY
    private Double qty;

    /**
     * 출고수량
     **/
    //GI_QTY
    private Double giQty;

    /**
     * 대상수량
     **/
    //QTY
    private Double targetQty;

    /**
     * 가용수량
     **/
    //AVLB_STOCK_QTY
    private Double avlbStockQty;

    /**
     * 단위코드
     **/
    //UNIT_CD
    private String unitCd;

    /**
     * 기준창고코드
     **/
    //STD_STRGE_CD
    private String stdStrgeCd;

    /**
     * 창고코드
     **/
    //STRGE_CD
    private String strgeCd;

    /**
     * 위치코드
     **/
    //LOC_CD
    private String locCd;

    /**
     * 비고
     **/
    //REMARK
    private String remark;

    /**
     * 단가
     **/
    //PRC
    private Double prc;

    /**
     * 이동평균단가
     **/
    //MOVING_AVG_PRC
    private Double movingAvgPrc;

    /**
     * 소매가
     **/
    //RETAIL_PRC
    private Double retailPrc;

    /**
     * 금액
     **/
    //AMT
    private Double amt;

    /**
     * 참조문서번호
     **/
    //REF_DOC_NO
    private String refDocNo;

    /**
     * 참조문서라인번호
     **/
    //REF_DOC_LINE_NO
    private int refDocLineNo;

    /**
     * 수령인ID
     **/
    //RECEIVE_ID
    private String receiveId;

    /**
     * 담당자ID
     **/
    //PRSN_ID
    private String prsnId;

    /**
     * 담당자명
     **/
    //PRSN_NM
    private String prsnNm;

    /**
     * 출고일자
     **/
    //GI_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date giDt;

    /**
     * 출고시간
     **/
    //GI_TIME
    private String giTime;

    /**
     * 수령일자
     **/
    //RECEIVE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiveDt;

    /**
     * 반품인ID
     **/
    //RETURN_ID
    private String returnId;

    /**
     * 반품일자
     **/
    //RETURN_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnDt;


    /**
     * 반품시간
     **/
    //RETURN_TIME
    private String returnTime;

    /**
     * 취소인ID
     **/
    //CANC_ID
    private String cancId;

    /**
     * 취소일자
     **/
    //CANC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cancDt;


    /**
     * 취소시간
     **/
    //CANC_TIME
    private String cancTime;

    /**
     * 세금공제금액
     **/
    //TAX_DDCT_AMT
    private Double taxDdctAmt;

    /**
     * 세금액
     **/
    //TAX_AMT
    private Double taxAmt;

    /**
     * 공구출고문서번호
     **/

    private String toolGiDocNo;

    /**
     * 공구출고문서라인번호
     **/

    private int  toolGiDocLineNo;

    /**
     * 단가(세금제외)
     **/
    //TAX_DDCT_PRC

    private Double taxDdctPrc;

    /**
     * 수리공ID
     **/
    //TECH_ID

    private String techId;

    /**
     * 수리공명
     **/
    //TECH_NM

    private String techNm;

    /**
     * 출고담당ID
     **/
    //GI_PRSN_ID

    private String giPrsnId;

    /**
     * 출고담당명
     **/
    //GI_PRSN_NM

    private String giPrsnNm;

    /**
     * 반환담당ID
     **/
    //RETURN_PRSN_ID

    private String returnPrsnId;

    /**
     * 반환담당명
     **/
    //RETURN_PRSN_NM

    private String returnPrsnNm;

    /**
     * 수불문서년월
     **/
    //MVT_DOC_YY_MM
    private String mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    //MVT_DOC_NO
    private String mvtDocNo;

    /**
     * 수불문서라인번호
     **/
    //MVT_DOC_LINE_NO
    private int mvtDocLineNo;

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
     * @return the cancYn
     */
    public String getCancYn() {
        return cancYn;
    }

    /**
     * @param cancYn the cancYn to set
     */
    public void setCancYn(String cancYn) {
        this.cancYn = cancYn;
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
     * @return the returnQty
     */
    public Double getReturnQty() {
        return returnQty;
    }

    /**
     * @param returnQty the returnQty to set
     */
    public void setReturnQty(Double returnQty) {
        this.returnQty = returnQty;
    }

    /**
     * @return the qty
     */
    public Double getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(Double qty) {
        this.qty = qty;
    }

    /**
     * @return the targetQty
     */
    public Double getTargetQty() {
        return targetQty;
    }

    /**
     * @param targetQty the targetQty to set
     */
    public void setTargetQty(Double targetQty) {
        this.targetQty = targetQty;
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
     * @return the stdStrgeCd
     */
    public String getStdStrgeCd() {
        return stdStrgeCd;
    }

    /**
     * @param stdStrgeCd the stdStrgeCd to set
     */
    public void setStdStrgeCd(String stdStrgeCd) {
        this.stdStrgeCd = stdStrgeCd;
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
     * @return the retailPrc
     */
    public Double getRetailPrc() {
        return retailPrc;
    }

    /**
     * @param retailPrc the retailPrc to set
     */
    public void setRetailPrc(Double retailPrc) {
        this.retailPrc = retailPrc;
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
     * @return the refDocNo
     */
    public String getRefDocNo() {
        return refDocNo;
    }

    /**
     * @param refDocNo the refDocNo to set
     */
    public void setRefDocNo(String refDocNo) {
        this.refDocNo = refDocNo;
    }

    /**
     * @return the refDocLineNo
     */
    public int getRefDocLineNo() {
        return refDocLineNo;
    }

    /**
     * @param refDocLineNo the refDocLineNo to set
     */
    public void setRefDocLineNo(int refDocLineNo) {
        this.refDocLineNo = refDocLineNo;
    }

    /**
     * @return the receiveId
     */
    public String getReceiveId() {
        return receiveId;
    }

    /**
     * @param receiveId the receiveId to set
     */
    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
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
     * @return the prsnId
     */
    public String getPrsnId() {
        return prsnId;
    }

    /**
     * @param prsnId the prsnId to set
     */
    public void setPrsnId(String prsnId) {
        this.prsnId = prsnId;
    }

    /**
     * @return the prsnNm
     */
    public String getPrsnNm() {
        return prsnNm;
    }

    /**
     * @param prsnNm the prsnNm to set
     */
    public void setPrsnNm(String prsnNm) {
        this.prsnNm = prsnNm;
    }

    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    /**
     * @return the giTime
     */
    public String getGiTime() {
        return giTime;
    }

    /**
     * @param giTime the giTime to set
     */
    public void setGiTime(String giTime) {
        this.giTime = giTime;
    }

    /**
     * @return the techNm
     */
    public String getTechNm() {
        return techNm;
    }

    /**
     * @param techNm the techNm to set
     */
    public void setTechNm(String techNm) {
        this.techNm = techNm;
    }

    /**
     * @return the receiveDt
     */
    public Date getReceiveDt() {
        return receiveDt;
    }

    /**
     * @param receiveDt the receiveDt to set
     */
    public void setReceiveDt(Date receiveDt) {
        this.receiveDt = receiveDt;
    }

    /**
     * @return the returnId
     */
    public String getReturnId() {
        return returnId;
    }

    /**
     * @param returnId the returnId to set
     */
    public void setReturnId(String returnId) {
        this.returnId = returnId;
    }

    /**
     * @return the returnDt
     */
    public Date getReturnDt() {
        return returnDt;
    }

    /**
     * @param returnDt the returnDt to set
     */
    public void setReturnDt(Date returnDt) {
        this.returnDt = returnDt;
    }

    /**
     * @return the returnTime
     */
    public String getReturnTime() {
        return returnTime;
    }

    /**
     * @param returnTime the returnTime to set
     */
    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
    }

    /**
     * @return the cancId
     */
    public String getCancId() {
        return cancId;
    }

    /**
     * @param cancId the cancId to set
     */
    public void setCancId(String cancId) {
        this.cancId = cancId;
    }

    /**
     * @return the cancDt
     */
    public Date getCancDt() {
        return cancDt;
    }

    /**
     * @param cancDt the cancDt to set
     */
    public void setCancDt(Date cancDt) {
        this.cancDt = cancDt;
    }

    /**
     * @return the cancTime
     */
    public String getCancTime() {
        return cancTime;
    }

    /**
     * @param cancTime the cancTime to set
     */
    public void setCancTime(String cancTime) {
        this.cancTime = cancTime;
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
     * @return the toolGiDocNo
     */
    public String getToolGiDocNo() {
        return toolGiDocNo;
    }

    /**
     * @param toolGiDocNo the toolGiDocNo to set
     */
    public void setToolGiDocNo(String toolGiDocNo) {
        this.toolGiDocNo = toolGiDocNo;
    }

    /**
     * @return the toolGiDocLineNo
     */
    public int getToolGiDocLineNo() {
        return toolGiDocLineNo;
    }

    /**
     * @param toolGiDocLineNo the toolGiDocLineNo to set
     */
    public void setToolGiDocLineNo(int toolGiDocLineNo) {
        this.toolGiDocLineNo = toolGiDocLineNo;
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
     * @return the techId
     */
    public String getTechId() {
        return techId;
    }

    /**
     * @param techId the techId to set
     */
    public void setTechId(String techId) {
        this.techId = techId;
    }

    /**
     * @return the giPrsnId
     */
    public String getGiPrsnId() {
        return giPrsnId;
    }

    /**
     * @param giPrsnId the giPrsnId to set
     */
    public void setGiPrsnId(String giPrsnId) {
        this.giPrsnId = giPrsnId;
    }

    /**
     * @return the returnPrsnId
     */
    public String getReturnPrsnId() {
        return returnPrsnId;
    }

    /**
     * @param returnPrsnId the returnPrsnId to set
     */
    public void setReturnPrsnId(String returnPrsnId) {
        this.returnPrsnId = returnPrsnId;
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
     * @return the disuseQty
     */
    public Double getDisuseQty() {
        return disuseQty;
    }

    /**
     * @return the disuseDt
     */
    public Date getDisuseDt() {
        return disuseDt;
    }

    /**
     * @param disuseDt the disuseDt to set
     */
    public void setDisuseDt(Date disuseDt) {
        this.disuseDt = disuseDt;
    }

    /**
     * @param disuseQty the disuseQty to set
     */
    public void setDisuseQty(Double disuseQty) {
        this.disuseQty = disuseQty;
    }

    /**
     * @return the giPrsnNm
     */
    public String getGiPrsnNm() {
        return giPrsnNm;
    }

    /**
     * @param giPrsnNm the giPrsnNm to set
     */
    public void setGiPrsnNm(String giPrsnNm) {
        this.giPrsnNm = giPrsnNm;
    }

    /**
     * @return the returnPrsnNm
     */
    public String getReturnPrsnNm() {
        return returnPrsnNm;
    }

    /**
     * @param returnPrsnNm the returnPrsnNm to set
     */
    public void setReturnPrsnNm(String returnPrsnNm) {
        this.returnPrsnNm = returnPrsnNm;
    }

    /**
     * @return the preReturnQty
     */
    public Double getPreReturnQty() {
        return preReturnQty;
    }

    /**
     * @param preReturnQty the preReturnQty to set
     */
    public void setPreReturnQty(Double preReturnQty) {
        this.preReturnQty = preReturnQty;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }

    /**
     * @return the mvtDocLineNo
     */
    public int getMvtDocLineNo() {
        return mvtDocLineNo;
    }

    /**
     * @param mvtDocLineNo the mvtDocLineNo to set
     */
    public void setMvtDocLineNo(int mvtDocLineNo) {
        this.mvtDocLineNo = mvtDocLineNo;
    }

    /**
     * @return the giQty
     */
    public Double getGiQty() {
        return giQty;
    }

    /**
     * @param giQty the giQty to set
     */
    public void setGiQty(Double giQty) {
        this.giQty = giQty;
    }



}
