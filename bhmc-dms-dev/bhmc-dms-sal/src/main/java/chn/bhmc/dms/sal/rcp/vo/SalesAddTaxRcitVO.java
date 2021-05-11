package chn.bhmc.dms.sal.rcp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 영수증관리 > 부가세영수증관리
 * </pre>
 *
 * @ClassName   : SalesAddTaxRcitVO.java
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

public class SalesAddTaxRcitVO extends BaseVO{

    private static final long serialVersionUID = 8835548827065572989L;

    // 내용
    private String carId;
    private int seq;
    private String vinNo;
    private String vinNo1;
    private String vinNo2;
    private String dlrCd;
    private String taxpayerIdCd;
    private String receiptNo;
    private String receiptCd;
    private String buyNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiptIssDt;
    private double scanSumAmt;
    private String carlineCd;
    private String carlineNm;
    private String modelCd;
    private String modelNm;
    private String jeongpanNo;
    private String extColorCd;
    private String extColorNm;
    private double wsPrc;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;
    private double sumAmt;
    private double taxAmt;
    private byte[] receiptImg;
    private String tmrCd;
    private String evalRsltCd;
    private String errUpCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date uploadDt;
    private String sdlrCd;

    private String scanReceiptCd;
    private String scanBuyNm;
    private String scanReceiptIssDate;
    private String scanTaxPayerId;
    private String scanReceiptNo;
    private double scanIncTotAmt;
    private byte[] scanBlob;
    private String scanFileImgDir;

    private String secDlrCd;
    private String fileNo;
    private int fileSeq;
    private int fileSizeVal;

    private String tempCd01;
    private String tempCd02;
    private String tempCd03;
    private String tempCd04;
    private String tempCd05;
    private String tempN01;
    private String tempN02;
    private String tempN03;
    private String tempN04;
    private String tempN05;

    private String sdlrTp;
    private String sdlrNm;
    private String receiptId;
    private String showYn;

    /**
     * @return the carId
     */
    public String getCarId() {
        return carId;
    }

    /**
     * @param carId the carId to set
     */
    public void setCarId(String carId) {
        this.carId = carId;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
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
     * @return the texpayerIdCd
     */
    public String getTaxpayerIdCd() {
        return taxpayerIdCd;
    }

    /**
     * @param texpayerIdCd the texpayerIdCd to set
     */
    public void setTaxpayerIdCd(String taxpayerIdCd) {
        this.taxpayerIdCd = taxpayerIdCd;
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
     * @return the buyNm
     */
    public String getBuyNm() {
        return buyNm;
    }

    /**
     * @param buyNm the buyNm to set
     */
    public void setBuyNm(String buyNm) {
        this.buyNm = buyNm;
    }

    /**
     * @return the receiptIssDt
     */
    public Date getReceiptIssDt() {
        return receiptIssDt;
    }

    /**
     * @param receiptIssDt the receiptIssDt to set
     */
    public void setReceiptIssDt(Date receiptIssDt) {
        this.receiptIssDt = receiptIssDt;
    }

    /**
     * @return the scanSumAmt
     */
    public double getScanSumAmt() {
        return scanSumAmt;
    }

    /**
     * @param scanSumAmt the scanSumAmt to set
     */
    public void setScanSumAmt(double scanSumAmt) {
        this.scanSumAmt = scanSumAmt;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }

    /**
     * @return the jeongpanNo
     */
    public String getJeongpanNo() {
        return jeongpanNo;
    }

    /**
     * @param jeongpanNo the jeongpanNo to set
     */
    public void setJeongpanNo(String jeongpanNo) {
        this.jeongpanNo = jeongpanNo;
    }

    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }

    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }

    /**
     * @return the wsPrc
     */
    public double getWsPrc() {
        return wsPrc;
    }

    /**
     * @param wsPrc the wsPrc to set
     */
    public void setWsPrc(double wsPrc) {
        this.wsPrc = wsPrc;
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
     * @return the pltGiDt
     */
    public Date getPltGiDt() {
        return pltGiDt;
    }

    /**
     * @param pltGiDt the pltGiDt to set
     */
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
    }

    /**
     * @return the sumAmt
     */
    public double getSumAmt() {
        return sumAmt;
    }

    /**
     * @param sumAmt the sumAmt to set
     */
    public void setSumAmt(double sumAmt) {
        this.sumAmt = sumAmt;
    }

    /**
     * @return the taxAmt
     */
    public double getTaxAmt() {
        return taxAmt;
    }

