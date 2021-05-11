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
public class IssueEtcInfcItemVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

    /**
     * 품목코드
     **/
    private String itemNm;

    /**
     * 가용수량
     **/
    private Double avlbStockQty;

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
     * 위치코드
     **/
    private String locCd;

    /**
     * 이동평균단가
     **/
    private Double movingAvgPrc;

    /**
     * 소매가
     **/
    private Double retailPrc;

    /**
     * 출고사유코드
     **/
    private String giReasonCd;

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
    private String giTime;

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
     * 세금액
     **/
    private Double taxAmt;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 입고대상딜러코드
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
     * 취소여부
     **/
    private String cancYn;

    /**
     * 품목코드
     **/
    //ITEM_CD

    private String itemCd;

    /**
     * 수량
     **/
    private Double qty;

    /**
     * 단가
     **/
    private Double prc;

    /**
     * 금액
     **/
    private Double amt;

    /**
     * 출고사유코드
     **/
    private String reasonCd;

    /**
     * 수령자
     **/
    private String rcvId;

    /**
     * 출고일자
     **/
    private String issDt;

    /**
     * 출고시간
     **/
    private String issTm;

    /**
     * 취소인
     **/
    private String canId;

    /**
     * 취소일자
     **/
    private String canDt;

    /**
     * 취소시간
     **/
    private String canTm;

    /**
     * 세금제외가격
     **/
    private Double prcWot;

    /**
     * 세금
     **/
    private Double tax;

    /**
     * 등록자ID
     **/
    private String regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 상대딜러입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rcvDt;

    /**
     * 인터페이스결과코드
     **/
    private  String ifresult;

    /**
     * 인터페이스실패메세지
     **/
    private String iffailmsg;

    /**
     * 인터페이스생성일자
     **/
    private String createdate;

    /**
     * 인터페이스변경일자
     **/
    private String updatedate;

    /**
     * 인터페이스등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ifRegDt;

    /**
     * 배치상태코드
     **/
    private String batStatCd;

    /**
     * 배치결과일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date batRsltDt;

    /**
     * 배치메세지내용
     **/
    private String batMesgCont;

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
     * @return the reasonCd
     */
    public String getReasonCd() {
        return reasonCd;
    }

    /**
     * @param reasonCd the reasonCd to set
     */
    public void setReasonCd(String reasonCd) {
        this.reasonCd = reasonCd;
    }

    /**
     * @return the rcvId
     */
    public String getRcvId() {
        return rcvId;
    }

    /**
     * @param rcvId the rcvId to set
     */
    public void setRcvId(String rcvId) {
        this.rcvId = rcvId;
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
     * @return the issTm
     */
    public String getIssTm() {
        return issTm;
    }

    /**
     * @param issTm the issTm to set
     */
    public void setIssTm(String issTm) {
        this.issTm = issTm;
    }

    /**
     * @return the canId
     */
    public String getCanId() {
        return canId;
    }

    /**
     * @param canId the canId to set
     */
    public void setCanId(String canId) {
        this.canId = canId;
    }

    /**
     * @return the canDt
     */
    public String getCanDt() {
        return canDt;
    }

    /**
     * @param canDt the canDt to set
     */
    public void setCanDt(String canDt) {
        this.canDt = canDt;
    }

    /**
     * @return the canTm
     */
    public String getCanTm() {
        return canTm;
    }

    /**
     * @param canTm the canTm to set
     */
    public void setCanTm(String canTm) {
        this.canTm = canTm;
    }

    /**
     * @return the prcWot
     */
    public Double getPrcWot() {
        return prcWot;
    }

    /**
     * @param prcWot the prcWot to set
     */
    public void setPrcWot(Double prcWot) {
        this.prcWot = prcWot;
    }

    /**
     * @return the tax
     */
    public Double getTax() {
        return tax;
    }

    /**
     * @param tax the tax to set
     */
    public void setTax(Double tax) {
        this.tax = tax;
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
     * @return the rcvDt
     */
    public Date getRcvDt() {
        return rcvDt;
    }

    /**
     * @param rcvDt the rcvDt to set
     */
    public void setRcvDt(Date rcvDt) {
        this.rcvDt = rcvDt;
    }

    /**
     * @return the ifresult
     */
    public String getIfresult() {
        return ifresult;
    }

    /**
     * @param ifresult the ifresult to set
     */
    public void setIfresult(String ifresult) {
        this.ifresult = ifresult;
    }

    /**
     * @return the iffailmsg
     */
    public String getIffailmsg() {
        return iffailmsg;
    }

    /**
     * @param iffailmsg the iffailmsg to set
     */
    public void setIffailmsg(String iffailmsg) {
        this.iffailmsg = iffailmsg;
    }

    /**
     * @return the createdate
     */
    public String getCreatedate() {
        return createdate;
    }

    /**
     * @param createdate the createdate to set
     */
    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    /**
     * @return the updatedate
     */
    public String getUpdatedate() {
        return updatedate;
    }

    /**
     * @param updatedate the updatedate to set
     */
    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    /**
     * @return the ifRegDt
     */
    public Date getIfRegDt() {
        return ifRegDt;
    }

    /**
     * @param ifRegDt the ifRegDt to set
     */
    public void setIfRegDt(Date ifRegDt) {
        this.ifRegDt = ifRegDt;
    }

    /**
     * @return the batStatCd
     */
    public String getBatStatCd() {
        return batStatCd;
    }

    /**
     * @param batStatCd the batStatCd to set
     */
    public void setBatStatCd(String batStatCd) {
        this.batStatCd = batStatCd;
    }

    /**
     * @return the batRsltDt
     */
    public Date getBatRsltDt() {
        return batRsltDt;
    }

    /**
     * @param batRsltDt the batRsltDt to set
     */
    public void setBatRsltDt(Date batRsltDt) {
        this.batRsltDt = batRsltDt;
    }

    /**
     * @return the batMesgCont
     */
    public String getBatMesgCont() {
        return batMesgCont;
    }

    /**
     * @param batMesgCont the batMesgCont to set
     */
    public void setBatMesgCont(String batMesgCont) {
        this.batMesgCont = batMesgCont;
    }

}
