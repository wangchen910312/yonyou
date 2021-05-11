package chn.bhmc.dms.par.pcm.vo;

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
 * @ClassName   : PurcOrdVO.java
 * @Description : PurcOrdVO.class
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
    ,@ValidField(field="invcTp", mesgKey="par.lbl.invcTp")
    ,@ValidField(field="invcDstinCd", mesgKey="par.lbl.invcDstinCd")
    ,@ValidField(field="invcStatCd", mesgKey="par.lbl.invcStatCd")
    ,@ValidField(field="invcDt", mesgKey="par.lbl.invcDt")
    ,@ValidField(field="arrvDt", mesgKey="par.lbl.arrvDt")
    ,@ValidField(field="confirmDt", mesgKey="par.lbl.confirmDt")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="mobisInvcNo", mesgKey="par.lbl.mobisInvcNo")
    ,@ValidField(field="currCd", mesgKey="par.lbl.currency")
    ,@ValidField(field="invcTotAmt", mesgKey="par.lbl.invcTotAmt")
    ,@ValidField(field="vatCd", mesgKey="par.lbl.vatCd")
    ,@ValidField(field="vatAmt", mesgKey="par.lbl.vatAmt")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
    ,@ValidField(field="cancYn", mesgKey="par.lbl.cancYn")
})
public class InvcVO extends BaseVO{

     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2828539812288053295L;

    /**
     * 저장 성공실패 여부
     **/
    private boolean resultYn;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 송장문서번호
     **/
    private String invcDocNo;

    /**
     * 입고문서번호
     **/
    private String grDocNo;

    /**
     * 입고문서 업무구분
     */
    private String grDocTp;

    /**
     * 송장유형
     **/
    private String invcTp;

    /**
     * 송장구분코드
     **/
    private String invcDstinCd;

    /**
     * 송장상태코드
     **/
    private String invcStatCd;

    /**
     * 운송유형
     **/
    private String trsfTp;

    /**
     * 공급처유형
     **/
    private String bpTp;

    /**
     * 송장일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 도착일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arrvDt;

    /**
     * 도착일자CHAR
     **/
    private String arrvDtChar;

    /**
     * 도착일자 시간CHAR
     **/
    private String arrvTmChar;

    /**
     * 등록일자CHAR
     **/
    private String regDtChar;

    /**
     * 확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmDt;

    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcGrDt;

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
     * 모비스송장번호
     **/
    private String mobisInvcNo;

    /**
     * 구매오더번호
     **/
    private String purcOrdNo;

    /**
     * 통화코드
     **/
    private String currCd;

    /**
     * 송장총금액
     **/
    private Double invcTotAmt;

    /**
     * 전송금액
     **/
    private Double trsfAmt;

    /**
     * 보험비
     **/
    private Double incAmt;

    /**
     * 부가세코드
     **/
    private String vatCd;

    /**
     * 부가세금액
     **/
    private Double vatAmt;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 취소여부
     **/
    private String cancYn;

    /**
     * 인터페이스여부
     **/
    private String ifYn;

    /**
     * 부품건수
     **/
    private Double itemCnt;

    /**
     * 세금포함 구매금액
     **/
    private Double purcIncTaxAmt;

    /**
     * 구매금액
     **/
    private Double purcAmt;

    /**
     * 부품수량
     **/
    private Double itemQty;

    /**
     * out box count
     **/
    private Double invcCseCnt;

    /**
     * out box CBM
     **/
    private Double invcCbm;

    /**
     * total line no
     **/
    private Double invcTotalLine;

    /**
     * transporter code(물류회사)
     **/
    private String invcTspCode;

    /**
     * TR NO
     **/
    private String invcGcnBlNo;

    /**
     * truck no
     **/
    private String invcTnCnNo;


    /**
     * Invoice Quantity
     **/
    private Double invcSumQt;

    /**
     * 송장 부가세 제외 금액
     **/
    private Double invcAmtCur;

    /**
     * 입고수량
     **/
    private Double grTotQty;

