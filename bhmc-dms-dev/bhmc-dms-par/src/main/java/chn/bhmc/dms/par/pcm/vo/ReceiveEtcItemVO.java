package chn.bhmc.dms.par.pcm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReceiveEtcItemVO.java
 * @Description : ReceiveEtcItemVO.class
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
     @ValidField(field="dlrCd"            , mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="etcGrDocNo"       , mesgKey="par.lbl.etcGrDocNo")
    ,@ValidField(field="etcGrDocLineNo"   , mesgKey="par.lbl.line")
    ,@ValidField(field="cancYn"           , mesgKey="par.lbl.cancYn")
    ,@ValidField(field="itemCd"           , mesgKey="par.lbl.itemCd")
    ,@ValidField(field="qty"              , mesgKey="par.lbl.qty")
    ,@ValidField(field="unitCd"           , mesgKey="par.lbl.unitCd")
    ,@ValidField(field="strgeCd"          , mesgKey="par.lbl.strgeCd")
    ,@ValidField(field="locCd"            , mesgKey="par.lbl.locCd")
    ,@ValidField(field="prc"              , mesgKey="par.lbl.prc")
    ,@ValidField(field="amt"              , mesgKey="par.lbl.amt")
    ,@ValidField(field="grReasonCd"       , mesgKey="par.lbl.grReasonCd")
    ,@ValidField(field="mvtDocYyMm"       , mesgKey="par.lbl.mvtDocYyMm")
    ,@ValidField(field="mvtDocNo"         , mesgKey="par.lbl.mvtDocNo")
    ,@ValidField(field="mvtDocLineNo"     , mesgKey="par.lbl.mvtLineNo")
    ,@ValidField(field="refDocNo"         , mesgKey="par.lbl.refDocNo")
    ,@ValidField(field="refDocLineNo"     , mesgKey="par.lbl.refDocLineNo")
    ,@ValidField(field="grStatCd"         , mesgKey="par.lbl.grStatCd")
    ,@ValidField(field="cancId"           , mesgKey="par.lbl.cancId")
    ,@ValidField(field="cancDt"           , mesgKey="par.lbl.cancDt")
    ,@ValidField(field="taxDdctAmt"       , mesgKey="par.lbl.taxDdctAmt")
    ,@ValidField(field="taxAmt"           , mesgKey="par.lbl.taxAmt")
   })
public class ReceiveEtcItemVO  extends AbstractExcelDataBinder{



        /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

    /**
     * 딜러코드
     **/
    private  String dlrCd;

    /**
     * 기타입고문서번호
     **/
    private  String etcGrDocNo;

    /**
     * 기타입고문서라인번호
     **/
    private  int etcGrDocLineNo;

    /**
     * 거래처(타딜러)
     **/
    private  String bpCd;

    /**
     * 거래처(타딜러)
     **/
    private  String bpNm;

    /**
     * 취소여부
     **/
    private  String cancYn;

    /**
     * 품목코드
     **/
    //ITEM_CD
    private  String itemCd;

    /**
     * 품목코드
     **/
    //ITEM_CD
    private  String itemNm;

    /**
     * 차입수량
     **/
    //BORROW_QTY
    private  Double borrowQty;

    /**
     * 대여수량
     **/
    //RENT_QTY
    private  Double rentQty;

    /**
     * 반환상태
     **/
    //RETURN_STAT
    private  String returnStat;

    /**
     * 반환수량
     **/
    //RETURN_QTY
    private  Double returnQty;

    /**
     * 반환금액
     **/
    //RETURN_AMT
    private  Double returnAmt;

    /**
     * 반환금액(세금제외)
     **/
    //RETURN_TAX_DDCT_AMT
    private  Double returnTaxDdctAmt;

    /**
     * 반환세금금액
     **/
    //RETURN_TAX_AMT
    private  Double returnTaxAmt;

    /**
     * 남은수량
     **/
    //REMAIN_QTY
    private  Double remainQty;

    /**
     * 처리수량
     **/
    //PROC_QTY
    private  Double procQty;

