package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 기준정보 > 영수증스캔이력관리
 * </pre>
 *
 * @ClassName   : ReceiptScanHistMgmtVO.java
 * @Description : 기준정보 > 영수증스캔이력관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.     chibeom.song     최초 생성
 * </pre>
 */

public class ReceiptScanHistMgmtVO extends BaseVO{

    private static final long serialVersionUID = 8835548827065572989L;

    private String langCd;

    // 내용
    private String dlrCd;
    private String upDt;
    private String receiptNo;
    private String receiptType;
    private String vinNo;
    private String vinNo1;
    private String vinNo2;
    private String taxpayerIdCd;
    private String receiptCd;
    private String receiptCustNm;
    private String ssnCrnNo;
    private String receiptIssDt;
    private String scanVinNo;
    private String sumAmt;
    private String certNo;
    private String engnNo;
    private String sumIncTax;
    private String sumExcTax;
    private String taxRt;
    private String taxAmt;
    private String merchNm;
    private String custAddr;
    private String tmrCd;
    private String regUsrId;
    private Date regDt;
    private Date custSaleDt;
    private Date receiptStat;
    private String uploadStat;


    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }
    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }
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
     * @return the upDt
     */
    public String getUpDt() {
        return upDt;
    }
    /**
     * @param upDt the upDt to set
     */
    public void setUpDt(String upDt) {
        this.upDt = upDt;
    }
    /**
     * @return the receiptNo
     */
    public String getReceiptNo() {
        return receiptNo;
    }
    /**
     * @param receiptNo the receiptNo to set
     */
    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }
    /**
     * @return the receiptType
     */
    public String getReceiptType() {
        return receiptType;
    }
    /**
     * @param receiptType the receiptType to set
     */
    public void setReceiptType(String receiptType) {
        this.receiptType = receiptType;
    }
    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    /**
     * @return the vinNo1
     */
    public String getVinNo1() {
        return vinNo1;
    }
    /**
     * @param vinNo1 the vinNo1 to set
     */
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }
    /**
     * @return the vinNo2
     */
    public String getVinNo2() {
        return vinNo2;
    }
    /**
     * @param vinNo2 the vinNo2 to set
     */
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
    }
    /**
     * @return the taxpayerIdCd
     */
    public String getTaxpayerIdCd() {
        return taxpayerIdCd;
    }
    /**
     * @param taxpayerIdCd the taxpayerIdCd to set
     */
    public void setTaxpayerIdCd(String taxpayerIdCd) {
        this.taxpayerIdCd = taxpayerIdCd;
    }
    /**
     * @return the receiptCd
     */
    public String getReceiptCd() {
        return receiptCd;
    }
    /**
     * @param receiptCd the receiptCd to set
     */
    public void setReceiptCd(String receiptCd) {
        this.receiptCd = receiptCd;
    }
    /**
     * @return the receiptCustNm
     */
    public String getReceiptCustNm() {
        return receiptCustNm;
    }
    /**
     * @param receiptCustNm the receiptCustNm to set
     */
    public void setReceiptCustNm(String receiptCustNm) {
        this.receiptCustNm = receiptCustNm;
    }
    /**
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }
    /**
     * @param ssnCrnNo the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }
    /**
     * @return the receiptIssDt
     */
    public String getReceiptIssDt() {
        return receiptIssDt;
    }
    /**
     * @param receiptIssDt the receiptIssDt to set
     */
    public void setReceiptIssDt(String receiptIssDt) {
        this.receiptIssDt = receiptIssDt;
    }
    /**
     * @return the scanVinNo
     */
    public String getScanVinNo() {
        return scanVinNo;
    }
    /**
     * @param scanVinNo the scanVinNo to set
     */
    public void setScanVinNo(String scanVinNo) {
        this.scanVinNo = scanVinNo;
    }
    /**
     * @return the sumAmt
     */
    public String getSumAmt() {
        return sumAmt;
    }
    /**
     * @param sumAmt the sumAmt to set
     */
    public void setSumAmt(String sumAmt) {
        this.sumAmt = sumAmt;
    }
    /**
     * @return the certNo
     */
    public String getCertNo() {
        return certNo;
    }
    /**
     * @param certNo the certNo to set
     */
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }
    /**
     * @return the engnNo
     */
    public String getEngnNo() {
        return engnNo;
    }
    /**
     * @param engnNo the engnNo to set
     */
    public void setEngnNo(String engnNo) {
        this.engnNo = engnNo;
    }
    /**
     * @return the sumIncTax
     */
    public String getSumIncTax() {
        return sumIncTax;
    }
    /**
     * @param sumIncTax the sumIncTax to set
     */
    public void setSumIncTax(String sumIncTax) {
        this.sumIncTax = sumIncTax;
    }
    /**
     * @return the sumExcTax
     */
    public String getSumExcTax() {
        return sumExcTax;
    }
    /**
     * @param sumExcTax the sumExcTax to set
     */
    public void setSumExcTax(String sumExcTax) {
        this.sumExcTax = sumExcTax;
    }
    /**
     * @return the taxRt
     */
    public String getTaxRt() {
        return taxRt;
    }
    /**
     * @param taxRt the taxRt to set
     */
    public void setTaxRt(String taxRt) {
        this.taxRt = taxRt;
    }
    /**
     * @return the taxAmt
     */
    public String getTaxAmt() {
        return taxAmt;
    }
    /**
     * @param taxAmt the taxAmt to set
     */
    public void setTaxAmt(String taxAmt) {
        this.taxAmt = taxAmt;
    }
    /**
     * @return the merchNm
     */
    public String getMerchNm() {
        return merchNm;
    }
    /**
     * @param merchNm the merchNm to set
     */
    public void setMerchNm(String merchNm) {
        this.merchNm = merchNm;
    }
    /**
     * @return the custAddr
     */
    public String getCustAddr() {
        return custAddr;
    }
    /**
     * @param custAddr the custAddr to set
     */
    public void setCustAddr(String custAddr) {
        this.custAddr = custAddr;
    }
    /**
     * @return the tmrCd
     */
    public String getTmrCd() {
        return tmrCd;
    }
    /**
     * @param tmrCd the tmrCd to set
     */
    public void setTmrCd(String tmrCd) {
        this.tmrCd = tmrCd;
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
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the custSaleDt
     */
    public Date getCustSaleDt() {
        return custSaleDt;
    }
    /**
     * @param custSaleDt the custSaleDt to set
     */
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
    }
    /**
     * @return the receiptStat
     */
    public Date getReceiptStat() {
        return receiptStat;
    }
    /**
     * @param receiptStat the receiptStat to set
     */
    public void setReceiptStat(Date receiptStat) {
        this.receiptStat = receiptStat;
    }
    /**
     * @return the uploadStat
     */
    public String getUploadStat() {
        return uploadStat;
    }
    /**
     * @param uploadStat the uploadStat to set
     */
    public void setUploadStat(String uploadStat) {
        this.uploadStat = uploadStat;
    }
}
