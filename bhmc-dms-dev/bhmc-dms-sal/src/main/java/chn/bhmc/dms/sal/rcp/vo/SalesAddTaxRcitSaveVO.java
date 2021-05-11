package chn.bhmc.dms.sal.rcp.vo;

import java.util.Date;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * 영수증관리 > 부가세영수증관리
 * </pre>
 *
 * @ClassName   : SalesAddTaxRcitSaveVO.java
 * @Description : 영수증관리 > 부가세영수증관리
 * @author chibeom.song
 * @since 2017. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 24.   chibeom.song     최초 생성
 * </pre>
 */

public class SalesAddTaxRcitSaveVO extends BaseSaveVO<SalesAddTaxRcitVO> {

    private static final long serialVersionUID = -1210745396214803853L;

    private String scanReceiptCd;
    private String scanBuyNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date scanReceiptIssDate;
    private String scanTaxPayerId;
    private String scanReceiptNo;
    private double scanIncTotAmt;
    private byte[] scanBlob;
    private String scanFileImgDir;

    private String secDlrCd;

    SalesAddTaxRcitVO salesAddTaxRcitVO;

    BaseSaveVO<SalesAddTaxRcitVO> addTaxRcitList;

    /**
     * @return the scanReceiptCd
     */
    public String getScanReceiptCd() {
        return scanReceiptCd;
    }

    /**
     * @param scanReceiptCd the scanReceiptCd to set
     */
    public void setScanReceiptCd(String scanReceiptCd) {
        this.scanReceiptCd = scanReceiptCd;
    }

    /**
     * @return the scanBuyNm
     */
    public String getScanBuyNm() {
        return scanBuyNm;
    }

    /**
     * @param scanBuyNm the scanBuyNm to set
     */
    public void setScanBuyNm(String scanBuyNm) {
        this.scanBuyNm = scanBuyNm;
    }

    /**
     * @return the scanReceiptIssDate
     */
    public Date getScanReceiptIssDate() {
        return scanReceiptIssDate;
    }

    /**
     * @param scanReceiptIssDate the scanReceiptIssDate to set
     */
    public void setScanReceiptIssDate(Date scanReceiptIssDate) {
        this.scanReceiptIssDate = scanReceiptIssDate;
    }

    /**
     * @return the scanTaxPayerId
     */
    public String getScanTaxPayerId() {
        return scanTaxPayerId;
    }

    /**
     * @param scanTaxPayerId the scanTaxPayerId to set
     */
    public void setScanTaxPayerId(String scanTaxPayerId) {
        this.scanTaxPayerId = scanTaxPayerId;
    }

    /**
     * @return the scanReceiptNo
     */
    public String getScanReceiptNo() {
        return scanReceiptNo;
    }

    /**
     * @param scanReceiptNo the scanReceiptNo to set
     */
    public void setScanReceiptNo(String scanReceiptNo) {
        this.scanReceiptNo = scanReceiptNo;
    }

    /**
     * @return the scanIncTotAmt
     */
    public double getScanIncTotAmt() {
        return scanIncTotAmt;
    }

    /**
     * @param scanIncTotAmt the scanIncTotAmt to set
     */
    public void setScanIncTotAmt(double scanIncTotAmt) {
        this.scanIncTotAmt = scanIncTotAmt;
    }

    /**
     * @return the scanBlob
     */
    public byte[] getScanBlob() {
        return scanBlob;
    }

    /**
     * @param scanBlob the scanBlob to set
     */
    public void setScanBlob(byte[] scanBlob) {
        this.scanBlob = scanBlob;
    }

    /**
     * @return the scanFileImgDir
     */
    public String getScanFileImgDir() {
        return scanFileImgDir;
    }

    /**
     * @param scanFileImgDir the scanFileImgDir to set
     */
    public void setScanFileImgDir(String scanFileImgDir) {
        this.scanFileImgDir = scanFileImgDir;
    }

    /**
     * @return the secDlrCd
     */
    public String getSecDlrCd() {
        return secDlrCd;
    }

    /**
     * @param secDlrCd the secDlrCd to set
     */
    public void setSecDlrCd(String secDlrCd) {
        this.secDlrCd = secDlrCd;
    }

    /**
     * @return the salesAddTaxRcitVO
     */
    public SalesAddTaxRcitVO getSalesAddTaxRcitVO() {
        return salesAddTaxRcitVO;
    }

    /**
     * @param salesAddTaxRcitVO the salesAddTaxRcitVO to set
     */
    public void setSalesAddTaxRcitVO(SalesAddTaxRcitVO salesAddTaxRcitVO) {
        this.salesAddTaxRcitVO = salesAddTaxRcitVO;
    }

    /**
     * @return the addTaxRcitList
     */
    public BaseSaveVO<SalesAddTaxRcitVO> getAddTaxRcitList() {
        return addTaxRcitList;
    }

    /**
     * @param addTaxRcitList the addTaxRcitList to set
     */
    public void setAddTaxRcitList(BaseSaveVO<SalesAddTaxRcitVO> addTaxRcitList) {
        this.addTaxRcitList = addTaxRcitList;
    }

}