    /**
     * 수량
     **/
    //QTY
    private  Double qty;

    /**
     * 취소수량
     **/
    //CANC_QTY
    private  Double cancQty;

    /**
     * 기반환수량
     **/
    //PRE_RETURN_QTY
    private  Double preReturnQty;

    /**
     * 기반품금액합
     **/
    //PRE_RETURN_AMT
    private  Double preReturnAmt;

    /**
     * 검사수량
     **/
    //INSP_QTY
    private  Double inspQty;

    /**
     * 가용수량
     **/
    //AVLB_STOCK_QTY
    private  Double avlbStockQty;

    /**
     * 재고수량
     **/
    //STOCK_QTY
    private  Double stockQty;

    /**
     * 예류수량
     **/
    //RESV_STOCK_QTY
    private  Double resvStockQty;

    /**
     * 단위코드
     **/
    //UNIT_CD
    private  String unitCd;

    /**
     * 기준창고코드
     **/
    //STD_STRGE_CD
    private  String stdStrgeCd;

    /**
     * 창고코드
     **/
    //STRGE_CD
    private  String strgeCd;

    /**
     * 위치코드
     **/
    //LOC_CD
    private  String locCd;

    /**
     * 단가
     **/
    //PRC
    private  Double prc;

    /**
     * 이동평균단가
     **/
    //MOVING_AVG_PRC
    private  Double movingAvgPrc;

    /**
     * 이동평균금액
     **/
    //MOVING_AVG_AMT
    private  Double movingAvgAmt;

    /**
     * 반품이동평균금액
     **/
    //RETURN_MOVING_AVG_AMT
    private  Double returnMovingAvgAmt;

    /**
     * 기존반환이동평균금액
     **/
    //PRE_RETURN_MOVING_AVG_AMT
    private  Double preReturnMovingAvgAmt;



    /**
     * 소매가
     **/
    //RETAIL_PRC
    private  Double retailPrc;

    /**
     * 금액
     **/
    //AMT
    private  Double amt;

    /**
     * 할인율
     **/
    //DC_RATE
    private  Double dcRate;

    /**
     * 입고사유코드
     **/
    //GR_REASON_CD
    private  String grReasonCd;

    /**
     * 반환번호
     **/
    //RETURN_DOC_NO
    private  String returnDocNo;

    /**
     * 수불문서년월
     **/
    //MVT_DOC_YY_MM
    private  String mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    //MVT_DOC_NO
    private  String mvtDocNo;

    /**
     * 수불문서라인번호
     **/
    //MVT_DOC_LINE_NO
    private  int mvtDocLineNo;

    /**
     * 참조문서번호
     **/
    //REF_DOC_NO
    private  String refDocNo;

    /**
     * 참조문서라인번호
     **/
    //REF_DOC_LINE_NO
    private  int refDocLineNo;

    /**
     * 입고상태코드
     **/
    //GR_STAT_CD
    private  String grStatCd;

    /**
     * 수령인ID
     **/
    //RECEIVE_USR_ID
    private  String receiveUsrId;

    /**
     * 수령인
     **/
    //RECEIVE_USR_ID
    private  String receiveUsrNm;

    /**
     * 등록인명
     **/
    //REG_USR_NM_ID
    private  String regUsrNm;

    /**
     * 취소인ID
     **/
    //CANC_ID
    private  String cancId;

    /**
     * 취소인명
     **/
    //CANC_USR_NM_ID
    private  String cancUsrNm;

    /**
     * 취소일자
     **/
    //CANC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date cancDt;

    /**
     * 취소시간
     **/
    //CANC_TIME
    private  String cancTime;

    /**
     * 세금공제금액
     **/
    //TAX_DDCT_AMT
    private  Double taxDdctAmt;

    /**
     * 세금공제단가
     **/
    //TAX_DDCT_PRC
    private  Double taxDdctPrc;

    /**
     * 세금액
     **/
    //TAX_AMT
    private  Double taxAmt;

