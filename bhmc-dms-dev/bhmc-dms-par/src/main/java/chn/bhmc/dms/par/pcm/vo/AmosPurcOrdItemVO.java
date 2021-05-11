package chn.bhmc.dms.par.pcm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AmosPurcOrdItemVO.java
 * @Description : AmosPurcOrdItemVO.class
 * @author Mid Eum Park
 * @since 2017. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 18.    Mid Eum Park            최초 생성
 * </pre>
 */
public class AmosPurcOrdItemVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 447903051210203010L;

    /**
     * 딜러코드
     */
    @JsonProperty("ORH_DLR_CD")
    private String orhDlrCd;

    /**
     * Order Number(Dealer)
     */
    @JsonProperty("ORH_DLR_ORD_NO")
    private String orhDlrOrdNo;

    /**
     * 전송 날짜 (Start)
     */
    @JsonProperty("ORH_INS_START_DT")
    private String orhInsStartDt;

    /**
     * 전송 날짜 (End)
     */
    @JsonProperty("ORH_INS_END_DT")
    private String orhInsEndDt;

    /**
     * AMOS Order No
     */
    @JsonProperty("ORH_ORD_NO")
    private String orhOrdNo;

    /**
     * HMC / KIA
     */
    @JsonProperty("ORH_CMP_KND")
    private String orhCmpKnd;

    /**
     * PDC Code
     */
    @JsonProperty("ORH_PDC")
    private String orhPdc;

    /**
     * Received Date
     */
    @JsonProperty("ORH_ORD_RCVE_DT")
    private String orhOrdRcveDt;

    /**
     * Received hour
     */
    @JsonProperty("ORH_ORD_RCVE_TIM")
    private String orhOrdRcveTim;

    /**
     * Allocation Trigger Date
     */
    @JsonProperty("ORH_ALC_TRG_DT")
    private String orhAlcTrgDt;

    /**
     * Order Header Process Code
     */
    @JsonProperty("ORH_ORD_HPCD")
    private String orhOrdHpcd;

    /**
     * Order Process Code(A~I)
     */
    @JsonProperty("ORH_ORD_PRC_CD")
    private String orhOrdPrcCd;

    /**
     * Order Type
     */
    @JsonProperty("ORH_ORD_TYP")
    private String orhOrdTyp;

    /**
     * confirm Date
     */
    @JsonProperty("ORH_CFM_DT")
    private String orhCfmDt;

    /**
     * Transportation Mode
     */
    @JsonProperty("TRN_DESC")
    private String trnDesc;

    /**
     * Transportation Code
     */
    @JsonProperty("TRNCD")
    private String trncd;

    /**
     * Transportation Name
     */
    @JsonProperty("TPM_TRN_NM")
    private String tpmTrnNm;

    /**
     * Order Item
     */
    @JsonProperty("ORH_ORD_ITM")
    private double orhOrdItm;

    /**
     * Order Qty
     */
    @JsonProperty("ORH_ORD_QT")
    private double orhOrdQt;

    /**
     * Order Amount
     */
    @JsonProperty("ORH_ORD_AMT")
    private double orhOrdAmt;

    /**
     * Confirm Item
     */
    @JsonProperty("ORH_CFM_ITM")
    private double orhCfmItm;

    /**
     * Confirm Qty
     */
    @JsonProperty("ORH_CFM_QT")
    private double orhCfmQt;

    /**
     * Confirm Amount
     */
    @JsonProperty("ORH_CFM_AMT")
    private double orhCfmAmt;

    /**
     * Processing Item
     */
    @JsonProperty("ORH_PRC_ITM")
    private double orhPrcItm;

    /**
     * Processing Qty
     */
    @JsonProperty("ORH_PRC_QT")
    private double orhPrcQt;

    /**
     * Processing Amount
     */
    @JsonProperty("ORH_PRC_AMT")
    private double orhPrcAmt;

    /**
     * Canceled Item
     */
    @JsonProperty("ORH_XCL_ITM")
    private double orhXclItm;

    /**
     * Canceled Qty
     */
    @JsonProperty("ORH_XCL_QT")
    private double orhXclQt;

    /**
     * Canceled Amount
     */
    @JsonProperty("ORH_XCL_AMT")
    private double orhXclAmt;

    /**
     * B/O Item
     */
    @JsonProperty("ORH_BO_ITM")
    private double orhBoItm;

    /**
     * B/O Qty
     */
    @JsonProperty("ORH_BO_QT")
    private double orhBoQt;

    /**
     * B/O Amount
     */
    @JsonProperty("ORH_BO_AMT")
    private double orhBoAmt;

    /**
     * Shipped Item
     */
    @JsonProperty("ORH_SHP_ITM")
    private double orhShpItm;

    /**
     * Shipped Qty
     */
    @JsonProperty("ORH_SHP_QT")
    private double orhShpQt;

    /**
     * Shipped Amount
     */
    @JsonProperty("ORH_SHP_AMT")
    private double orhShpAmt;

    /**
     * Insert User ID
     */
    @JsonProperty("ORH_INS_USR")
    private String orhInsUsr;

    /**
     * Creation Date
     */
    @JsonProperty("orh_INS_DT")
    private String orhInsDt;

    /**
     * Creation Time
     */
    @JsonProperty("orh_INS_TM")
    private String orhInsTm;

    /**
     * 전송 일자 (Header)
     */
    @JsonProperty("orh_SND_DT")
    private String orhSndDt;

    /**
     * 전송 시간 (Header)
     */
    @JsonProperty("orh_SND_TM")
    private String orhSndTm;

    /**
     * AMOS Order No
     */
    @JsonProperty("ORD_ORD_NO")
    private String ordOrdNo;

    /**
     * Line
     */
    @JsonProperty("ORD_ORD_LN")
    private String ordOrdLn;

    /**
     * Order Line Suffix
     */
    @JsonProperty("ORD_ORD_SF")
    private String ordOrdSf;

    /**
     * HMC / KIA
     */
    @JsonProperty("ORD_CMP_KND")
    private String ordCmpKnd;

    /**
     * Order Processing Code
     */
    @JsonProperty("ORD_ORD_DTL_PRC")
    private String ordOrdDtlPrc;

    /**
     * Ordered Part Number
     */
    @JsonProperty("ORD_ORD_PNO")
    private String ordOrdPno;

    /**
     * Confirm Part No
     */
    @JsonProperty("CF_PNO")
    private String cfPno;

    /**
     * Ordered Quantity
     */
    @JsonProperty("ORD_ORD_QT")
    private double ordOrdQt;

    /**
     * Confirm Order Quantity
     */
    @JsonProperty("CF_QT")
    private int cfQt;

    /**
     * B/O Quantity
     */
    @JsonProperty("ORD_LST_BO_QT")
    private double ordLstBoQt;

    /**
     * Shipped Quantity
     */
    @JsonProperty("ORD_SHP_QT")
    private double ordShpQt;

    /**
     *
     */
    @JsonProperty("ORD_SPL_QT")
    private double ordSplQt;

    /**
     *
     */
    @JsonProperty("ORD_LST_SHP_DT")
    private String ordLstShpDt;

    /**
     * Canceled Quantity
     */
    @JsonProperty("ORD_XCL_QT")
    private double ordXclQt;

    /**
     * AMEND Code
     */
    @JsonProperty("ORD_LST_AMCD")
    private String ordLstAmcd;

    /**
     * Confirm Flag
     */
    @JsonProperty("ORD_CFM_APL_FLG")
    private String ordCfmAplFlg;

    /**
     * Dealer Net(without tax)
     */
    @JsonProperty("ORD_UPCE_NDP")
    private double ordUpceNdp;

    /**
     * Dealer Net
     */
    @JsonProperty("ORD_UPCE_CUR")
    private double ordUpceCur;

    /**
     * PDC
     */
    @JsonProperty("ORD_PDC")
    private String ordPdc;

    /**
     * VAT Amt
     */
    @JsonProperty("ORD_VAT_AMT")
    private double ordVatAmt;

    /**
     * ETD Date per order no (ETD DB) : BAck Order Date
     */
    @JsonProperty("ETD_ETA_DPOS")
    private String etdEtaDpos;

    /**
     * Allocation Quantity
     */
    @JsonProperty("ORD_ALC_QT")
    private double ordAlcQt;

    /**
     * On_Pick Quantity
     */
    @JsonProperty("ORD_OPIC_QT")
    private double ordOpicQt;

    /**
     * On_Pack Quantity
     */
    @JsonProperty("ORD_OPAC_QT")
    private double ordOpacQt;

    /**
     * Packed Quantity
     */
    @JsonProperty("ORD_PAKD_QT")
    private double ordPakdQt;

    /**
     * Invoiced Quantity
     */
    @JsonProperty("ORD_INV_QT")
    private double ordInvQt;

    /**
     * Creation Date
     */
    @JsonProperty("ORD_INS_DT")
    private String ordInsDt;

    /**
     * Creation Time
     */
    @JsonProperty("ORD_INS_TM")
    private String ordInsTm;

    /**
     * 전송 일자 (Detail)
     */
    @JsonProperty("ORD_SND_DT")
    private String ordSndDt;

    /**
     * 전송 시간 (Detail)
     */
    @JsonProperty("ORD_SND_TM")
    private String ordSndTm;

    /**
     * dealer code
     */
    @JsonProperty("INS_DLR_CD")
    private String insDlrCd;

    /**
     * invoice no
     */
    @JsonProperty("IVD_INV_NO")
    private String ivdInvNo;

    /**
     * invoice date
     */
    @JsonProperty("INS_INV_DT")
    private String insInvDt;

    /**
     * out box count
     */
    @JsonProperty("INS_INV_CSE_CNT")
    private double insInvCseCnt;

    /**
     * out box CBM
     */
    @JsonProperty("INS_CBM")
    private double insCbm;

    /**
     * total line no
     */
    @JsonProperty("INS_INV_ITM")
    private double insInvItm;

    /**
     * supplier code
     */
    @JsonProperty("INS_VND")
    private String insVnd;

    /**
     * transporter code
     */
    @JsonProperty("INS_TSP_CODE")
    private String insTspCode;

    /**
     * TR NO
     */
    @JsonProperty("INS_GCN_BL_NO")
    private String insGcnBlNo;

    /**
     * truck no
     */
    @JsonProperty("INS_TN_CN_NO")
    private String insTnCnNo;

    /**
     *
     */
    @JsonProperty("INS_SUM_QT")
    private double insSumQt;

    /**
     * inv_amt_cur
     */
    @JsonProperty("INS_INV_AMT_CUR")
    private double insInvAmtCur;

    /**
     * sales tax
     */
    @JsonProperty("INS_TAX_TOT")
    private double insTaxTot;

    /**
     * invoice amount
     */
    @JsonProperty("INS_AMT_TOT")
    private double insAmtTot;

    /**
     * gross weight
     */
    @JsonProperty("INS_GWG")
    private double insGwg;

    /**
     * net weight item
     */
    @JsonProperty("INS_NET_WGI")
    private double insNetWgi;

    /**
     * net weight case
     */
    @JsonProperty("INS_NET_WGC")
    private double insNetWgc;

    /**
     * order no
     */
    @JsonProperty("INS_ORD_NO")
    private String insOrdNo;

    /**
     * order line no
     */
    @JsonProperty("INS_ORD_LN")
    private String insOrdLn;

    /**
     * order line suffix
     */
    @JsonProperty("INS_ORD_SF")
    private String insOrdSf;

    /**
     * out box no
     */
    @JsonProperty("CASE_NO")
    private String caseNo;

    /**
     * PDC CODE
     */
    @JsonProperty("INS_PDC")
    private String insPdc;

    /**
     * dealer PO NO
     */
    @JsonProperty("INS_DLR_ORD_NO")
    private String insDlrOrdNo;

    /**
     * PART NO
     */
    @JsonProperty("INS_SUP_PNO")
    private String insSupPno;

    /**
     *
     */
    @JsonProperty("INS_INV_QT")
    private double insInvQt;

    /**
     * UNIT PRICE(MAT)
     */
    @JsonProperty("INS_UPCE_MAT")
    private double insUpceMat;

    /**
     * sales tax
     */
    @JsonProperty("INS_UPCE_TAX")
    private double insUpceTax;

    /**
     * Material Value Amount
     */
    @JsonProperty("INS_AMT_MAT")
    private double insAmtMat;

    /**
     * TAX Amount
     */
    @JsonProperty("INS_AMT_TAX")
    private double insAmtTax;

    /**
     * 송장 날짜
     */
    @JsonProperty("INS_INS_DT")
    private String insInsDt;

    /**
     * 송장 시간
     */
    @JsonProperty("INS_INS_TM")
    private String insInsTm;

    /**
     * 전송 일자 (송장)
     */
    @JsonProperty("INS_SND_DT")
    private String insSndDt;

    /**
     * 전송 시간 (송장)
     */
    @JsonProperty("INS_SND_TM")
    private String insSndTm;

    /**
     * @return the orhDlrCd
     */
    public String getOrhDlrCd() {
        return orhDlrCd;
    }

    /**
     * @param orhDlrCd the orhDlrCd to set
     */
    public void setOrhDlrCd(String orhDlrCd) {
        this.orhDlrCd = orhDlrCd;
    }

    /**
     * @return the orhDlrOrdNo
     */
    public String getOrhDlrOrdNo() {
        return orhDlrOrdNo;
    }

    /**
     * @param orhDlrOrdNo the orhDlrOrdNo to set
     */
    public void setOrhDlrOrdNo(String orhDlrOrdNo) {
        this.orhDlrOrdNo = orhDlrOrdNo;
    }

    /**
     * @return the orhInsStartDt
     */
    public String getOrhInsStartDt() {
        return orhInsStartDt;
    }

    /**
     * @param orhInsStartDt the orhInsStartDt to set
     */
    public void setOrhInsStartDt(String orhInsStartDt) {
        this.orhInsStartDt = orhInsStartDt;
    }

    /**
     * @return the orhInsEndDt
     */
    public String getOrhInsEndDt() {
        return orhInsEndDt;
    }

    /**
     * @param orhInsEndDt the orhInsEndDt to set
     */
    public void setOrhInsEndDt(String orhInsEndDt) {
        this.orhInsEndDt = orhInsEndDt;
    }

    /**
     * @return the orhOrdNo
     */
    public String getOrhOrdNo() {
        return orhOrdNo;
    }

    /**
     * @param orhOrdNo the orhOrdNo to set
     */
    public void setOrhOrdNo(String orhOrdNo) {
        this.orhOrdNo = orhOrdNo;
    }

    /**
     * @return the orhCmpKnd
     */
    public String getOrhCmpKnd() {
        return orhCmpKnd;
    }

    /**
     * @param orhCmpKnd the orhCmpKnd to set
     */
    public void setOrhCmpKnd(String orhCmpKnd) {
        this.orhCmpKnd = orhCmpKnd;
    }

    /**
     * @return the orhPdc
     */
    public String getOrhPdc() {
        return orhPdc;
    }

    /**
     * @param orhPdc the orhPdc to set
     */
    public void setOrhPdc(String orhPdc) {
        this.orhPdc = orhPdc;
    }

    /**
     * @return the orhOrdRcveDt
     */
    public String getOrhOrdRcveDt() {
        return orhOrdRcveDt;
    }

    /**
     * @param orhOrdRcveDt the orhOrdRcveDt to set
     */
    public void setOrhOrdRcveDt(String orhOrdRcveDt) {
        this.orhOrdRcveDt = orhOrdRcveDt;
    }

    /**
     * @return the orhOrdRcveTim
     */
    public String getOrhOrdRcveTim() {
        return orhOrdRcveTim;
    }

    /**
     * @param orhOrdRcveTim the orhOrdRcveTim to set
     */
    public void setOrhOrdRcveTim(String orhOrdRcveTim) {
        this.orhOrdRcveTim = orhOrdRcveTim;
    }

    /**
     * @return the orhAlcTrgDt
     */
    public String getOrhAlcTrgDt() {
        return orhAlcTrgDt;
    }

    /**
     * @param orhAlcTrgDt the orhAlcTrgDt to set
     */
    public void setOrhAlcTrgDt(String orhAlcTrgDt) {
        this.orhAlcTrgDt = orhAlcTrgDt;
    }

    /**
     * @return the orhOrdHpcd
     */
    public String getOrhOrdHpcd() {
        return orhOrdHpcd;
    }

    /**
     * @param orhOrdHpcd the orhOrdHpcd to set
     */
    public void setOrhOrdHpcd(String orhOrdHpcd) {
        this.orhOrdHpcd = orhOrdHpcd;
    }

    /**
     * @return the orhOrdPrcCd
     */
    public String getOrhOrdPrcCd() {
        return orhOrdPrcCd;
    }

    /**
     * @param orhOrdPrcCd the orhOrdPrcCd to set
     */
    public void setOrhOrdPrcCd(String orhOrdPrcCd) {
        this.orhOrdPrcCd = orhOrdPrcCd;
    }

    /**
     * @return the orhOrdTyp
     */
    public String getOrhOrdTyp() {
        return orhOrdTyp;
    }

    /**
     * @param orhOrdTyp the orhOrdTyp to set
     */
    public void setOrhOrdTyp(String orhOrdTyp) {
        this.orhOrdTyp = orhOrdTyp;
    }

    /**
     * @return the orhCfmDt
     */
    public String getOrhCfmDt() {
        return orhCfmDt;
    }

    /**
     * @param orhCfmDt the orhCfmDt to set
     */
    public void setOrhCfmDt(String orhCfmDt) {
        this.orhCfmDt = orhCfmDt;
    }

    /**
     * @return the orhOrdItm
     */
    public double getOrhOrdItm() {
        return orhOrdItm;
    }

    /**
     * @param orhOrdItm the orhOrdItm to set
     */
    public void setOrhOrdItm(double orhOrdItm) {
        this.orhOrdItm = orhOrdItm;
    }

    /**
     * @return the orhOrdQt
     */
    public double getOrhOrdQt() {
        return orhOrdQt;
    }

    /**
     * @param orhOrdQt the orhOrdQt to set
     */
    public void setOrhOrdQt(double orhOrdQt) {
        this.orhOrdQt = orhOrdQt;
    }

    /**
     * @return the orhOrdAmt
     */
    public double getOrhOrdAmt() {
        return orhOrdAmt;
    }

    /**
     * @param orhOrdAmt the orhOrdAmt to set
     */
    public void setOrhOrdAmt(double orhOrdAmt) {
        this.orhOrdAmt = orhOrdAmt;
    }

    /**
     * @return the orhCfmItm
     */
    public double getOrhCfmItm() {
        return orhCfmItm;
    }

    /**
     * @param orhCfmItm the orhCfmItm to set
     */
    public void setOrhCfmItm(double orhCfmItm) {
        this.orhCfmItm = orhCfmItm;
    }

    /**
     * @return the orhCfmQt
     */
    public double getOrhCfmQt() {
        return orhCfmQt;
    }

    /**
     * @param orhCfmQt the orhCfmQt to set
     */
    public void setOrhCfmQt(double orhCfmQt) {
        this.orhCfmQt = orhCfmQt;
    }

    /**
     * @return the orhCfmAmt
     */
    public double getOrhCfmAmt() {
        return orhCfmAmt;
    }

    /**
     * @param orhCfmAmt the orhCfmAmt to set
     */
    public void setOrhCfmAmt(double orhCfmAmt) {
        this.orhCfmAmt = orhCfmAmt;
    }

    /**
     * @return the orhPrcItm
     */
    public double getOrhPrcItm() {
        return orhPrcItm;
    }

    /**
     * @param orhPrcItm the orhPrcItm to set
     */
    public void setOrhPrcItm(double orhPrcItm) {
        this.orhPrcItm = orhPrcItm;
    }

    /**
     * @return the orhPrcQt
     */
    public double getOrhPrcQt() {
        return orhPrcQt;
    }

    /**
     * @param orhPrcQt the orhPrcQt to set
     */
    public void setOrhPrcQt(double orhPrcQt) {
        this.orhPrcQt = orhPrcQt;
    }

    /**
     * @return the orhPrcAmt
     */
    public double getOrhPrcAmt() {
        return orhPrcAmt;
    }

    /**
     * @param orhPrcAmt the orhPrcAmt to set
     */
    public void setOrhPrcAmt(double orhPrcAmt) {
        this.orhPrcAmt = orhPrcAmt;
    }

    /**
     * @return the orhXclItm
     */
    public double getOrhXclItm() {
        return orhXclItm;
    }

    /**
     * @param orhXclItm the orhXclItm to set
     */
    public void setOrhXclItm(double orhXclItm) {
        this.orhXclItm = orhXclItm;
    }

    /**
     * @return the orhXclQt
     */
    public double getOrhXclQt() {
        return orhXclQt;
    }

    /**
     * @param orhXclQt the orhXclQt to set
     */
    public void setOrhXclQt(double orhXclQt) {
        this.orhXclQt = orhXclQt;
    }

    /**
     * @return the orhXclAmt
     */
    public double getOrhXclAmt() {
        return orhXclAmt;
    }

    /**
     * @param orhXclAmt the orhXclAmt to set
     */
    public void setOrhXclAmt(double orhXclAmt) {
        this.orhXclAmt = orhXclAmt;
    }

    /**
     * @return the orhBoItm
     */
    public double getOrhBoItm() {
        return orhBoItm;
    }

    /**
     * @param orhBoItm the orhBoItm to set
     */
    public void setOrhBoItm(double orhBoItm) {
        this.orhBoItm = orhBoItm;
    }

    /**
     * @return the orhBoQt
     */
    public double getOrhBoQt() {
        return orhBoQt;
    }

    /**
     * @param orhBoQt the orhBoQt to set
     */
    public void setOrhBoQt(double orhBoQt) {
        this.orhBoQt = orhBoQt;
    }

    /**
     * @return the orhBoAmt
     */
    public double getOrhBoAmt() {
        return orhBoAmt;
    }

    /**
     * @param orhBoAmt the orhBoAmt to set
     */
    public void setOrhBoAmt(double orhBoAmt) {
        this.orhBoAmt = orhBoAmt;
    }

    /**
     * @return the orhShpItm
     */
    public double getOrhShpItm() {
        return orhShpItm;
    }

    /**
     * @param orhShpItm the orhShpItm to set
     */
    public void setOrhShpItm(double orhShpItm) {
        this.orhShpItm = orhShpItm;
    }

    /**
     * @return the orhShpQt
     */
    public double getOrhShpQt() {
        return orhShpQt;
    }

    /**
     * @param orhShpQt the orhShpQt to set
     */
    public void setOrhShpQt(double orhShpQt) {
        this.orhShpQt = orhShpQt;
    }

    /**
     * @return the orhShpAmt
     */
    public double getOrhShpAmt() {
        return orhShpAmt;
    }

    /**
     * @param orhShpAmt the orhShpAmt to set
     */
    public void setOrhShpAmt(double orhShpAmt) {
        this.orhShpAmt = orhShpAmt;
    }

    /**
     * @return the orhInsUsr
     */
    public String getOrhInsUsr() {
        return orhInsUsr;
    }

    /**
     * @param orhInsUsr the orhInsUsr to set
     */
    public void setOrhInsUsr(String orhInsUsr) {
        this.orhInsUsr = orhInsUsr;
    }

    /**
     * @return the orhInsDt
     */
    public String getOrhInsDt() {
        return orhInsDt;
    }

    /**
     * @param orhInsDt the orhInsDt to set
     */
    public void setOrhInsDt(String orhInsDt) {
        this.orhInsDt = orhInsDt;
    }

    /**
     * @return the orhInsTm
     */
    public String getOrhInsTm() {
        return orhInsTm;
    }

    /**
     * @param orhInsTm the orhInsTm to set
     */
    public void setOrhInsTm(String orhInsTm) {
        this.orhInsTm = orhInsTm;
    }

    /**
     * @return the orhSndDt
     */
    public String getOrhSndDt() {
        return orhSndDt;
    }

    /**
     * @param orhSndDt the orhSndDt to set
     */
    public void setOrhSndDt(String orhSndDt) {
        this.orhSndDt = orhSndDt;
    }

    /**
     * @return the orhSndTm
     */
    public String getOrhSndTm() {
        return orhSndTm;
    }

    /**
     * @param orhSndTm the orhSndTm to set
     */
    public void setOrhSndTm(String orhSndTm) {
        this.orhSndTm = orhSndTm;
    }

    /**
     * @return the ordOrdNo
     */
    public String getOrdOrdNo() {
        return ordOrdNo;
    }

    /**
     * @param ordOrdNo the ordOrdNo to set
     */
    public void setOrdOrdNo(String ordOrdNo) {
        this.ordOrdNo = ordOrdNo;
    }

    /**
     * @return the ordOrdLn
     */
    public String getOrdOrdLn() {
        return ordOrdLn;
    }

    /**
     * @param ordOrdLn the ordOrdLn to set
     */
    public void setOrdOrdLn(String ordOrdLn) {
        this.ordOrdLn = ordOrdLn;
    }

    /**
     * @return the ordOrdSf
     */
    public String getOrdOrdSf() {
        return ordOrdSf;
    }

    /**
     * @param ordOrdSf the ordOrdSf to set
     */
    public void setOrdOrdSf(String ordOrdSf) {
        this.ordOrdSf = ordOrdSf;
    }

    /**
     * @return the ordCmpKnd
     */
    public String getOrdCmpKnd() {
        return ordCmpKnd;
    }

    /**
     * @param ordCmpKnd the ordCmpKnd to set
     */
    public void setOrdCmpKnd(String ordCmpKnd) {
        this.ordCmpKnd = ordCmpKnd;
    }

    /**
     * @return the ordOrdDtlPrc
     */
    public String getOrdOrdDtlPrc() {
        return ordOrdDtlPrc;
    }

    /**
     * @param ordOrdDtlPrc the ordOrdDtlPrc to set
     */
    public void setOrdOrdDtlPrc(String ordOrdDtlPrc) {
        this.ordOrdDtlPrc = ordOrdDtlPrc;
    }

    /**
     * @return the ordOrdPno
     */
    public String getOrdOrdPno() {
        return ordOrdPno;
    }

    /**
     * @param ordOrdPno the ordOrdPno to set
     */
    public void setOrdOrdPno(String ordOrdPno) {
        this.ordOrdPno = ordOrdPno;
    }

    /**
     * @return the cfPno
     */
    public String getCfPno() {
        return cfPno;
    }

    /**
     * @param cfPno the cfPno to set
     */
    public void setCfPno(String cfPno) {
        this.cfPno = cfPno;
    }

    /**
     * @return the ordOrdQt
     */
    public double getOrdOrdQt() {
        return ordOrdQt;
    }

    /**
     * @param ordOrdQt the ordOrdQt to set
     */
    public void setOrdOrdQt(double ordOrdQt) {
        this.ordOrdQt = ordOrdQt;
    }

    /**
     * @return the cfQt
     */
    public int getCfQt() {
        return cfQt;
    }

    /**
     * @param cfQt the cfQt to set
     */
    public void setCfQt(int cfQt) {
        this.cfQt = cfQt;
    }

    /**
     * @return the ordLstBoQt
     */
    public double getOrdLstBoQt() {
        return ordLstBoQt;
    }

    /**
     * @param ordLstBoQt the ordLstBoQt to set
     */
    public void setOrdLstBoQt(double ordLstBoQt) {
        this.ordLstBoQt = ordLstBoQt;
    }

    /**
     * @return the ordShpQt
     */
    public double getOrdShpQt() {
        return ordShpQt;
    }

    /**
     * @param ordShpQt the ordShpQt to set
     */
    public void setOrdShpQt(double ordShpQt) {
        this.ordShpQt = ordShpQt;
    }

    /**
     * @return the ordXclQt
     */
    public double getOrdXclQt() {
        return ordXclQt;
    }

    /**
     * @param ordXclQt the ordXclQt to set
     */
    public void setOrdXclQt(double ordXclQt) {
        this.ordXclQt = ordXclQt;
    }

    /**
     * @return the ordLstAmcd
     */
    public String getOrdLstAmcd() {
        return ordLstAmcd;
    }

    /**
     * @param ordLstAmcd the ordLstAmcd to set
     */
    public void setOrdLstAmcd(String ordLstAmcd) {
        this.ordLstAmcd = ordLstAmcd;
    }

    /**
     * @return the ordCfmAplFlg
     */
    public String getOrdCfmAplFlg() {
        return ordCfmAplFlg;
    }

    /**
     * @param ordCfmAplFlg the ordCfmAplFlg to set
     */
    public void setOrdCfmAplFlg(String ordCfmAplFlg) {
        this.ordCfmAplFlg = ordCfmAplFlg;
    }

    /**
     * @return the ordUpceNdp
     */
    public double getOrdUpceNdp() {
        return ordUpceNdp;
    }

    /**
     * @param ordUpceNdp the ordUpceNdp to set
     */
    public void setOrdUpceNdp(double ordUpceNdp) {
        this.ordUpceNdp = ordUpceNdp;
    }

    /**
     * @return the ordVatAmt
     */
    public double getOrdVatAmt() {
        return ordVatAmt;
    }

    /**
     * @param ordVatAmt the ordVatAmt to set
     */
    public void setOrdVatAmt(double ordVatAmt) {
        this.ordVatAmt = ordVatAmt;
    }

    /**
     * @return the ordAlcQt
     */
    public double getOrdAlcQt() {
        return ordAlcQt;
    }

    /**
     * @param ordAlcQt the ordAlcQt to set
     */
    public void setOrdAlcQt(double ordAlcQt) {
        this.ordAlcQt = ordAlcQt;
    }

    /**
     * @return the ordOpicQt
     */
    public double getOrdOpicQt() {
        return ordOpicQt;
    }

    /**
     * @param ordOpicQt the ordOpicQt to set
     */
    public void setOrdOpicQt(double ordOpicQt) {
        this.ordOpicQt = ordOpicQt;
    }

    /**
     * @return the ordOpacQt
     */
    public double getOrdOpacQt() {
        return ordOpacQt;
    }

    /**
     * @param ordOpacQt the ordOpacQt to set
     */
    public void setOrdOpacQt(double ordOpacQt) {
        this.ordOpacQt = ordOpacQt;
    }

    /**
     * @return the ordPakdQt
     */
    public double getOrdPakdQt() {
        return ordPakdQt;
    }

    /**
     * @param ordPakdQt the ordPakdQt to set
     */
    public void setOrdPakdQt(double ordPakdQt) {
        this.ordPakdQt = ordPakdQt;
    }

    /**
     * @return the ordInvQt
     */
    public double getOrdInvQt() {
        return ordInvQt;
    }

    /**
     * @param ordInvQt the ordInvQt to set
     */
    public void setOrdInvQt(double ordInvQt) {
        this.ordInvQt = ordInvQt;
    }

    /**
     * @return the ordInsDt
     */
    public String getOrdInsDt() {
        return ordInsDt;
    }

    /**
     * @param ordInsDt the ordInsDt to set
     */
    public void setOrdInsDt(String ordInsDt) {
        this.ordInsDt = ordInsDt;
    }

    /**
     * @return the ordInsTm
     */
    public String getOrdInsTm() {
        return ordInsTm;
    }

    /**
     * @param ordInsTm the ordInsTm to set
     */
    public void setOrdInsTm(String ordInsTm) {
        this.ordInsTm = ordInsTm;
    }

    /**
     * @return the ordSndDt
     */
    public String getOrdSndDt() {
        return ordSndDt;
    }

    /**
     * @param ordSndDt the ordSndDt to set
     */
    public void setOrdSndDt(String ordSndDt) {
        this.ordSndDt = ordSndDt;
    }

    /**
     * @return the ordSndTm
     */
    public String getOrdSndTm() {
        return ordSndTm;
    }

    /**
     * @param ordSndTm the ordSndTm to set
     */
    public void setOrdSndTm(String ordSndTm) {
        this.ordSndTm = ordSndTm;
    }

    /**
     * @return the insDlrCd
     */
    public String getInsDlrCd() {
        return insDlrCd;
    }

    /**
     * @param insDlrCd the insDlrCd to set
     */
    public void setInsDlrCd(String insDlrCd) {
        this.insDlrCd = insDlrCd;
    }

    /**
     * @return the insInvDt
     */
    public String getInsInvDt() {
        return insInvDt;
    }

    /**
     * @param insInvDt the insInvDt to set
     */
    public void setInsInvDt(String insInvDt) {
        this.insInvDt = insInvDt;
    }

    /**
     * @return the insInvCseCnt
     */
    public double getInsInvCseCnt() {
        return insInvCseCnt;
    }

    /**
     * @param insInvCseCnt the insInvCseCnt to set
     */
    public void setInsInvCseCnt(double insInvCseCnt) {
        this.insInvCseCnt = insInvCseCnt;
    }

    /**
     * @return the insCbm
     */
    public double getInsCbm() {
        return insCbm;
    }

    /**
     * @param insCbm the insCbm to set
     */
    public void setInsCbm(double insCbm) {
        this.insCbm = insCbm;
    }

    /**
     * @return the insInvItm
     */
    public double getInsInvItm() {
        return insInvItm;
    }

    /**
     * @param insInvItm the insInvItm to set
     */
    public void setInsInvItm(double insInvItm) {
        this.insInvItm = insInvItm;
    }

    /**
     * @return the insVnd
     */
    public String getInsVnd() {
        return insVnd;
    }

    /**
     * @param insVnd the insVnd to set
     */
    public void setInsVnd(String insVnd) {
        this.insVnd = insVnd;
    }

    /**
     * @return the insTspCode
     */
    public String getInsTspCode() {
        return insTspCode;
    }

    /**
     * @param insTspCode the insTspCode to set
     */
    public void setInsTspCode(String insTspCode) {
        this.insTspCode = insTspCode;
    }

    /**
     * @return the insGcnBlNo
     */
    public String getInsGcnBlNo() {
        return insGcnBlNo;
    }

    /**
     * @param insGcnBlNo the insGcnBlNo to set
     */
    public void setInsGcnBlNo(String insGcnBlNo) {
        this.insGcnBlNo = insGcnBlNo;
    }

    /**
     * @return the insTnCnNo
     */
    public String getInsTnCnNo() {
        return insTnCnNo;
    }

    /**
     * @param insTnCnNo the insTnCnNo to set
     */
    public void setInsTnCnNo(String insTnCnNo) {
        this.insTnCnNo = insTnCnNo;
    }

    /**
     * @return the insSumQt
     */
    public double getInsSumQt() {
        return insSumQt;
    }

    /**
     * @param insSumQt the insSumQt to set
     */
    public void setInsSumQt(double insSumQt) {
        this.insSumQt = insSumQt;
    }

    /**
     * @return the insInvAmtCur
     */
    public double getInsInvAmtCur() {
        return insInvAmtCur;
    }

    /**
     * @param insInvAmtCur the insInvAmtCur to set
     */
    public void setInsInvAmtCur(double insInvAmtCur) {
        this.insInvAmtCur = insInvAmtCur;
    }

    /**
     * @return the insTaxTot
     */
    public double getInsTaxTot() {
        return insTaxTot;
    }

    /**
     * @param insTaxTot the insTaxTot to set
     */
    public void setInsTaxTot(double insTaxTot) {
        this.insTaxTot = insTaxTot;
    }

    /**
     * @return the insAmtTot
     */
    public double getInsAmtTot() {
        return insAmtTot;
    }

    /**
     * @param insAmtTot the insAmtTot to set
     */
    public void setInsAmtTot(double insAmtTot) {
        this.insAmtTot = insAmtTot;
    }

    /**
     * @return the insGwg
     */
    public double getInsGwg() {
        return insGwg;
    }

    /**
     * @param insGwg the insGwg to set
     */
    public void setInsGwg(double insGwg) {
        this.insGwg = insGwg;
    }

    /**
     * @return the insNetWgi
     */
    public double getInsNetWgi() {
        return insNetWgi;
    }

    /**
     * @param insNetWgi the insNetWgi to set
     */
    public void setInsNetWgi(double insNetWgi) {
        this.insNetWgi = insNetWgi;
    }

    /**
     * @return the insNetWgc
     */
    public double getInsNetWgc() {
        return insNetWgc;
    }

    /**
     * @param insNetWgc the insNetWgc to set
     */
    public void setInsNetWgc(double insNetWgc) {
        this.insNetWgc = insNetWgc;
    }

    /**
     * @return the insOrdNo
     */
    public String getInsOrdNo() {
        return insOrdNo;
    }

    /**
     * @param insOrdNo the insOrdNo to set
     */
    public void setInsOrdNo(String insOrdNo) {
        this.insOrdNo = insOrdNo;
    }

    /**
     * @return the insOrdLn
     */
    public String getInsOrdLn() {
        return insOrdLn;
    }

    /**
     * @param insOrdLn the insOrdLn to set
     */
    public void setInsOrdLn(String insOrdLn) {
        this.insOrdLn = insOrdLn;
    }

    /**
     * @return the insOrdSf
     */
    public String getInsOrdSf() {
        return insOrdSf;
    }

    /**
     * @param insOrdSf the insOrdSf to set
     */
    public void setInsOrdSf(String insOrdSf) {
        this.insOrdSf = insOrdSf;
    }

    /**
     * @return the insPdc
     */
    public String getInsPdc() {
        return insPdc;
    }

    /**
     * @param insPdc the insPdc to set
     */
    public void setInsPdc(String insPdc) {
        this.insPdc = insPdc;
    }

    /**
     * @return the insDlrOrdNo
     */
    public String getInsDlrOrdNo() {
        return insDlrOrdNo;
    }

    /**
     * @param insDlrOrdNo the insDlrOrdNo to set
     */
    public void setInsDlrOrdNo(String insDlrOrdNo) {
        this.insDlrOrdNo = insDlrOrdNo;
    }

    /**
     * @return the insSupPno
     */
    public String getInsSupPno() {
        return insSupPno;
    }

    /**
     * @param insSupPno the insSupPno to set
     */
    public void setInsSupPno(String insSupPno) {
        this.insSupPno = insSupPno;
    }

    /**
     * @return the insInvQt
     */
    public double getInsInvQt() {
        return insInvQt;
    }

    /**
     * @param insInvQt the insInvQt to set
     */
    public void setInsInvQt(double insInvQt) {
        this.insInvQt = insInvQt;
    }

    /**
     * @return the insUpceMat
     */
    public double getInsUpceMat() {
        return insUpceMat;
    }

    /**
     * @param insUpceMat the insUpceMat to set
     */
    public void setInsUpceMat(double insUpceMat) {
        this.insUpceMat = insUpceMat;
    }

    /**
     * @return the insUpceTax
     */
    public double getInsUpceTax() {
        return insUpceTax;
    }

    /**
     * @param insUpceTax the insUpceTax to set
     */
    public void setInsUpceTax(double insUpceTax) {
        this.insUpceTax = insUpceTax;
    }

    /**
     * @return the insAmtMat
     */
    public double getInsAmtMat() {
        return insAmtMat;
    }

    /**
     * @param insAmtMat the insAmtMat to set
     */
    public void setInsAmtMat(double insAmtMat) {
        this.insAmtMat = insAmtMat;
    }

    /**
     * @return the insAmtTax
     */
    public double getInsAmtTax() {
        return insAmtTax;
    }

    /**
     * @param insAmtTax the insAmtTax to set
     */
    public void setInsAmtTax(double insAmtTax) {
        this.insAmtTax = insAmtTax;
    }

    /**
     * @return the insInsDt
     */
    public String getInsInsDt() {
        return insInsDt;
    }

    /**
     * @param insInsDt the insInsDt to set
     */
    public void setInsInsDt(String insInsDt) {
        this.insInsDt = insInsDt;
    }

    /**
     * @return the insInsTm
     */
    public String getInsInsTm() {
        return insInsTm;
    }

    /**
     * @param insInsTm the insInsTm to set
     */
    public void setInsInsTm(String insInsTm) {
        this.insInsTm = insInsTm;
    }

    /**
     * @return the insSndDt
     */
    public String getInsSndDt() {
        return insSndDt;
    }

    /**
     * @param insSndDt the insSndDt to set
     */
    public void setInsSndDt(String insSndDt) {
        this.insSndDt = insSndDt;
    }

    /**
     * @return the insSndTm
     */
    public String getInsSndTm() {
        return insSndTm;
    }

    /**
     * @param insSndTm the insSndTm to set
     */
    public void setInsSndTm(String insSndTm) {
        this.insSndTm = insSndTm;
    }

    /**
     * @return the trnDesc
     */
    public String getTrnDesc() {
        return trnDesc;
    }

    /**
     * @param trnDesc the trnDesc to set
     */
    public void setTrnDesc(String trnDesc) {
        this.trnDesc = trnDesc;
    }

    /**
     * @return the trncd
     */
    public String getTrncd() {
        return trncd;
    }

    /**
     * @param trncd the trncd to set
     */
    public void setTrncd(String trncd) {
        this.trncd = trncd;
    }

    /**
     * @return the tpmTrnNm
     */
    public String getTpmTrnNm() {
        return tpmTrnNm;
    }

    /**
     * @param tpmTrnNm the tpmTrnNm to set
     */
    public void setTpmTrnNm(String tpmTrnNm) {
        this.tpmTrnNm = tpmTrnNm;
    }

    /**
     * @return the ordSplQt
     */
    public double getOrdSplQt() {
        return ordSplQt;
    }

    /**
     * @param ordSplQt the ordSplQt to set
     */
    public void setOrdSplQt(double ordSplQt) {
        this.ordSplQt = ordSplQt;
    }

    /**
     * @return the ordLstShpDt
     */
    public String getOrdLstShpDt() {
        return ordLstShpDt;
    }

    /**
     * @param ordLstShpDt the ordLstShpDt to set
     */
    public void setOrdLstShpDt(String ordLstShpDt) {
        this.ordLstShpDt = ordLstShpDt;
    }

    /**
     * @return the ordUpceCur
     */
    public double getOrdUpceCur() {
        return ordUpceCur;
    }

    /**
     * @param ordUpceCur the ordUpceCur to set
     */
    public void setOrdUpceCur(double ordUpceCur) {
        this.ordUpceCur = ordUpceCur;
    }

    /**
     * @return the ordPdc
     */
    public String getOrdPdc() {
        return ordPdc;
    }

    /**
     * @param ordPdc the ordPdc to set
     */
    public void setOrdPdc(String ordPdc) {
        this.ordPdc = ordPdc;
    }

    /**
     * @return the etdEtaDpos
     */
    public String getEtdEtaDpos() {
        return etdEtaDpos;
    }

    /**
     * @param etdEtaDpos the etdEtaDpos to set
     */
    public void setEtdEtaDpos(String etdEtaDpos) {
        this.etdEtaDpos = etdEtaDpos;
    }

    /**
     * @return the ivdInvNo
     */
    public String getIvdInvNo() {
        return ivdInvNo;
    }

    /**
     * @param ivdInvNo the ivdInvNo to set
     */
    public void setIvdInvNo(String ivdInvNo) {
        this.ivdInvNo = ivdInvNo;
    }

    /**
     * @return the caseNo
     */
    public String getCaseNo() {
        return caseNo;
    }

    /**
     * @param caseNo the caseNo to set
     */
    public void setCaseNo(String caseNo) {
        this.caseNo = caseNo;
    }
}