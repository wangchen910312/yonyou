package chn.bhmc.dms.sal.rcp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
/**
 * <pre>
 * 영수증관리 > 기동차통일영수증관리
 * </pre>
 *
 * @ClassName   : SalesVehicleCombineReceiptVO.java
 * @Description : 영수증관리 > 기동차통일영수증관리
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

public class SalesVhclCbinRcitVO extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -598716768575116757L;
    // 내용
    private String carId;
    private String vinNo;
    private String vinNo1;
    private String vinNo2;
    private String ordDlrCd;
    private String dlrCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;
    private String taxpayerIdCd;
    private String receiptNo;
    private String receiptCd;
    private String receiptCustNm;
    private String ssnCrnNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiptIssDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiptUpdt;
    private String updtUsrId;
    private double sumAmt;
    private String certNo;
    private String engnNo;
    private double sumIncTax;
    private double sumExcTax;
    private String taxRt;
    private double taxAmt;
    private String merchNm;
    private String custAddr;
    private byte[] receiptImg;
    private String tmrCd;
    private String evalRsltCd;
    private String certFst;
    private String cert2nd;
    private String cert3rd;
    private String errUpCd;
    private String addr;
    private String taxChkYn;
    private String addtaxReceiptNo;

    private String vinType;
    private String uploadStat;

    private String provinceCd;
    private String provinceNm;
    private String carlineCd;
    private String carlineNm;
    private String modelCd;
    private String modelNm;
    private String ocnCd;
    private String ocnNm;
    private String extColorCd;
    private String extColorNm;
    private String intColorCd;
    private String intColorNm;
    private String carStatCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;
    private String jeongpanNo;
    private String vinmF20010;
    private double wsPrc;

    private String scanRcptPubDt;
    private String scanRcptCd;
    private String scanRcptNo;
    private String scanCustInfo;
    private String scanCertNo;
    private String scanEngNo;
    private String scanVinNo;
    private double scanTaxIncPrice;
    private String scanSaleCmpnNm;
    private String scanPayTaxPinNo;
    private String scanSaleCmpnAddr;
    private String scanTaxRate;
    private double scanTaxAmt;
    private double scanTaxExcPrice;
    private String scanSsnCrnNo;
    private byte[] scanBlob;
    private String scanFileImgDir;

    private String secDlrCd;
    private String taxBeforeChk;

    private String sdlrCd;
    private String sdlrTp;
    private String sdlrNm;

    private String grteStartDt;

    private String chkSsnCrnNo;
    private String addtaxReceiptYn;
    private String custNm;
    private String custSsnCrnNo;

    private String sungNm;
    private String sungCd;
    private String remark;
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

    private String sdptCd;
    private String distOfficeCd;
    private String uploadStatNm;
    private String errUpNm;

    private String taxSungCd;
    private double  msPrc;//指导价 R19080700284 贾明 2019-8-8 
    private String  judUnSociCreo;  //R19092301306 判断统一社会信用代码  贾明 2019-9-24 
    // R19111100817 统一发票下载功能 修正 贾明 2019-11-14 start 
    private String chkSsnCrnNm;
    private String certFstNm;
    private String cert2ndNm;
    private String taxChkNm;
    private String increaseTicketYn;
    private String offNm; //办事处
    private String sdptNm; //事业部
    // R19111100817 统一发票下载功能 修正 贾明 2019-11-14 end 
    /**
     * 发票图片路径
     */
    private String imgPath;
    
    /**
     * 本地图片base64字节流
     */
    private byte[] imgDecoder;

    private String manufactYyMmDt;
    // 2021-04-14 宫荣枢 机动车统一发票增加字段
    // 经销商名称
    private String dlrNm;
    private String receiptStatusNm;
    // 发票类型（000001-专用发票 000003-机动车发票 000004-普通发票 000015-二手车发票）
    private String receiptType;
    // 车辆类型
    private String carType;
    // 厂牌型号
    private String brandModel;
    // 产地
    private String prodArea;
    // 进口证书号
    private String importCertNo;
    // 商检单号
    private String comInsNo;
    // 吨位
    private String ton;
    // 限乘
    private String limitNum;
    // 生产企业名称
    private String entNm;
    // 销方名称
    private String selNm;
    // 销方税号
    private String selTaxpayerIdCd;
    // 销方地址
    private String selAddr;
    // 销方电话
    private String selPhone;
    // 销方开户行
    private String selBank;
    // 销方开户行账号
    private String selBankNo;
    // 开票人
    private String drawer;
    // 发票录入来源（01.数衍发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码）
    private String receiptInResource;
    // 发票状态（01.正常、02.作废、04.红冲）
    private String receiptStatus;
    // 是否绑定车辆（Y.已绑定、N.未绑定）
    private String bindingCarYn;
    
    /**
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }
    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }
    /**
     * @return the distOfficeCd
     */
    public String getDistOfficeCd() {
        return distOfficeCd;
    }
    /**
     * @param distOfficeCd the distOfficeCd to set
     */
    public void setDistOfficeCd(String distOfficeCd) {
        this.distOfficeCd = distOfficeCd;
    }
    /**
     * @return the uploadStatNm
     */
    public String getUploadStatNm() {
        return uploadStatNm;
    }
    /**
     * @param uploadStatNm the uploadStatNm to set
     */
    public void setUploadStatNm(String uploadStatNm) {
        this.uploadStatNm = uploadStatNm;
    }
    /**
     * @return the errUpNm
     */
    public String getErrUpNm() {
        return errUpNm;
    }
    /**
     * @param errUpNm the errUpNm to set
     */
    public void setErrUpNm(String errUpNm) {
        this.errUpNm = errUpNm;
    }
    public String getCarId() {
        return carId;
    }
    public void setCarId(String carId) {
        this.carId = carId;
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
    public String getOrdDlrCd() {
        return ordDlrCd;
    }
    public void setOrdDlrCd(String ordDlrCd) {
        this.ordDlrCd = ordDlrCd;
    }
    public String getDlrCd() {
        return dlrCd;
    }
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    public Date getCustSaleDt() {
        return custSaleDt;
    }
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
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
    public String getReceiptCustNm() {
        return receiptCustNm;
    }
    public void setReceiptCustNm(String receiptCustNm) {
        this.receiptCustNm = receiptCustNm;
    }
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }
    public Date getReceiptIssDt() {
        return receiptIssDt;
    }
    public void setReceiptIssDt(Date receiptIssDt) {
        this.receiptIssDt = receiptIssDt;
    }
    public Date getReceiptUpdt() {
        return receiptUpdt;
    }
    public void setReceiptUpdt(Date receiptUpdt) {
        this.receiptUpdt = receiptUpdt;
    }
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    public double getSumAmt() {
        return sumAmt;
    }
    public void setSumAmt(double sumAmt) {
        this.sumAmt = sumAmt;
    }
    public String getCertNo() {
        return certNo;
    }
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }
    public String getEngnNo() {
        return engnNo;
    }
    public void setEngnNo(String engnNo) {
        this.engnNo = engnNo;
    }
    public double getSumIncTax() {
        return sumIncTax;
    }
    public void setSumIncTax(double sumIncTax) {
        this.sumIncTax = sumIncTax;
    }
    public double getSumExcTax() {
        return sumExcTax;
    }
    public void setSumExcTax(double sumExcTax) {
        this.sumExcTax = sumExcTax;
    }
    public String getTaxRt() {
        return taxRt;
    }
    public void setTaxRt(String taxRt) {
        this.taxRt = taxRt;
    }
    public double getTaxAmt() {
        return taxAmt;
    }
    public void setTaxAmt(double taxAmt) {
        this.taxAmt = taxAmt;
    }
    public String getMerchNm() {
        return merchNm;
    }
    public void setMerchNm(String merchNm) {
        this.merchNm = merchNm;
    }
    public String getCustAddr() {
        return custAddr;
    }
    public void setCustAddr(String custAddr) {
        this.custAddr = custAddr;
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
    public String getCertFst() {
        return certFst;
    }
    public void setCertFst(String certFst) {
        this.certFst = certFst;
    }
    public String getCert2nd() {
        return cert2nd;
    }
    public void setCert2nd(String cert2nd) {
        this.cert2nd = cert2nd;
    }
    public String getCert3rd() {
        return cert3rd;
    }
    public void setCert3rd(String cert3rd) {
        this.cert3rd = cert3rd;
    }
    public String getErrUpCd() {
        return errUpCd;
    }
    public void setErrUpCd(String errUpCd) {
        this.errUpCd = errUpCd;
    }
    public String getAddr() {
        return addr;
    }
    public void setAddr(String addr) {
        this.addr = addr;
    }
    public String getTaxChkYn() {
        return taxChkYn;
    }
    public void setTaxChkYn(String taxChkYn) {
        this.taxChkYn = taxChkYn;
    }
    public String getAddtaxReceiptNo() {
        return addtaxReceiptNo;
    }
    public void setAddtaxReceiptNo(String addtaxReceiptNo) {
        this.addtaxReceiptNo = addtaxReceiptNo;
    }
    public String getVinType() {
        return vinType;
    }
    public void setVinType(String vinType) {
        this.vinType = vinType;
    }
    public String getUploadStat() {
        return uploadStat;
    }
    public void setUploadStat(String uploadStat) {
        this.uploadStat = uploadStat;
    }
    public String getProvinceCd() {
        return provinceCd;
    }
    public void setProvinceCd(String provinceCd) {
        this.provinceCd = provinceCd;
    }
    public String getProvinceNm() {
        return provinceNm;
    }
    public void setProvinceNm(String provinceNm) {
        this.provinceNm = provinceNm;
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
    public String getOcnCd() {
        return ocnCd;
    }
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    public String getOcnNm() {
        return ocnNm;
    }
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
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
    public String getIntColorCd() {
        return intColorCd;
    }
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    public String getIntColorNm() {
        return intColorNm;
    }
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    public String getCarStatCd() {
        return carStatCd;
    }
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
    }
    public Date getPltGiDt() {
        return pltGiDt;
    }
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
    }
    public String getJeongpanNo() {
        return jeongpanNo;
    }
    public void setJeongpanNo(String jeongpanNo) {
        this.jeongpanNo = jeongpanNo;
    }
    public String getVinmF20010() {
        return vinmF20010;
    }
    public void setVinmF20010(String vinmF20010) {
        this.vinmF20010 = vinmF20010;
    }
    public double getWsPrc() {
        return wsPrc;
    }
    public void setWsPrc(double wsPrc) {
        this.wsPrc = wsPrc;
    }
    public String getScanRcptPubDt() {
        return scanRcptPubDt;
    }
    public void setScanRcptPubDt(String scanRcptPubDt) {
        this.scanRcptPubDt = scanRcptPubDt;
    }
    public String getScanRcptCd() {
        return scanRcptCd;
    }
    public void setScanRcptCd(String scanRcptCd) {
        this.scanRcptCd = scanRcptCd;
    }
    public String getScanRcptNo() {
        return scanRcptNo;
    }
    public void setScanRcptNo(String scanRcptNo) {
        this.scanRcptNo = scanRcptNo;
    }
    public String getScanCustInfo() {
        return scanCustInfo;
    }
    public void setScanCustInfo(String scanCustInfo) {
        this.scanCustInfo = scanCustInfo;
    }
    public String getScanCertNo() {
        return scanCertNo;
    }
    public void setScanCertNo(String scanCertNo) {
        this.scanCertNo = scanCertNo;
    }
    public String getScanEngNo() {
        return scanEngNo;
    }
    public void setScanEngNo(String scanEngNo) {
        this.scanEngNo = scanEngNo;
    }
    public String getScanVinNo() {
        return scanVinNo;
    }
    public void setScanVinNo(String scanVinNo) {
        this.scanVinNo = scanVinNo;
    }
    public double getScanTaxIncPrice() {
        return scanTaxIncPrice;
    }
    public void setScanTaxIncPrice(double scanTaxIncPrice) {
        this.scanTaxIncPrice = scanTaxIncPrice;
    }
    public String getScanSaleCmpnNm() {
        return scanSaleCmpnNm;
    }
    public void setScanSaleCmpnNm(String scanSaleCmpnNm) {
        this.scanSaleCmpnNm = scanSaleCmpnNm;
    }
    public String getScanPayTaxPinNo() {
        return scanPayTaxPinNo;
    }
    public void setScanPayTaxPinNo(String scanPayTaxPinNo) {
        this.scanPayTaxPinNo = scanPayTaxPinNo;
    }
    public String getScanSaleCmpnAddr() {
        return scanSaleCmpnAddr;
    }
    public void setScanSaleCmpnAddr(String scanSaleCmpnAddr) {
        this.scanSaleCmpnAddr = scanSaleCmpnAddr;
    }
    public String getScanTaxRate() {
        return scanTaxRate;
    }
    public void setScanTaxRate(String scanTaxRate) {
        this.scanTaxRate = scanTaxRate;
    }
    public double getScanTaxAmt() {
        return scanTaxAmt;
    }
    public void setScanTaxAmt(double scanTaxAmt) {
        this.scanTaxAmt = scanTaxAmt;
    }
    public double getScanTaxExcPrice() {
        return scanTaxExcPrice;
    }
    public void setScanTaxExcPrice(double scanTaxExcPrice) {
        this.scanTaxExcPrice = scanTaxExcPrice;
    }
    public String getScanSsnCrnNo() {
        return scanSsnCrnNo;
    }
    public void setScanSsnCrnNo(String scanSsnCrnNo) {
        this.scanSsnCrnNo = scanSsnCrnNo;
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
    public String getTaxBeforeChk() {
        return taxBeforeChk;
    }
    public void setTaxBeforeChk(String taxBeforeChk) {
        this.taxBeforeChk = taxBeforeChk;
    }
    public String getSdlrCd() {
        return sdlrCd;
    }
    public void setSdlrCd(String sdlrCd) {
        this.sdlrCd = sdlrCd;
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
    public String getReceiptStatusNm() {
        return receiptStatusNm;
    }
    public void setReceiptStatusNm(String receiptStatusNm) {
        this.receiptStatusNm = receiptStatusNm;
    }
    public String getGrteStartDt() {
        return grteStartDt;
    }
    public void setGrteStartDt(String grteStartDt) {
        this.grteStartDt = grteStartDt;
    }
    public String getChkSsnCrnNo() {
        return chkSsnCrnNo;
    }
    public void setChkSsnCrnNo(String chkSsnCrnNo) {
        this.chkSsnCrnNo = chkSsnCrnNo;
    }
    public String getAddtaxReceiptYn() {
        return addtaxReceiptYn;
    }
    public void setAddtaxReceiptYn(String addtaxReceiptYn) {
        this.addtaxReceiptYn = addtaxReceiptYn;
    }
    public String getCustNm() {
        return custNm;
    }
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    public String getCustSsnCrnNo() {
        return custSsnCrnNo;
    }
    public void setCustSsnCrnNo(String custSsnCrnNo) {
        this.custSsnCrnNo = custSsnCrnNo;
    }
    public String getSungNm() {
        return sungNm;
    }
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }
    public String getSungCd() {
        return sungCd;
    }
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
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
     * @return the taxSungCd
     */
    public String getTaxSungCd() {
        return taxSungCd;
    }
    /**
     * @param taxSungCd the taxSungCd to set
     */
    public void setTaxSungCd(String taxSungCd) {
        this.taxSungCd = taxSungCd;
    }
    /**
     * @return the msPrc
     */
	public double getMsPrc() {
		return msPrc;
	}
	/**
     * @param msPrc the msPrc to set
     */
	public void setMsPrc(double msPrc) {
		this.msPrc = msPrc;
	}
	public String getJudUnSociCreo() {
		return judUnSociCreo;
	}
	public void setJudUnSociCreo(String judUnSociCreo) {
		this.judUnSociCreo = judUnSociCreo;
	}
	public String getChkSsnCrnNm() {
		return chkSsnCrnNm;
	}
	public void setChkSsnCrnNm(String chkSsnCrnNm) {
		this.chkSsnCrnNm = chkSsnCrnNm;
	}
	public String getCertFstNm() {
		return certFstNm;
	}
	public void setCertFstNm(String certFstNm) {
		this.certFstNm = certFstNm;
	}
	public String getCert2ndNm() {
		return cert2ndNm;
	}
	public void setCert2ndNm(String cert2ndNm) {
		this.cert2ndNm = cert2ndNm;
	}
	public String getTaxChkNm() {
		return taxChkNm;
	}
	public void setTaxChkNm(String taxChkNm) {
		this.taxChkNm = taxChkNm;
	}
	public String getIncreaseTicketYn() {
		return increaseTicketYn;
	}
	public void setIncreaseTicketYn(String increaseTicketYn) {
		this.increaseTicketYn = increaseTicketYn;
	}
	public String getOffNm() {
		return offNm;
	}
	public void setOffNm(String offNm) {
		this.offNm = offNm;
	}
	public String getSdptNm() {
		return sdptNm;
	}
	public void setSdptNm(String sdptNm) {
		this.sdptNm = sdptNm;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public byte[] getImgDecoder() {
		return imgDecoder;
	}
	public void setImgDecoder(byte[] imgDecoder) {
		this.imgDecoder = imgDecoder;
	}
    public String getManufactYyMmDt() {
        return manufactYyMmDt;
    }
    public void setManufactYyMmDt(String manufactYyMmDt) {
        this.manufactYyMmDt = manufactYyMmDt;
    }
    public String getDlrNm() {
        return dlrNm;
    }
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    public String getReceiptType() {
        return receiptType;
    }
    public void setReceiptType(String receiptType) {
        this.receiptType = receiptType;
    }
    public String getCarType() {
        return carType;
    }
    public void setCarType(String carType) {
        this.carType = carType;
    }
    public String getBrandModel() {
        return brandModel;
    }
    public void setBrandModel(String brandModel) {
        this.brandModel = brandModel;
    }
    public String getProdArea() {
        return prodArea;
    }
    public void setProdArea(String prodArea) {
        this.prodArea = prodArea;
    }
    public String getImportCertNo() {
        return importCertNo;
    }
    public void setImportCertNo(String importCertNo) {
        this.importCertNo = importCertNo;
    }
    public String getComInsNo() {
        return comInsNo;
    }
    public void setComInsNo(String comInsNo) {
        this.comInsNo = comInsNo;
    }
    public String getTon() {
        return ton;
    }
    public void setTon(String ton) {
        this.ton = ton;
    }
    public String getLimitNum() {
        return limitNum;
    }
    public void setLimitNum(String limitNum) {
        this.limitNum = limitNum;
    }
    public String getEntNm() {
        return entNm;
    }
    public void setEntNm(String entNm) {
        this.entNm = entNm;
    }
    public String getSelNm() {
        return selNm;
    }
    public void setSelNm(String selNm) {
        this.selNm = selNm;
    }
    public String getSelTaxpayerIdCd() {
        return selTaxpayerIdCd;
    }
    public void setSelTaxpayerIdCd(String selTaxpayerIdCd) {
        this.selTaxpayerIdCd = selTaxpayerIdCd;
    }
    public String getSelAddr() {
        return selAddr;
    }
    public void setSelAddr(String selAddr) {
        this.selAddr = selAddr;
    }
    public String getSelPhone() {
        return selPhone;
    }
    public void setSelPhone(String selPhone) {
        this.selPhone = selPhone;
    }
    public String getSelBank() {
        return selBank;
    }
    public void setSelBank(String selBank) {
        this.selBank = selBank;
    }
    public String getSelBankNo() {
        return selBankNo;
    }
    public void setSelBankNo(String selBankNo) {
        this.selBankNo = selBankNo;
    }
    public String getDrawer() {
        return drawer;
    }
    public void setDrawer(String drawer) {
        this.drawer = drawer;
    }
    public String getReceiptInResource() {
        return receiptInResource;
    }
    public void setReceiptInResource(String receiptInResource) {
        this.receiptInResource = receiptInResource;
    }
    public String getReceiptStatus() {
        return receiptStatus;
    }
    public void setReceiptStatus(String receiptStatus) {
        this.receiptStatus = receiptStatus;
    }
    public String getBindingCarYn() {
        return bindingCarYn;
    }
    public void setBindingCarYn(String bindingCarYn) {
        this.bindingCarYn = bindingCarYn;
    }
}