    /**
     * @param taxAmt the taxAmt to set
     */
    public void setTaxAmt(double taxAmt) {
        this.taxAmt = taxAmt;
    }

    /**
     * @return the receiptImg
     */
    public byte[] getReceiptImg() {
        return receiptImg;
    }

    /**
     * @param receiptImg the receiptImg to set
     */
    public void setReceiptImg(byte[] receiptImg) {
        this.receiptImg = receiptImg;
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
     * @return the evalRsltCd
     */
    public String getEvalRsltCd() {
        return evalRsltCd;
    }

    /**
     * @param evalRsltCd the evalRsltCd to set
     */
    public void setEvalRsltCd(String evalRsltCd) {
        this.evalRsltCd = evalRsltCd;
    }

    /**
     * @return the errUpCd
     */
    public String getErrUpCd() {
        return errUpCd;
    }

    /**
     * @param errUpCd the errUpCd to set
     */
    public void setErrUpCd(String errUpCd) {
        this.errUpCd = errUpCd;
    }

    /**
     * @return the uploadDt
     */
    public Date getUploadDt() {
        return uploadDt;
    }

    /**
     * @param uploadDt the uploadDt to set
     */
    public void setUploadDt(Date uploadDt) {
        this.uploadDt = uploadDt;
    }

    /**
     * @return the sdlrCd
     */
    public String getSdlrCd() {
        return sdlrCd;
    }

    /**
     * @param sdlrCd the sdlrCd to set
     */
    public void setSdlrCd(String sdlrCd) {
        this.sdlrCd = sdlrCd;
    }

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
    public String getScanReceiptIssDate() {
        return scanReceiptIssDate;
    }

    /**
     * @param scanReceiptIssDate the scanReceiptIssDate to set
     */
    public void setScanReceiptIssDate(String scanReceiptIssDate) {
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



    public String getFileNo() {
        return fileNo;
    }

    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }

    public int getFileSeq() {
        return fileSeq;
    }

    public void setFileSeq(int fileSeq) {
        this.fileSeq = fileSeq;
    }

    public int getFileSizeVal() {
        return fileSizeVal;
    }

    public void setFileSizeVal(int fileSizeVal) {
        this.fileSizeVal = fileSizeVal;
    }

    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }

    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }

    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }

    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }

    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }

    public String getTempCd01() {
        return tempCd01;
    }

    public void setTempCd01(String tempCd01) {
        this.tempCd01 = tempCd01;
    }

    public String getTempCd02() {
        return tempCd02;
    }

    public void setTempCd02(String tempCd02) {
        this.tempCd02 = tempCd02;
    }

    public String getTempCd03() {
        return tempCd03;
    }

    public void setTempCd03(String tempCd03) {
        this.tempCd03 = tempCd03;
    }

    public String getTempCd04() {
        return tempCd04;
    }

    public void setTempCd04(String tempCd04) {
        this.tempCd04 = tempCd04;
    }

    public String getTempCd05() {
        return tempCd05;
    }

    public void setTempCd05(String tempCd05) {
        this.tempCd05 = tempCd05;
    }

    public String getTempN01() {
        return tempN01;
    }

    public void setTempN01(String tempN01) {
        this.tempN01 = tempN01;
    }

    public String getTempN02() {
        return tempN02;
    }

    public void setTempN02(String tempN02) {
        this.tempN02 = tempN02;
    }

    public String getTempN03() {
        return tempN03;
    }

    public void setTempN03(String tempN03) {
        this.tempN03 = tempN03;
    }

    public String getTempN04() {
        return tempN04;
    }

    public void setTempN04(String tempN04) {
        this.tempN04 = tempN04;
    }

    public String getTempN05() {
        return tempN05;
    }

    public void setTempN05(String tempN05) {
        this.tempN05 = tempN05;
    }

    /**
     * @return the sdlrTp
     */
    public String getSdlrTp() {
        return sdlrTp;
    }

    /**
     * @param sdlrTp the sdlrTp to set
     */
    public void setSdlrTp(String sdlrTp) {
        this.sdlrTp = sdlrTp;
    }

    /**
     * @return the sdlrNm
     */
    public String getSdlrNm() {
        return sdlrNm;
    }

    /**
     * @param sdlrNm the sdlrNm to set
     */
    public void setSdlrNm(String sdlrNm) {
        this.sdlrNm = sdlrNm;
    }

    public String getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(String receiptId) {
        this.receiptId = receiptId;
    }

	public String getShowYn() {
		return showYn;
	}

	public void setShowYn(String showYn) {
		this.showYn = showYn;
	}



}
