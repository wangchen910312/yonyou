package chn.bhmc.dms.sal.rcp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

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


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3036698541978406827L;
    // 내용
    private String receiptId;
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

    public String getReceiptId() {
        return receiptId;
    }
    public void setReceiptId(String receiptId) {
        this.receiptId = receiptId;
    }
    public String getCarId() {
        return carId;
    }
    public void setCarId(String carId) {
        this.carId = carId;
    }
    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public String getVinNo() {
        return vinNo;
    }
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    public String getVinNo1() {
        return vinNo1;
    }
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }
    public String getVinNo2() {
        return vinNo2;
    }
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
    }
    public String getDlrCd() {
        return dlrCd;
    }
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    public String getTaxpayerIdCd() {
        return taxpayerIdCd;
    }
    public void setTaxpayerIdCd(String taxpayerIdCd) {
        this.taxpayerIdCd = taxpayerIdCd;
    }
    public String getReceiptNo() {
        return receiptNo;
    }
    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }
    public String getReceiptCd() {
        return receiptCd;
    }
    public void setReceiptCd(String receiptCd) {
        this.receiptCd = receiptCd;
    }
    public String getBuyNm() {
        return buyNm;
    }
    public void setBuyNm(String buyNm) {
        this.buyNm = buyNm;
    }
    public Date getReceiptIssDt() {
        return receiptIssDt;
    }
    public void setReceiptIssDt(Date receiptIssDt) {
        this.receiptIssDt = receiptIssDt;
    }
    public double getScanSumAmt() {
        return scanSumAmt;
    }
    public void setScanSumAmt(double scanSumAmt) {
        this.scanSumAmt = scanSumAmt;
    }
    public String getCarlineCd() {
        return carlineCd;
    }
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    public String getCarlineNm() {
        return carlineNm;
    }
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    public String getModelCd() {
        return modelCd;
    }
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    public String getModelNm() {
        return modelNm;
    }
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    public String getJeongpanNo() {
        return jeongpanNo;
    }
    public void setJeongpanNo(String jeongpanNo) {
        this.jeongpanNo = jeongpanNo;
    }
    public String getExtColorCd() {
        return extColorCd;
    }
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    public String getExtColorNm() {
        return extColorNm;
    }
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    public double getWsPrc() {
        return wsPrc;
    }
    public void setWsPrc(double wsPrc) {
        this.wsPrc = wsPrc;
    }
    public Date getPltGiDt() {
        return pltGiDt;
    }
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
    }
    public double getSumAmt() {
        return sumAmt;
    }
    public void setSumAmt(double sumAmt) {
        this.sumAmt = sumAmt;
    }
    public double getTaxAmt() {
        return taxAmt;
    }
    public void setTaxAmt(double taxAmt) {
        this.taxAmt = taxAmt;
    }
    public byte[] getReceiptImg() {
        return receiptImg;
    }
    public void setReceiptImg(byte[] receiptImg) {
        this.receiptImg = receiptImg;
    }
    public String getTmrCd() {
        return tmrCd;
    }
    public void setTmrCd(String tmrCd) {
        this.tmrCd = tmrCd;
    }
    public String getEvalRsltCd() {
        return evalRsltCd;
    }
    public void setEvalRsltCd(String evalRsltCd) {
        this.evalRsltCd = evalRsltCd;
    }
    public String getErrUpCd() {
        return errUpCd;
    }
    public void setErrUpCd(String errUpCd) {
        this.errUpCd = errUpCd;
    }
    public Date getUploadDt() {
        return uploadDt;
    }
    public void setUploadDt(Date uploadDt) {
        this.uploadDt = uploadDt;
    }
    public String getSdlrCd() {
        return sdlrCd;
    }
    public void setSdlrCd(String sdlrCd) {
        this.sdlrCd = sdlrCd;
    }
    public String getScanReceiptCd() {
        return scanReceiptCd;
    }
    public void setScanReceiptCd(String scanReceiptCd) {
        this.scanReceiptCd = scanReceiptCd;
    }
    public String getScanBuyNm() {
        return scanBuyNm;
    }
    public void setScanBuyNm(String scanBuyNm) {
        this.scanBuyNm = scanBuyNm;
    }
    public String getScanReceiptIssDate() {
        return scanReceiptIssDate;
    }
    public void setScanReceiptIssDate(String scanReceiptIssDate) {
        this.scanReceiptIssDate = scanReceiptIssDate;
    }
    public String getScanTaxPayerId() {
        return scanTaxPayerId;
    }
    public void setScanTaxPayerId(String scanTaxPayerId) {
        this.scanTaxPayerId = scanTaxPayerId;
    }
    public String getScanReceiptNo() {
        return scanReceiptNo;
    }
    public void setScanReceiptNo(String scanReceiptNo) {
        this.scanReceiptNo = scanReceiptNo;
    }
    public double getScanIncTotAmt() {
        return scanIncTotAmt;
    }
    public void setScanIncTotAmt(double scanIncTotAmt) {
        this.scanIncTotAmt = scanIncTotAmt;
    }
    public byte[] getScanBlob() {
        return scanBlob;
    }
    public void setScanBlob(byte[] scanBlob) {
        this.scanBlob = scanBlob;
    }
    public String getScanFileImgDir() {
        return scanFileImgDir;
    }
    public void setScanFileImgDir(String scanFileImgDir) {
        this.scanFileImgDir = scanFileImgDir;
    }
    public String getSecDlrCd() {
        return secDlrCd;
    }
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
    public String getSdlrTp() {
        return sdlrTp;
    }
    public void setSdlrTp(String sdlrTp) {
        this.sdlrTp = sdlrTp;
    }
    public String getSdlrNm() {
        return sdlrNm;
    }
    public void setSdlrNm(String sdlrNm) {
        this.sdlrNm = sdlrNm;
    }

}