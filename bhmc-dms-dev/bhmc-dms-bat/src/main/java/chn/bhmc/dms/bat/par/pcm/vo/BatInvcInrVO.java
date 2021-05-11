package chn.bhmc.dms.bat.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * BatchInvoiceInterface VO
 *
 * @ClassName   : BatInvcInrVO.java
 * @Description : BatInvcInrVO Class
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

public class BatInvcInrVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8370899333289506697L;

    /**
     * dealer code
     **/
    @NotEmpty
    private String inrDlrCd;

    /**
     * invoice no
     **/
    @NotEmpty
    private String inrInvNo;

    /**
     * invoice date
     **/
    private String inrInvDt;

    /**
     * out box count
     **/
    private int inrInvCseCnt;

    /**
     * out box CBM
     **/
    private Double inrCbm;

    /**
     * total line no
     **/
    private int inrInvItm;

    /**
     * supplier code
     **/
    private String inrVnd;

    /**
     * transporter code
     **/
    private String inrTspCode;

    /**
     * TR NO
     **/
    private String inrGcnBlNo;

    /**
     * truck no
     **/
    private String inrTnCnNo;

    /**
     * invoice quantity
     **/
    private int inrInvQt;

    /**
     * inv_amt_cur
     **/
    private Double inrInvAmtCur;

    /**
     * sales tax
     **/
    private Double inrTaxTot;

    /**
     * invoice amount
     **/
    private Double inrAmtTot;

    /**
     * gross weight
     **/
    private Double inrGwg;

    /**
     * net_weight_item
     **/
    private Double inrNetWgi;

    /**
     * net_weight_case
     **/
    private int inrNetWgc;

    /**
     * order no
     **/
    @NotEmpty
    private String inrOrdNo;

    /**
     * line no
     **/
    @NotEmpty
    private String inrOrdLn;

    /**
     * line suffix
     **/
    @NotEmpty
    private String inrOrdSf;

    /**
     * out box no
     **/
    @NotEmpty
    private String inrCseNo;

    /**
     * PDC CODE
     **/
    private String inrPdc;

    /**
     * dealer PO NO
     **/
    private String inrDlrOrdNo;

    /**
     * PART NO
     **/
    private String inrSupPno;

    /**
     * UNIT PRICE(MAT)
     **/
    private Double inrUpceMat;

    /**
     * sales tax
     **/
    private Double inrUpceTax;

    /**
     * Matetial Value Amount
     **/
    private Double inrAmtMat;

    /**
     * TAX Amount
     **/
    private Double inrAmtTax;

    /**
     * 인터페이스결과코드
     **/
    private String ifresult;

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
    private Date ifRegDt;

    /**
     * 배치상태코드
     **/
    private String batStatCd;

    /**
     * 배치결과일자
     **/
    private Date batRsltCd;

    /**
     * 배치메세지내용
     **/
    private String batMesgCont;

    /**
     * Invoice Quantity
     **/
    private int inrSumQt;

    /**
     * @return the inrDlrCd
     */
    public String getInrDlrCd() {
        return inrDlrCd;
    }

    /**
     * @param inrDlrCd the inrDlrCd to set
     */
    public void setInrDlrCd(String inrDlrCd) {
        this.inrDlrCd = inrDlrCd;
    }

    /**
     * @return the inrInvNo
     */
    public String getInrInvNo() {
        return inrInvNo;
    }

    /**
     * @param inrInvNo the inrInvNo to set
     */
    public void setInrInvNo(String inrInvNo) {
        this.inrInvNo = inrInvNo;
    }

    /**
     * @return the inrInvDt
     */
    public String getInrInvDt() {
        return inrInvDt;
    }

    /**
     * @param inrInvDt the inrInvDt to set
     */
    public void setInrInvDt(String inrInvDt) {
        this.inrInvDt = inrInvDt;
    }

    /**
     * @return the inrInvCseCnt
     */
    public int getInrInvCseCnt() {
        return inrInvCseCnt;
    }

    /**
     * @param inrInvCseCnt the inrInvCseCnt to set
     */
    public void setInrInvCseCnt(int inrInvCseCnt) {
        this.inrInvCseCnt = inrInvCseCnt;
    }

    /**
     * @return the inrCbm
     */
    public Double getInrCbm() {
        return inrCbm;
    }

    /**
     * @param inrCbm the inrCbm to set
     */
    public void setInrCbm(Double inrCbm) {
        this.inrCbm = inrCbm;
    }

    /**
     * @return the inrInvItm
     */
    public int getInrInvItm() {
        return inrInvItm;
    }

    /**
     * @param inrInvItm the inrInvItm to set
     */
    public void setInrInvItm(int inrInvItm) {
        this.inrInvItm = inrInvItm;
    }

    /**
     * @return the inrVnd
     */
    public String getInrVnd() {
        return inrVnd;
    }

    /**
     * @param inrVnd the inrVnd to set
     */
    public void setInrVnd(String inrVnd) {
        this.inrVnd = inrVnd;
    }

    /**
     * @return the inrTspCode
     */
    public String getInrTspCode() {
        return inrTspCode;
    }

    /**
     * @param inrTspCode the inrTspCode to set
     */
    public void setInrTspCode(String inrTspCode) {
        this.inrTspCode = inrTspCode;
    }

    /**
     * @return the inrGcnBlNo
     */
    public String getInrGcnBlNo() {
        return inrGcnBlNo;
    }

    /**
     * @param inrGcnBlNo the inrGcnBlNo to set
     */
    public void setInrGcnBlNo(String inrGcnBlNo) {
        this.inrGcnBlNo = inrGcnBlNo;
    }

    /**
     * @return the inrTnCnNo
     */
    public String getInrTnCnNo() {
        return inrTnCnNo;
    }

    /**
     * @param inrTnCnNo the inrTnCnNo to set
     */
    public void setInrTnCnNo(String inrTnCnNo) {
        this.inrTnCnNo = inrTnCnNo;
    }

    /**
     * @return the inrInvQt
     */
    public int getInrInvQt() {
        return inrInvQt;
    }

    /**
     * @param inrInvQt the inrInvQt to set
     */
    public void setInrInvQt(int inrInvQt) {
        this.inrInvQt = inrInvQt;
    }

    /**
     * @return the inrInvAmtCur
     */
    public Double getInrInvAmtCur() {
        return inrInvAmtCur;
    }

    /**
     * @param inrInvAmtCur the inrInvAmtCur to set
     */
    public void setInrInvAmtCur(Double inrInvAmtCur) {
        this.inrInvAmtCur = inrInvAmtCur;
    }

    /**
     * @return the inrTaxTot
     */
    public Double getInrTaxTot() {
        return inrTaxTot;
    }

    /**
     * @param inrTaxTot the inrTaxTot to set
     */
    public void setInrTaxTot(Double inrTaxTot) {
        this.inrTaxTot = inrTaxTot;
    }

    /**
     * @return the inrAmtTot
     */
    public Double getInrAmtTot() {
        return inrAmtTot;
    }

    /**
     * @param inrAmtTot the inrAmtTot to set
     */
    public void setInrAmtTot(Double inrAmtTot) {
        this.inrAmtTot = inrAmtTot;
    }

    /**
     * @return the inrGwg
     */
    public Double getInrGwg() {
        return inrGwg;
    }

    /**
     * @param inrGwg the inrGwg to set
     */
    public void setInrGwg(Double inrGwg) {
        this.inrGwg = inrGwg;
    }

    /**
     * @return the inrNetWgi
     */
    public Double getInrNetWgi() {
        return inrNetWgi;
    }

    /**
     * @param inrNetWgi the inrNetWgi to set
     */
    public void setInrNetWgi(Double inrNetWgi) {
        this.inrNetWgi = inrNetWgi;
    }

    /**
     * @return the inrNetWgc
     */
    public int getInrNetWgc() {
        return inrNetWgc;
    }

    /**
     * @param inrNetWgc the inrNetWgc to set
     */
    public void setInrNetWgc(int inrNetWgc) {
        this.inrNetWgc = inrNetWgc;
    }

    /**
     * @return the inrOrdNo
     */
    public String getInrOrdNo() {
        return inrOrdNo;
    }

    /**
     * @param inrOrdNo the inrOrdNo to set
     */
    public void setInrOrdNo(String inrOrdNo) {
        this.inrOrdNo = inrOrdNo;
    }

    /**
     * @return the inrOrdLn
     */
    public String getInrOrdLn() {
        return inrOrdLn;
    }

    /**
     * @param inrOrdLn the inrOrdLn to set
     */
    public void setInrOrdLn(String inrOrdLn) {
        this.inrOrdLn = inrOrdLn;
    }

    /**
     * @return the inrOrdSf
     */
    public String getInrOrdSf() {
        return inrOrdSf;
    }

    /**
     * @param inrOrdSf the inrOrdSf to set
     */
    public void setInrOrdSf(String inrOrdSf) {
        this.inrOrdSf = inrOrdSf;
    }

    /**
     * @return the inrCseNo
     */
    public String getInrCseNo() {
        return inrCseNo;
    }

    /**
     * @param inrCseNo the inrCseNo to set
     */
    public void setInrCseNo(String inrCseNo) {
        this.inrCseNo = inrCseNo;
    }

    /**
     * @return the inrPdc
     */
    public String getInrPdc() {
        return inrPdc;
    }

    /**
     * @param inrPdc the inrPdc to set
     */
    public void setInrPdc(String inrPdc) {
        this.inrPdc = inrPdc;
    }

    /**
     * @return the inrDlrOrdNo
     */
    public String getInrDlrOrdNo() {
        return inrDlrOrdNo;
    }

    /**
     * @param inrDlrOrdNo the inrDlrOrdNo to set
     */
    public void setInrDlrOrdNo(String inrDlrOrdNo) {
        this.inrDlrOrdNo = inrDlrOrdNo;
    }

    /**
     * @return the inrSupPno
     */
    public String getInrSupPno() {
        return inrSupPno;
    }

    /**
     * @param inrSupPno the inrSupPno to set
     */
    public void setInrSupPno(String inrSupPno) {
        this.inrSupPno = inrSupPno;
    }

    /**
     * @return the inrUpceMat
     */
    public Double getInrUpceMat() {
        return inrUpceMat;
    }

    /**
     * @param inrUpceMat the inrUpceMat to set
     */
    public void setInrUpceMat(Double inrUpceMat) {
        this.inrUpceMat = inrUpceMat;
    }

    /**
     * @return the inrUpceTax
     */
    public Double getInrUpceTax() {
        return inrUpceTax;
    }

    /**
     * @param inrUpceTax the inrUpceTax to set
     */
    public void setInrUpceTax(Double inrUpceTax) {
        this.inrUpceTax = inrUpceTax;
    }

    /**
     * @return the inrAmtMat
     */
    public Double getInrAmtMat() {
        return inrAmtMat;
    }

    /**
     * @param inrAmtMat the inrAmtMat to set
     */
    public void setInrAmtMat(Double inrAmtMat) {
        this.inrAmtMat = inrAmtMat;
    }

    /**
     * @return the inrAmtTax
     */
    public Double getInrAmtTax() {
        return inrAmtTax;
    }

    /**
     * @param inrAmtTax the inrAmtTax to set
     */
    public void setInrAmtTax(Double inrAmtTax) {
        this.inrAmtTax = inrAmtTax;
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
     * @return the batRsltCd
     */
    public Date getBatRsltCd() {
        return batRsltCd;
    }

    /**
     * @param batRsltCd the batRsltCd to set
     */
    public void setBatRsltCd(Date batRsltCd) {
        this.batRsltCd = batRsltCd;
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

    /**
     * @return the inrSumQt
     */
    public int getInrSumQt() {
        return inrSumQt;
    }

    /**
     * @param inrSumQt the inrSumQt to set
     */
    public void setInrSumQt(int inrSumQt) {
        this.inrSumQt = inrSumQt;
    }
}
