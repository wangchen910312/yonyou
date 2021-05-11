package chn.bhmc.dms.mob.api.part.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.hibernate.validator.constraints.NotEmpty;
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
 * @ClassName   : InvcItemVO.java
 * @Description : InvcItemVO.class
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
    ,@ValidField(field="invcDocNo", mesgKey="par.lbl.invcDocNo")
    ,@ValidField(field="invcDocLineNo", mesgKey="par.lbl.invcDocLineNo")
    ,@ValidField(field="mobisInvcNo", mesgKey="par.lbl.mobisInvcNo")
    ,@ValidField(field="mobisInvcLineNo", mesgKey="par.lbl.mobisInvcLineNo")
    ,@ValidField(field="purcOrdNo", mesgKey="par.lbl.purcOrdNo")
    ,@ValidField(field="purcOrdLineNo", mesgKey="par.lbl.purcOrdLineNo")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="invcQty", mesgKey="par.lbl.invcQty")
    ,@ValidField(field="invcUnitCd", mesgKey="par.lbl.invcUnitCd")
    ,@ValidField(field="invcPrc", mesgKey="par.lbl.invcPrc")
    ,@ValidField(field="invcAmt", mesgKey="par.lbl.invcAmt")
    ,@ValidField(field="vatAmt", mesgKey="par.lbl.vatAmt")
    ,@ValidField(field="invcTotAmt", mesgKey="par.lbl.invcTotAmt")
    ,@ValidField(field="debitCreditDstinCd", mesgKey="par.lbl.debitCreditDstinCd")
    ,@ValidField(field="refInvcDocNo", mesgKey="par.lbl.refInvcDocNo")
    ,@ValidField(field="refInvcDocLineNo", mesgKey="par.lbl.refInvcDocLineNo")
    ,@ValidField(field="invcGrDt", mesgKey="par.lbl.invcGrDt")
    ,@ValidField(field="dlPdcCd", mesgKey="par.lbl.dlPdcCd")
})
public class InvcItemVO extends AbstractExcelDataBinder{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6423192068120338402L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 송장문서번호
     **/
    @NotEmpty
    private String invcDocNo;

    /**
     * 송장문서라인번호
     **/
    @NotEmpty
    private int invcDocLineNo;

    /**
     * 모비스송장번호
     **/
    private String mobisInvcNo;

    /**
     * 모비스송장라인번호
     **/
    private int mobisInvcLineNo;

    /**
     * 구매오더유형
     **/
    private String purcOrdTp;

    /**
     * 구매오더번호
     **/
    private String purcOrdNo;

    /**
     * 구매오더라인번호
     **/
    private String purcOrdLineNo;

    /**
     * I/F 구매오더번호
     **/
    private String invcIfOrdNo;

    /**
     * I/F 구매오더라인번호
     **/
    private String invcIfOrdLn;

    /**
     * 구매오더라인구분자
     **/
    private String purcOrdLineDetlNo;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 가격유형
     **/
    private String prcTp;

    /**
     * 송장대상수량
     **/
    private Double invcTargetQty;

    /**
     * 송장수량
     **/
    private Double invcQty;

    /**
     * 구매수량
     **/
    private Double purcQty;

    /**
     * 엑셀업로드수량
     **/
    private String excelQty;

    /**
     * 엑셀업로드단가
     **/
    private String excelPrc;

    /**
     * 엑셀업로드세전단가
     **/
    private String excelTaxDdctPrc;

    /**
     * 엑셀창고코드
     **/
    private String excelStrgeCd;

    /**
     * 송장원본수량(구매수량)
     **/
    private Double invcQtyOrg;

    /**
     * 송장단위코드
     **/
    private String invcUnitCd;

    /**
     * 공급상
     **/
    private String spyrCd;

    /**
     * 송장단가
     **/
    private Double invcPrc;

    /**
     * 세금공제단가
     **/
    private Double taxDdctPrc;

    /**
     * 할인율
     **/
    private Double dcRate;

    /**
     * 송장단가(세액포함)
     **/
    private Double invcIncTaxPrc;

