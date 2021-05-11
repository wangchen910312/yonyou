package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="mvtDocYyMm", mesgKey="par.lbl.mvtDocYyMm")
    ,@ValidField(field="mvtDocNo", mesgKey="par.lbl.mvtDocNo")
    ,@ValidField(field="mvtDocLineNo", mesgKey="par.lbl.mvtDocLineNo")
    ,@ValidField(field="cancStmtYn", mesgKey="par.lbl.cancStmtYn")
    ,@ValidField(field="autoCreYn", mesgKey="par.lbl.autoCreYn")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="strgeCd", mesgKey="par.lbl.strgeCd")
    ,@ValidField(field="locCd", mesgKey="par.lbl.locCd")
    ,@ValidField(field="debitCreditDstinCd", mesgKey="par.lbl.debitCreditDstinCd")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="itemQty", mesgKey="par.lbl.itemQty")
    ,@ValidField(field="itemUnitCd", mesgKey="par.lbl.itemUnitCd")
    ,@ValidField(field="refDocTp", mesgKey="par.lbl.refDocTp")
    ,@ValidField(field="refDocNo", mesgKey="par.lbl.refDocNo")
    ,@ValidField(field="refDocLineNo", mesgKey="par.lbl.refDocLineNo")
    ,@ValidField(field="cancMvtDocNo", mesgKey="par.lbl.cancMvtDocNo")
    ,@ValidField(field="cancMvtDocYyMm", mesgKey="par.lbl.cancMvtDocYyMm")
    ,@ValidField(field="cancMvtDocLineNo", mesgKey="par.lbl.cancMvtDocLineNo")
    ,@ValidField(field="currCd", mesgKey="par.lbl.currCd")
    ,@ValidField(field="stdPrc", mesgKey="par.lbl.stdPrc")
    ,@ValidField(field="stdAmt", mesgKey="par.lbl.stdAmt")
    ,@ValidField(field="salePrc", mesgKey="par.lbl.salePrc")
    ,@ValidField(field="saleAmt", mesgKey="par.lbl.saleAmt")
    ,@ValidField(field="movingAvgPrc", mesgKey="par.lbl.movingAvgPrc")
    ,@ValidField(field="movingAvgAmt", mesgKey="par.lbl.movingAvgAmt")
    ,@ValidField(field="purcPrc", mesgKey="par.lbl.purcPrc")
    ,@ValidField(field="purcAmt", mesgKey="par.lbl.purcAmt")
    ,@ValidField(field="ddlnYn", mesgKey="par.lbl.ddlnYn")
    ,@ValidField(field="mvtReasonCont", mesgKey="par.lbl.mvtReasonCont")
    ,@ValidField(field="stmtTxt", mesgKey="par.lbl.stmtTxt")
    ,@ValidField(field="regUsrId", mesgKey="par.lbl.regUsrId")
    ,@ValidField(field="regDt", mesgKey="par.lbl.regDt")
    ,@ValidField(field="updtUsrId", mesgKey="par.lbl.updtUsrId")
    ,@ValidField(field="updtDt", mesgKey="par.lbl.updtDt")
})
public class MvtDocItemVO extends BaseVO {

	/**
	 * 수물문서 품목정보 (DT_PT_0005)
	 */
	private static final long serialVersionUID = 2185127956868281872L;

	/**
	 * 딜러코드
	 **/
	@NotEmpty
	private  String dlrCd;


	/**
	 * 수불문서년월일자
	 **/
	private  String mvtDocYyMm;

	/**
	 * 수불문서번호
	 **/
	@NotEmpty

	private  String mvtDocNo;

	/**
	 * 수불문서라인번호
	 **/
	@NotEmpty

	private  int   mvtDocLineNo;

	/**
	 * 취소전표여부
	 **/
	@NotEmpty

	private  String cancStmtYn;

	/**
	 * 자동생성여부
	 **/
	@NotEmpty

