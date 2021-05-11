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

    private static final long serialVersionUID = 8835548827065572989L;

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

    private String uploadStatNm;
    private String errUpNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDtFormat;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiptUpdtFormat;

    private String taxSungCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDtFormat;
    
    private double  msPrc;//指导价 R19080700284 贾明 2019-8-8 
    private String  judUnSociCreo;  //R19092301306 判断统一社会信用代码  贾明 2019-9-24 
    // R19111100817 统一发票下载功能 修正 贾明 2019-11-14 start 
    private String chkSsnCrnNm;
    private String certFstNm;
    private String cert2ndNm;
    private String taxChkNm;
    private String increaseTicketYn;
    // R19111100817 统一发票下载功能 修正 贾明 2019-11-14 end
    //crs 37 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 start
    private String contractNo;
    private String telNo;
    //crs 37 发票上传扫描信息显示的画面，在“证件号码”后面增加“手机号码”，取合同上的客户手机号，允许修改，校验手机号为11位数字。提交给发票系统，发票初审不通过时可修 贾明 2019-12-11 end
    
    // 2021-04-14 宫荣枢 机动车统一发票增加字段
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
    // 发票来源（01.本店开票、02.他店开票、03.二网开票）
    private String receiptResource;
    private String receiptResourceNm;
    // 发票录入来源（01.数衍发票机、02.DMS上传发票图片、03.DMS手动填写、04.APP扫码）
    private String receiptInResource;
    // 发票状态（01.正常、02.作废、04.红冲）
    private String receiptStatus;
    private String receiptStatusNm;
    // 是否绑定车辆（Y.已绑定、N.未绑定）
    private String bindingCarYn;
    
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
    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }
    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }
    /**
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }
    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
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
     * @return the ordDlrCd
     */
    public String getOrdDlrCd() {
        return ordDlrCd;
    }
    /**
     * @param ordDlrCd the ordDlrCd to set
     */
    public void setOrdDlrCd(String ordDlrCd) {
        this.ordDlrCd = ordDlrCd;
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
    public double getSumIncTax() {
        return sumIncTax;
    }
    /**
     * @param sumIncTax the sumIncTax to set
     */
    public void setSumIncTax(double sumIncTax) {
        this.sumIncTax = sumIncTax;
    }
    /**
     * @return the sumExcTax
     */
    public double getSumExcTax() {
        return sumExcTax;
    }
    /**
     * @param sumExcTax the sumExcTax to set
     */
    public void setSumExcTax(double sumExcTax) {
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

    public byte[] getReceiptImg() {
		return receiptImg;
	}
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
     * @return the certFst
     */
    public String getCertFst() {
        return certFst;
    }
    /**
     * @param certFst the certFst to set
     */
    public void setCertFst(String certFst) {
        this.certFst = certFst;
    }
    /**
     * @return the cert2nd
     */
    public String getCert2nd() {
        return cert2nd;
    }
    /**
     * @param cert2nd the cert2nd to set
     */
    public void setCert2nd(String cert2nd) {
        this.cert2nd = cert2nd;
    }
    /**
     * @return the cert3rd
     */
    public String getCert3rd() {
        return cert3rd;
    }
    /**
     * @param cert3rd the cert3rd to set
     */
    public void setCert3rd(String cert3rd) {
        this.cert3rd = cert3rd;
    }
    /**
     * @return the errUpCd
     */
    public String getErrUpCd() {
        return errUpCd;
    }
    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }
    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }
    /**
     * @param errUpCd the errUpCd to set
     */
    public void setErrUpCd(String errUpCd) {
        this.errUpCd = errUpCd;
    }
    /**
     * @return the vinType
     */
    public String getVinType() {
        return vinType;
    }
    /**
     * @param vinType the vinType to set
     */
    public void setVinType(String vinType) {
        this.vinType = vinType;
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
    /**
     * @return the provinceCd
     */
    public String getProvinceCd() {
        return provinceCd;
    }
    /**
     * @param provinceCd the provinceCd to set
     */
    public void setProvinceCd(String provinceCd) {
        this.provinceCd = provinceCd;
    }
    /**
     * @return the provinceNm
     */
    public String getProvinceNm() {
        return provinceNm;
    }
    /**
     * @param provinceNm the provinceNm to set
     */
    public void setProvinceNm(String provinceNm) {
        this.provinceNm = provinceNm;
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
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
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
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the carStatCd
     */
    public String getCarStatCd() {
        return carStatCd;
    }
    /**
     * @param carStatCd the carStatCd to set
     */
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
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
     * @return the vinmF20010
     */
    public String getVinmF20010() {
        return vinmF20010;
    }
    /**
     * @param vinmF20010 the vinmF20010 to set
     */
    public void setVinmF20010(String vinmF20010) {
        this.vinmF20010 = vinmF20010;
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
     * @return the scanRcptPubDt
     */
    public String getScanRcptPubDt() {
        return scanRcptPubDt;
    }
    /**
     * @param scanRcptPubDt the scanRcptPubDt to set
     */
    public void setScanRcptPubDt(String scanRcptPubDt) {
        this.scanRcptPubDt = scanRcptPubDt;
    }
    /**
     * @return the scanRcptCd
     */
    public String getScanRcptCd() {
        return scanRcptCd;
    }
    /**
     * @param scanRcptCd the scanRcptCd to set
     */
    public void setScanRcptCd(String scanRcptCd) {
        this.scanRcptCd = scanRcptCd;
    }
    /**
     * @return the scanRcptNo
     */
    public String getScanRcptNo() {
        return scanRcptNo;
    }
    /**
     * @param scanRcptNo the scanRcptNo to set
     */
    public void setScanRcptNo(String scanRcptNo) {
        this.scanRcptNo = scanRcptNo;
    }
    /**
     * @return the scanCustInfo
     */
    public String getScanCustInfo() {
        return scanCustInfo;
    }
    /**
     * @param scanCustInfo the scanCustInfo to set
     */
    public void setScanCustInfo(String scanCustInfo) {
        this.scanCustInfo = scanCustInfo;
    }
    /**
     * @return the scanCertNo
     */
    public String getScanCertNo() {
        return scanCertNo;
    }
    /**
     * @param scanCertNo the scanCertNo to set
     */
    public void setScanCertNo(String scanCertNo) {
        this.scanCertNo = scanCertNo;
    }
    /**
     * @return the scanEngNo
     */
    public String getScanEngNo() {
        return scanEngNo;
    }
    /**
     * @param scanEngNo the scanEngNo to set
     */
    public void setScanEngNo(String scanEngNo) {
        this.scanEngNo = scanEngNo;
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
     * @return the scanTaxIncPrice
     */
    public double getScanTaxIncPrice() {
        return scanTaxIncPrice;
    }
    /**
     * @param scanTaxIncPrice the scanTaxIncPrice to set
     */
    public void setScanTaxIncPrice(double scanTaxIncPrice) {
        this.scanTaxIncPrice = scanTaxIncPrice;
    }
    /**
     * @return the scanSaleCmpnNm
     */
    public String getScanSaleCmpnNm() {
        return scanSaleCmpnNm;
    }
    /**
     * @param scanSaleCmpnNm the scanSaleCmpnNm to set
     */
    public void setScanSaleCmpnNm(String scanSaleCmpnNm) {
        this.scanSaleCmpnNm = scanSaleCmpnNm;
    }
    /**
     * @return the scanPayTaxPinNo
     */
    public String getScanPayTaxPinNo() {
        return scanPayTaxPinNo;
    }
    /**
     * @param scanPayTaxPinNo the scanPayTaxPinNo to set
     */
    public void setScanPayTaxPinNo(String scanPayTaxPinNo) {
        this.scanPayTaxPinNo = scanPayTaxPinNo;
    }
    /**
     * @return the scanSaleCmpnAddr
     */
    public String getScanSaleCmpnAddr() {
        return scanSaleCmpnAddr;
    }
    /**
     * @param scanSaleCmpnAddr the scanSaleCmpnAddr to set
     */
    public void setScanSaleCmpnAddr(String scanSaleCmpnAddr) {
        this.scanSaleCmpnAddr = scanSaleCmpnAddr;
    }
    /**
     * @return the scanTaxRate
     */
    public String getScanTaxRate() {
        return scanTaxRate;
    }
    /**
     * @param scanTaxRate the scanTaxRate to set
     */
    public void setScanTaxRate(String scanTaxRate) {
        this.scanTaxRate = scanTaxRate;
    }
    /**
     * @return the scanTaxAmt
     */
    public double getScanTaxAmt() {
        return scanTaxAmt;
    }
    /**
     * @param scanTaxAmt the scanTaxAmt to set
     */
    public void setScanTaxAmt(double scanTaxAmt) {
        this.scanTaxAmt = scanTaxAmt;
    }
    /**
     * @return the scanTaxExcPrice
     */
    public double getScanTaxExcPrice() {
        return scanTaxExcPrice;
    }
    /**
     * @param scanTaxExcPrice the scanTaxExcPrice to set
     */
    public void setScanTaxExcPrice(double scanTaxExcPrice) {
        this.scanTaxExcPrice = scanTaxExcPrice;
    }
    /**
     * @return the scanSsnCrnNo
     */
    public String getScanSsnCrnNo() {
        return scanSsnCrnNo;
    }
    /**
     * @param scanSsnCrnNo the scanSsnCrnNo to set
     */
    public void setScanSsnCrnNo(String scanSsnCrnNo) {
        this.scanSsnCrnNo = scanSsnCrnNo;
    }
    public byte[] getScanBlob() {
		return scanBlob;
	}
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
     * @return the taxBeforeChk
     */
    public String getTaxBeforeChk() {
        return taxBeforeChk;
    }
    /**
     * @param taxBeforeChk the taxBeforeChk to set
     */
    public void setTaxBeforeChk(String taxBeforeChk) {
        this.taxBeforeChk = taxBeforeChk;
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
     * @return the receiptUpdt
     */
    public Date getReceiptUpdt() {
        return receiptUpdt;
    }
    /**
     * @param receiptUpdt the receiptUpdt to set
     */
    public void setReceiptUpdt(Date receiptUpdt) {
        this.receiptUpdt = receiptUpdt;
    }
    /**
     * @return the taxChkYn
     */
    public String getTaxChkYn() {
        return taxChkYn;
    }
    /**
     * @param taxChkYn the taxChkYn to set
     */
    public void setTaxChkYn(String taxChkYn) {
        this.taxChkYn = taxChkYn;
    }
    /**
     * @return the addtaxReceiptNo
     */
    public String getAddtaxReceiptNo() {
        return addtaxReceiptNo;
    }
    /**
     * @param addtaxReceiptNo the addtaxReceiptNo to set
     */
    public void setAddtaxReceiptNo(String addtaxReceiptNo) {
        this.addtaxReceiptNo = addtaxReceiptNo;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the grteStartDt
     */
    public String getGrteStartDt() {
        return grteStartDt;
    }
    /**
     * @param grteStartDt the grteStartDt to set
     */
    public void setGrteStartDt(String grteStartDt) {
        this.grteStartDt = grteStartDt;
    }
    /**
     * @return the chkSsnCrnNo
     */
    public String getChkSsnCrnNo() {
        return chkSsnCrnNo;
    }
    /**
     * @param chkSsnCrnNo the chkSsnCrnNo to set
     */
    public void setChkSsnCrnNo(String chkSsnCrnNo) {
        this.chkSsnCrnNo = chkSsnCrnNo;
    }
    /**
     * @return the addtaxReceiptYn
     */
    public String getAddtaxReceiptYn() {
        return addtaxReceiptYn;
    }
    /**
     * @param addtaxReceiptYn the addtaxReceiptYn to set
     */
    public void setAddtaxReceiptYn(String addtaxReceiptYn) {
        this.addtaxReceiptYn = addtaxReceiptYn;
    }
    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the custSsnCrnNo
     */
    public String getCustSsnCrnNo() {
        return custSsnCrnNo;
    }
    /**
     * @param custSsnCrnNo the custSsnCrnNo to set
     */
    public void setCustSsnCrnNo(String custSsnCrnNo) {
        this.custSsnCrnNo = custSsnCrnNo;
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
     * @return the custSaleDtFormat
     */
    public Date getCustSaleDtFormat() {
        return custSaleDtFormat;
    }
    /**
     * @param custSaleDtFormat the custSaleDtFormat to set
     */
    public void setCustSaleDtFormat(Date custSaleDtFormat) {
        this.custSaleDtFormat = custSaleDtFormat;
    }
    /**
     * @return the receiptUpdtFormat
     */
    public Date getReceiptUpdtFormat() {
        return receiptUpdtFormat;
    }
    /**
     * @param receiptUpdtFormat the receiptUpdtFormat to set
     */
    public void setReceiptUpdtFormat(Date receiptUpdtFormat) {
        this.receiptUpdtFormat = receiptUpdtFormat;
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
     * @return the regDtFormat
     */
    public Date getRegDtFormat() {
        return regDtFormat;
    }
    /**
     * @param regDtFormat the regDtFormat to set
     */
    public void setRegDtFormat(Date regDtFormat) {
        this.regDtFormat = regDtFormat;
    }
    
	public double getMsPrc() {
		return msPrc;
	}
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
	public String getContractNo() {
		return contractNo;
	}
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
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
	public String getReceiptResource() {
		return receiptResource;
	}
	public void setReceiptResource(String receiptResource) {
		this.receiptResource = receiptResource;
	}
	public String getReceiptResourceNm() {
		return receiptResourceNm;
	}
	public void setReceiptResourceNm(String receiptResourceNm) {
		this.receiptResourceNm = receiptResourceNm;
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
	public String getReceiptStatusNm() {
		return receiptStatusNm;
	}
	public void setReceiptStatusNm(String receiptStatusNm) {
		this.receiptStatusNm = receiptStatusNm;
	}
	public String getBindingCarYn() {
		return bindingCarYn;
	}
	public void setBindingCarYn(String bindingCarYn) {
		this.bindingCarYn = bindingCarYn;
	}
}