    /**
     * 송장금액
     **/
    private Double invcAmt;

    /**
     * 부가세금액
     **/
    private Double vatAmt;

    /**
     * 송장총금액
     **/
    private Double invcTotAmt;

    /**
     * 입고총금액
     **/
    private Double grTotAmt;

    /**
     * 입고총금액(세금제외)
     **/
    private Double grTaxDdctAmt;

    /**
     * 세금
     **/
    private Double taxAmt;

    /**
     * 차변대변구분코드
     **/
    private String debitCreditDstinCd;

    /**
     * 참조송장문서번호
     **/
    private String refInvcDocNo;

    /**
     * 참조송장문서라인번호
     **/
    private int refInvcDocLineNo;

    /**
     * 도착예정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arrvDt;

    /**
     * 송장입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcGrDt;

    /**
     * INVOICE일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 구매신청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date purcRegDt;

    /**
     * 배송PDC코드
     **/
    private String dlPdcCd;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd;

    /**
     * 입고창고명
     **/
    private String grStrgeNm;

    /**
     * 입고Location
     **/
    private String grLocCd;

    /**
     * 입고Location명
     **/
    private String grLocNm;

    /**
     * 입고수량
     **/
    private Double grQty;

    /**
     * 거래처코드
     **/
    private String bpCd;

    /**
     * 거래처명
     **/
    private String bpNm;

    /**
     * 구매신청자
     **/
    private String ordRegUsrId;

    /**
     * 구매신청자명
     **/
    private String ordRegUsrNm;

    /**
     * 결품신청자
     **/
    private String reqUsrId;

    /**
     * 결품신청자명
     **/
    private String reqUsrNm;

    /**
     * 클레임대상코드
     **/
    private String claimTargCd;

    /**
     * 배송거래처코드
     **/
    private String dlBpCd;

    /**
     * 배송거래처명
     **/
    private String dlBpNm;

    /**
     * 클레임유형
     **/
    private String claimTp;

    /**
     * 송장유형
     **/
    private String invcTp;

    /**
     * 송장상태
     **/
    private String invcStatCd;

    /**
     * 기 클레임수량
     **/
    private Double prevClaimQty;

    /**
     * 클레임수량
     **/
    private Double claimQty;

    /**
     * 차이수량
     **/
    private Double compareQty;

    /**
     * 요청내용
     **/
    private String reqCont;

    /**
     * 문서파일번호
     **/
    private String docFileNo;

    /**
     * 입고완료여부
     */
    private String grEndYn;

    /**
     * BOX번호
     */
    private String boxNo;

    /**
     * BMP구매번호
     */
    private String bmpOrdNo;

    /**
     * BMP구매라인번호
     */
    private String bmpOrdLineNo;

    /**
     * 구매단가
     **/
    private Double purcPrc;

    /**
     * 구매금액
     **/
    private Double purcAmt;

    /**
     * 실구매요청수량
     **/
    private Double purcReqQty;

    /**
     * 가용재고
     **/
    private Double avlbStockQty;

    /**
     * 예약수량
     **/
    private Double resvStockQty;

    /**
     * 재고수량
     **/
    private Double stockQty;

    /**
     * 차입수량
     **/
    private Double borrowQty;

    /**
     * 대여수량
     **/
    private Double rentQty;

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
     * @return the invcDocLineNo
     */
    public int getInvcDocLineNo() {
        return invcDocLineNo;
    }

    /**
     * @param invcDocLineNo the invcDocLineNo to set
     */
    public void setInvcDocLineNo(int invcDocLineNo) {
        this.invcDocLineNo = invcDocLineNo;
    }

    /**
     * @return the mobisInvcNo
     */
    public String getMobisInvcNo() {
        return mobisInvcNo;
    }

    /**
     * @param mobisInvcNo the mobisInvcNo to set
     */
    public void setMobisInvcNo(String mobisInvcNo) {
        this.mobisInvcNo = mobisInvcNo;
    }

