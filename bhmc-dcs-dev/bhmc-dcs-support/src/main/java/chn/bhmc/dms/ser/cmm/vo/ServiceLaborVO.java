package chn.bhmc.dms.ser.cmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;


public class ServiceLaborVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5484193064778881931L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * PREFIX ID
     **/
    @NotEmpty
    private String preFixId;

    /**
     * 문서번호
     **/
    @NotEmpty
    private String docNo;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
     * RO유형
     **/
    //RO_TP
    private String roTp;

    /**
     * 공임코드
     **/
    //LBR_CD
    private String lbrCd;

    /**
     * 공임명
     **/
    //LBR_NM
    private String lbrNm;

    /**
     * 패키지품목코드
     **/
    //PKG_ITEM_CD
    private String pkgItemCd;

    /**
     * 공임유형
     **/
    //LBR_TP
    private String lbrTp;

    /**
     * 공임단가
     **/
    //LBR_PRC
    private Double lbrPrc;

    /**
     * 공임수량
     **/
    //LBR_QTY
    private Double lbrQty;

    /**
     * 공임시간
     **/
    //LBR_HM
    private Double lbrHm;

    /**
     * 배분시간
     **/
    //DSTB_HM
    private Double dstbHm;

    /**
     * 할인금액
     **/
    //DC_AMT
    private Double dcAmt;

    /**
     * 할인율
     **/
    //DC_RATE
    private Double dcRate;

    /**
     * 공임합계금액
     **/
    //LBR_TOT_AMT
    private Double lbrTotAmt;

    /**
     * 캠페인리콜번호
     **/
    //CR_NO
    private String crNo;

    /**
     * 캠페인리콜명
     **/
    //CR_NM
    private String crNm;

    /**
     * 캠페인리콜유형
     **/
    //CR_TP
    private String crTp;

    /**
     * FMS쿠폰품목코드
     **/
    //FMS_CUPN_ITEM_CD
    private String fmsCupnItemCd;

    /**
     * FMS품목코드
     **/
    //FMS_ITEM_CD
    private String fmsItemCd;

    /**
     * 외주거래처코드
     **/
    //SUB_BP_CD
    private String subBpCd;

    /**
     * 외주거래처명
     **/
    //SUB_BP_NM
    private String subBpNm;

    /**
     * 지불회사명
     **/
    //PAY_CMP_NM
    private String payCmpNm;

    /**
     * 결제자유형
     **/
    //PAYM_TP
    private String paymTp;

    /**
     * 결제자명
     **/
    //PAYM_USR_NM
    private String paymUsrNm;

    /**
     * 비고
     **/
    //REMARK
    private String remark;

    /**
     * 원인코드
     **/
    //CAU_CD
    private String cauCd;

    /**
     * 원인명
     **/
    //CAU_NM
    private String cauNm;

    /**
     * 현상코드
     **/
    //PHEN_CD
    private String phenCd;

    /**
     * 현상명
     **/
    //PHEN_NM
    private String phenNm;


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
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }

    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }

    /**
     * @return the docNo
     */
    public String getDocNo() {
        return docNo;
    }

    /**
     * @param docNo the docNo to set
     */
    public void setDocNo(String docNo) {
        this.docNo = docNo;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    /**
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }

    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the lbrNm
     */
    public String getLbrNm() {
        return lbrNm;
    }

    /**
     * @param lbrNm the lbrNm to set
     */
    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    /**
     * @return the pkgItemCd
     */
    public String getPkgItemCd() {
        return pkgItemCd;
    }

    /**
     * @param pkgItemCd the pkgItemCd to set
     */
    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the lbrTp
     */
    public String getLbrTp() {
        return lbrTp;
    }

    /**
     * @param lbrTp the lbrTp to set
     */
    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    /**
     * @return the lbrPrc
     */
    public Double getLbrPrc() {
        return lbrPrc;
    }

    /**
     * @param lbrPrc the lbrPrc to set
     */
    public void setLbrPrc(Double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    /**
     * @return the lbrQty
     */
    public Double getLbrQty() {
        return lbrQty;
    }

    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(Double lbrQty) {
        this.lbrQty = lbrQty;
    }

    /**
     * @return the lbrHm
     */
    public Double getLbrHm() {
        return lbrHm;
    }

    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }

    /**
     * @return the dstbHm
     */
    public Double getDstbHm() {
        return dstbHm;
    }

    /**
     * @param dstbHm the dstbHm to set
     */
    public void setDstbHm(Double dstbHm) {
        this.dstbHm = dstbHm;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
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
     * @return the lbrTotAmt
     */
    public Double getLbrTotAmt() {
        return lbrTotAmt;
    }

    /**
     * @param lbrTotAmt the lbrTotAmt to set
     */
    public void setLbrTotAmt(Double lbrTotAmt) {
        this.lbrTotAmt = lbrTotAmt;
    }

    /**
     * @return the crNo
     */
    public String getCrNo() {
        return crNo;
    }

    /**
     * @param crNo the crNo to set
     */
    public void setCrNo(String crNo) {
        this.crNo = crNo;
    }

    /**
     * @return the crNm
     */
    public String getCrNm() {
        return crNm;
    }

    /**
     * @param crNm the crNm to set
     */
    public void setCrNm(String crNm) {
        this.crNm = crNm;
    }

    /**
     * @return the crTp
     */
    public String getCrTp() {
        return crTp;
    }

    /**
     * @param crTp the crTp to set
     */
    public void setCrTp(String crTp) {
        this.crTp = crTp;
    }

    /**
     * @return the fmsCupnItemCd
     */
    public String getFmsCupnItemCd() {
        return fmsCupnItemCd;
    }

    /**
     * @param fmsCupnItemCd the fmsCupnItemCd to set
     */
    public void setFmsCupnItemCd(String fmsCupnItemCd) {
        this.fmsCupnItemCd = fmsCupnItemCd;
    }

    /**
     * @return the fmsItemCd
     */
    public String getFmsItemCd() {
        return fmsItemCd;
    }

    /**
     * @param fmsItemCd the fmsItemCd to set
     */
    public void setFmsItemCd(String fmsItemCd) {
        this.fmsItemCd = fmsItemCd;
    }

    /**
     * @return the subBpCd
     */
    public String getSubBpCd() {
        return subBpCd;
    }

    /**
     * @param subBpCd the subBpCd to set
     */
    public void setSubBpCd(String subBpCd) {
        this.subBpCd = subBpCd;
    }

    /**
     * @return the subBpNm
     */
    public String getSubBpNm() {
        return subBpNm;
    }

    /**
     * @param subBpNm the subBpNm to set
     */
    public void setSubBpNm(String subBpNm) {
        this.subBpNm = subBpNm;
    }

    /**
     * @return the payCmpNm
     */
    public String getPayCmpNm() {
        return payCmpNm;
    }

    /**
     * @param payCmpNm the payCmpNm to set
     */
    public void setPayCmpNm(String payCmpNm) {
        this.payCmpNm = payCmpNm;
    }

    /**
     * @return the paymTp
     */
    public String getPaymTp() {
        return paymTp;
    }

    /**
     * @param paymTp the paymTp to set
     */
    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }

    /**
     * @return the paymUsrNm
     */
    public String getPaymUsrNm() {
        return paymUsrNm;
    }

    /**
     * @param paymUsrNm the paymUsrNm to set
     */
    public void setPaymUsrNm(String paymUsrNm) {
        this.paymUsrNm = paymUsrNm;
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
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }

    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    /**
     * @return the cauNm
     */
    public String getCauNm() {
        return cauNm;
    }

    /**
     * @param cauNm the cauNm to set
     */
    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    /**
     * @return the phenCd
     */
    public String getPhenCd() {
        return phenCd;
    }

    /**
     * @param phenCd the phenCd to set
     */
    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    /**
     * @return the phenNm
     */
    public String getPhenNm() {
        return phenNm;
    }

    /**
     * @param phenNm the phenNm to set
     */
    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
    }

}