	private  String autoCreYn;

	/**
	 * 센터코드
	 **/
	private  String pltCd;

	/**
	 * 창고코드
	 **/
	private  String strgeCd;  //창고


	/**
	 * 출고창고코드
	 **/
	private  String frStrgeCd;  //출고창고

	/**
	 * 입고창고코드
	 **/
	private  String toStrgeCd;  //입고창고

	/**
	 * 위치코드
	 **/
	private  String locCd;

	/**
	 * 차변대변구분코드
	 **/
	private  String debitCreditDstinCd;

	/**
	 * 품목코드
	 **/
	//ITEM_CD

	private  String itemCd;

	private  String itemNm;

	/**
	 * 품목수량
	 **/
	private  Double itemQty;

	/**
	 * 품목단위코드
	 **/
	private  String itemUnitCd;

	/**
	 * 참조문서유형
	 **/
	private  String refDocTp;

	/**
	 * 참조문서번호
	 **/
	private  String refDocNo;

	/**
	 * 참조문서라인번호
	 **/
	private  int   refDocLineNo;

	/**
	 * 출고문서번호
	 **/
	//GI_DOC_NO

	private  String giDocNo;

	/**
	 * 출고문서라인번호
	 **/
	private  int   giDocLineNo;

	/**
	 * 입고문서번호
	 **/
	private  String grDocNo;

	/**
	 * 입고문서라인번호
	 **/
	private  int   grDocLineNo;

	/**
	 * 취소수불문서번호
	 **/
	private  String cancMvtDocNo;

	/**
	 * 취소수불문서년월일자
	 **/
	private  String cancMvtDocYyMm;

	/**
	 * 취소수불문서라인번호
	 **/
	private  int   cancMvtDocLineNo;

	/**
	 * 통화코드
	 **/
	private  String currCd;

	/**
	 * 표준단가
	 **/
	private  Double stdPrc;

	/**
	 * 표준금액
	 **/
	private  Double stdAmt;

	/**
	 * 판매단가
	 **/
	private  Double salePrc;

	/**
	 * 판매단가(세금미포함)
	 **/
	private  Double saleTaxDdctPrc;

	/**
	 * 판매금액
	 **/
	private  Double saleAmt;

	/**
	 * 이동평균단가
	 **/
	private  Double movingAvgPrc;

	/**
	 * 이동평균금액
	 **/
	private  Double movingAvgAmt;

	/**
	 * 구매단가
	 **/
	private  Double purcPrc;

	/**
	 * 구매단가(세금미포함)
	 **/
	private  Double purcTaxDdctPrc;

	/**
	 * 구매금액
	 **/
	private  Double purcAmt;

	/**
     * 수불구매금액(입고 반품 금액)
     **/
    private  Double mvtPurcAmt;

    /**
     * 수불구매금액(입고 반품 금액 세금미포함)
     **/
    private  Double mvtPurcTaxDdctAmt;

	/**
	 * 마감여부
	 **/
	@NotEmpty
	private  String ddlnYn;

	/**
	 * 수불사유내용
	 **/
	private  String mvtReasonCont;

	/**
	 * 전표텍스트
	 **/
	private  String stmtTxt;

	 /**
     * 품목구분코드
     */
    private String itemDstinCd;

    /**
     * ABC CLASS
     */
    private  String abcInd;

    /***
     * 차종코드
     */
    private  String carlineCd;

    /**
     * 수불유형
     **/
    private  String mvtTp;

    /**
     * 수불유형명
     **/
    private  String mvtTpNm;

    /**
     * 거래처코드
     **/
    private  String bpCd;

    /**
     * 거래처명
     **/
    private  String bpNm;

    /**
     * 고객코드
     **/
    private  String custNo;

    /**
     * 고객명
     **/
    private  String custNm;

    /**
     * 사업장코드
     **/
    private  String bizAreaCd;

    /**
     * 입고일자문자
     **/
    private  String grDtString;