    /**
     * @return the mobisInvcLineNo
     */
    public int getMobisInvcLineNo() {
        return mobisInvcLineNo;
    }

    /**
     * @param mobisInvcLineNo the mobisInvcLineNo to set
     */
    public void setMobisInvcLineNo(int mobisInvcLineNo) {
        this.mobisInvcLineNo = mobisInvcLineNo;
    }

    /**
     * @return the purcOrdNo
     */
    public String getPurcOrdNo() {
        return purcOrdNo;
    }

    /**
     * @param purcOrdNo the purcOrdNo to set
     */
    public void setPurcOrdNo(String purcOrdNo) {
        this.purcOrdNo = purcOrdNo;
    }

    /**
     * @return the purcOrdLineNo
     */
    public String getPurcOrdLineNo() {
        return purcOrdLineNo;
    }

    /**
     * @param purcOrdLineNo the purcOrdLineNo to set
     */
    public void setPurcOrdLineNo(String purcOrdLineNo) {
        this.purcOrdLineNo = purcOrdLineNo;
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
     * @return the invcQty
     */
    public Double getInvcQty() {
        return invcQty;
    }

    /**
     * @param invcQty the invcQty to set
     */
    public void setInvcQty(Double invcQty) {
        this.invcQty = invcQty;
    }

    /**
     * @return the invcUnitCd
     */
    public String getInvcUnitCd() {
        return invcUnitCd;
    }

    /**
     * @param invcUnitCd the invcUnitCd to set
     */
    public void setInvcUnitCd(String invcUnitCd) {
        this.invcUnitCd = invcUnitCd;
    }

    /**
     * @return the invcPrc
     */
    public Double getInvcPrc() {
        return invcPrc;
    }

    /**
     * @param invcPrc the invcPrc to set
     */
    public void setInvcPrc(Double invcPrc) {
        this.invcPrc = invcPrc;
    }

    /**
     * @return the invcAmt
     */
    public Double getInvcAmt() {
        return invcAmt;
    }

    /**
     * @param invcAmt the invcAmt to set
     */
    public void setInvcAmt(Double invcAmt) {
        this.invcAmt = invcAmt;
    }

    /**
     * @return the vatAmt
     */
    public Double getVatAmt() {
        return vatAmt;
    }

    /**
     * @param vatAmt the vatAmt to set
     */
    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
    }

    /**
     * @return the invcTotAmt
     */
    public Double getInvcTotAmt() {
        return invcTotAmt;
    }

