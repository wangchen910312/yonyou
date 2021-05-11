package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimVO.java
 * @Description : ClaimVO.class
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


public class ClaimVO extends BaseVO{

     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2828539812288053295L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 클레임문서번호
     **/
    private String claimDocNo;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 거래처코드
     **/
    private String bpCd;

    /**
     * 거래처명
     **/
    private String bpNm;

    /**
     * 송장일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 로케이션
     **/
    private String locCd;

    /**
     * 창고
     **/
    private String strgeCd;

    /**
     * 클레임상태코드
     **/
    private String claimStatCd;

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
     * 요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;

    /**
     * 승인일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date approveDt;

    /**
     * 완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 판정결과내용
     **/
    private String judgRsltCont;

    /**
     * 결재의견내용
     **/
    private String signOpnCont;

    /**
     * 삭제여부
     **/
    private String delYn;

    /**
     * 클레임유형
     **/
    private String claimTp;

    /**
     * 처리유형
     **/
    private String procTp;

    /**
     * 품목번호
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 클레임수량
     **/
    private Double claimQty;

    /**
     * 클레임단위코드
     **/
    private String claimUnitCd;

    /**
     * 단가
     **/
    private Double prc;

    /**
     * 금액
     **/
    private Double amt;

    /**
     * 송장수량
     **/
    private Double invcQty;

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
     * 송장문서번호
     **/
    private String invcDocNo;

    /**
     * 송장문서라인번호
     **/
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
     * 구매오더정보
     **/
    private String purcOrdNo;

    /**
     * 구매오더라인번호
     **/
    private int purcOrdLineNo;

    /**
     * 문서파일번호
     **/
    private String docFileNo;

    /**
     * 요청내용
     **/
    private String reqCont;

    /**
     * 수불문서년월일자
     **/
    private String mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    private String mvtDocNo;

    /**
     * 수불문서라인번호
     **/
    private int mvrDocLineNo;

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
     * @return the claimDocNo
     */
    public String getClaimDocNo() {
        return claimDocNo;
    }

    /**
     * @param claimDocNo the claimDocNo to set
     */
    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
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
     * @return the claimStatCd
     */
    public String getClaimStatCd() {
        return claimStatCd;
    }

    /**
     * @param claimStatCd the claimStatCd to set
     */
    public void setClaimStatCd(String claimStatCd) {
        this.claimStatCd = claimStatCd;
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
     * @return the reqDt
     */
    public Date getReqDt() {
        return reqDt;
    }

    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }

    /**
     * @return the approveDt
     */
    public Date getApproveDt() {
        return approveDt;
    }

    /**
     * @param approveDt the approveDt to set
     */
    public void setApproveDt(Date approveDt) {
        this.approveDt = approveDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
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
     * @return the judgRsltCont
     */
    public String getJudgRsltCont() {
        return judgRsltCont;
    }

    /**
     * @param judgRsltCont the judgRsltCont to set
     */
    public void setJudgRsltCont(String judgRsltCont) {
        this.judgRsltCont = judgRsltCont;
    }

    /**
     * @return the signOpnCont
     */
    public String getSignOpnCont() {
        return signOpnCont;
    }

    /**
     * @param signOpnCont the signOpnCont to set
     */
    public void setSignOpnCont(String signOpnCont) {
        this.signOpnCont = signOpnCont;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
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
     * @return the procTp
     */
    public String getProcTp() {
        return procTp;
    }

    /**
     * @param procTp the procTp to set
     */
    public void setProcTp(String procTp) {
        this.procTp = procTp;
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
     * @return the claimUnitCd
     */
    public String getClaimUnitCd() {
        return claimUnitCd;
    }

    /**
     * @param claimUnitCd the claimUnitCd to set
     */
    public void setClaimUnitCd(String claimUnitCd) {
        this.claimUnitCd = claimUnitCd;
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
     * @return the mvrDocLineNo
     */
    public int getMvrDocLineNo() {
        return mvrDocLineNo;
    }

    /**
     * @param mvrDocLineNo the mvrDocLineNo to set
     */
    public void setMvrDocLineNo(int mvrDocLineNo) {
        this.mvrDocLineNo = mvrDocLineNo;
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
    public int getPurcOrdLineNo() {
        return purcOrdLineNo;
    }

    /**
     * @param purcOrdLineNo the purcOrdLineNo to set
     */
    public void setPurcOrdLineNo(int purcOrdLineNo) {
        this.purcOrdLineNo = purcOrdLineNo;
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
}
