package chn.bhmc.dms.ser.cmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;


public class ServicePartIfVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7094630459059054030L;

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
     * 품목코드
     **/
    //ITEM_CD
    @JsonProperty("ITEM_CD")
    private String itemCd;

    /**
     * 품목명
     **/
    //ITEM_NM
    @JsonProperty("ITEM_NM")
    private String itemNm;

    /**
     * 패키지품목코드
     **/
    //PKG_ITEM_CD
    @JsonProperty("PKG_ITEM_CD")
    private String pkgItemCd;

    /**
     * 출고유형
     **/
    //GI_TP
    @JsonProperty("GI_TP")
    private String giTp;

    /**
     * 품목단가
     **/
    //ITEM_PRC
    @JsonProperty("ITEM_PRC")
    private String itemPrc;

    /**
     * 품목수량
     **/
    //ITEM_QTY
    @JsonProperty("ITEM_QTY")
    private String itemQty;

    /**
     * 품목판매단가
     **/
    //ITEM_SALE_PRC
    @JsonProperty("ITEM_SALE_PRC")
    private String itemSalePrc;

    /**
     * 품목판매금액
     **/
    //ITEM_SALE_AMT
    @JsonProperty("ITEM_SALE_AMT")
    private String itemSaleAmt;

    /**
     * 계산단위코드
     **/
    //CALC_UNIT_CD
    @JsonProperty("CALC_UNIT_CD")
    private String calcUnitCd;

    /**
     * 계산단위명
     **/
    //CALC_UNIT_NM
    @JsonProperty("CALC_UNIT_NM")
    private String calcUnitNm;

    /**
     * 요청수량
     **/
    //REQ_QTY
    @JsonProperty("REQ_QTY")
    private String reqQty;

    /**
     * 출고수량
     **/
    //GI_QTY
    @JsonProperty("GI_QTY")
    private String giQty;

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
     * 품목합계금액
     **/
    //ITEM_TOT_AMT
    @JsonProperty("ITEM_TOT_AMT")
    private String itemTotAmt;

    /**
     * 공용품목코드
     **/
    //COM_ITEM_CD
    @JsonProperty("COM_ITEM_CD")
    private String comItemCd;

    /**
     * 공용픔목명
     **/
    //COM_ITEM_NM
    @JsonProperty("COM_ITEM_NM")
    private String comItemNm;

    /**
     * 공용품목단가
     **/
    //COM_ITEM_PRC
    @JsonProperty("COM_ITEM_PRC")
    private String comItemPrc;

    /**
     * 고품품목번호
     **/
    //ATQ_ITEM_NO
    @JsonProperty("ATQ_ITEM_NO")
    private String atqItemNo;

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
     * FMS쿠폰품목코드
     **/
    //FMS_CUPN_ITEM_CD
    @JsonProperty("FMS_CUPN_ITEM_CD")
    private String fmsCupnItemCd;

    /**
     * FMS품목코드
     **/
    //FMS_ITEM_CD
    @JsonProperty("FMS_ITEM_CD")
    private String fmsItemCd;

    /**
     * 창고코드
     **/
    //STRGE_CD
    @JsonProperty("STRGE_CD")
    private String strgeCd;

    /**
     * 위치코드
     **/
    //LOC_CD
    @JsonProperty("LOC_CD")
    private String locCd;

    /**
     * 외주거래처코드
     **/
    //SUB_BP_CD
    @JsonProperty("SUB_BP_CD")
    private String subBpCd;

    /**
     * 외주거래처명
     **/
    //SUB_BP_NM
    @JsonProperty("SUB_BP_NM")
    private String subBpNm;

    /**
     * 요청창고코드
     **/
    //REQ_STRGE_CD
    @JsonProperty("REQ_STRGE_CD")
    private String reqStrgeCd;

    /**
     * 입고창고코드
     **/
    //GR_STRGE_CD
    @JsonProperty("GR_STRGE_CD")
    private String grStrgeCd;

    /**
     * 출고창고코드
     **/
    //GI_STRGE_CD
    @JsonProperty("GI_STRGE_CD")
    private String giStrgeCd;

    /**
     * 준비상태코드
     **/
    //READY_STAT_CD
    @JsonProperty("READY_STAT_CD")
    private String readyStatCd;

    /**
     * 결제자번호
     **/
    //PAY_NO
    @JsonProperty("PAY_NO")
    private String payNo;

    /**
     * 지불회사명
     **/
    //PAY_CMP_NM
    @JsonProperty("PAY_CMP_NM")
    private String payCmpNm;

    /**
     * 결제자유형
     **/
    //PAYM_TP
    @JsonProperty("PAYM_TP")
    private String paymTp;

    /**
     * 결제자명
     **/
    //PAYM_USR_NM
    @JsonProperty("PAYM_USR_NM")
    private String paymUsrNm;

    /**
     * 비고
     **/
    //REMARK
    @JsonProperty("REMARK")
    private String remark;

    /**
     * 원인코드
     **/
    //CAU_CD
    @JsonProperty("CAU_CD")
    private String cauCd;

    /**
     * 원인명
     **/
    //CAU_NM
    @JsonProperty("CAU_NM")
    private String cauNm;

    /**
     * 현상코드
     **/
    //PHEN_CD
    @JsonProperty("PHEN_CD")
    private String phenCd;

    /**
     * 현상명
     **/
    //PHEN_NM
    @JsonProperty("PHEN_NM")
    private String phenNm;

    /**
     * 구매오더번호
     **/
    //PURC_ORD_NO
    @JsonProperty("PURC_ORD_NO")
    private String purcOrdNo;

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
     * @return the giTp
     */
    public String getGiTp() {
        return giTp;
    }

    /**
     * @param giTp the giTp to set
     */
    public void setGiTp(String giTp) {
        this.giTp = giTp;
    }

    /**
     * @return the itemPrc
     */
    public String getItemPrc() {
        return itemPrc;
    }

    /**
     * @param itemPrc the itemPrc to set
     */
    public void setItemPrc(String itemPrc) {
        this.itemPrc = itemPrc;
    }

    /**
     * @return the itemQty
     */
    public String getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(String itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the itemSalePrc
     */
    public String getItemSalePrc() {
        return itemSalePrc;
    }

    /**
     * @param itemSalePrc the itemSalePrc to set
     */
    public void setItemSalePrc(String itemSalePrc) {
        this.itemSalePrc = itemSalePrc;
    }

    /**
     * @return the itemSaleAmt
     */
    public String getItemSaleAmt() {
        return itemSaleAmt;
    }

    /**
     * @param itemSaleAmt the itemSaleAmt to set
     */
    public void setItemSaleAmt(String itemSaleAmt) {
        this.itemSaleAmt = itemSaleAmt;
    }

    /**
     * @return the calcUnitCd
     */
    public String getCalcUnitCd() {
        return calcUnitCd;
    }

    /**
     * @param calcUnitCd the calcUnitCd to set
     */
    public void setCalcUnitCd(String calcUnitCd) {
        this.calcUnitCd = calcUnitCd;
    }

    /**
     * @return the calcUnitNm
     */
    public String getCalcUnitNm() {
        return calcUnitNm;
    }

    /**
     * @param calcUnitNm the calcUnitNm to set
     */
    public void setCalcUnitNm(String calcUnitNm) {
        this.calcUnitNm = calcUnitNm;
    }

    /**
     * @return the reqQty
     */
    public String getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(String reqQty) {
        this.reqQty = reqQty;
    }

    /**
     * @return the giQty
     */
    public String getGiQty() {
        return giQty;
    }

    /**
     * @param giQty the giQty to set
     */
    public void setGiQty(String giQty) {
        this.giQty = giQty;
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
     * @return the itemTotAmt
     */
    public String getItemTotAmt() {
        return itemTotAmt;
    }

    /**
     * @param itemTotAmt the itemTotAmt to set
     */
    public void setItemTotAmt(String itemTotAmt) {
        this.itemTotAmt = itemTotAmt;
    }

    /**
     * @return the comItemCd
     */
    public String getComItemCd() {
        return comItemCd;
    }

    /**
     * @param comItemCd the comItemCd to set
     */
    public void setComItemCd(String comItemCd) {
        this.comItemCd = comItemCd;
    }

    /**
     * @return the comItemNm
     */
    public String getComItemNm() {
        return comItemNm;
    }

    /**
     * @param comItemNm the comItemNm to set
     */
    public void setComItemNm(String comItemNm) {
        this.comItemNm = comItemNm;
    }

    /**
     * @return the comItemPrc
     */
    public String getComItemPrc() {
        return comItemPrc;
    }

    /**
     * @param comItemPrc the comItemPrc to set
     */
    public void setComItemPrc(String comItemPrc) {
        this.comItemPrc = comItemPrc;
    }

    /**
     * @return the atqItemNo
     */
    public String getAtqItemNo() {
        return atqItemNo;
    }

    /**
     * @param atqItemNo the atqItemNo to set
     */
    public void setAtqItemNo(String atqItemNo) {
        this.atqItemNo = atqItemNo;
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
     * @return the reqStrgeCd
     */
    public String getReqStrgeCd() {
        return reqStrgeCd;
    }

    /**
     * @param reqStrgeCd the reqStrgeCd to set
     */
    public void setReqStrgeCd(String reqStrgeCd) {
        this.reqStrgeCd = reqStrgeCd;
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
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    /**
     * @return the readyStatCd
     */
    public String getReadyStatCd() {
        return readyStatCd;
    }

    /**
     * @param readyStatCd the readyStatCd to set
     */
    public void setReadyStatCd(String readyStatCd) {
        this.readyStatCd = readyStatCd;
    }

    /**
     * @return the payNo
     */
    public String getPayNo() {
        return payNo;
    }

    /**
     * @param payNo the payNo to set
     */
    public void setPayNo(String payNo) {
        this.payNo = payNo;
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

}