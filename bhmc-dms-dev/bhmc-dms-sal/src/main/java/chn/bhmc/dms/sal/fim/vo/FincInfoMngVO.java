package chn.bhmc.dms.sal.fim.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FincInfoMngVO
 * @Description : 금융서비스 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"               , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="fincNo"              , mesgKey="sal.lbl.fincNo")
   ,@ValidField(field="fincReqDt"           , mesgKey="sal.lbl.fincReqDt")
   })
public class FincInfoMngVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6226978735254175575L;

    /**
     * 딜러코드
     **/
    private  String               dlrCd;

    /**
     * 금융번호
     **/
    private  String               fincNo;

    /**
     * 금융요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                 fincReqDt;

    /**
     * 금융상태코드
     **/
    private  String               fincStatCd;
    private  String               fincStatNm;

    /**
     * 계약번호
     **/
    private  String               contractNo;

    /**
     * 차대번호
     **/
    private  String               vinNo;

    /**
     * 차종코드
     **/
    private  String               carlineCd;
    private  String               carlineNm;
    
    /**
     * 차관코드
     **/
    private  String               fscCd;
    private  String               fscNm;
    
    /**
     * 모델코드
     **/
    private  String               modelCd;
    private  String               modelNm;

    /**
     * OCN코드
     **/
    private  String               ocnCd;
    private  String               ocnNm;

    /**
     * 외장색상코드
     **/
    private  String               extColorCd;
    private  String               extColorNm;

    /**
     * 내장색상코드
     **/
    private  String               intColorCd;
    private  String               intColorNm;

    /**
     * 차량등록번호
     **/
    private  String               carRegNo;

    /**
     * 엔진번호
     **/
    private  String               enginNo;

    /**
     * 합격증번호
     **/
    private  String               certNo;

    /**
     * 발행명
     **/
    private  String               publNm;

    /**
     * 전화번호1
     **/
    private  String               telNo1;

    /**
     * 고객유형
     **/
    private  String               custTp;

    /**
     * 주요인증유형
     **/
    private  String               mathDocTp;

    /**
     * 주민사업자등록번호
     **/
    private  String               ssnCrnNo;
    
    /**
     * 순차량금액
     **/
    private  Double               realAmt; 

    /**
     * 금융요청금액
     **/
    private  Double               fincReqAmt;

    /**
     * 금융상환기간
     **/
    private  int                  fincRpayPrid;

    /**
     * 금융대출수수료금액
     **/
    private  Double               fincLoanFeeAmt;

    /**
     * 자기금액(고객부담금액)
     */
    private  Double               fincBurdAmt;

    /**
     * 금융회사코드
     **/
    private  String               fincCmpCd;
    private  String               fincCmpNm;

    /**
     * 금융품목코드
     **/
    private  String               fincItemCd;
    private  String               fincItemNm;

    /**
     * 금융만기일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                 fincEndDt;

    /**
     * 금융대출비율
     **/
    private  Double               fincLoanRate;

    /**
     * 할부이자율
     */
    private  Double               instIntrRate;

    /**
     * 보증보험금액
     */
    private  Double               grteIncAmt;


    /**
     * 요청자료수집완료여부
     **/
    private  String               reqDataCollcEndYn;

    /**
     * 대출동의상태코드
     **/
    private  String               loanAgreeStatCd;

    /**
     * 대출여부
     **/
    private  String               loanYn;

    /**
     * 담보대출상태코드
     **/
    private  String               cltrLoanStatCd;

    /**
     * 파일문서ID
     **/
    private  String               fileDocId;

    /**
     * 등록자명
     */
    private  String               regUsrNm;

    /**
     * 수정자명
     */
    private  String               updtUsrNm;

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
     * @return the fincNo
     */
    public String getFincNo() {
        return fincNo;
    }

    /**
     * @param fincNo the fincNo to set
     */
    public void setFincNo(String fincNo) {
        this.fincNo = fincNo;
    }

    /**
     * @return the fincReqDt
     */
    public Date getFincReqDt() {
        return fincReqDt;
    }

    /**
     * @param fincReqDt the fincReqDt to set
     */
    public void setFincReqDt(Date fincReqDt) {
        this.fincReqDt = fincReqDt;
    }

    /**
     * @return the fincStatCd
     */
    public String getFincStatCd() {
        return fincStatCd;
    }

    /**
     * @param fincStatCd the fincStatCd to set
     */
    public void setFincStatCd(String fincStatCd) {
        this.fincStatCd = fincStatCd;
    }

    /**
     * @return the fincStatNm
     */
    public String getFincStatNm() {
        return fincStatNm;
    }

    /**
     * @param fincStatNm the fincStatNm to set
     */
    public void setFincStatNm(String fincStatNm) {
        this.fincStatNm = fincStatNm;
    }

    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
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
     * @return the fscCd
     */
    public String getFscCd() {
        return fscCd;
    }

    /**
     * @param fscCd the fscCd to set
     */
    public void setFscCd(String fscCd) {
        this.fscCd = fscCd;
    }

    /**
     * @return the fscNm
     */
    public String getFscNm() {
        return fscNm;
    }

    /**
     * @param fscNm the fscNm to set
     */
    public void setFscNm(String fscNm) {
        this.fscNm = fscNm;
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
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    /**
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }

    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
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
     * @return the publNm
     */
    public String getPublNm() {
        return publNm;
    }

    /**
     * @param publNm the publNm to set
     */
    public void setPublNm(String publNm) {
        this.publNm = publNm;
    }

    /**
     * @return the telNo1
     */
    public String getTelNo1() {
        return telNo1;
    }

    /**
     * @param telNo1 the telNo1 to set
     */
    public void setTelNo1(String telNo1) {
        this.telNo1 = telNo1;
    }

    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }

    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }

    /**
     * @return the mathDocTp
     */
    public String getMathDocTp() {
        return mathDocTp;
    }

    /**
     * @param mathDocTp the mathDocTp to set
     */
    public void setMathDocTp(String mathDocTp) {
        this.mathDocTp = mathDocTp;
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
     * @return the realAmt
     */
    public Double getRealAmt() {
        return realAmt;
    }

    /**
     * @param realAmt the realAmt to set
     */
    public void setRealAmt(Double realAmt) {
        this.realAmt = realAmt;
    }

    /**
     * @return the fincReqAmt
     */
    public Double getFincReqAmt() {
        return fincReqAmt;
    }

    /**
     * @param fincReqAmt the fincReqAmt to set
     */
    public void setFincReqAmt(Double fincReqAmt) {
        this.fincReqAmt = fincReqAmt;
    }

    /**
     * @return the fincRpayPrid
     */
    public int getFincRpayPrid() {
        return fincRpayPrid;
    }

    /**
     * @param fincRpayPrid the fincRpayPrid to set
     */
    public void setFincRpayPrid(int fincRpayPrid) {
        this.fincRpayPrid = fincRpayPrid;
    }

    /**
     * @return the fincLoanFeeAmt
     */
    public Double getFincLoanFeeAmt() {
        return fincLoanFeeAmt;
    }

    /**
     * @param fincLoanFeeAmt the fincLoanFeeAmt to set
     */
    public void setFincLoanFeeAmt(Double fincLoanFeeAmt) {
        this.fincLoanFeeAmt = fincLoanFeeAmt;
    }

    /**
     * @return the fincBurdAmt
     */
    public Double getFincBurdAmt() {
        return fincBurdAmt;
    }

    /**
     * @param fincBurdAmt the fincBurdAmt to set
     */
    public void setFincBurdAmt(Double fincBurdAmt) {
        this.fincBurdAmt = fincBurdAmt;
    }

    /**
     * @return the fincCmpCd
     */
    public String getFincCmpCd() {
        return fincCmpCd;
    }

    /**
     * @param fincCmpCd the fincCmpCd to set
     */
    public void setFincCmpCd(String fincCmpCd) {
        this.fincCmpCd = fincCmpCd;
    }

    /**
     * @return the fincCmpNm
     */
    public String getFincCmpNm() {
        return fincCmpNm;
    }

    /**
     * @param fincCmpNm the fincCmpNm to set
     */
    public void setFincCmpNm(String fincCmpNm) {
        this.fincCmpNm = fincCmpNm;
    }

    /**
     * @return the fincItemCd
     */
    public String getFincItemCd() {
        return fincItemCd;
    }

    /**
     * @param fincItemCd the fincItemCd to set
     */
    public void setFincItemCd(String fincItemCd) {
        this.fincItemCd = fincItemCd;
    }

    /**
     * @return the fincItemNm
     */
    public String getFincItemNm() {
        return fincItemNm;
    }

    /**
     * @param fincItemNm the fincItemNm to set
     */
    public void setFincItemNm(String fincItemNm) {
        this.fincItemNm = fincItemNm;
    }

    /**
     * @return the fincEndDt
     */
    public Date getFincEndDt() {
        return fincEndDt;
    }

    /**
     * @param fincEndDt the fincEndDt to set
     */
    public void setFincEndDt(Date fincEndDt) {
        this.fincEndDt = fincEndDt;
    }

    /**
     * @return the fincLoanRate
     */
    public Double getFincLoanRate() {
        return fincLoanRate;
    }

    /**
     * @param fincLoanRate the fincLoanRate to set
     */
    public void setFincLoanRate(Double fincLoanRate) {
        this.fincLoanRate = fincLoanRate;
    }

    /**
     * @return the instIntrRate
     */
    public Double getInstIntrRate() {
        return instIntrRate;
    }

    /**
     * @param instIntrRate the instIntrRate to set
     */
    public void setInstIntrRate(Double instIntrRate) {
        this.instIntrRate = instIntrRate;
    }

    /**
     * @return the grteIncAmt
     */
    public Double getGrteIncAmt() {
        return grteIncAmt;
    }

    /**
     * @param grteIncAmt the grteIncAmt to set
     */
    public void setGrteIncAmt(Double grteIncAmt) {
        this.grteIncAmt = grteIncAmt;
    }

    /**
     * @return the reqDataCollcEndYn
     */
    public String getReqDataCollcEndYn() {
        return reqDataCollcEndYn;
    }

    /**
     * @param reqDataCollcEndYn the reqDataCollcEndYn to set
     */
    public void setReqDataCollcEndYn(String reqDataCollcEndYn) {
        this.reqDataCollcEndYn = reqDataCollcEndYn;
    }

    /**
     * @return the loanAgreeStatCd
     */
    public String getLoanAgreeStatCd() {
        return loanAgreeStatCd;
    }

    /**
     * @param loanAgreeStatCd the loanAgreeStatCd to set
     */
    public void setLoanAgreeStatCd(String loanAgreeStatCd) {
        this.loanAgreeStatCd = loanAgreeStatCd;
    }

    /**
     * @return the loanYn
     */
    public String getLoanYn() {
        return loanYn;
    }

    /**
     * @param loanYn the loanYn to set
     */
    public void setLoanYn(String loanYn) {
        this.loanYn = loanYn;
    }

    /**
     * @return the cltrLoanStatCd
     */
    public String getCltrLoanStatCd() {
        return cltrLoanStatCd;
    }

    /**
     * @param cltrLoanStatCd the cltrLoanStatCd to set
     */
    public void setCltrLoanStatCd(String cltrLoanStatCd) {
        this.cltrLoanStatCd = cltrLoanStatCd;
    }

    /**
     * @return the fileDocId
     */
    public String getFileDocId() {
        return fileDocId;
    }

    /**
     * @param fileDocId the fileDocId to set
     */
    public void setFileDocId(String fileDocId) {
        this.fileDocId = fileDocId;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }

    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}