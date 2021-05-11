package chn.bhmc.dms.ser.wac.vo;


import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;
/**
 * 
 *<p>Title:发票信息实体类</p>
 * @author wangc
 * @param
 * @return
 */
public class ClaimInvoiceDetailVO extends BaseVO{
    /**
	 * 
	 */
	private static final long serialVersionUID = 4413024205822128465L;

	 /**
     * 增票主键
     */
    private String receiptId;

    /**
     * 车辆ID
     */
    private String carId;

    /**
     * 순번
     */
    private Short seq;

    /**
     * VIN码
     */
    private String vinNo;

    /**
     * VIN码1
     */
    private String vinNo1;

    /**
     * VIN码2
     */
    private String vinNo2;

    /**
     * 经销商代码
     */
    private String dlrCd;

    /**
     * 纳税人识别号
     */
    private String taxpayerIdCd;

    /**
     * 发票号码
     */
    private String receiptNo;

    /**
     * 发票代码
     */
    private String receiptCd;

    /**
     * 发票抬头
     */
    private String buyNm;

    /**
     * 发票日期
     */
    private Date receiptIssDt;

    /**
     * 税价合计(小写)
     */
    private int scanSumAmt;

    /**
     * 车种代码
     */
    private String carlineCd;

    /**
     * 车型代码
     */
    private String modelCd;

    /**
     * 厂牌型号
     */
    private String jeongpanNo;

    /**
     * 外观颜色代码코드
     */
    private String extColorCd;

    /**
     * 新车工厂指导价
     */
    private int wsPrc;

    /**
     * 税价合计
     */
    private Date pltGiDt;

    /**
     * 发票金额
     */
    private int sumAmt;

    /**
     * 税额
     */
    private int taxAmt;

    /**
     * 파일번호
     */
    private String fileNo;

    /**
     * 파일일련번호
     */
    private Integer fileSeq;

    /**
     * 파일사이즈값
     */
    private Integer fileSizeVal;

    /**
     * 终端机代码
     */
    private String tmrCd;

    /**
     * 审核结果代码
     */
    private String evalRsltCd;

    /**
     * 未上传原因
     */
    private String errUpCd;

    /**
     * 2급딜러코드
     */
    private String sdlrCd;

    /**
     * 备注
     */
    private String remark;

    /**
     * 등록자ID
     */
    private String regUsrId;

    /**
     * 등록일자
     */
    private Date regDt;

    /**
     * 수정자ID
     */
    private String updtUsrId;

    /**
     * 수정일자
     */
    private Date updtDt;

    /**
     * BIMS 취합여부
     */
    private String dcsFlag;

    /**
     * 영수증진위검증, 1통과, 0미통과
     */
    private String certFst;

    /**
     * 월별심사, 1통과, 0미통과
     */
    private String cert2nd;

    /**
     * 분기별심사, 1통과, 0미통과
     */
    private String cert3rd;

    /**
     * 월별재심, 1재심완 2재심하지 않음
     */
    private String cert2rt;

    /**
     * 분기별재심, 1재심완 2재심하지 않음
     */
    private String cert3rt;

    /**
     * 2급딜러 구분
     */
    private String sdlrTp;

    /**
     * 2급딜러 명칭
     */
    private String sdlrNm;

    /**
     * 发票类型（000001-专用发票 000004-普通发票）
     */
    private String receiptType;

    /**
     * 校验码
     */
    private String checkCode;

    /**
     * 购方地址
     */
    private String buyAddr;

    /**
     * 购方电话
     */
    private String buyPhone;

    /**
     * 购方开户行
     */
    private String buyBank;

    /**
     * 购方开户行账号
     */
    private String buyBankNo;

    /**
     * 销方名称
     */
    private String selNm;

    /**
     * 销方税号
     */
    private String selTaxpayerIdCd;

    /**
     * 销方地址
     */
    private String selAddr;

    /**
     * 销方电话
     */
    private String selPhone;

    /**
     * 销方开户行
     */
    private String selBank;

    /**
     * 销方开户行账号
     */
    private String selBankNo;

    /**
     * 收款人
     */
    private String payee;

    /**
     * 复核人
     */
    private String checker;

    /**
     * 开票人
     */
    private String drawer;

    /**
     * 发票状态（01.正常、02.作废、04.红冲）
     */
    private String receiptStatus;

