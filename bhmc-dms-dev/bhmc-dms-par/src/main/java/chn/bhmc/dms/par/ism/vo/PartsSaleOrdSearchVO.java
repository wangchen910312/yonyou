package chn.bhmc.dms.par.ism.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleOrdSearchVO.java
 * @Description : PartsSaleOrdSearchVO.class
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

public class PartsSaleOrdSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5889788098505718469L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 부품판매오더번호
     **/
    private String sParSaleOrdNo;

    /**
     * 부품판매오더 정산번호
     **/
    private String sCalcDocNo;

    /**
     * 구매오더상태코드리스트
     **/
    private List<String> sOrdStatLst;

    /**
     * 오더상태코드
     **/
    private String sOrdStatCd;

    /**
     * 오더일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDt;

    /**
     * 취소일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCancDt;

    /**
     * 반품일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReturnDt;

    /**
     * 오더일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtFr;

    /**
     * 오더일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sOrdDtTo;

    /**
     * 정산일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcDtFr;

    /**
     * 정산일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcDtTo;

    /**
     * 고객유형
     **/
    private String sCustTp;

    /**
     * 판매유형
     **/
    private String sSaleTp;

    /**
     * 고객코드
     **/
    private String sCustCd;

    /**
     * 고객명
     **/
    private String sCustNm;

    /**
     * 고객전화번호
     **/
    private String sCustTelNo;

    /**
     * SAID
     **/
    private String sSaId;

    /**
     * SANM
     **/
    private String sSaNm;

    /**
     * SALE_PRSN_ID
     **/
    private String sSalePrsnId;

    /**
     * SALE_PRSN_NM
     **/
    private String sSalePrsnNm;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * 할인율
     **/
    private int sDcRate;

    /**
     * 할인전총금액
     **/
    private Double sDcBefTotAmt;

    /**
     * 할인금액
     **/
    private Double sDcAmt;

    /**
     * 총금액
     **/
    private Double sTotAmt;

    /**
     * 부가세금액
     **/
    private Double sVatAmt;

    /**
     * 부품건수
     **/
    private int sItemCnt;

    /**
     * 부품건수Fr
     **/
    private int sItemCntFr;

    /**
     * 부품건수To
     **/
    private int sItemCntTo;

    /**
     * 부품수량
     **/
    private Double sItemQty;

    /**
     * 부품수량Fr
     **/
    private Double sItemQtyFr;

    /**
     * 부품수량To
     **/
    private Double sItemQtyTo;

    /**
     * 부품금액
     **/
    private Double sItemAmt;

    /**
     * 부품금액Fr
     **/
    private Double sItemAmtFr;

    /**
     * 부품금액To
     **/
    private Double sItemAmtTo;

    /**
     * 취소사유코드
     **/
    private String sCancReasonCd;

    /**
     * 취소사유비고
     **/
    private String sCancReasonRemark;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sParSaleOrdNo
     */
    public String getsParSaleOrdNo() {
        return sParSaleOrdNo;
    }

    /**
     * @param sParSaleOrdNo the sParSaleOrdNo to set
     */
    public void setsParSaleOrdNo(String sParSaleOrdNo) {
        this.sParSaleOrdNo = sParSaleOrdNo;
    }

    /**
     * @return the sOrdStatCd
     */
    public String getsOrdStatCd() {
        return sOrdStatCd;
    }

    /**
     * @param sOrdStatCd the sOrdStatCd to set
     */
    public void setsOrdStatCd(String sOrdStatCd) {
        this.sOrdStatCd = sOrdStatCd;
    }

    /**
     * @return the sOrdDt
     */
    public Date getsOrdDt() {
        return sOrdDt;
    }

    /**
     * @param sOrdDt the sOrdDt to set
     */
    public void setsOrdDt(Date sOrdDt) {
        this.sOrdDt = sOrdDt;
    }

    /**
     * @return the sCancDt
     */
    public Date getsCancDt() {
        return sCancDt;
    }

    /**
     * @param sCancDt the sCancDt to set
     */
    public void setsCancDt(Date sCancDt) {
        this.sCancDt = sCancDt;
    }

    /**
     * @return the sReturnDt
     */
    public Date getsReturnDt() {
        return sReturnDt;
    }

    /**
     * @param sReturnDt the sReturnDt to set
     */
    public void setsReturnDt(Date sReturnDt) {
        this.sReturnDt = sReturnDt;
    }

    /**
     * @return the sOrdDtFr
     */
    public Date getsOrdDtFr() {
        return sOrdDtFr;
    }

    /**
     * @param sOrdDtFr the sOrdDtFr to set
     */
    public void setsOrdDtFr(Date sOrdDtFr) {
        this.sOrdDtFr = sOrdDtFr;
    }



    /**
     * @return the sCalcDtFr
     */
    public Date getsCalcDtFr() {
        return sCalcDtFr;
    }

    /**
     * @param sCalcDtFr the sCalcDtFr to set
     */
    public void setsCalcDtFr(Date sCalcDtFr) {
        this.sCalcDtFr = sCalcDtFr;
    }

    /**
     * @return the sCalcDtTo
     */
    public Date getsCalcDtTo() {
        return sCalcDtTo;
    }

    /**
     * @param sCalcDtTo the sCalcDtTo to set
     */
    public void setsCalcDtTo(Date sCalcDtTo) {
        this.sCalcDtTo = sCalcDtTo;
    }

    /**
     * @return the sOrdDtTo
     */
    public Date getsOrdDtTo() {
        return sOrdDtTo;
    }

    /**
     * @param sOrdDtTo the sOrdDtTo to set
     */
    public void setsOrdDtTo(Date sOrdDtTo) {
        this.sOrdDtTo = sOrdDtTo;
    }

    /**
     * @return the sCustTp
     */
    public String getsCustTp() {
        return sCustTp;
    }

    /**
     * @param sCustTp the sCustTp to set
     */
    public void setsCustTp(String sCustTp) {
        this.sCustTp = sCustTp;
    }

    /**
     * @return the sCustCd
     */
    public String getsCustCd() {
        return sCustCd;
    }

    /**
     * @param sCustCd the sCustCd to set
     */
    public void setsCustCd(String sCustCd) {
        this.sCustCd = sCustCd;
    }

    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sCustTelNo
     */
    public String getsCustTelNo() {
        return sCustTelNo;
    }

    /**
     * @param sCustTelNo the sCustTelNo to set
     */
    public void setsCustTelNo(String sCustTelNo) {
        this.sCustTelNo = sCustTelNo;
    }

    /**
     * @return the sSaId
     */
    public String getsSaId() {
        return sSaId;
    }

    /**
     * @param sSaId the sSaId to set
     */
    public void setsSaId(String sSaId) {
        this.sSaId = sSaId;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    /**
     * @return the sDcRate
     */
    public int getsDcRate() {
        return sDcRate;
    }

    /**
     * @param sDcRate the sDcRate to set
     */
    public void setsDcRate(int sDcRate) {
        this.sDcRate = sDcRate;
    }

    /**
     * @return the sDcBefTotAmt
     */
    public Double getsDcBefTotAmt() {
        return sDcBefTotAmt;
    }

    /**
     * @param sDcBefTotAmt the sDcBefTotAmt to set
     */
    public void setsDcBefTotAmt(Double sDcBefTotAmt) {
        this.sDcBefTotAmt = sDcBefTotAmt;
    }

    /**
     * @return the sDcAmt
     */
    public Double getsDcAmt() {
        return sDcAmt;
    }

    /**
     * @param sDcAmt the sDcAmt to set
     */
    public void setsDcAmt(Double sDcAmt) {
        this.sDcAmt = sDcAmt;
    }

    /**
     * @return the sTotAmt
     */
    public Double getsTotAmt() {
        return sTotAmt;
    }

    /**
     * @param sTotAmt the sTotAmt to set
     */
    public void setsTotAmt(Double sTotAmt) {
        this.sTotAmt = sTotAmt;
    }

    /**
     * @return the sVatAmt
     */
    public Double getsVatAmt() {
        return sVatAmt;
    }

    /**
     * @param sVatAmt the sVatAmt to set
     */
    public void setsVatAmt(Double sVatAmt) {
        this.sVatAmt = sVatAmt;
    }

    /**
     * @return the sCancReasonCd
     */
    public String getsCancReasonCd() {
        return sCancReasonCd;
    }

    /**
     * @param sCancReasonCd the sCancReasonCd to set
     */
    public void setsCancReasonCd(String sCancReasonCd) {
        this.sCancReasonCd = sCancReasonCd;
    }

    /**
     * @return the sCancReasonRemark
     */
    public String getsCancReasonRemark() {
        return sCancReasonRemark;
    }

    /**
     * @param sCancReasonRemark the sCancReasonRemark to set
     */
    public void setsCancReasonRemark(String sCancReasonRemark) {
        this.sCancReasonRemark = sCancReasonRemark;
    }

    /**
     * @return the sSaNm
     */
    public String getsSaNm() {
        return sSaNm;
    }

    /**
     * @param sSaNm the sSaNm to set
     */
    public void setsSaNm(String sSaNm) {
        this.sSaNm = sSaNm;
    }


    /**
     * @return the sSalePrsnId
     */
    public String getsSalePrsnId() {
        return sSalePrsnId;
    }

    /**
     * @param sSalePrsnId the sSalePrsnId to set
     */
    public void setsSalePrsnId(String sSalePrsnId) {
        this.sSalePrsnId = sSalePrsnId;
    }

    /**
     * @return the sSalePrsnNm
     */
    public String getsSalePrsnNm() {
        return sSalePrsnNm;
    }

    /**
     * @param sSalePrsnNm the sSalePrsnNm to set
     */
    public void setsSalePrsnNm(String sSalePrsnNm) {
        this.sSalePrsnNm = sSalePrsnNm;
    }

    /**
     * @return the sOrdStatLst
     */
    public List<String> getsOrdStatLst() {
        return sOrdStatLst;
    }

    /**
     * @param sOrdStatLst the sOrdStatLst to set
     */
    public void setsOrdStatLst(List<String> sOrdStatLst) {
        this.sOrdStatLst = sOrdStatLst;
    }

    /**
     * @return the sSaleTp
     */
    public String getsSaleTp() {
        return sSaleTp;
    }

    /**
     * @param sSaleTp the sSaleTp to set
     */
    public void setsSaleTp(String sSaleTp) {
        this.sSaleTp = sSaleTp;
    }

    /**
     * @return the sCalcDocNo
     */
    public String getsCalcDocNo() {
        return sCalcDocNo;
    }

    /**
     * @param sCalcDocNo the sCalcDocNo to set
     */
    public void setsCalcDocNo(String sCalcDocNo) {
        this.sCalcDocNo = sCalcDocNo;
    }

    /**
     * @return the sItemCnt
     */
    public int getsItemCnt() {
        return sItemCnt;
    }

    /**
     * @param sItemCnt the sItemCnt to set
     */
    public void setsItemCnt(int sItemCnt) {
        this.sItemCnt = sItemCnt;
    }

    /**
     * @return the sItemQty
     */
    public Double getsItemQty() {
        return sItemQty;
    }

    /**
     * @param sItemQty the sItemQty to set
     */
    public void setsItemQty(Double sItemQty) {
        this.sItemQty = sItemQty;
    }

    /**
     * @return the sItemQtyFr
     */
    public Double getsItemQtyFr() {
        return sItemQtyFr;
    }

    /**
     * @param sItemQtyFr the sItemQtyFr to set
     */
    public void setsItemQtyFr(Double sItemQtyFr) {
        this.sItemQtyFr = sItemQtyFr;
    }

    /**
     * @return the sItemQtyTo
     */
    public Double getsItemQtyTo() {
        return sItemQtyTo;
    }

    /**
     * @param sItemQtyTo the sItemQtyTo to set
     */
    public void setsItemQtyTo(Double sItemQtyTo) {
        this.sItemQtyTo = sItemQtyTo;
    }

    /**
     * @return the sItemAmt
     */
    public Double getsItemAmt() {
        return sItemAmt;
    }

    /**
     * @param sItemAmt the sItemAmt to set
     */
    public void setsItemAmt(Double sItemAmt) {
        this.sItemAmt = sItemAmt;
    }

    /**
     * @return the sItemAmtFr
     */
    public Double getsItemAmtFr() {
        return sItemAmtFr;
    }

    /**
     * @param sItemAmtFr the sItemAmtFr to set
     */
    public void setsItemAmtFr(Double sItemAmtFr) {
        this.sItemAmtFr = sItemAmtFr;
    }

    /**
     * @return the sItemAmtTo
     */
    public Double getsItemAmtTo() {
        return sItemAmtTo;
    }

    /**
     * @param sItemAmtTo the sItemAmtTo to set
     */
    public void setsItemAmtTo(Double sItemAmtTo) {
        this.sItemAmtTo = sItemAmtTo;
    }

    /**
     * @return the sItemCntFr
     */
    public int getsItemCntFr() {
        return sItemCntFr;
    }

    /**
     * @param sItemCntFr the sItemCntFr to set
     */
    public void setsItemCntFr(int sItemCntFr) {
        this.sItemCntFr = sItemCntFr;
    }

    /**
     * @return the sItemCntTo
     */
    public int getsItemCntTo() {
        return sItemCntTo;
    }

    /**
     * @param sItemCntTo the sItemCntTo to set
     */
    public void setsItemCntTo(int sItemCntTo) {
        this.sItemCntTo = sItemCntTo;
    }
}