    /**
     * 출고일자문자
     **/
    private  String giDtString;

    /**
     * 전표처리일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date  stmtProcDt;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date  giDt;

    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date  grDt;

    /**
     * 시스템처리일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date  sysProcDt;

    /**
     * 등록일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date  regDt;

    /**
     * 당월 입고 건
     **/
    private  Double mmGrItemCnt;

    /**
     * 당월 입고 수량
     **/
    private  Double mmGrItemSum;

    /**
     * 당월 출고 건
     **/
    private  Double mmGiItemCnt;

    /**
     * 당월 출고 수량
     **/
    private  Double mmGiItemSum;

    /**
     * 3개월 입고 건
     **/
    private  Double mm3GrItemCnt;

    /**
     * 3개월 입고 수량
     **/
    private  Double mm3GrItemSum;

    /**
     * 3개월 출고 건
     **/
    private  Double mm3GiItemCnt;

    /**
     * 3개월 출고 수량
     **/
    private  Double mm3GiItemSum;

    /**
     * 6개월 입고 건
     **/
    private  Double mm6GrItemCnt;

    /**
     * 6개월 입고 수량
     **/
    private  Double mm6GrItemSum;

    /**
     * 6개월 출고 건
     **/
    private  Double mm6GiItemCnt;

    /**
     * 6개월 출고 수량
     **/
    private  Double mm6GiItemSum;

    /**
     * 장면수량
     **/
    private  Double stockQty;

    /**
     * 가용수량
     **/
    private  Double avlbStockQty;

    /**
     * 예류수량
     **/
    private  Double resvStockQty;

    /**
     * 차입수량
     **/
    private  Double borrowQty;

    /**
     * 차출수량
     **/
    private  Double rentQty;

    /**
     * 세율
     **/
    private  Double taxRate;

    /**
     * 출고금액(세금미포함)
     **/
    private  Double saleTaxDdctAmt;

    /**
     * 이평가(세금미포함)
     **/
    private  Double movingAvgTaxDdctPrc;

    /**
     * 이평가금액(세금미포함)
     **/
    private  Double movingAvgTaxDdctAmt;

    /**
     * 입고금액(세금미포함)
     **/
    private  Double purcTaxDdctAmt;

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
     * @return the cancStmtYn
     */
    public String getCancStmtYn() {
        return cancStmtYn;
    }

    /**
     * @param cancStmtYn the cancStmtYn to set
     */
    public void setCancStmtYn(String cancStmtYn) {
        this.cancStmtYn = cancStmtYn;
    }

    /**
     * @return the autoCreYn
     */
    public String getAutoCreYn() {
        return autoCreYn;
    }

