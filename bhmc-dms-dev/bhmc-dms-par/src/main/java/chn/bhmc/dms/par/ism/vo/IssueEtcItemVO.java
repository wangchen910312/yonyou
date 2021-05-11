package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

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
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="etcGiDocNo", mesgKey="par.lbl.etcGiDocNo")
    ,@ValidField(field="etcGiDocLineNo", mesgKey="par.lbl.line")
    ,@ValidField(field="cancYn", mesgKey="par.lbl.cancYn")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="qty", mesgKey="par.lbl.qty")
    ,@ValidField(field="unitCd", mesgKey="par.lbl.unitCd")
    ,@ValidField(field="strgeCd", mesgKey="par.lbl.strgeCd")
    ,@ValidField(field="locCd", mesgKey="par.lbl.locCd")
    ,@ValidField(field="prc", mesgKey="par.lbl.prc")
    ,@ValidField(field="amt", mesgKey="par.lbl.amt")
    ,@ValidField(field="giReasonCd", mesgKey="par.lbl.giReasonCd")
    ,@ValidField(field="mvtDocYyMm", mesgKey="par.lbl.mvtDocYyMm")
    ,@ValidField(field="mvtDocNo", mesgKey="par.lbl.mvtDocNo")
    ,@ValidField(field="mvtDocLineNo", mesgKey="par.lbl.mvtLineNo")
    ,@ValidField(field="giStatCd", mesgKey="par.lbl.giStatCd")
    ,@ValidField(field="receiveId", mesgKey="par.lbl.receiveId")
    ,@ValidField(field="giDt", mesgKey="par.lbl.giDt")
    ,@ValidField(field="receiveDt", mesgKey="par.lbl.receiveDt")
    ,@ValidField(field="returnId", mesgKey="par.lbl.returnId")
    ,@ValidField(field="returnDt", mesgKey="par.lbl.returnDt")
    ,@ValidField(field="cancId", mesgKey="par.lbl.cancId")
    ,@ValidField(field="cancDt", mesgKey="par.lbl.cancDt")
    ,@ValidField(field="taxDdctAmt", mesgKey="par.lbl.taxDdctAmt")
    ,@ValidField(field="taxAmt", mesgKey="par.lbl.taxAmt")
})
public class IssueEtcItemVO extends BaseVO {

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
     * 입고 딜러코드
     **/
    private String dlrCdRcv;

    /**
     * 기타출고문서번호
     **/
    private String etcGiDocNo;

    /**
     * 기타출고문서라인번호
     **/
    private int etcGiDocLineNo;

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
    private String itemCd;

    /**
     * 품목코드
     **/
    private String itemNm;

    /**
     * 차입수량
     **/
    private Double borrowQty;

    /**
     * 남은수량
     **/
    private Double remainQty;

    /**
     * 반환상태
     **/
    private String returnStat;

    /**
     * 반환수량
     **/
    private Double returnQty;

    /**
     * 반환금액
     **/
    private Double returnAmt;

    /**
     * 처리수량
     **/
    private Double procQty;

    /**
     * 수량
     **/
    private Double qty;

    /**
     * 대여수량
     **/
    private Double rentQty;

    /**
     * 수량
     **/
    private Double cancQty;

    /**
     * 가용수량
     **/
    private Double avlbStockQty;

    /**
     * 재고수량
     **/
    private Double stockQty;

    /**
     * 예류수량
     **/
    private Double resvStockQty;

    /**
     * 단위코드
     **/
    private String unitCd;

    /**
     * 기준창고코드
     **/
    private String stdStrgeCd;

    /**
     * 창고코드
     **/
    private String strgeCd;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd;

    /**
     * 위치코드
     **/
    private String locCd;

    /**
     * 단가
     **/
    private Double prc;

    /**
     * 이동평균단가
     **/
    private Double movingAvgPrc;

    /**
     * 소매가
     **/
    private Double retailPrc;

    /**
     * 금액
     **/
    private Double amt;

    /**
     * 출고사유코드
     **/
    private String giReasonCd;

    /**
     * 반환번호
     **/
    private String returnDocNo;

    /**
     * 수불문서년월
     **/
    private String mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    private String mvtDocNo;

    /**
     * 수불문서라인번호
     **/
    private int mvtDocLineNo;

    /**
     * 참조문서번호
     **/
    private String refDocNo;

    /**
     * 참조문서라인번호
     **/
    private int refDocLineNo;

    /**
     * 출고상태코드
     **/
    private String giStatCd;