    /**
     * 입고일자
     **/
    //GR_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date grDt;

    /**
     * 반품일자
     **/
    //RETURN_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date returnDt;

    /**
     * 입고시간
     **/
    //GR_TIME
    private  String grTime;

    /**
     * 엑셀업로드수량
     **/
    //EXCEL_QTY
    private  String excelQty;

    /**
     * 엑셀업로드단가
     **/
    //EXCEL_PRC
    private  String excelPrc;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    //UPDT_DT_STR
    private  String          updtDtStr;

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
     * @return the etcGrDocNo
     */
    public String getEtcGrDocNo() {
        return etcGrDocNo;
    }

    /**
     * @param etcGrDocNo the etcGrDocNo to set
     */
    public void setEtcGrDocNo(String etcGrDocNo) {
        this.etcGrDocNo = etcGrDocNo;
    }

    /**
     * @return the etcGrDocLineNo
     */
    public int getEtcGrDocLineNo() {
        return etcGrDocLineNo;
    }

    /**
     * @param etcGrDocLineNo the etcGrDocLineNo to set
     */
    public void setEtcGrDocLineNo(int etcGrDocLineNo) {
        this.etcGrDocLineNo = etcGrDocLineNo;
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
     * @return the grReasonCd
     */
    public String getGrReasonCd() {
        return grReasonCd;
    }

    /**
     * @param grReasonCd the grReasonCd to set
     */
    public void setGrReasonCd(String grReasonCd) {
        this.grReasonCd = grReasonCd;
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
     * @return the grStatCd
     */
    public String getGrStatCd() {
        return grStatCd;
    }

    /**
     * @param grStatCd the grStatCd to set
     */
    public void setGrStatCd(String grStatCd) {
        this.grStatCd = grStatCd;
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
     * @return the receiveUsrId
     */
    public String getReceiveUsrId() {
        return receiveUsrId;
    }

    /**
     * @param receiveUsrId the receiveUsrId to set
     */
    public void setReceiveUsrId(String receiveUsrId) {
        this.receiveUsrId = receiveUsrId;
    }

    /**
     * @return the receiveUsrNm
     */
    public String getReceiveUsrNm() {
        return receiveUsrNm;
    }

    /**
     * @param receiveUsrId the receiveUsrNm to set
     */
    public void setReceiveUsrNm(String receiveUsrNm) {
        this.receiveUsrNm = receiveUsrNm;
    }

    /**
     * @return the grDt
     */
    public Date getGrDt() {
        return grDt;
    }

    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(Date grDt) {
        this.grDt = grDt;
    }

    /**
     * @return the grTime
     */
    public String getGrTime() {
        return grTime;
    }

    /**
     * @param grTime the grTime to set
     */
    public void setGrTime(String grTime) {
        this.grTime = grTime;
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
     * @return the inspQty
     */
    public Double getInspQty() {
        return inspQty;
    }

    /**
     * @param inspQty the inspQty to set
     */
    public void setInspQty(Double inspQty) {
        this.inspQty = inspQty;
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
     * @return the returnTaxDdctAmt
     */
    public Double getReturnTaxDdctAmt() {
        return returnTaxDdctAmt;
    }

    /**
     * @param returnTaxDdctAmt the returnTaxDdctAmt to set
     */
    public void setReturnTaxDdctAmt(Double returnTaxDdctAmt) {
        this.returnTaxDdctAmt = returnTaxDdctAmt;
    }

    /**
     * @return the returnTaxAmt
     */
    public Double getReturnTaxAmt() {
        return returnTaxAmt;
    }

    /**
     * @param returnTaxAmt the returnTaxAmt to set
     */
    public void setReturnTaxAmt(Double returnTaxAmt) {
        this.returnTaxAmt = returnTaxAmt;
    }

    /**
     * @return the preReturnAmt
     */
    public Double getPreReturnAmt() {
        return preReturnAmt;
    }

    /**
     * @param preReturnAmt the preReturnAmt to set
     */
    public void setPreReturnAmt(Double preReturnAmt) {
        this.preReturnAmt = preReturnAmt;
    }

    /**
     * @return the movingAvgAmt
     */
    public Double getMovingAvgAmt() {
        return movingAvgAmt;
    }

    /**
     * @param movingAvgAmt the movingAvgAmt to set
     */
    public void setMovingAvgAmt(Double movingAvgAmt) {
        this.movingAvgAmt = movingAvgAmt;
    }

    /**
     * @return the returnMovingAvgAmt
     */
    public Double getReturnMovingAvgAmt() {
        return returnMovingAvgAmt;
    }

    /**
     * @param returnMovingAvgAmt the returnMovingAvgAmt to set
     */
    public void setReturnMovingAvgAmt(Double returnMovingAvgAmt) {
        this.returnMovingAvgAmt = returnMovingAvgAmt;
    }

    /**
     * @return the preReturnMovingAvgAmt
     */
    public Double getPreReturnMovingAvgAmt() {
        return preReturnMovingAvgAmt;
    }

    /**
     * @param preReturnMovingAvgAmt the preReturnMovingAvgAmt to set
     */
    public void setPreReturnMovingAvgAmt(Double preReturnMovingAvgAmt) {
        this.preReturnMovingAvgAmt = preReturnMovingAvgAmt;
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

    /**
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }

    /**
     * @return the excelQty
     */
    public String getExcelQty() {
        return excelQty;
    }

    /**
     * @param excelQty the excelQty to set
     */
    public void setExcelQty(String excelQty) {
        this.excelQty = excelQty;
    }

    /**
     * @return the excelPrc
     */
    public String getExcelPrc() {
        return excelPrc;
    }

    /**
     * @param excelPrc the excelPrc to set
     */
    public void setExcelPrc(String excelPrc) {
        this.excelPrc = excelPrc;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;   //부품번호
                case 1:
                    this.setExcelQty(String.valueOf(Math.round(Double.parseDouble(ExcelDataBinderUtil.toString(value).trim()))));
                    break;      //입고수량
                case 2:
                    this.setExcelPrc(String.valueOf((Math.round(Double.parseDouble(ExcelDataBinderUtil.toString(value).trim()) * 100)/100)));
                    break;     //입고단가
                case 3:this.setStrgeCd(ExcelDataBinderUtil.toString(value).trim()); break;
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /**
     * {@inheritDoc}
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        if(!(StringUtils.isBlank(this.getItemCd()) && StringUtils.isBlank(this.getExcelQty()) && StringUtils.isBlank(this.getExcelPrc()) && StringUtils.isBlank(this.getStrgeCd()))){
            //부품번호
            if(StringUtils.isBlank(this.getItemCd())){

                String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 0, this.getItemCd(), msg));
            }


            if(StringUtils.isBlank(this.getExcelQty())){
                String msg = messageSource.getMessage(
                        "global.info.emptyParamInfo"
                        , new String[]{
                                messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
            }else{

                //입고수량
                if(NumberUtils.isNumber(this.getExcelQty())){
                    if(NumberUtils.toDouble(this.getExcelQty()) <= 0){
                        String msg = messageSource.getMessage(
                            "par.info.itemReqZeroCntMsg"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())
                                   ,"0"
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
                    }
                }else{
                    String msg = messageSource.getMessage(
                            "global.err.checkQtyParam"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
                }
            }

            if(!StringUtils.isBlank(this.getExcelPrc())){

                //판매단가
                if(NumberUtils.isNumber(this.getExcelPrc())){
                    if(NumberUtils.toDouble(this.getExcelPrc()) <= 0){
                        String msg = messageSource.getMessage(
                                "par.info.itemReqZeroCntMsg"
                                , new String[]{
                                        messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())
                                        ,"0"
                                }
                                , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelPrc()), msg));
                    }
                }else{
                    String msg = messageSource.getMessage(
                            "global.err.checkQtyParam"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelPrc()), msg));
                }
            }
        }

        return errors;


    }

}