    /**
     * 是否大于5万（Y.是、N.否）
     */
    private String geraterFiveYn;

    /**
     * 是否索赔（Y.是、N.否）
     */
    private String claimYn;

    /**
     * 结算单号
     */
    private String settlementNo;

    /**
     * 是否绑定车辆（Y.是、N.否）
     */
    private String bidingVinYn;

    /**
     * 이미지
     */
    private byte[] receiptImg;

    /**
     * 增票主键
     * @return RECEIPT_ID 增票主键
     */
    public String getReceiptId() {
        return receiptId;
    }

    /**
     * 增票主键
     * @param receiptId 增票主键
     */
    public void setReceiptId(String receiptId) {
        this.receiptId = receiptId == null ? null : receiptId.trim();
    }

    /**
     * 车辆ID
     * @return CAR_ID 车辆ID
     */
    public String getCarId() {
        return carId;
    }

    /**
     * 车辆ID
     * @param carId 车辆ID
     */
    public void setCarId(String carId) {
        this.carId = carId == null ? null : carId.trim();
    }

    /**
     * 순번
     * @return SEQ 순번
     */
    public Short getSeq() {
        return seq;
    }

    /**
     * 순번
     * @param seq 순번
     */
    public void setSeq(Short seq) {
        this.seq = seq;
    }

    /**
     * VIN码
     * @return VIN_NO VIN码
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * VIN码
     * @param vinNo VIN码
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo == null ? null : vinNo.trim();
    }

    /**
     * VIN码1
     * @return VIN_NO1 VIN码1
     */
    public String getVinNo1() {
        return vinNo1;
    }