    /**
     * 출고인
     **/
    private String regUsrNm;

    /**
     * 수령인ID
     **/
    private String receiveId;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date giDt;

    /**
     * 출고시간
     **/
    private String   giTime;

    /**
     * 수령일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiveDt;

    /**
     * 반품인ID
     **/
    private String returnId;

    /**
     * 반품일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnDt;


    /**
     * 반품시간
     **/
    private String returnTime;

    /**
     * 취소인ID
     **/
    private String cancId;

    /**
     * 취소인명
     **/
    private String cancUsrNm;

    /**
     * 취소일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cancDt;

    /**
     * 취소시간
     **/
    private String cancTime;

    /**
     * 세금공제금액
     **/
    private Double taxDdctAmt;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private String issDt;

    /**
     * 세금액
     **/
    private Double taxAmt;

    /**
     * 세금공제단가
     **/
    private Double taxDdctPrc;

    /**
     * 할인율
     **/
    private Double dcRate;

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
     * @return the etcGiDocNo
     */
    public String getEtcGiDocNo() {
        return etcGiDocNo;
    }

    /**
     * @param etcGiDocNo the etcGiDocNo to set
     */
    public void setEtcGiDocNo(String etcGiDocNo) {
        this.etcGiDocNo = etcGiDocNo;
    }

    /**
     * @return the etcGiDocLineNo
     */
    public int getEtcGiDocLineNo() {
        return etcGiDocLineNo;
    }

    /**
     * @param etcGiDocLineNo the etcGiDocLineNo to set
     */
    public void setEtcGiDocLineNo(int etcGiDocLineNo) {
        this.etcGiDocLineNo = etcGiDocLineNo;
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
     * @return the giReasonCd
     */
    public String getGiReasonCd() {
        return giReasonCd;
    }

    /**
     * @param giReasonCd the giReasonCd to set
     */
    public void setGiReasonCd(String giReasonCd) {
        this.giReasonCd = giReasonCd;
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
     * @return the procQty
     */
    public Double getProcQty() {
        return procQty;
    }

    /**
     * @param procQty the procQty to set
     */
    public void setProcQty(Double procQty) {
        this.procQty = procQty;
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
     * @return the remainQty
     */
    public Double getRemainQty() {
        return remainQty;
    }

    /**
     * @param remainQty the remainQty to set
     */
    public void setRemainQty(Double remainQty) {
        this.remainQty = remainQty;
    }

    /**
     * @return the giStatCd
     */
    public String getGiStatCd() {
        return giStatCd;
    }

    /**
     * @param giStatCd the giStatCd to set
     */
    public void setGiStatCd(String giStatCd) {
        this.giStatCd = giStatCd;
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
     * @return the dlrCdRcv
     */
    public String getDlrCdRcv() {
        return dlrCdRcv;
    }

    /**
     * @param dlrCdRcv the dlrCdRcv to set
     */
    public void setDlrCdRcv(String dlrCdRcv) {
        this.dlrCdRcv = dlrCdRcv;
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
     * @return the issDt
     */
    public String getIssDt() {
        return issDt;
    }

    /**
     * @param issDt the issDt to set
     */
    public void setIssDt(String issDt) {
        this.issDt = issDt;
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
     * @return the cancQty
     */
    public Double getCancQty() {
        return cancQty;
    }

    /**
     * @param cancQty the cancQty to set
     */
    public void setCancQty(Double cancQty) {
        this.cancQty = cancQty;
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
     * @return the returnAmt
     */
    public Double getReturnAmt() {
        return returnAmt;
    }

    /**
     * @param returnAmt the returnAmt to set
     */
    public void setReturnAmt(Double returnAmt) {
        this.returnAmt = returnAmt;
    }

    /**
     * @return the returnStat
     */
    public String getReturnStat() {
        return returnStat;
    }

    /**
     * @param returnStat the returnStat to set
     */
    public void setReturnStat(String returnStat) {
        this.returnStat = returnStat;
    }

    /**
     * @return the cancUsrNm
     */
    public String getCancUsrNm() {
        return cancUsrNm;
    }

    /**
     * @param cancUsrNm the cancUsrNm to set
     */
    public void setCancUsrNm(String cancUsrNm) {
        this.cancUsrNm = cancUsrNm;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the returnDocNo
     */
    public String getReturnDocNo() {
        return returnDocNo;
    }

    /**
     * @param returnDocNo the returnDocNo to set
     */
    public void setReturnDocNo(String returnDocNo) {
        this.returnDocNo = returnDocNo;
    }

}