    /**
     * 클레임수량
     **/
    private Double claimTotQty;

    /**
     * 입고금액
     **/
    private Double grIncTaxAmt;

    /**
     * 입고금액(부가세 제외)
     **/
    private Double grAmt;

    /**
     * 입고총금액
     **/
    private Double grTotIncTaxAmt;

    /**
     * 입고총금액(부가세 제외)
     **/
    private Double grTotAmt;

    /**
     * 할인율
     **/
    private Double dcRate;


    /**
     * 구매신청자
     **/
    private String regUsrId;

    /**
     * 구매신청자명
     **/
    private String regUsrNm;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private String updtDtStr;

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
     * @return the invcDstinCd
     */
    public String getInvcDstinCd() {
        return invcDstinCd;
    }

    /**
     * @param invcDstinCd the invcDstinCd to set
     */
    public void setInvcDstinCd(String invcDstinCd) {
        this.invcDstinCd = invcDstinCd;
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
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }

    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
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
     * @return the vatCd
     */
    public String getVatCd() {
        return vatCd;
    }

    /**
     * @param vatCd the vatCd to set
     */
    public void setVatCd(String vatCd) {
        this.vatCd = vatCd;
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
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }

    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
    }

    /**
     * @param ifYn the ifYn to set
     */
    public void setIfYn(String ifYn) {
        this.ifYn = ifYn;
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
     * @return the itemCnt
     */
    public Double getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(Double itemCnt) {
        this.itemCnt = itemCnt;
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
     * @return the ifYn
     */
    public String getIfYn() {
        return ifYn;
    }

    /**
     * @return the purcIncTaxAmt
     */
    public Double getPurcIncTaxAmt() {
        return purcIncTaxAmt;
    }

    /**
     * @param purcIncTaxAmt the purcIncTaxAmt to set
     */
    public void setPurcIncTaxAmt(Double purcIncTaxAmt) {
        this.purcIncTaxAmt = purcIncTaxAmt;
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
     * @return the invcCseCnt
     */
    public Double getInvcCseCnt() {
        return invcCseCnt;
    }

    /**
     * @param invcCseCnt the invcCseCnt to set
     */
    public void setInvcCseCnt(Double invcCseCnt) {
        this.invcCseCnt = invcCseCnt;
    }

    /**
     * @return the invcCbm
     */
    public Double getInvcCbm() {
        return invcCbm;
    }

    /**
     * @param invcCbm the invcCbm to set
     */
    public void setInvcCbm(Double invcCbm) {
        this.invcCbm = invcCbm;
    }

    /**
     * @return the invcTotalLine
     */
    public Double getInvcTotalLine() {
        return invcTotalLine;
    }

    /**
     * @param invcTotalLine the invcTotalLine to set
     */
    public void setInvcTotalLine(Double invcTotalLine) {
        this.invcTotalLine = invcTotalLine;
    }

    /**
     * @return the invcTspCode
     */
    public String getInvcTspCode() {
        return invcTspCode;
    }

    /**
     * @param invcTspCode the invcTspCode to set
     */
    public void setInvcTspCode(String invcTspCode) {
        this.invcTspCode = invcTspCode;
    }

    /**
     * @return the invcGcnBlNo
     */
    public String getInvcGcnBlNo() {
        return invcGcnBlNo;
    }

    /**
     * @param invcGcnBlNo the invcGcnBlNo to set
     */
    public void setInvcGcnBlNo(String invcGcnBlNo) {
        this.invcGcnBlNo = invcGcnBlNo;
    }

    /**
     * @return the invcTnCnNo
     */
    public String getInvcTnCnNo() {
        return invcTnCnNo;
    }

    /**
     * @param invcTnCnNo the invcTnCnNo to set
     */
    public void setInvcTnCnNo(String invcTnCnNo) {
        this.invcTnCnNo = invcTnCnNo;
    }

    /**
     * @return the invcSumQt
     */
    public Double getInvcSumQt() {
        return invcSumQt;
    }

    /**
     * @param invcSumQt the invcSumQt to set
     */
    public void setInvcSumQt(Double invcSumQt) {
        this.invcSumQt = invcSumQt;
    }

    /**
     * @return the invcAmtCur
     */
    public Double getInvcAmtCur() {
        return invcAmtCur;
    }

    /**
     * @param invcAmtCur the invcAmtCur to set
     */
    public void setInvcAmtCur(Double invcAmtCur) {
        this.invcAmtCur = invcAmtCur;
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
     * @return the grTotIncTaxAmt
     */
    public Double getGrTotIncTaxAmt() {
        return grTotIncTaxAmt;
    }

    /**
     * @param grTotIncTaxAmt the grTotIncTaxAmt to set
     */
    public void setGrTotIncTaxAmt(Double grTotIncTaxAmt) {
        this.grTotIncTaxAmt = grTotIncTaxAmt;
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
     * @return the grIncTaxAmt
     */
    public Double getGrIncTaxAmt() {
        return grIncTaxAmt;
    }

    /**
     * @param grIncTaxAmt the grIncTaxAmt to set
     */
    public void setGrIncTaxAmt(Double grIncTaxAmt) {
        this.grIncTaxAmt = grIncTaxAmt;
    }

    /**
     * @return the grAmt
     */
    public Double getGrAmt() {
        return grAmt;
    }

    /**
     * @param grAmt the grAmt to set
     */
    public void setGrAmt(Double grAmt) {
        this.grAmt = grAmt;
    }

    /**
     * @return the arrvDtChar
     */
    public String getArrvDtChar() {
        return arrvDtChar;
    }

    /**
     * @param arrvDtChar the arrvDtChar to set
     */
    public void setArrvDtChar(String arrvDtChar) {
        this.arrvDtChar = arrvDtChar;
    }

    /**
     * @return the arrvTmChar
     */
    public String getArrvTmChar() {
        return arrvTmChar;
    }

    /**
     * @param arrvTmChar the arrvTmChar to set
     */
    public void setArrvTmChar(String arrvTmChar) {
        this.arrvTmChar = arrvTmChar;
    }

    /**
     * @return the regDtChar
     */
    public String getRegDtChar() {
        return regDtChar;
    }

    /**
     * @param regDtChar the regDtChar to set
     */
    public void setRegDtChar(String regDtChar) {
        this.regDtChar = regDtChar;
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
     * @return the grDocTp
     */
    public String getGrDocTp() {
        return grDocTp;
    }

    /**
     * @param grDocTp the grDocTp to set
     */
    public void setGrDocTp(String grDocTp) {
        this.grDocTp = grDocTp;
    }

    /**
     * @return the grTotQty
     */
    public Double getGrTotQty() {
        return grTotQty;
    }

    /**
     * @param grTotQty the grTotQty to set
     */
    public void setGrTotQty(Double grTotQty) {
        this.grTotQty = grTotQty;
    }

    /**
     * @return the claimTotQty
     */
    public Double getClaimTotQty() {
        return claimTotQty;
    }

    /**
     * @param claimTotQty the claimTotQty to set
     */
    public void setClaimTotQty(Double claimTotQty) {
        this.claimTotQty = claimTotQty;
    }

    /**
     * @return the trsfAmt
     */
    public Double getTrsfAmt() {
        return trsfAmt;
    }

    /**
     * @param trsfAmt the trsfAmt to set
     */
    public void setTrsfAmt(Double trsfAmt) {
        this.trsfAmt = trsfAmt;
    }

    /**
     * @return the incAmt
     */
    public Double getIncAmt() {
        return incAmt;
    }

    /**
     * @param incAmt the incAmt to set
     */
    public void setIncAmt(Double incAmt) {
        this.incAmt = incAmt;
    }

    /**
     * @return the trsfTp
     */
    public String getTrsfTp() {
        return trsfTp;
    }

    /**
     * @param trsfTp the trsfTp to set
     */
    public void setTrsfTp(String trsfTp) {
        this.trsfTp = trsfTp;
    }

    /**
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
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
}