    /**
     * VIN码1
     * @param vinNo1 VIN码1
     */
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1 == null ? null : vinNo1.trim();
    }

    /**
     * VIN码2
     * @return VIN_NO2 VIN码2
     */
    public String getVinNo2() {
        return vinNo2;
    }

    /**
     * VIN码2
     * @param vinNo2 VIN码2
     */
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2 == null ? null : vinNo2.trim();
    }

    /**
     * 经销商代码
     * @return DLR_CD 经销商代码
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * 经销商代码
     * @param dlrCd 经销商代码
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd == null ? null : dlrCd.trim();
    }

    /**
     * 纳税人识别号
纳税人识别号
纳税人识别号

     * @return TAXPAYER_ID_CD 纳税人识别号
纳税人识别号
纳税人识别号

     */
    public String getTaxpayerIdCd() {
        return taxpayerIdCd;
    }

    /**
     * 纳税人识别号
纳税人识别号
纳税人识别号

     * @param taxpayerIdCd 纳税人识别号
纳税人识别号
纳税人识别号

     */
    public void setTaxpayerIdCd(String taxpayerIdCd) {
        this.taxpayerIdCd = taxpayerIdCd == null ? null : taxpayerIdCd.trim();
    }

    /**
     * 发票号码
     * @return RECEIPT_NO 发票号码
     */
    public String getReceiptNo() {
        return receiptNo;
    }

    /**
     * 发票号码
     * @param receiptNo 发票号码
     */
    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo == null ? null : receiptNo.trim();
    }

    /**
     * 发票代码
     * @return RECEIPT_CD 发票代码
     */
    public String getReceiptCd() {
        return receiptCd;
    }

    /**
     * 发票代码
     * @param receiptCd 发票代码
     */
    public void setReceiptCd(String receiptCd) {
        this.receiptCd = receiptCd == null ? null : receiptCd.trim();
    }

    /**
     * 购货单位
     * @return BUY_NM 购货单位
     */
    public String getBuyNm() {
        return buyNm;
    }

    /**
     * 购货单位
     * @param buyNm 购货单位
     */
    public void setBuyNm(String buyNm) {
        this.buyNm = buyNm == null ? null : buyNm.trim();
    }

    /**
     * 开票日期
     * @return RECEIPT_ISS_DT 开票日期
     */
    public Date getReceiptIssDt() {
        return receiptIssDt;
    }

    /**
     * 开票日期
     * @param receiptIssDt 开票日期
     */
    public void setReceiptIssDt(Date receiptIssDt) {
        this.receiptIssDt = receiptIssDt;
    }

    /**
     * 税价合计(小写)
     * @return SCAN_SUM_AMT 税价合计(小写)
     */
    public int getScanSumAmt() {
        return scanSumAmt;
    }

    /**
     * 税价合计(小写)
     * @param scanSumAmt 税价合计(小写)
     */
    public void setScanSumAmt(int scanSumAmt) {
        this.scanSumAmt = scanSumAmt;
    }

    /**
     * 车种代码
     * @return CARLINE_CD 车种代码
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * 车种代码
     * @param carlineCd 车种代码
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd == null ? null : carlineCd.trim();
    }

    /**
     * 车型代码
     * @return MODEL_CD 车型代码
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * 车型代码
     * @param modelCd 车型代码
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd == null ? null : modelCd.trim();
    }

    /**
     * 厂牌型号
     * @return JEONGPAN_NO 厂牌型号
     */
    public String getJeongpanNo() {
        return jeongpanNo;
    }

    /**
     * 厂牌型号
     * @param jeongpanNo 厂牌型号
     */
    public void setJeongpanNo(String jeongpanNo) {
        this.jeongpanNo = jeongpanNo == null ? null : jeongpanNo.trim();
    }

    /**
     * 外观颜色代码코드
     * @return EXT_COLOR_CD 外观颜色代码코드
     */
    public String getExtColorCd() {
        return extColorCd;
    }

    /**
     * 外观颜色代码코드
     * @param extColorCd 外观颜色代码코드
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd == null ? null : extColorCd.trim();
    }

    /**
     * 新车工厂指导价
     * @return WS_PRC 新车工厂指导价
     */
    public int getWsPrc() {
        return wsPrc;
    }

    /**
     * 新车工厂指导价
     * @param wsPrc 新车工厂指导价
     */
    public void setWsPrc(int wsPrc) {
        this.wsPrc = wsPrc;
    }

    /**
     * 税价合计
     * @return PLT_GI_DT 税价合计
     */
    public Date getPltGiDt() {
        return pltGiDt;
    }

    /**
     * 税价合计
     * @param pltGiDt 税价合计
     */
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
    }

    /**
     * 금액
     * @return SUM_AMT 금액
     */
    public int getSumAmt() {
        return sumAmt;
    }

    /**
     * 금액
     * @param sumAmt 금액
     */
    public void setSumAmt(int sumAmt) {
        this.sumAmt = sumAmt;
    }

    /**
     * 税额
     * @return TAX_AMT 税额
     */
    public int getTaxAmt() {
        return taxAmt;
    }

    /**
     * 税额
     * @param taxAmt 税额
     */
    public void setTaxAmt(int taxAmt) {
        this.taxAmt = taxAmt;
    }

    /**
     * 파일번호
     * @return FILE_NO 파일번호
     */
    public String getFileNo() {
        return fileNo;
    }

    /**
     * 파일번호
     * @param fileNo 파일번호
     */
    public void setFileNo(String fileNo) {
        this.fileNo = fileNo == null ? null : fileNo.trim();
    }

    /**
     * 파일일련번호
     * @return FILE_SEQ 파일일련번호
     */
    public Integer getFileSeq() {
        return fileSeq;
    }

    /**
     * 파일일련번호
     * @param fileSeq 파일일련번호
     */
    public void setFileSeq(Integer fileSeq) {
        this.fileSeq = fileSeq;
    }

    /**
     * 파일사이즈값
     * @return FILE_SIZE_VAL 파일사이즈값
     */
    public Integer getFileSizeVal() {
        return fileSizeVal;
    }

    /**
     * 파일사이즈값
     * @param fileSizeVal 파일사이즈값
     */
    public void setFileSizeVal(Integer fileSizeVal) {
        this.fileSizeVal = fileSizeVal;
    }

    /**
     * 终端机代码
     * @return TMR_CD 终端机代码
     */
    public String getTmrCd() {
        return tmrCd;
    }

    /**
     * 终端机代码
     * @param tmrCd 终端机代码
     */
    public void setTmrCd(String tmrCd) {
        this.tmrCd = tmrCd == null ? null : tmrCd.trim();
    }

    /**
     * 审核结果代码
     * @return EVAL_RSLT_CD 审核结果代码
     */
    public String getEvalRsltCd() {
        return evalRsltCd;
    }

    /**
     * 审核结果代码
     * @param evalRsltCd 审核结果代码
     */
    public void setEvalRsltCd(String evalRsltCd) {
        this.evalRsltCd = evalRsltCd == null ? null : evalRsltCd.trim();
    }

    /**
     * 未上传原因
     * @return ERR_UP_CD 未上传原因
     */
    public String getErrUpCd() {
        return errUpCd;
    }

    /**
     * 未上传原因
     * @param errUpCd 未上传原因
     */
    public void setErrUpCd(String errUpCd) {
        this.errUpCd = errUpCd == null ? null : errUpCd.trim();
    }

    /**
     * 2급딜러코드
     * @return SDLR_CD 2급딜러코드
     */
    public String getSdlrCd() {
        return sdlrCd;
    }

    /**
     * 2급딜러코드
     * @param sdlrCd 2급딜러코드
     */
    public void setSdlrCd(String sdlrCd) {
        this.sdlrCd = sdlrCd == null ? null : sdlrCd.trim();
    }

    /**
     * 비고
     * @return REMARK 비고
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 비고
     * @param remark 비고
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * 등록자ID
     * @return REG_USR_ID 등록자ID
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * 등록자ID
     * @param regUsrId 등록자ID
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId == null ? null : regUsrId.trim();
    }

    /**
     * 등록일자
     * @return REG_DT 등록일자
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * 등록일자
     * @param regDt 등록일자
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * 수정자ID
     * @return UPDT_USR_ID 수정자ID
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * 수정자ID
     * @param updtUsrId 수정자ID
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId == null ? null : updtUsrId.trim();
    }

    /**
     * 수정일자
     * @return UPDT_DT 수정일자
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * 수정일자
     * @param updtDt 수정일자
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * BIMS 취합여부
     * @return DCS_FLAG BIMS 취합여부
     */
    public String getDcsFlag() {
        return dcsFlag;
    }

    /**
     * BIMS 취합여부
     * @param dcsFlag BIMS 취합여부
     */
    public void setDcsFlag(String dcsFlag) {
        this.dcsFlag = dcsFlag == null ? null : dcsFlag.trim();
    }

    /**
     * 영수증진위검증, 1통과, 0미통과
     * @return CERT_FST 영수증진위검증, 1통과, 0미통과
     */
    public String getCertFst() {
        return certFst;
    }

    /**
     * 영수증진위검증, 1통과, 0미통과
     * @param certFst 영수증진위검증, 1통과, 0미통과
     */
    public void setCertFst(String certFst) {
        this.certFst = certFst == null ? null : certFst.trim();
    }

    /**
     * 월별심사, 1통과, 0미통과
     * @return CERT_2ND 월별심사, 1통과, 0미통과
     */
    public String getCert2nd() {
        return cert2nd;
    }

    /**
     * 월별심사, 1통과, 0미통과
     * @param cert2nd 월별심사, 1통과, 0미통과
     */
    public void setCert2nd(String cert2nd) {
        this.cert2nd = cert2nd == null ? null : cert2nd.trim();
    }

    /**
     * 분기별심사, 1통과, 0미통과
     * @return CERT_3RD 분기별심사, 1통과, 0미통과
     */
    public String getCert3rd() {
        return cert3rd;
    }

    /**
     * 분기별심사, 1통과, 0미통과
     * @param cert3rd 분기별심사, 1통과, 0미통과
     */
    public void setCert3rd(String cert3rd) {
        this.cert3rd = cert3rd == null ? null : cert3rd.trim();
    }

    /**
     * 월별재심, 1재심완 2재심하지 않음
     * @return CERT_2RT 월별재심, 1재심완 2재심하지 않음
     */
    public String getCert2rt() {
        return cert2rt;
    }

    /**
     * 월별재심, 1재심완 2재심하지 않음
     * @param cert2rt 월별재심, 1재심완 2재심하지 않음
     */
    public void setCert2rt(String cert2rt) {
        this.cert2rt = cert2rt == null ? null : cert2rt.trim();
    }

    /**
     * 분기별재심, 1재심완 2재심하지 않음
     * @return CERT_3RT 분기별재심, 1재심완 2재심하지 않음
     */
    public String getCert3rt() {
        return cert3rt;
    }

    /**
     * 분기별재심, 1재심완 2재심하지 않음
     * @param cert3rt 분기별재심, 1재심완 2재심하지 않음
     */
    public void setCert3rt(String cert3rt) {
        this.cert3rt = cert3rt == null ? null : cert3rt.trim();
    }

    /**
     * 2급딜러 구분
     * @return SDLR_TP 2급딜러 구분
     */
    public String getSdlrTp() {
        return sdlrTp;
    }

    /**
     * 2급딜러 구분
     * @param sdlrTp 2급딜러 구분
     */
    public void setSdlrTp(String sdlrTp) {
        this.sdlrTp = sdlrTp == null ? null : sdlrTp.trim();
    }

    /**
     * 2급딜러 명칭
     * @return SDLR_NM 2급딜러 명칭
     */
    public String getSdlrNm() {
        return sdlrNm;
    }

    /**
     * 2급딜러 명칭
     * @param sdlrNm 2급딜러 명칭
     */
    public void setSdlrNm(String sdlrNm) {
        this.sdlrNm = sdlrNm == null ? null : sdlrNm.trim();
    }

    /**
     * 发票类型（000001-专用发票 000004-普通发票）
     * @return RECEIPT_TYPE 发票类型（000001-专用发票 000004-普通发票）
     */
    public String getReceiptType() {
        return receiptType;
    }

    /**
     * 发票类型（000001-专用发票 000004-普通发票）
     * @param receiptType 发票类型（000001-专用发票 000004-普通发票）
     */
    public void setReceiptType(String receiptType) {
        this.receiptType = receiptType == null ? null : receiptType.trim();
    }

    /**
     * 校验码
     * @return CHECK_CODE 校验码
     */
    public String getCheckCode() {
        return checkCode;
    }

    /**
     * 校验码
     * @param checkCode 校验码
     */
    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode == null ? null : checkCode.trim();
    }

    /**
     * 购方地址
     * @return BUY_ADDR 购方地址
     */
    public String getBuyAddr() {
        return buyAddr;
    }

    /**
     * 购方地址
     * @param buyAddr 购方地址
     */
    public void setBuyAddr(String buyAddr) {
        this.buyAddr = buyAddr == null ? null : buyAddr.trim();
    }

    /**
     * 购方电话
     * @return BUY_PHONE 购方电话
     */
    public String getBuyPhone() {
        return buyPhone;
    }

    /**
     * 购方电话
     * @param buyPhone 购方电话
     */
    public void setBuyPhone(String buyPhone) {
        this.buyPhone = buyPhone == null ? null : buyPhone.trim();
    }

    /**
     * 购方开户行
     * @return BUY_BANK 购方开户行
     */
    public String getBuyBank() {
        return buyBank;
    }

    /**
     * 购方开户行
     * @param buyBank 购方开户行
     */
    public void setBuyBank(String buyBank) {
        this.buyBank = buyBank == null ? null : buyBank.trim();
    }

    /**
     * 购方开户行账号
     * @return BUY_BANK_NO 购方开户行账号
     */
    public String getBuyBankNo() {
        return buyBankNo;
    }

    /**
     * 购方开户行账号
     * @param buyBankNo 购方开户行账号
     */
    public void setBuyBankNo(String buyBankNo) {
        this.buyBankNo = buyBankNo == null ? null : buyBankNo.trim();
    }

    /**
     * 销方名称
     * @return SEL_NM 销方名称
     */
    public String getSelNm() {
        return selNm;
    }

    /**
     * 销方名称
     * @param selNm 销方名称
     */
    public void setSelNm(String selNm) {
        this.selNm = selNm == null ? null : selNm.trim();
    }

    /**
     * 销方税号
     * @return SEL_TAXPAYER_ID_CD 销方税号
     */
    public String getSelTaxpayerIdCd() {
        return selTaxpayerIdCd;
    }

    /**
     * 销方税号
     * @param selTaxpayerIdCd 销方税号
     */
    public void setSelTaxpayerIdCd(String selTaxpayerIdCd) {
        this.selTaxpayerIdCd = selTaxpayerIdCd == null ? null : selTaxpayerIdCd.trim();
    }

    /**
     * 销方地址
     * @return SEL_ADDR 销方地址
     */
    public String getSelAddr() {
        return selAddr;
    }

    /**
     * 销方地址
     * @param selAddr 销方地址
     */
    public void setSelAddr(String selAddr) {
        this.selAddr = selAddr == null ? null : selAddr.trim();
    }

    /**
     * 销方电话
     * @return SEL_PHONE 销方电话
     */
    public String getSelPhone() {
        return selPhone;
    }

    /**
     * 销方电话
     * @param selPhone 销方电话
     */
    public void setSelPhone(String selPhone) {
        this.selPhone = selPhone == null ? null : selPhone.trim();
    }

    /**
     * 销方开户行
     * @return SEL_BANK 销方开户行
     */
    public String getSelBank() {
        return selBank;
    }

    /**
     * 销方开户行
     * @param selBank 销方开户行
     */
    public void setSelBank(String selBank) {
        this.selBank = selBank == null ? null : selBank.trim();
    }

    /**
     * 销方开户行账号
     * @return SEL_BANK_NO 销方开户行账号
     */
    public String getSelBankNo() {
        return selBankNo;
    }

    /**
     * 销方开户行账号
     * @param selBankNo 销方开户行账号
     */
    public void setSelBankNo(String selBankNo) {
        this.selBankNo = selBankNo == null ? null : selBankNo.trim();
    }

    /**
     * 收款人
     * @return PAYEE 收款人
     */
    public String getPayee() {
        return payee;
    }

    /**
     * 收款人
     * @param payee 收款人
     */
    public void setPayee(String payee) {
        this.payee = payee == null ? null : payee.trim();
    }

    /**
     * 复核人
     * @return CHECKER 复核人
     */
    public String getChecker() {
        return checker;
    }

    /**
     * 复核人
     * @param checker 复核人
     */
    public void setChecker(String checker) {
        this.checker = checker == null ? null : checker.trim();
    }

    /**
     * 开票人
     * @return DRAWER 开票人
     */
    public String getDrawer() {
        return drawer;
    }

    /**
     * 开票人
     * @param drawer 开票人
     */
    public void setDrawer(String drawer) {
        this.drawer = drawer == null ? null : drawer.trim();
    }

    /**
     * 发票状态（01.正常、02.作废、04.红冲）
     * @return RECEIPT_STATUS 发票状态（01.正常、02.作废、04.红冲）
     */
    public String getReceiptStatus() {
        return receiptStatus;
    }

    /**
     * 发票状态（01.正常、02.作废、04.红冲）
     * @param receiptStatus 发票状态（01.正常、02.作废、04.红冲）
     */
    public void setReceiptStatus(String receiptStatus) {
        this.receiptStatus = receiptStatus == null ? null : receiptStatus.trim();
    }

    /**
     * 是否大于5万（Y.是、N.否）
     * @return GERATER_FIVE_YN 是否大于5万（Y.是、N.否）
     */
    public String getGeraterFiveYn() {
        return geraterFiveYn;
    }

    /**
     * 是否大于5万（Y.是、N.否）
     * @param geraterFiveYn 是否大于5万（Y.是、N.否）
     */
    public void setGeraterFiveYn(String geraterFiveYn) {
        this.geraterFiveYn = geraterFiveYn == null ? null : geraterFiveYn.trim();
    }

    /**
     * 是否索赔（Y.是、N.否）
     * @return CLAIM_YN 是否索赔（Y.是、N.否）
     */
    public String getClaimYn() {
        return claimYn;
    }

    /**
     * 是否索赔（Y.是、N.否）
     * @param claimYn 是否索赔（Y.是、N.否）
     */
    public void setClaimYn(String claimYn) {
        this.claimYn = claimYn == null ? null : claimYn.trim();
    }

    /**
     * 结算单号
     * @return SETTLEMENT_NO 结算单号
     */
    public String getSettlementNo() {
        return settlementNo;
    }

    /**
     * 结算单号
     * @param settlementNo 结算单号
     */
    public void setSettlementNo(String settlementNo) {
        this.settlementNo = settlementNo == null ? null : settlementNo.trim();
    }

    /**
     * 是否绑定车辆（Y.是、N.否）
     * @return BIDING_VIN_YN 是否绑定车辆（Y.是、N.否）
     */
    public String getBidingVinYn() {
        return bidingVinYn;
    }

    /**
     * 是否绑定车辆（Y.是、N.否）
     * @param bidingVinYn 是否绑定车辆（Y.是、N.否）
     */
    public void setBidingVinYn(String bidingVinYn) {
        this.bidingVinYn = bidingVinYn == null ? null : bidingVinYn.trim();
    }

    /**
     * 이미지
     * @return RECEIPT_IMG 이미지
     */
    public byte[] getReceiptImg() {
        return receiptImg;
    }

    /**
     * 이미지
     * @param receiptImg 이미지
     */
    public void setReceiptImg(byte[] receiptImg) {
        this.receiptImg = receiptImg;
    }
}