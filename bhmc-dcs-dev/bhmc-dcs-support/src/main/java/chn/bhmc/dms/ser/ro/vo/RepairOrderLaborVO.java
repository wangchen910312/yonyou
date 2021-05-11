package chn.bhmc.dms.ser.ro.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;


public class RepairOrderLaborVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5484193092578881931L;

    /**
    * 딜러코드
    **/
    @NotEmpty
    private String dlrCd;

    /**
    * RO문서번호
    **/
    @NotEmpty
    private String roDocNo;

    /**
    * 예약문서번호
    **/
    private String resvDocNo;

    /**
    * 라인번호
    **/
    @NotEmpty
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
    * 예정공임금액
    **/
    //EXPC_LBR_AMT
    private Double expcLbrAmt;

    /**
    * 캠페인리콜일련번호
    **/
    //CR_SEQ
    private String crNo;

    /**
    * FMS쿠폰품목코드
    **/
    //SER_CUPN_ITEM_CD
    private String serCupnItemCd;

    /**
    * FMS품목코드
    **/
    //SER_ITEM_CD
    private String serItemCd;

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
     * 비고
     **/
    private String remark;

    /**
     * 지불회사명
     **/
    private String payCmpNm;
    
    /**
     * 공임수량
     */
    private Double lbrQty;


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
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }

    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
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
     * @return the expcLbrAmt
     */
    public Double getExpcLbrAmt() {
        return expcLbrAmt;
    }

    /**
     * @param expcLbrAmt the expcLbrAmt to set
     */
    public void setExpcLbrAmt(Double expcLbrAmt) {
        this.expcLbrAmt = expcLbrAmt;
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
     * @return the serCupnItemCd
     */
    public String getSerCupnItemCd() {
        return serCupnItemCd;
    }

    /**
     * @param serCupnItemCd the serCupnItemCd to set
     */
    public void setSerCupnItemCd(String serCupnItemCd) {
        this.serCupnItemCd = serCupnItemCd;
    }

    /**
     * @return the serItemCd
     */
    public String getSerItemCd() {
        return serItemCd;
    }

    /**
     * @param serItemCd the serItemCd to set
     */
    public void setSerItemCd(String serItemCd) {
        this.serItemCd = serItemCd;
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

}