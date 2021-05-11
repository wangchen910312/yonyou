package chn.bhmc.dms.sal.uco.vo;

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
 * @ClassName   : UsedCarContractVO
 * @Description : 중고차 - 계약정보 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 12.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"                 , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="contractNo"            , mesgKey="sal.lbl.contractNo")
   ,@ValidField(field="contractTp"            , mesgKey="sal.lbl.contractTp")
   ,@ValidField(field="contractStatCd"        , mesgKey="sal.lbl.contractStatCd")
   ,@ValidField(field="contractDt"            , mesgKey="sal.lbl.contractDt")
   ,@ValidField(field="saleEmpNo"             , mesgKey="sal.lbl.saleEmpNo")
   })
public class UsedCarContractVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1326278798821254444L;

    /**
     * 딜러코드
     **/
    private  String             dlrCd;

    /**
     * 계약번호
     **/
    private  String             contractNo;

    /**
     * 계약상태코드
     **/
    //CONTRACT_STAT_CD

    private  String             contractStatCd;

    /**
     * 계약일자
     **/
    //CONTRACT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               contractDt;

    /**
     * 판매사원번호
     **/
    //SALE_EMP_NO

    private  String             saleEmpNo;

    /**
     * 계약고객번호
     **/
    //CONTRACT_CUST_NO

    private  String             contractCustNo;

    /**
     * 실제운전자고객번호
     **/
    //REAL_DRIVER_CUST_NO

    private  String             realDriverCustNo;

    /**
     * 실제운전자동일여부
     **/
    private  String             realDriverSameYn;

    /**
     * 판매관리번호
     **/
    //SALE_MNG_NO

    private  String             saleMngNo;

    /**
     * 지불유형
     **/
    //PAY_TP
    private  String             payTp;

    /**
     * 차대번호
     **/
    //VIN_NO
    private  String             vinNo;

    /**
     * 차량상태
     */
    private  String             carStatCd;

    /**
     * 자사차량구분코드
     **/
    //CORP_CAR_DSTIN_CD
    private  String             corpCarDstinCd;

    /**
     * 차종코드
     **/
    //CARLINE_CD
    private  String             carlineCd;

    /**
     * 차종명
     */
    private  String             carlineNm;

    /**
     * 모델코드
     **/
    //MODEL_CD

    private  String             modelCd;

    /**
     * 모델명
     **/
    private  String             modelNm;

    /**
     * OCN코드
     **/
    //OCN_CD

    private  String             ocnCd;

    /**
     * OCN명
     **/
    private  String             ocnNm;

    /**
     * 외장색상코드
     **/
    //EXT_COLOR_CD
    private  String             extColorCd;

    /**
     * 외장색상명
     **/
    private  String             extColorNm;

    /**
     * 내장색상코드
     **/
    //INT_COLOR_CD
    private  String             intColorCd;

    /**
     * 내장색상명
     **/
    private  String             intColorNm;


    /**
     * 차량브랜드코드
     **/
    //CAR_BRAND_CD

    private  String             carBrandCd;

    /**
     * 차량명
     **/
    //CAR_NM

    private  String             carNm;

    /**
     * 평가금액
     **/
    //EVAL_AMT

    private  Double             evalAmt;

    /**
     * 차량판매금액
     **/
    //CAR_SALE_AMT

    private  Double             carSaleAmt;

    /**
     * 소매금액
     **/
    //RETL_AMT

    private  Double             retlAmt;

    /**
     * 보험금액
     **/
    //INC_AMT

    private  Double             incAmt;

    /**
     * 대행금액
     **/
    //AAP_AMT

    private  Double             aapAmt;

    /**
     * 부가가치세금액
     **/
    //VAT_AMT

    private  Double             vatAmt;

    /**
     * 실제차량금액
     **/
    //REAL_CAR_AMT

    private  Double             realCarAmt;

    /**
     * 기타합계금액
     **/
    //ETC_SUM_AMT

    private  Double             etcSumAmt;

    /**
     * 실제지불금액
     **/
    //REAL_PAY_AMT

    private  Double             realPayAmt;

    /**
     * 계약입금자명
     **/
    //CONTRACT_PDPST_NM

    private  String             contractPdpstNm;

    /**
     * 계약영수증번호
     **/
    //CONTRACT_RCPT_NO

    private  String             contractRcptNo;

    /**
     * 계약영수증금액
     **/
    //CONTRACT_RCPT_AMT

    private  Double             contractRcptAmt;

    /**
     * 계약영수증ID
     **/
    //CONTRACT_RCPT_ID

    private  String             contractRcptId;

    /**
     * 계약영수증일자
     **/
    //CONTRACT_RCPT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               contractRcptDt;

    /**
     * 등록유형
     **/
    //REG_TP

    private  String             regTp;

    /**
     * 실제등록금액
     **/
    //REAL_REG_AMT

    private  Double             regAmt;

    /**
     * 등록수수료금액
     **/
    //REG_FEE_AMT

    private  Double             regFeeAmt;

    /**
     * 보험대행금액
     **/
    //INC_AAP_TP

    private  String             incAapTp;

    /**
     * 보험수수료금액
     **/
    //INC_FEE_AMT

    private  Double             incFeeAmt;

    /**
     * 금융요청여부
     **/
    private  String             fincReqYn;

    /**
     * 금융수수료금액
     **/
    //FINC_FEE_AMT

    private  Double             fincFeeAmt;

    /**
     * 인도요청일자
     **/
    //DL_REQ_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               dlReqDt;

    /**
     * 실제인도일자
     **/
    //REAL_DL_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               realDlDt;

    /**
     * 파일문서ID
     **/
    //FILE_DOC_ID

    private  String             fileDocId;

    /**
     * 비고
     **/
    //REMARK

    private  String             remark;

    /**
     * 2급딜러여부
     **/
    private  String             lv2DlrYn;

    /**
     * 2급딜러조직코드
     **/
    private  String             lv2DlrOrgCd;
    private  String             lv2DlrOrgNm;

    /**
     * 등록자ID
     **/
    private  String             regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               regDt;

    /**
     * 수정자ID
     **/
    //UPDT_USR_ID
    private  String             updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               updtDt;

    /**
     * 고객코드
     **/
    private  String        custNo;

    /**
     * 고객유형
     **/
    private  String        custTp;

    /**
     * 고객명
     **/
    private  String        custNm;

    /**
     * 전화번호1
     **/
    //TEL_NO1
    private  String        telNo1;

    /**
     * 전화번호2
     **/
    //TEL_NO2
    private  String        telNo2;

    /**
     * 이메일명
     **/
    //EMAIL_NM
    private  String        emailNm;

    /**
     * 신분증번호
     **/
    //SSN_CRN_NO
    private  String        ssnCrnNo;

    /**
     * 신분증유형
     **/
    private  String        mathDocTp;

    /**
     * 우편번호
     **/
    //ZIP_CD
    private  String        zipCd;

    /**
     * 성코드
     **/
    //SUNG_CD
    private  String        sungCd;

    /**
     * 도시코드
     **/
    //CITY_CD
    private  String        cityCd;

    /**
     * 지역코드
     **/
    //DIST_CD
    private  String        distCd;

    /**
     * 성명
     **/
    //SUNG_NM
    private  String        sungNm;

    /**
     * 도시명
     **/
    //CITY_NM
    private  String        cityNm;

    /**
     * 지역명
     **/
    //DIST_NM
    private  String        distNm;

    /**
     * 주소명
     **/
    //ADDR_NM
    private  String        addrNm;

    /**
     * 주소상세내용
     **/
    //ADDR_DETL_CONT
    private  String        addrDetlCont;

    /**
     * 고객코드
     **/
    private  String        drvCustNo;

    /**
     * 고객유형
     **/
    private  String        drvCustTp;

    /**
     * 고객명
     **/
    private  String        drvCustNm;

    /**
     * 전화번호1
     **/
    //TEL_NO1
    private  String        drvTelNo1;

    /**
     * 전화번호2
     **/
    //TEL_NO2
    private  String        drvTelNo2;

    /**
     * 이메일명
     **/
    //EMAIL_NM
    private  String        drvEmailNm;

    /**
     * 신분증번호
     **/
    //SSN_CRN_NO
    private  String        drvSsnCrnNo;

    /**
     * 신분증유형
     **/
    //SSN_CRN_TP
    private  String        drvMathDocTp;

    /**
     * 우편번호
     **/
    //ZIP_CD
    private  String        drvZipCd;

    /**
     * 성코드
     **/
    //SUNG_CD
    private  String        drvSungCd;

    /**
     * 도시코드
     **/
    //CITY_CD
    private  String        drvCityCd;

    /**
     * 지역코드
     **/
    //DIST_CD
    private  String        drvDistCd;

    /**
     * 성명
     **/
    //SUNG_NM
    private  String        drvSungNm;

    /**
     * 도시명
     **/
    //CITY_NM
    private  String        drvCityNm;

    /**
     * 지역명
     **/
    //DIST_NM
    private  String        drvDistNm;

    /**
     * 주소명
     **/
    //ADDR_NM
    private  String        drvAddrNm;

    /**
     * 주소상세내용
     **/
    //ADDR_DETL_CONT
    private  String        drvAddrDetlCont;

    /**
     * 등록선수금액
     **/
    //REG_PRE_AMT
    private  Double           regPreAmt;

    /**
     * 실제등록금액
     **/
    //REAL_REG_AMT
    private  Double           realRegAmt;

    /**
     * 등록수수료금액
     **/
    //REG_FEE_AMT
    private  Double           realRegFeeAmt;

    /**
     * 등록지역코드
     **/
    //REG_DIST_CD

    private  String           regDistCd;

    /**
     * 등록예상일자
     **/
    //REG_EXPC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             regExpcDt;

    /**
     * 구입세금선수금액
     **/
    private  Double           purcPreAmt;

    /**
     * 실제구입세금액
     **/
    private  Double           realPurcAmt;

    /**
     * 보험회사코드
     **/
    //INC_CMP_CD
    private  String       incCmpCd;

    /**
     * 보험수혜자명
     **/
    //INC_PROFIT_NM
    private  String       incProfitNm;

    /**
     * 보험가입일자
     **/
    //INC_JOIN_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date         incJoinDt;

    /**
     * 보험예상금액
     **/
    //INC_EXPC_AMT
    private  Double       incExpcAmt;

    /**
     * 실보험금액
     **/
    //REAL_INC_AMT
    private  Double       realIncAmt;

    /**
     * 보험수수료금액
     **/
    //INC_FEE_AMT
    private  Double       realIncFeeAmt;

    /**
     * 비고
     **/
    //REMARK
    private  String       incRemark;

    /**
     * 금융회사코드
     **/
    //FINC_CMP_CD

    private  String        fincCmpCd;

    /**
     * 금융품목코드
     **/
    //FINC_ITEM_CD

    private  String        fincItemCd;

    /**
     * 금융요청일자
     **/
    //FINC_REQ_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          fincReqDt;

    /**
     * 금융요청금액
     **/
    //FINC_REQ_AMT

    private  Double        fincReqAmt;

    /**
     * 금융만기일자
     **/
    //FINC_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          fincEndDt;

    /**
     * 금융수수료금액
     **/
    //FINC_FEE_AMT

    private  Double        realFincFeeAmt;

    /**
     * 금융상환기간
     **/
    //FINC_RPAY_PRID
    private  int           fincRpayPrid;

    /**
     * 금융대출비율
     **/
    private  Double        fincLoanRate;

    /**
     * 파트너유형
     **/
    private  String        partnerTp;


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
     * @return the contractStatCd
     */
    public String getContractStatCd() {
        return contractStatCd;
    }

    /**
     * @param contractStatCd the contractStatCd to set
     */
    public void setContractStatCd(String contractStatCd) {
        this.contractStatCd = contractStatCd;
    }

    /**
     * @return the contractDt
     */
    public Date getContractDt() {
        return contractDt;
    }

    /**
     * @param contractDt the contractDt to set
     */
    public void setContractDt(Date contractDt) {
        this.contractDt = contractDt;
    }

    /**
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }

    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
    }

    /**
     * @return the contractCustNo
     */
    public String getContractCustNo() {
        return contractCustNo;
    }

    /**
     * @param contractCustNo the contractCustNo to set
     */
    public void setContractCustNo(String contractCustNo) {
        this.contractCustNo = contractCustNo;
    }

    /**
     * @return the realDriverCustNo
     */
    public String getRealDriverCustNo() {
        return realDriverCustNo;
    }

    /**
     * @param realDriverCustNo the realDriverCustNo to set
     */
    public void setRealDriverCustNo(String realDriverCustNo) {
        this.realDriverCustNo = realDriverCustNo;
    }

    /**
     * @return the realDriverSameYn
     */
    public String getRealDriverSameYn() {
        return realDriverSameYn;
    }

    /**
     * @param realDriverSameYn the realDriverSameYn to set
     */
    public void setRealDriverSameYn(String realDriverSameYn) {
        this.realDriverSameYn = realDriverSameYn;
    }

    /**
     * @return the saleMngNo
     */
    public String getSaleMngNo() {
        return saleMngNo;
    }

    /**
     * @param saleMngNo the saleMngNo to set
     */
    public void setSaleMngNo(String saleMngNo) {
        this.saleMngNo = saleMngNo;
    }

    /**
     * @return the payTp
     */
    public String getPayTp() {
        return payTp;
    }

    /**
     * @param payTp the payTp to set
     */
    public void setPayTp(String payTp) {
        this.payTp = payTp;
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
     * @return the corpCarDstinCd
     */
    public String getCorpCarDstinCd() {
        return corpCarDstinCd;
    }

    /**
     * @param corpCarDstinCd the corpCarDstinCd to set
     */
    public void setCorpCarDstinCd(String corpCarDstinCd) {
        this.corpCarDstinCd = corpCarDstinCd;
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
     * @return the carBrandCd
     */
    public String getCarBrandCd() {
        return carBrandCd;
    }

    /**
     * @param carBrandCd the carBrandCd to set
     */
    public void setCarBrandCd(String carBrandCd) {
        this.carBrandCd = carBrandCd;
    }

    /**
     * @return the carNm
     */
    public String getCarNm() {
        return carNm;
    }

    /**
     * @param carNm the carNm to set
     */
    public void setCarNm(String carNm) {
        this.carNm = carNm;
    }

    /**
     * @return the evalAmt
     */
    public Double getEvalAmt() {
        return evalAmt;
    }

    /**
     * @param evalAmt the evalAmt to set
     */
    public void setEvalAmt(Double evalAmt) {
        this.evalAmt = evalAmt;
    }

    /**
     * @return the carSaleAmt
     */
    public Double getCarSaleAmt() {
        return carSaleAmt;
    }

    /**
     * @param carSaleAmt the carSaleAmt to set
     */
    public void setCarSaleAmt(Double carSaleAmt) {
        this.carSaleAmt = carSaleAmt;
    }

    /**
     * @return the retlAmt
     */
    public Double getRetlAmt() {
        return retlAmt;
    }

    /**
     * @param retlAmt the retlAmt to set
     */
    public void setRetlAmt(Double retlAmt) {
        this.retlAmt = retlAmt;
    }

    /**
     * @return the incAmt
     */
    public Double getIncAmt() {
        return incAmt;
    }

    /**
     * @param incAmt the incAmt to set
     */
    public void setIncAmt(Double incAmt) {
        this.incAmt = incAmt;
    }

    /**
     * @return the aapAmt
     */
    public Double getAapAmt() {
        return aapAmt;
    }

    /**
     * @param aapAmt the aapAmt to set
     */
    public void setAapAmt(Double aapAmt) {
        this.aapAmt = aapAmt;
    }

    /**
     * @return the vatAmt
     */
    public Double getVatAmt() {
        return vatAmt;
    }

    /**
     * @param vatAmt the vatAmt to set
     */
    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
    }

    /**
     * @return the realCarAmt
     */
    public Double getRealCarAmt() {
        return realCarAmt;
    }

    /**
     * @param realCarAmt the realCarAmt to set
     */
    public void setRealCarAmt(Double realCarAmt) {
        this.realCarAmt = realCarAmt;
    }

    /**
     * @return the etcSumAmt
     */
    public Double getEtcSumAmt() {
        return etcSumAmt;
    }

    /**
     * @param etcSumAmt the etcSumAmt to set
     */
    public void setEtcSumAmt(Double etcSumAmt) {
        this.etcSumAmt = etcSumAmt;
    }

    /**
     * @return the realPayAmt
     */
    public Double getRealPayAmt() {
        return realPayAmt;
    }

    /**
     * @param realPayAmt the realPayAmt to set
     */
    public void setRealPayAmt(Double realPayAmt) {
        this.realPayAmt = realPayAmt;
    }

    /**
     * @return the contractPdpstNm
     */
    public String getContractPdpstNm() {
        return contractPdpstNm;
    }

    /**
     * @param contractPdpstNm the contractPdpstNm to set
     */
    public void setContractPdpstNm(String contractPdpstNm) {
        this.contractPdpstNm = contractPdpstNm;
    }

    /**
     * @return the contractRcptNo
     */
    public String getContractRcptNo() {
        return contractRcptNo;
    }

    /**
     * @param contractRcptNo the contractRcptNo to set
     */
    public void setContractRcptNo(String contractRcptNo) {
        this.contractRcptNo = contractRcptNo;
    }

    /**
     * @return the contractRcptAmt
     */
    public Double getContractRcptAmt() {
        return contractRcptAmt;
    }

    /**
     * @param contractRcptAmt the contractRcptAmt to set
     */
    public void setContractRcptAmt(Double contractRcptAmt) {
        this.contractRcptAmt = contractRcptAmt;
    }

    /**
     * @return the contractRcptId
     */
    public String getContractRcptId() {
        return contractRcptId;
    }

    /**
     * @param contractRcptId the contractRcptId to set
     */
    public void setContractRcptId(String contractRcptId) {
        this.contractRcptId = contractRcptId;
    }

    /**
     * @return the contractRcptDt
     */
    public Date getContractRcptDt() {
        return contractRcptDt;
    }

    /**
     * @param contractRcptDt the contractRcptDt to set
     */
    public void setContractRcptDt(Date contractRcptDt) {
        this.contractRcptDt = contractRcptDt;
    }

    /**
     * @return the regTp
     */
    public String getRegTp() {
        return regTp;
    }

    /**
     * @param regTp the regTp to set
     */
    public void setRegTp(String regTp) {
        this.regTp = regTp;
    }

    /**
     * @return the regAmt
     */
    public Double getRegAmt() {
        return regAmt;
    }

    /**
     * @param regAmt the regAmt to set
     */
    public void setRegAmt(Double regAmt) {
        this.regAmt = regAmt;
    }

    /**
     * @return the regFeeAmt
     */
    public Double getRegFeeAmt() {
        return regFeeAmt;
    }

    /**
     * @param regFeeAmt the regFeeAmt to set
     */
    public void setRegFeeAmt(Double regFeeAmt) {
        this.regFeeAmt = regFeeAmt;
    }

    /**
     * @return the incAapTp
     */
    public String getIncAapTp() {
        return incAapTp;
    }

    /**
     * @param incAapTp the incAapTp to set
     */
    public void setIncAapTp(String incAapTp) {
        this.incAapTp = incAapTp;
    }

    /**
     * @return the incFeeAmt
     */
    public Double getIncFeeAmt() {
        return incFeeAmt;
    }

    /**
     * @param incFeeAmt the incFeeAmt to set
     */
    public void setIncFeeAmt(Double incFeeAmt) {
        this.incFeeAmt = incFeeAmt;
    }

    /**
     * @return the fincReqYn
     */
    public String getFincReqYn() {
        return fincReqYn;
    }

    /**
     * @param fincReqYn the fincReqYn to set
     */
    public void setFincReqYn(String fincReqYn) {
        this.fincReqYn = fincReqYn;
    }

    /**
     * @return the fincFeeAmt
     */
    public Double getFincFeeAmt() {
        return fincFeeAmt;
    }

    /**
     * @param fincFeeAmt the fincFeeAmt to set
     */
    public void setFincFeeAmt(Double fincFeeAmt) {
        this.fincFeeAmt = fincFeeAmt;
    }

    /**
     * @return the dlReqDt
     */
    public Date getDlReqDt() {
        return dlReqDt;
    }

    /**
     * @param dlReqDt the dlReqDt to set
     */
    public void setDlReqDt(Date dlReqDt) {
        this.dlReqDt = dlReqDt;
    }

    /**
     * @return the realDlDt
     */
    public Date getRealDlDt() {
        return realDlDt;
    }

    /**
     * @param realDlDt the realDlDt to set
     */
    public void setRealDlDt(Date realDlDt) {
        this.realDlDt = realDlDt;
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
     * @return the lv2DlrYn
     */
    public String getLv2DlrYn() {
        return lv2DlrYn;
    }

    /**
     * @param lv2DlrYn the lv2DlrYn to set
     */
    public void setLv2DlrYn(String lv2DlrYn) {
        this.lv2DlrYn = lv2DlrYn;
    }

    /**
     * @return the lv2DlrOrgCd
     */
    public String getLv2DlrOrgCd() {
        return lv2DlrOrgCd;
    }

    /**
     * @param lv2DlrOrgCd the lv2DlrOrgCd to set
     */
    public void setLv2DlrOrgCd(String lv2DlrOrgCd) {
        this.lv2DlrOrgCd = lv2DlrOrgCd;
    }

    /**
     * @return the lv2DlrOrgNm
     */
    public String getLv2DlrOrgNm() {
        return lv2DlrOrgNm;
    }

    /**
     * @param lv2DlrOrgNm the lv2DlrOrgNm to set
     */
    public void setLv2DlrOrgNm(String lv2DlrOrgNm) {
        this.lv2DlrOrgNm = lv2DlrOrgNm;
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
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
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
     * @return the telNo2
     */
    public String getTelNo2() {
        return telNo2;
    }

    /**
     * @param telNo2 the telNo2 to set
     */
    public void setTelNo2(String telNo2) {
        this.telNo2 = telNo2;
    }

    /**
     * @return the emailNm
     */
    public String getEmailNm() {
        return emailNm;
    }

    /**
     * @param emailNm the emailNm to set
     */
    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
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
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }

    /**
     * @param zipCd the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
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
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }

    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }

    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
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
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }

    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }

    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    /**
     * @return the addrNm
     */
    public String getAddrNm() {
        return addrNm;
    }

    /**
     * @param addrNm the addrNm to set
     */
    public void setAddrNm(String addrNm) {
        this.addrNm = addrNm;
    }

    /**
     * @return the addrDetlCont
     */
    public String getAddrDetlCont() {
        return addrDetlCont;
    }

    /**
     * @param addrDetlCont the addrDetlCont to set
     */
    public void setAddrDetlCont(String addrDetlCont) {
        this.addrDetlCont = addrDetlCont;
    }

    /**
     * @return the drvCustNo
     */
    public String getDrvCustNo() {
        return drvCustNo;
    }

    /**
     * @param drvCustNo the drvCustNo to set
     */
    public void setDrvCustNo(String drvCustNo) {
        this.drvCustNo = drvCustNo;
    }

    /**
     * @return the drvCustTp
     */
    public String getDrvCustTp() {
        return drvCustTp;
    }

    /**
     * @param drvCustTp the drvCustTp to set
     */
    public void setDrvCustTp(String drvCustTp) {
        this.drvCustTp = drvCustTp;
    }

    /**
     * @return the drvCustNm
     */
    public String getDrvCustNm() {
        return drvCustNm;
    }

    /**
     * @param drvCustNm the drvCustNm to set
     */
    public void setDrvCustNm(String drvCustNm) {
        this.drvCustNm = drvCustNm;
    }

    /**
     * @return the drvTelNo1
     */
    public String getDrvTelNo1() {
        return drvTelNo1;
    }

    /**
     * @param drvTelNo1 the drvTelNo1 to set
     */
    public void setDrvTelNo1(String drvTelNo1) {
        this.drvTelNo1 = drvTelNo1;
    }

    /**
     * @return the drvTelNo2
     */
    public String getDrvTelNo2() {
        return drvTelNo2;
    }

    /**
     * @param drvTelNo2 the drvTelNo2 to set
     */
    public void setDrvTelNo2(String drvTelNo2) {
        this.drvTelNo2 = drvTelNo2;
    }

    /**
     * @return the drvEmailNm
     */
    public String getDrvEmailNm() {
        return drvEmailNm;
    }

    /**
     * @param drvEmailNm the drvEmailNm to set
     */
    public void setDrvEmailNm(String drvEmailNm) {
        this.drvEmailNm = drvEmailNm;
    }

    /**
     * @return the drvSsnCrnNo
     */
    public String getDrvSsnCrnNo() {
        return drvSsnCrnNo;
    }

    /**
     * @param drvSsnCrnNo the drvSsnCrnNo to set
     */
    public void setDrvSsnCrnNo(String drvSsnCrnNo) {
        this.drvSsnCrnNo = drvSsnCrnNo;
    }

    /**
     * @return the drvMathDocTp
     */
    public String getDrvMathDocTp() {
        return drvMathDocTp;
    }

    /**
     * @param drvMathDocTp the drvMathDocTp to set
     */
    public void setDrvMathDocTp(String drvMathDocTp) {
        this.drvMathDocTp = drvMathDocTp;
    }

    /**
     * @return the drvZipCd
     */
    public String getDrvZipCd() {
        return drvZipCd;
    }

    /**
     * @param drvZipCd the drvZipCd to set
     */
    public void setDrvZipCd(String drvZipCd) {
        this.drvZipCd = drvZipCd;
    }

    /**
     * @return the drvSungCd
     */
    public String getDrvSungCd() {
        return drvSungCd;
    }

    /**
     * @param drvSungCd the drvSungCd to set
     */
    public void setDrvSungCd(String drvSungCd) {
        this.drvSungCd = drvSungCd;
    }

    /**
     * @return the drvCityCd
     */
    public String getDrvCityCd() {
        return drvCityCd;
    }

    /**
     * @param drvCityCd the drvCityCd to set
     */
    public void setDrvCityCd(String drvCityCd) {
        this.drvCityCd = drvCityCd;
    }

    /**
     * @return the drvDistCd
     */
    public String getDrvDistCd() {
        return drvDistCd;
    }

    /**
     * @param drvDistCd the drvDistCd to set
     */
    public void setDrvDistCd(String drvDistCd) {
        this.drvDistCd = drvDistCd;
    }

    /**
     * @return the drvSungNm
     */
    public String getDrvSungNm() {
        return drvSungNm;
    }

    /**
     * @param drvSungNm the drvSungNm to set
     */
    public void setDrvSungNm(String drvSungNm) {
        this.drvSungNm = drvSungNm;
    }

    /**
     * @return the drvCityNm
     */
    public String getDrvCityNm() {
        return drvCityNm;
    }

    /**
     * @param drvCityNm the drvCityNm to set
     */
    public void setDrvCityNm(String drvCityNm) {
        this.drvCityNm = drvCityNm;
    }

    /**
     * @return the drvDistNm
     */
    public String getDrvDistNm() {
        return drvDistNm;
    }

    /**
     * @param drvDistNm the drvDistNm to set
     */
    public void setDrvDistNm(String drvDistNm) {
        this.drvDistNm = drvDistNm;
    }

    /**
     * @return the drvAddrNm
     */
    public String getDrvAddrNm() {
        return drvAddrNm;
    }

    /**
     * @param drvAddrNm the drvAddrNm to set
     */
    public void setDrvAddrNm(String drvAddrNm) {
        this.drvAddrNm = drvAddrNm;
    }

    /**
     * @return the drvAddrDetlCont
     */
    public String getDrvAddrDetlCont() {
        return drvAddrDetlCont;
    }

    /**
     * @param drvAddrDetlCont the drvAddrDetlCont to set
     */
    public void setDrvAddrDetlCont(String drvAddrDetlCont) {
        this.drvAddrDetlCont = drvAddrDetlCont;
    }

    /**
     * @return the regPreAmt
     */
    public Double getRegPreAmt() {
        return regPreAmt;
    }

    /**
     * @param regPreAmt the regPreAmt to set
     */
    public void setRegPreAmt(Double regPreAmt) {
        this.regPreAmt = regPreAmt;
    }

    /**
     * @return the realRegAmt
     */
    public Double getRealRegAmt() {
        return realRegAmt;
    }

    /**
     * @param realRegAmt the realRegAmt to set
     */
    public void setRealRegAmt(Double realRegAmt) {
        this.realRegAmt = realRegAmt;
    }

    /**
     * @return the realRegFeeAmt
     */
    public Double getRealRegFeeAmt() {
        return realRegFeeAmt;
    }

    /**
     * @param realRegFeeAmt the realRegFeeAmt to set
     */
    public void setRealRegFeeAmt(Double realRegFeeAmt) {
        this.realRegFeeAmt = realRegFeeAmt;
    }

    /**
     * @return the regDistCd
     */
    public String getRegDistCd() {
        return regDistCd;
    }

    /**
     * @param regDistCd the regDistCd to set
     */
    public void setRegDistCd(String regDistCd) {
        this.regDistCd = regDistCd;
    }

    /**
     * @return the regExpcDt
     */
    public Date getRegExpcDt() {
        return regExpcDt;
    }

    /**
     * @param regExpcDt the regExpcDt to set
     */
    public void setRegExpcDt(Date regExpcDt) {
        this.regExpcDt = regExpcDt;
    }

    /**
     * @return the purcPreAmt
     */
    public Double getPurcPreAmt() {
        return purcPreAmt;
    }

    /**
     * @param purcPreAmt the purcPreAmt to set
     */
    public void setPurcPreAmt(Double purcPreAmt) {
        this.purcPreAmt = purcPreAmt;
    }

    /**
     * @return the realPurcAmt
     */
    public Double getRealPurcAmt() {
        return realPurcAmt;
    }

    /**
     * @param realPurcAmt the realPurcAmt to set
     */
    public void setRealPurcAmt(Double realPurcAmt) {
        this.realPurcAmt = realPurcAmt;
    }

    /**
     * @return the incCmpCd
     */
    public String getIncCmpCd() {
        return incCmpCd;
    }

    /**
     * @param incCmpCd the incCmpCd to set
     */
    public void setIncCmpCd(String incCmpCd) {
        this.incCmpCd = incCmpCd;
    }

    /**
     * @return the incProfitNm
     */
    public String getIncProfitNm() {
        return incProfitNm;
    }

    /**
     * @param incProfitNm the incProfitNm to set
     */
    public void setIncProfitNm(String incProfitNm) {
        this.incProfitNm = incProfitNm;
    }

    /**
     * @return the incJoinDt
     */
    public Date getIncJoinDt() {
        return incJoinDt;
    }

    /**
     * @param incJoinDt the incJoinDt to set
     */
    public void setIncJoinDt(Date incJoinDt) {
        this.incJoinDt = incJoinDt;
    }

    /**
     * @return the incExpcAmt
     */
    public Double getIncExpcAmt() {
        return incExpcAmt;
    }

    /**
     * @param incExpcAmt the incExpcAmt to set
     */
    public void setIncExpcAmt(Double incExpcAmt) {
        this.incExpcAmt = incExpcAmt;
    }

    /**
     * @return the realIncAmt
     */
    public Double getRealIncAmt() {
        return realIncAmt;
    }

    /**
     * @param realIncAmt the realIncAmt to set
     */
    public void setRealIncAmt(Double realIncAmt) {
        this.realIncAmt = realIncAmt;
    }

    /**
     * @return the realIncFeeAmt
     */
    public Double getRealIncFeeAmt() {
        return realIncFeeAmt;
    }

    /**
     * @param realIncFeeAmt the realIncFeeAmt to set
     */
    public void setRealIncFeeAmt(Double realIncFeeAmt) {
        this.realIncFeeAmt = realIncFeeAmt;
    }

    /**
     * @return the incRemark
     */
    public String getIncRemark() {
        return incRemark;
    }

    /**
     * @param incRemark the incRemark to set
     */
    public void setIncRemark(String incRemark) {
        this.incRemark = incRemark;
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
     * @return the realFincFeeAmt
     */
    public Double getRealFincFeeAmt() {
        return realFincFeeAmt;
    }

    /**
     * @param realFincFeeAmt the realFincFeeAmt to set
     */
    public void setRealFincFeeAmt(Double realFincFeeAmt) {
        this.realFincFeeAmt = realFincFeeAmt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the partnerTp
     */
    public String getPartnerTp() {
        return partnerTp;
    }

    /**
     * @param partnerTp the partnerTp to set
     */
    public void setPartnerTp(String partnerTp) {
        this.partnerTp = partnerTp;
    }

}