    /**
     * @param invcTotAmt the invcTotAmt to set
     */
    public void setInvcTotAmt(Double invcTotAmt) {
        this.invcTotAmt = invcTotAmt;
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
     * @return the refInvcDocNo
     */
    public String getRefInvcDocNo() {
        return refInvcDocNo;
    }

    /**
     * @param refInvcDocNo the refInvcDocNo to set
     */
    public void setRefInvcDocNo(String refInvcDocNo) {
        this.refInvcDocNo = refInvcDocNo;
    }

    /**
     * @return the refInvcDocLineNo
     */
    public int getRefInvcDocLineNo() {
        return refInvcDocLineNo;
    }

    /**
     * @param refInvcDocLineNo the refInvcDocLineNo to set
     */
    public void setRefInvcDocLineNo(int refInvcDocLineNo) {
        this.refInvcDocLineNo = refInvcDocLineNo;
    }

    /**
     * @return the invcGrDt
     */
    public Date getInvcGrDt() {
        return invcGrDt;
    }

    /**
     * @param invcGrDt the invcGrDt to set
     */
    public void setInvcGrDt(Date invcGrDt) {
        this.invcGrDt = invcGrDt;
    }

    /**
     * @return the dlPdcCd
     */
    public String getDlPdcCd() {
        return dlPdcCd;
    }

    /**
     * @param dlPdcCd the dlPdcCd to set
     */
    public void setDlPdcCd(String dlPdcCd) {
        this.dlPdcCd = dlPdcCd;
    }

    /**
     * @return the purcOrdTp
     */
    public String getPurcOrdTp() {
        return purcOrdTp;
    }

    /**
     * @param purcOrdTp the purcOrdTp to set
     */
    public void setPurcOrdTp(String purcOrdTp) {
        this.purcOrdTp = purcOrdTp;
    }

    /**
     * @return the invcDt
     */
    public Date getInvcDt() {
        return invcDt;
    }

    /**
     * @param invcDt the invcDt to set
     */
    public void setInvcDt(Date invcDt) {
        this.invcDt = invcDt;
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
     * @return the grStrgeNm
     */
    public String getGrStrgeNm() {
        return grStrgeNm;
    }

    /**
     * @param grStrgeNm the grStrgeNm to set
     */
    public void setGrStrgeNm(String grStrgeNm) {
        this.grStrgeNm = grStrgeNm;
    }

    /**
     * @return the grLocCd
     */
    public String getGrLocCd() {
        return grLocCd;
    }

    /**
     * @param grLocCd the grLocCd to set
     */
    public void setGrLocCd(String grLocCd) {
        this.grLocCd = grLocCd;
    }

    /**
     * @return the grLocNm
     */
    public String getGrLocNm() {
        return grLocNm;
    }

    /**
     * @param grLocNm the grLocNm to set
     */
    public void setGrLocNm(String grLocNm) {
        this.grLocNm = grLocNm;
    }

    /**
     * @return the grQty
     */
    public Double getGrQty() {
        return grQty;
    }

    /**
     * @param grQty the grQty to set
     */
    public void setGrQty(Double grQty) {
        this.grQty = grQty;
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
     * @return the claimTargCd
     */
    public String getClaimTargCd() {
        return claimTargCd;
    }

    /**
     * @param claimTargCd the claimTargCd to set
     */
    public void setClaimTargCd(String claimTargCd) {
        this.claimTargCd = claimTargCd;
    }

    /**
     * @return the dlBpCd
     */
    public String getDlBpCd() {
        return dlBpCd;
    }

    /**
     * @param dlBpCd the dlBpCd to set
     */
    public void setDlBpCd(String dlBpCd) {
        this.dlBpCd = dlBpCd;
    }

    /**
     * @return the dlBpNm
     */
    public String getDlBpNm() {
        return dlBpNm;
    }

    /**
     * @param dlBpNm the dlBpNm to set
     */
    public void setDlBpNm(String dlBpNm) {
        this.dlBpNm = dlBpNm;
    }

    /**
     * @return the claimTp
     */
    public String getClaimTp() {
        return claimTp;
    }

    /**
     * @param claimTp the claimTp to set
     */
    public void setClaimTp(String claimTp) {
        this.claimTp = claimTp;
    }

    /**
     * @return the prevClaimQty
     */
    public Double getPrevClaimQty() {
        return prevClaimQty;
    }

    /**
     * @param prevClaimQty the prevClaimQty to set
     */
    public void setPrevClaimQty(Double prevClaimQty) {
        this.prevClaimQty = prevClaimQty;
    }

    /**
     * @return the claimQty
     */
    public Double getClaimQty() {
        return claimQty;
    }

    /**
     * @param claimQty the claimQty to set
     */
    public void setClaimQty(Double claimQty) {
        this.claimQty = claimQty;
    }

    /**
     * @return the reqCont
     */
    public String getReqCont() {
        return reqCont;
    }

    /**
     * @param reqCont the reqCont to set
     */
    public void setReqCont(String reqCont) {
        this.reqCont = reqCont;
    }

    /**
     * @return the docFileNo
     */
    public String getDocFileNo() {
        return docFileNo;
    }

    /**
     * @param docFileNo the docFileNo to set
     */
    public void setDocFileNo(String docFileNo) {
        this.docFileNo = docFileNo;
    }

    /**
     * @return the grEndYn
     */
    public String getGrEndYn() {
        return grEndYn;
    }

    /**
     * @param grEndYn the grEndYn to set
     */
    public void setGrEndYn(String grEndYn) {
        this.grEndYn = grEndYn;
    }

    /**
     * @return the invcQtyOrg
     */
    public Double getInvcQtyOrg() {
        return invcQtyOrg;
    }

    /**
     * @param invcQtyOrg the invcQtyOrg to set
     */
    public void setInvcQtyOrg(Double invcQtyOrg) {
        this.invcQtyOrg = invcQtyOrg;
    }

    /**
     * @return the purcOrdLineDetlNo
     */
    public String getPurcOrdLineDetlNo() {
        return purcOrdLineDetlNo;
    }

    /**
     * @param purcOrdLineDetlNo the purcOrdLineDetlNo to set
     */
    public void setPurcOrdLineDetlNo(String purcOrdLineDetlNo) {
        this.purcOrdLineDetlNo = purcOrdLineDetlNo;
    }

    /**
     * @return the invcTargetQty
     */
    public Double getInvcTargetQty() {
        return invcTargetQty;
    }

    /**
     * @param invcTargetQty the invcTargetQty to set
     */
    public void setInvcTargetQty(Double invcTargetQty) {
        this.invcTargetQty = invcTargetQty;
    }

    /**
     * @return the invcIncTaxPrc
     */
    public Double getInvcIncTaxPrc() {
        return invcIncTaxPrc;
    }

    /**
     * @param invcIncTaxPrc the invcIncTaxPrc to set
     */
    public void setInvcIncTaxPrc(Double invcIncTaxPrc) {
        this.invcIncTaxPrc = invcIncTaxPrc;
    }

    /**
     * @return the compareQty
     */
    public Double getCompareQty() {
        return compareQty;
    }

    /**
     * @param compareQty the compareQty to set
     */
    public void setCompareQty(Double compareQty) {
        this.compareQty = compareQty;
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
     * @return the arrvDt
     */
    public Date getArrvDt() {
        return arrvDt;
    }

    /**
     * @param arrvDt the arrvDt to set
     */
    public void setArrvDt(Date arrvDt) {
        this.arrvDt = arrvDt;
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
     * @param purcAmt the purcAmt to set
     */
    public void setPurcAmt(Double purcAmt) {
        this.purcAmt = purcAmt;
    }


    /**
     * @return the purcReqQty
     */
    public Double getPurcReqQty() {
        return purcReqQty;
    }

    /**
     * @param purcReqQty the purcReqQty to set
     */
    public void setPurcReqQty(Double purcReqQty) {
        this.purcReqQty = purcReqQty;
    }

    /**
     * @return the boxNo
     */
    public String getBoxNo() {
        return boxNo;
    }

    /**
     * @param boxNo the boxNo to set
     */
    public void setBoxNo(String boxNo) {
        this.boxNo = boxNo;
    }

    /**
     * @return the purcRegDt
     */
    public Date getPurcRegDt() {
        return purcRegDt;
    }

    /**
     * @param purcRegDt the purcRegDt to set
     */
    public void setPurcRegDt(Date purcRegDt) {
        this.purcRegDt = purcRegDt;
    }

    /**
     * @return the invcIfOrdNo
     */
    public String getInvcIfOrdNo() {
        return invcIfOrdNo;
    }

    /**
     * @param invcIfOrdNo the invcIfOrdNo to set
     */
    public void setInvcIfOrdNo(String invcIfOrdNo) {
        this.invcIfOrdNo = invcIfOrdNo;
    }

    /**
     * @return the invcIfOrdLn
     */
    public String getInvcIfOrdLn() {
        return invcIfOrdLn;
    }

    /**
     * @param invcIfOrdLn the invcIfOrdLn to set
     */
    public void setInvcIfOrdLn(String invcIfOrdLn) {
        this.invcIfOrdLn = invcIfOrdLn;
    }

    /**
     * @return the purcQty
     */
    public Double getPurcQty() {
        return purcQty;
    }

    /**
     * @param purcQty the purcQty to set
     */
    public void setPurcQty(Double purcQty) {
        this.purcQty = purcQty;
    }

    /**
     * @return the ordRegUsrId
     */
    public String getOrdRegUsrId() {
        return ordRegUsrId;
    }

    /**
     * @param ordRegUsrId the ordRegUsrId to set
     */
    public void setOrdRegUsrId(String ordRegUsrId) {
        this.ordRegUsrId = ordRegUsrId;
    }

    /**
     * @return the ordRegUsrNm
     */
    public String getOrdRegUsrNm() {
        return ordRegUsrNm;
    }

    /**
     * @param ordRegUsrNm the ordRegUsrNm to set
     */
    public void setOrdRegUsrNm(String ordRegUsrNm) {
        this.ordRegUsrNm = ordRegUsrNm;
    }

    /**
     * @return the invcTp
     */
    public String getInvcTp() {
        return invcTp;
    }

    /**
     * @param invcTp the invcTp to set
     */
    public void setInvcTp(String invcTp) {
        this.invcTp = invcTp;
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
     * @return the bmpOrdNo
     */
    public String getBmpOrdNo() {
        return bmpOrdNo;
    }

    /**
     * @param bmpOrdNo the bmpOrdNo to set
     */
    public void setBmpOrdNo(String bmpOrdNo) {
        this.bmpOrdNo = bmpOrdNo;
    }

    /**
     * @return the bmpOrdLineNo
     */
    public String getBmpOrdLineNo() {
        return bmpOrdLineNo;
    }

    /**
     * @param bmpOrdLineNo the bmpOrdLineNo to set
     */
    public void setBmpOrdLineNo(String bmpOrdLineNo) {
        this.bmpOrdLineNo = bmpOrdLineNo;
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
     * @return the grTotAmt
     */
    public Double getGrTotAmt() {
        return grTotAmt;
    }

    /**
     * @param grTotAmt the grTotAmt to set
     */
    public void setGrTotAmt(Double grTotAmt) {
        this.grTotAmt = grTotAmt;
    }

    /**
     * @return the grTaxDdctAmt
     */
    public Double getGrTaxDdctAmt() {
        return grTaxDdctAmt;
    }

    /**
     * @param grTaxDdctAmt the grTaxDdctAmt to set
     */
    public void setGrTaxDdctAmt(Double grTaxDdctAmt) {
        this.grTaxDdctAmt = grTaxDdctAmt;
    }

    /**
     * @return the spyrCd
     */
    public String getSpyrCd() {
        return spyrCd;
    }

    /**
     * @param spyrCd the spyrCd to set
     */
    public void setSpyrCd(String spyrCd) {
        this.spyrCd = spyrCd;
    }

    /**
     * @return the reqUsrId
     */
    public String getReqUsrId() {
        return reqUsrId;
    }

    /**
     * @param reqUsrId the reqUsrId to set
     */
    public void setReqUsrId(String reqUsrId) {
        this.reqUsrId = reqUsrId;
    }

    /**
     * @return the reqUsrNm
     */
    public String getReqUsrNm() {
        return reqUsrNm;
    }

    /**
     * @param reqUsrNm the reqUsrNm to set
     */
    public void setReqUsrNm(String reqUsrNm) {
        this.reqUsrNm = reqUsrNm;
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
     * @return the excelTaxDdctPrc
     */
    public String getExcelTaxDdctPrc() {
        return excelTaxDdctPrc;
    }

    /**
     * @param excelTaxDdctPrc the excelTaxDdctPrc to set
     */
    public void setExcelTaxDdctPrc(String excelTaxDdctPrc) {
        this.excelTaxDdctPrc = excelTaxDdctPrc;
    }

    /**
     * @return the excelStrgeCd
     */
    public String getExcelStrgeCd() {
        return excelStrgeCd;
    }

    /**
     * @param excelStrgeCd the excelStrgeCd to set
     */
    public void setExcelStrgeCd(String excelStrgeCd) {
        this.excelStrgeCd = excelStrgeCd;
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
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;   //부품번호
                case 1:this.setExcelQty(ExcelDataBinderUtil.toString(value).trim()); break;     //입고수량
                case 2:this.setExcelPrc(ExcelDataBinderUtil.toString(value).trim()); break;     //입고단가
                case 3:this.setExcelTaxDdctPrc(ExcelDataBinderUtil.toString(value).trim()); break;     //입고세전단가
                case 4:this.setExcelStrgeCd(ExcelDataBinderUtil.toString(value).trim()); break;     //입고창고
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
                            messageSource.getMessage("par.lbl.grQty", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
        }else{

            //입고단가
            if(NumberUtils.isNumber(this.getExcelQty())){
                if(NumberUtils.toDouble(this.getExcelQty()) <= 0){
                    String msg = messageSource.getMessage(
                        "par.info.itemReqZeroCntMsg"
                        , new String[]{
                                messageSource.getMessage("par.lbl.grQty", null, LocaleContextHolder.getLocale())
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
                                messageSource.getMessage("par.lbl.grQty", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
            }
        }

        //세전단가, 세후 단가 전부 값이 없을 때
        if(StringUtils.isBlank(this.getExcelPrc()) && StringUtils.isBlank(this.getExcelTaxDdctPrc()) ){
            String msg = messageSource.getMessage(
                    "global.info.emptyParamInfo"
                    , new String[]{
                            messageSource.getMessage("par.lbl.grItemPrice", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
            );
            this.setExcelPrc("-999");
            this.setExcelTaxDdctPrc("-999");
            errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelPrc()), msg));
        //세전단가, 세후 단가 전부 값이 있을 때
        }else if(StringUtils.isNoneBlank(this.getExcelPrc()) && StringUtils.isNoneBlank(this.getExcelTaxDdctPrc()) ){
            String msg = messageSource.getMessage(
                    "global.info.itemOnlyMsg"
                    , new String[]{
                            messageSource.getMessage("par.lbl.grItemPrice", null, LocaleContextHolder.getLocale())
                           ,messageSource.getMessage("par.lbl.grItemPriceTax", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelPrc()), msg));
        }else{

            //입고단가
            if(StringUtils.isNoneBlank(this.getExcelPrc())){
                if(NumberUtils.isNumber(this.getExcelPrc())){
                    if(NumberUtils.toDouble(this.getExcelPrc()) <= 0){
                        if(!this.getExcelPrc().equals(-999)){
                            String msg = messageSource.getMessage(
                                    "par.info.itemReqZeroCntMsg"
                                    , new String[]{
                                            messageSource.getMessage("par.lbl.grItemPrice", null, LocaleContextHolder.getLocale())
                                            ,"0"
                                    }
                                    , LocaleContextHolder.getLocale()
                            );

                            errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelPrc()), msg));
                        }
                    }
                }else{
                    String msg = messageSource.getMessage(
                            "global.err.checkQtyParam"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.grItemPrice", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelPrc()), msg));
                }

                this.setExcelTaxDdctPrc("-999");
            }

            //입고단가(세전)
            else if(StringUtils.isNoneBlank(this.getExcelTaxDdctPrc())){
                  if(NumberUtils.isNumber(this.getExcelTaxDdctPrc())){
                      if(NumberUtils.toDouble(this.getExcelTaxDdctPrc()) <= 0){
                          if(!this.getExcelTaxDdctPrc().equals(-999)){
                              String msg = messageSource.getMessage(
                                      "par.info.itemReqZeroCntMsg"
                                      , new String[]{
                                              messageSource.getMessage("par.lbl.grItemPriceTax", null, LocaleContextHolder.getLocale())
                                              ,"0"
                                      }
                                      , LocaleContextHolder.getLocale()
                              );

                              errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelTaxDdctPrc()), msg));
                          }

                      }
                  }else{
                      String msg = messageSource.getMessage(
                              "global.err.checkQtyParam"
                              , new String[]{
                                      messageSource.getMessage("par.lbl.grItemPriceTax", null, LocaleContextHolder.getLocale())
                              }
                              , LocaleContextHolder.getLocale()
                      );

                      errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelTaxDdctPrc()), msg));
                  }

                  this.setExcelPrc("-999");
              }
        }
        return errors;
    }
}