    /**
     * @param autoCreYn the autoCreYn to set
     */
    public void setAutoCreYn(String autoCreYn) {
        this.autoCreYn = autoCreYn;
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
     * @return the frStrgeCd
     */
    public String getFrStrgeCd() {
        return frStrgeCd;
    }

    /**
     * @param frStrgeCd the frStrgeCd to set
     */
    public void setFrStrgeCd(String frStrgeCd) {
        this.frStrgeCd = frStrgeCd;
    }

    /**
     * @return the toStrgeCd
     */
    public String getToStrgeCd() {
        return toStrgeCd;
    }

    /**
     * @param toStrgeCd the toStrgeCd to set
     */
    public void setToStrgeCd(String toStrgeCd) {
        this.toStrgeCd = toStrgeCd;
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
     * @return the debitCreditDstinCd
     */
    public String getDebitCreditDstinCd() {
        return debitCreditDstinCd;
    }

    /**
     * @param debitCreditDstinCd the debitCreditDstinCd to set
     */
    public void setDebitCreditDstinCd(String debitCreditDstinCd) {
        this.debitCreditDstinCd = debitCreditDstinCd;
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
     * @return the itemQty
     */
    public Double getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(Double itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the itemUnitCd
     */
    public String getItemUnitCd() {
        return itemUnitCd;
    }

    /**
     * @param itemUnitCd the itemUnitCd to set
     */
    public void setItemUnitCd(String itemUnitCd) {
        this.itemUnitCd = itemUnitCd;
    }

    /**
     * @return the refDocTp
     */
    public String getRefDocTp() {
        return refDocTp;
    }

    /**
     * @param refDocTp the refDocTp to set
     */
    public void setRefDocTp(String refDocTp) {
        this.refDocTp = refDocTp;
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
     * @return the cancMvtDocNo
     */
    public String getCancMvtDocNo() {
        return cancMvtDocNo;
    }

    /**
     * @param cancMvtDocNo the cancMvtDocNo to set
     */
    public void setCancMvtDocNo(String cancMvtDocNo) {
        this.cancMvtDocNo = cancMvtDocNo;
    }

    /**
     * @return the cancMvtDocLineNo
     */
    public int getCancMvtDocLineNo() {
        return cancMvtDocLineNo;
    }

    /**
     * @param cancMvtDocLineNo the cancMvtDocLineNo to set
     */
    public void setCancMvtDocLineNo(int cancMvtDocLineNo) {
        this.cancMvtDocLineNo = cancMvtDocLineNo;
    }

    /**
     * @return the currCd
     */
    public String getCurrCd() {
        return currCd;
    }

    /**
     * @param currCd the currCd to set
     */
    public void setCurrCd(String currCd) {
        this.currCd = currCd;
    }

    /**
     * @return the stdPrc
     */
    public Double getStdPrc() {
        return stdPrc;
    }

    /**
     * @param stdPrc the stdPrc to set
     */
    public void setStdPrc(Double stdPrc) {
        this.stdPrc = stdPrc;
    }

    /**
     * @return the stdAmt
     */
    public Double getStdAmt() {
        return stdAmt;
    }

    /**
     * @param stdAmt the stdAmt to set
     */
    public void setStdAmt(Double stdAmt) {
        this.stdAmt = stdAmt;
    }

    /**
     * @return the salePrc
     */
    public Double getSalePrc() {
        return salePrc;
    }

    /**
     * @param salePrc the salePrc to set
     */
    public void setSalePrc(Double salePrc) {
        this.salePrc = salePrc;
    }

    /**
     * @return the saleAmt
     */
    public Double getSaleAmt() {
        return saleAmt;
    }

    /**
     * @param saleAmt the saleAmt to set
     */
    public void setSaleAmt(Double saleAmt) {
        this.saleAmt = saleAmt;
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
     * @return the purcPrc
     */
    public Double getPurcPrc() {
        return purcPrc;
    }

    /**
     * @param purcPrc the purcPrc to set
     */
    public void setPurcPrc(Double purcPrc) {
        this.purcPrc = purcPrc;
    }

    /**
     * @return the purcAmt
     */
    public Double getPurcAmt() {
        return purcAmt;
    }

    /**
     * @return the mvtPurcAmt
     */
    public Double getMvtPurcAmt() {
        return mvtPurcAmt;
    }

    /**
     * @param mvtPurcAmt the mvtPurcAmt to set
     */
    public void setMvtPurcAmt(Double mvtPurcAmt) {
        this.mvtPurcAmt = mvtPurcAmt;
    }

    /**
     * @param purcAmt the purcAmt to set
     */
    public void setPurcAmt(Double purcAmt) {
        this.purcAmt = purcAmt;
    }

    /**
     * @return the ddlnYn
     */
    public String getDdlnYn() {
        return ddlnYn;
    }

    /**
     * @param ddlnYn the ddlnYn to set
     */
    public void setDdlnYn(String ddlnYn) {
        this.ddlnYn = ddlnYn;
    }

    /**
     * @return the mvtReasonCont
     */
    public String getMvtReasonCont() {
        return mvtReasonCont;
    }

    /**
     * @param mvtReasonCont the mvtReasonCont to set
     */
    public void setMvtReasonCont(String mvtReasonCont) {
        this.mvtReasonCont = mvtReasonCont;
    }

    /**
     * @return the stmtTxt
     */
    public String getStmtTxt() {
        return stmtTxt;
    }

    /**
     * @param stmtTxt the stmtTxt to set
     */
    public void setStmtTxt(String stmtTxt) {
        this.stmtTxt = stmtTxt;
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
     * @return the mvtTp
     */
    public String getMvtTp() {
        return mvtTp;
    }

    /**
     * @param mvtTp the mvtTp to set
     */
    public void setMvtTp(String mvtTp) {
        this.mvtTp = mvtTp;
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
     * @return the cancMvtDocYyMm
     */
    public String getCancMvtDocYyMm() {
        return cancMvtDocYyMm;
    }

    /**
     * @param cancMvtDocYyMm the cancMvtDocYyMm to set
     */
    public void setCancMvtDocYyMm(String cancMvtDocYyMm) {
        this.cancMvtDocYyMm = cancMvtDocYyMm;
    }

    /**
     * @return the bizAreaCd
     */
    public String getBizAreaCd() {
        return bizAreaCd;
    }

    /**
     * @param bizAreaCd the bizAreaCd to set
     */
    public void setBizAreaCd(String bizAreaCd) {
        this.bizAreaCd = bizAreaCd;
    }

    /**
     * @return the grDtString
     */
    public String getGrDtString() {
        return grDtString;
    }

    /**
     * @param grDtString the grDtString to set
     */
    public void setGrDtString(String grDtString) {
        this.grDtString = grDtString;
    }

    /**
     * @return the giDtString
     */
    public String getGiDtString() {
        return giDtString;
    }

    /**
     * @param giDtString the giDtString to set
     */
    public void setGiDtString(String giDtString) {
        this.giDtString = giDtString;
    }

    /**
     * @return the stmtProcDt
     */
    public Date getStmtProcDt() {
        return stmtProcDt;
    }

    /**
     * @param stmtProcDt the stmtProcDt to set
     */
    public void setStmtProcDt(Date stmtProcDt) {
        this.stmtProcDt = stmtProcDt;
    }

    /**
     * @return the sysProcDt
     */
    public Date getSysProcDt() {
        return sysProcDt;
    }

    /**
     * @param sysProcDt the sysProcDt to set
     */
    public void setSysProcDt(Date sysProcDt) {
        this.sysProcDt = sysProcDt;
    }

    /**
     * @return the mmGrItemCnt
     */
    public Double getMmGrItemCnt() {
        return mmGrItemCnt;
    }

    /**
     * @param mmGrItemCnt the mmGrItemCnt to set
     */
    public void setMmGrItemCnt(Double mmGrItemCnt) {
        this.mmGrItemCnt = mmGrItemCnt;
    }

    /**
     * @return the mmGrItemSum
     */
    public Double getMmGrItemSum() {
        return mmGrItemSum;
    }

    /**
     * @param mmGrItemSum the mmGrItemSum to set
     */
    public void setMmGrItemSum(Double mmGrItemSum) {
        this.mmGrItemSum = mmGrItemSum;
    }

    /**
     * @return the mmGiItemCnt
     */
    public Double getMmGiItemCnt() {
        return mmGiItemCnt;
    }

    /**
     * @param mmGiItemCnt the mmGiItemCnt to set
     */
    public void setMmGiItemCnt(Double mmGiItemCnt) {
        this.mmGiItemCnt = mmGiItemCnt;
    }

    /**
     * @return the mmGiItemSum
     */
    public Double getMmGiItemSum() {
        return mmGiItemSum;
    }

    /**
     * @param mmGiItemSum the mmGiItemSum to set
     */
    public void setMmGiItemSum(Double mmGiItemSum) {
        this.mmGiItemSum = mmGiItemSum;
    }

    /**
     * @return the mm3GrItemCnt
     */
    public Double getMm3GrItemCnt() {
        return mm3GrItemCnt;
    }

    /**
     * @param mm3GrItemCnt the mm3GrItemCnt to set
     */
    public void setMm3GrItemCnt(Double mm3GrItemCnt) {
        this.mm3GrItemCnt = mm3GrItemCnt;
    }

    /**
     * @return the mm3GrItemSum
     */
    public Double getMm3GrItemSum() {
        return mm3GrItemSum;
    }

    /**
     * @param mm3GrItemSum the mm3GrItemSum to set
     */
    public void setMm3GrItemSum(Double mm3GrItemSum) {
        this.mm3GrItemSum = mm3GrItemSum;
    }

    /**
     * @return the mm3GiItemCnt
     */
    public Double getMm3GiItemCnt() {
        return mm3GiItemCnt;
    }

    /**
     * @param mm3GiItemCnt the mm3GiItemCnt to set
     */
    public void setMm3GiItemCnt(Double mm3GiItemCnt) {
        this.mm3GiItemCnt = mm3GiItemCnt;
    }

    /**
     * @return the mm3GiItemSum
     */
    public Double getMm3GiItemSum() {
        return mm3GiItemSum;
    }

    /**
     * @param mm3GiItemSum the mm3GiItemSum to set
     */
    public void setMm3GiItemSum(Double mm3GiItemSum) {
        this.mm3GiItemSum = mm3GiItemSum;
    }

    /**
     * @return the mm6GrItemCnt
     */
    public Double getMm6GrItemCnt() {
        return mm6GrItemCnt;
    }

    /**
     * @param mm6GrItemCnt the mm6GrItemCnt to set
     */
    public void setMm6GrItemCnt(Double mm6GrItemCnt) {
        this.mm6GrItemCnt = mm6GrItemCnt;
    }

    /**
     * @return the mm6GrItemSum
     */
    public Double getMm6GrItemSum() {
        return mm6GrItemSum;
    }

    /**
     * @param mm6GrItemSum the mm6GrItemSum to set
     */
    public void setMm6GrItemSum(Double mm6GrItemSum) {
        this.mm6GrItemSum = mm6GrItemSum;
    }

    /**
     * @return the mm6GiItemCnt
     */
    public Double getMm6GiItemCnt() {
        return mm6GiItemCnt;
    }

    /**
     * @param mm6GiItemCnt the mm6GiItemCnt to set
     */
    public void setMm6GiItemCnt(Double mm6GiItemCnt) {
        this.mm6GiItemCnt = mm6GiItemCnt;
    }

    /**
     * @return the mm6GiItemSum
     */
    public Double getMm6GiItemSum() {
        return mm6GiItemSum;
    }

    /**
     * @param mm6GiItemSum the mm6GiItemSum to set
     */
    public void setMm6GiItemSum(Double mm6GiItemSum) {
        this.mm6GiItemSum = mm6GiItemSum;
    }

    /**
     * @return the giDocNo
     */
    public String getGiDocNo() {
        return giDocNo;
    }

    /**
     * @param giDocNo the giDocNo to set
     */
    public void setGiDocNo(String giDocNo) {
        this.giDocNo = giDocNo;
    }

    /**
     * @return the giDocLineNo
     */
    public int getGiDocLineNo() {
        return giDocLineNo;
    }

    /**
     * @param giDocLineNo the giDocLineNo to set
     */
    public void setGiDocLineNo(int giDocLineNo) {
        this.giDocLineNo = giDocLineNo;
    }

    /**
     * @return the grDocNo
     */
    public String getGrDocNo() {
        return grDocNo;
    }

    /**
     * @param grDocNo the grDocNo to set
     */
    public void setGrDocNo(String grDocNo) {
        this.grDocNo = grDocNo;
    }

    /**
     * @return the grDocLineNo
     */
    public int getGrDocLineNo() {
        return grDocLineNo;
    }

    /**
     * @param grDocLineNo the grDocLineNo to set
     */
    public void setGrDocLineNo(int grDocLineNo) {
        this.grDocLineNo = grDocLineNo;
    }

    /**
     * @return the mvtTpNm
     */
    public String getMvtTpNm() {
        return mvtTpNm;
    }

    /**
     * @param mvtTpNm the mvtTpNm to set
     */
    public void setMvtTpNm(String mvtTpNm) {
        this.mvtTpNm = mvtTpNm;
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

    /**
     * @return the taxRate
     */
    public Double getTaxRate() {
        return taxRate;
    }

    /**
     * @param taxRate the taxRate to set
     */
    public void setTaxRate(Double taxRate) {
        this.taxRate = taxRate;
    }

    /**
     * @return the saleTaxDdctAmt
     */
    public Double getSaleTaxDdctAmt() {
        return saleTaxDdctAmt;
    }

    /**
     * @param saleTaxDdctAmt the saleTaxDdctAmt to set
     */
    public void setSaleTaxDdctAmt(Double saleTaxDdctAmt) {
        this.saleTaxDdctAmt = saleTaxDdctAmt;
    }

    /**
     * @return the movingAvgTaxDdctPrc
     */
    public Double getMovingAvgTaxDdctPrc() {
        return movingAvgTaxDdctPrc;
    }

    /**
     * @param movingAvgTaxDdctPrc the movingAvgTaxDdctPrc to set
     */
    public void setMovingAvgTaxDdctPrc(Double movingAvgTaxDdctPrc) {
        this.movingAvgTaxDdctPrc = movingAvgTaxDdctPrc;
    }

    /**
     * @return the movingAvgTaxDdctAmt
     */
    public Double getMovingAvgTaxDdctAmt() {
        return movingAvgTaxDdctAmt;
    }

    /**
     * @param movingAvgTaxDdctAmt the movingAvgTaxDdctAmt to set
     */
    public void setMovingAvgTaxDdctAmt(Double movingAvgTaxDdctAmt) {
        this.movingAvgTaxDdctAmt = movingAvgTaxDdctAmt;
    }

    /**
     * @return the purcTaxDdctAmt
     */
    public Double getPurcTaxDdctAmt() {
        return purcTaxDdctAmt;
    }

    /**
     * @param purcTaxDdctAmt the purcTaxDdctAmt to set
     */
    public void setPurcTaxDdctAmt(Double purcTaxDdctAmt) {
        this.purcTaxDdctAmt = purcTaxDdctAmt;
    }

    /**
     * @return the saleTaxDdctPrc
     */
    public Double getSaleTaxDdctPrc() {
        return saleTaxDdctPrc;
    }

    /**
     * @param saleTaxDdctPrc the saleTaxDdctPrc to set
     */
    public void setSaleTaxDdctPrc(Double saleTaxDdctPrc) {
        this.saleTaxDdctPrc = saleTaxDdctPrc;
    }

    /**
     * @return the purcTaxDdctPrc
     */
    public Double getPurcTaxDdctPrc() {
        return purcTaxDdctPrc;
    }

    /**
     * @param purcTaxDdctPrc the purcTaxDdctPrc to set
     */
    public void setPurcTaxDdctPrc(Double purcTaxDdctPrc) {
        this.purcTaxDdctPrc = purcTaxDdctPrc;
    }

    /**
     * @return the mvtPurcTaxDdctAmt
     */
    public Double getMvtPurcTaxDdctAmt() {
        return mvtPurcTaxDdctAmt;
    }

    /**
     * @param mvtPurcTaxDdctAmt the mvtPurcTaxDdctAmt to set
     */
    public void setMvtPurcTaxDdctAmt(Double mvtPurcTaxDdctAmt) {
        this.mvtPurcTaxDdctAmt = mvtPurcTaxDdctAmt;
    }

}
