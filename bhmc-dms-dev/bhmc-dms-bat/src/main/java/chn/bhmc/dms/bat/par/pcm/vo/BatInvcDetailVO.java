package chn.bhmc.dms.bat.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatInvcDetailVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim     최초 생성
 * </pre>
 */
public class BatInvcDetailVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2608140687702847970L;

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
     * 송장수량
     **/
    private Double invcQty;

    /**
     * 송장원본수량(구매수량)
     **/
    private Double invcQtyOrg;

    /**
     * 송장단위코드
     **/
    private String invcUnitCd;

    /**
     * 송장단가
     **/
    private Double invcPrc;

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
     * 기 클레임수량
     **/
    private Double prevClaimQty;

    /**
     * 클레임수량
     **/
    private Double claimQty;

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
}
