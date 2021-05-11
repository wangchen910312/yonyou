package chn.bhmc.dms.ser.cmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;


public class ServiceLaborIfVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3960730790344642446L;

    /**
     * 딜러코드
     **/
    @JsonProperty("DLR_CD")
    private String dlrCd;

    /**
     * PREFIX ID
     **/
    @NotEmpty
    @JsonProperty("PREFIX_ID")
    private String preFixId;

    /**
     * 문서번호
     **/
    @NotEmpty
    @JsonProperty("DOC_NO")
    private String docNo;

    /**
     * 라인번호
     **/
    @JsonProperty("LINE_NO")
    private String lineNo;

    /**
     * RO유형
     **/
    //RO_TP
    @JsonProperty("RO_TP")
    private String roTp;

    /**
     * 공임코드
     **/
    //LBR_CD
    @JsonProperty("LBR_CD")
    private String lbrCd;

    /**
     * 공임명
     **/
    //LBR_NM
    @JsonProperty("LBR_NM")
    private String lbrNm;

    /**
     * 패키지품목코드
     **/
    //PKG_ITEM_CD
    @JsonProperty("PKG_ITEM_CD")
    private String pkgItemCd;

    /**
     * 공임유형
     **/
    //LBR_TP
    @JsonProperty("LBR_TP")
    private String lbrTp;

    /**
     * 공임단가
     **/
    //LBR_PRC
    @JsonProperty("LBR_PRC")
    private String lbrPrc;

    /**
     * 공임수량
     **/
    //LBR_QTY
    @JsonProperty("LBR_QTY")
    private String lbrQty;

    /**
     * 공임시간
     **/
    //LBR_HM
    @JsonProperty("LBR_HM")
    private String lbrHm;

    /**
     * 배분시간
     **/
    //DSTB_HM
    @JsonProperty("DSTB_HM")
    private String dstbHm;

    /**
     * 할인금액
     **/
    //DC_AMT
    @JsonProperty("DC_AMT")
    private String dcAmt;

    /**
     * 할인율
     **/
    //DC_RATE
    @JsonProperty("DC_RATE")
    private String dcRate;

    /**
     * 공임합계금액
     **/
    //LBR_TOT_AMT
    @JsonProperty("LBR_TOT_AMT")
    private String lbrTotAmt;

    /**
     * 캠페인리콜번호
     **/
    //CR_NO
    @JsonProperty("CR_NO")
    private String crNo;

    /**
     * 캠페인리콜명
     **/
    //CR_NM
    @JsonProperty("CR_NM")
    private String crNm;

    /**
     * 캠페인리콜유형
     **/
    //CR_TP
    @JsonProperty("CR_TP")
    private String crTp;

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
    public String getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(String lineNo) {
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
    public String getLbrPrc() {
        return lbrPrc;
    }

    /**
     * @param lbrPrc the lbrPrc to set
     */
    public void setLbrPrc(String lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    /**
     * @return the lbrQty
     */
    public String getLbrQty() {
        return lbrQty;
    }

    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(String lbrQty) {
        this.lbrQty = lbrQty;
    }

    /**
     * @return the lbrHm
     */
    public String getLbrHm() {
        return lbrHm;
    }

    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(String lbrHm) {
        this.lbrHm = lbrHm;
    }

    /**
     * @return the dstbHm
     */
    public String getDstbHm() {
        return dstbHm;
    }

    /**
     * @param dstbHm the dstbHm to set
     */
    public void setDstbHm(String dstbHm) {
        this.dstbHm = dstbHm;
    }

    /**
     * @return the dcAmt
     */
    public String getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(String dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the dcRate
     */
    public String getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(String dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the lbrTotAmt
     */
    public String getLbrTotAmt() {
        return lbrTotAmt;
    }

    /**
     * @param lbrTotAmt the lbrTotAmt to set
     */
    public void setLbrTotAmt(String lbrTotAmt) {
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



}