package chn.bhmc.dms.sal.cnt.vo;

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
 * @ClassName   : ContractReSupportVO
 * @Description : 계약정보 조회 VO
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
public class ContractReSupportVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8792538979217333341L;

    /**
     * 딜러코드
     **/
    private  String             dlrCd;

    /**
     * 계약번호
     **/
    private  String             contractNo;

    /**
     * 계약유형
     **/
    private  String             contractTp;
    private  String             contractTpNm;

    /**
     * 계약상태코드
     **/
    private  String             contractStatCd;
    private  String             contractStatNm;

    /**
     * 계약일자
     **/
    //CONTRACT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               contractDt;

    /**
     * 판매사원번호
     **/
    private  String             saleEmpNo;
    private  String             saleEmpNm;

    /**
     * 계약고객번호
     **/
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
     * 영업관리번호
     **/
    //SALES_MNG_NO

    private  String             salesMngNo;

    /**
     * 지불유형
     **/
    //PAY_TP
    private  String             payTp;
    private  String             payTpNm;

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
     * 차관코드
     **/
    private  String             fscCd;
    private  String             fscNm;
    
    /**
     * 모델코드
     **/
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
     * 탁송유형
     **/
    //CONS_TP

    private  String             consTp;

    /**
     * 도매금액
     **/
    //WHSL_AMT

    private  Double             whslAmt;

    /**
     * 소매금액
     **/
    //RETL_AMT

    private  Double             retlAmt;

    /**
     * 프로모션금액
     **/
    //PROMOTION_AMT

    private  Double             promotionAmt;

    /**
     * 법인프로모션금액
     **/
    //CORP_PROMOTION_AMT

    private  Double             corpPromotionAmt;

    /**
     * 딜러프로모션금액
     **/
    //DLR_PROMOTION_AMT

    private  Double             dlrPromotionAmt;

    /**
     * 포인트 금액
     **/
    private  Double             pointAmt;

    /**
     * BM 포인트 금액
     **/
    private  Double             blueMembershipPointVal;

    /**
     * BM 포인트 반영비율
     **/
    private  Double             bluePointApplyRate;

    /**
     * 치환금액
     **/
    //SBST_AMT
    private  Double             sbstAmt;

    /**
     * 용품금액
     **/
    //GOODS_AMT

    private  Double             goodsAmt;

    /**
     * 탁송금액
     **/
    //CONS_AMT

    private  Double             consAmt;

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
    private  Double             realAmt; 

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
     * 예약판매금액
     **/
    private  Double             reservContAmt;
    
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
     * 등록금액
     **/
    //REG_AMT

    private  Double             regAmt;

    /**
     * 등록수수료금액
     **/
    //REG_FEE_AMT

    private  Double             regFeeAmt;

    /**
     * 보험대행유형
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
     * 중고차량구매여부
     **/
    private  String             uatcCarPurcYn;

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
     * 유통채널코드
     **/
    //DSTB_CHN_CD

    private  String             dstbChnCd;

    /**
     * 소매유형
     **/
    //RETL_TP

    private  String             retlTp;

    /**
     * 취소일자
     **/
    //CANC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               cancDt;

    /**
     * 취소사유코드
     **/
    //CANC_REASON_CD

    private  String             cancReasonCd;

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
     * 비고1
     **/
    //REMARK1

    private  String             remark1;

    /**
     * 2급딜러조직코드
     */
    private  String             lv2DlrOrdCd;

    /**
     * 2급딜러여부
     **/
    private  String             lv2DlrYn = "N";

    /**
     * 2급딜러조직코드
     **/
    //LV2_DLR_ORG_CD

    private  String             lv2DlrOrgCd;
    private  String             lv2DlrOrgNm;

    /**
     * 판매기회번호
     **/
    private  String                saleOpptNo;
    
    /**
     * 판매기회 일련번호
     **/
    private  String                saleOpptSeq;

    /**
     * 소개딜러코드
     **/
    //INTRO_DLR_CD

    private  String             introDlrCd;

    /**
     * 용품계약번호
     **/
    //GOODS_CONTRACT_NO

    private  String             goodsContractNo;

    /**
     * 그룹계약번호
     **/
    //GRP_CONTRACT_NO
    private  String             grpContractNo;

    /**
     * 견적번호
     **/
    //ESTIMATE_NO
    private  String                 estimateNo;

    /**
     * 예약판매번호
     **/
    private  String            beforeNo;
    private  String            beBeforeNo;
    
    /**
     * 예판수납생성여부
     */
    private  String            beforeImplyYn;
    
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
     * 할인레벨코드
     */
    private String dcLvlCd;

    /**
     * 할인승인여부
     */
    private String dcApproveYn;

    /**
     * 할인승인일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dcApproveDt;

    /**
     * 고객상태코드
     **/
    private  String        custCcd;

    /**
     * 고객코드
     **/
    private  String        custCd;
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
     * 납세번호
     **/
    private  String        taxPayNo;
    
    /**
     * 구매담당자명
     **/
    private  String        purcMngNm;
    
    /**
     * 신분증번호
     **/
    //SSN_CRN_NO
    private  String        ssnCrnNo;

    /**
     * 신분증유형
     **/
    //SSN_CRN_TP
    private  String        ssnCrnTp;

    /**
     * 우편번호
     **/
    //ZIP_CD
    private  String        zipCd;

    /**
     * 주소유형
     **/
    private  String        addrTp;
    
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
    private  String        drvCustCd;

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
     * 납세번호
     **/
    private  String        drvTaxPayNo;
    
    /**
     * 구매담당자명
     **/
    private  String        drvPurcMngNm;
    
    /**
     * 신분증번호
     **/
    //SSN_CRN_NO
    private  String        drvSsnCrnNo;

    /**
     * 신분증유형
     **/
    //SSN_CRN_TP
    private  String        drvSsnCrnTp;

    /**
     * 우편번호
     **/
    //ZIP_CD
    private  String        drvZipCd;

    /**
     * 주소유형
     **/
    private  String        drvAddrTp;
    
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
     * 차대번호
     **/
    //VIN_NO
    private  String     usrVinNo;

    /**
     * 치환금액
     **/
    //SBST_AMT
    private  Double     usrSbstAmt;

    /**
     * 중고차 매입번호
     */
    private  String     purcNo;
    private  String     beforPurcNo;
    
    /**
     * 중고차 Vin검색 저장 여부
     */
    private  String     usrVinNoSrYn;

    /**
     * 중고차 기업보조금 구분
     */
    private  String     sbusTp;

    /**
     * 중고차 기업보조금
     */
    private  double     subsidyAmt;
    
    /**
     * 우편번호
     **/
    //ZIP_CD
    private  String        consZipCd;

    /**
     * 성코드
     **/
    //SUNG_CD
    private  String        consSungCd;

    /**
     * 도시코드
     **/
    //CITY_CD

    private  String        consCityCd;

    /**
     * 지역코드
     **/
    //DIST_CD

    private  String        consDistCd;

    /**
     * 성명
     **/
    //SUNG_NM

    private  String        consSungNm;

    /**
     * 도시명
     **/
    //CITY_NM

    private  String        consCityNm;

    /**
     * 지역명
     **/
    //DIST_NM

    private  String        consDistNm;

    /**
     * 주소명
     **/
    //ADDR_NM

    private  String        consAddrNm;

    /**
     * 주소상세내용
     **/
    //ADDR_DETL_CONT

    private  String        consAddrDetlCont;

    /**
     * 탁송금액
     **/
    //CONS_AMT

    private  String        consConsAmt;

    /**
     * 전화번호
     **/
    //TEL_NO

    private  String        consTelNo;

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
    //PURC_TAX_PRE_AMT
    private  Double           purcTaxPreAmt;

    /**
     * 실제구입세금액
     **/
    //REAL_PURC_TAX_AMT
    private  Double           realPurcTaxAmt;
    
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
     * 총금액포함여부
     **/
    private  String       implyYn;

    /**
     * 재무수납포함여부
     **/
    private  String       finImplyYn;
    
    /**
     * 피보험인
     **/    
    private  String       incCustNm;
    
    /**
     * 피보험인 전화번호
     **/    
    private  String       incCustTelNo;
    
    /**
     * 연계인
     **/    
    private  String       incPconCustNm;
    
    /**
     * 연계인 전화번호
     **/    
    private  String       incPconCustTelNo;
    
    /**
     * 대출여부
     **/    
    private  String       fincYn;

    /**
     * 강제보험금액
     **/    
    private  double       frcIncAmt;
    
    /**
     * 상업보험금액
     **/    
    private  double       busIncAmt;

    /**
     * 차량운송세금
     */
    private  double       transIncTaxAmt;
    
    /**
     * 상품관리유형
     */
    private  double       fincBurdAmt;

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
     * 할부이자율
     */
    private  Double        instIntrRate;

    /**
     * 보증보험금액
     */
    private  Double        grteIncAmt;

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
    //FINC_LOAD_RATE
    private  Double        fincLoadRate;

    /**
     * 파트너유형
     **/
    private  String        partnerTp;

    /* 딜러프로모션 할인 레벨 체크 */
    private String prcNregYn;

    /**
     * 차대번호
     */
    private  String        vinNo;
    private  String        beforVinNo;

    /**
     * 차량소매금액
     */
    private  Double        carRetlAmt;


    /**
     * 중고차 - 차량 브랜드 
     */
    private  String        carBrandCd;
    private  String        carBrandNm;
    private  String        carNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cnclDt;

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
     * @return the contractTp
     */
    public String getContractTp() {
        return contractTp;
    }

    /**
     * @param contractTp the contractTp to set
     */
    public void setContractTp(String contractTp) {
        this.contractTp = contractTp;
    }

    /**
     * @return the contractTpNm
     */
    public String getContractTpNm() {
        return contractTpNm;
    }

    /**
     * @param contractTpNm the contractTpNm to set
     */
    public void setContractTpNm(String contractTpNm) {
        this.contractTpNm = contractTpNm;
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
     * @return the contractStatNm
     */
    public String getContractStatNm() {
        return contractStatNm;
    }

    /**
     * @param contractStatNm the contractStatNm to set
     */
    public void setContractStatNm(String contractStatNm) {
        this.contractStatNm = contractStatNm;
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
     * @return the saleEmpNm
     */
    public String getSaleEmpNm() {
        return saleEmpNm;
    }

    /**
     * @param saleEmpNm the saleEmpNm to set
     */
    public void setSaleEmpNm(String saleEmpNm) {
        this.saleEmpNm = saleEmpNm;
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
     * @return the salesMngNo
     */
    public String getSalesMngNo() {
        return salesMngNo;
    }

    /**
     * @param salesMngNo the salesMngNo to set
     */
    public void setSalesMngNo(String salesMngNo) {
        this.salesMngNo = salesMngNo;
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
     * @return the payTpNm
     */
    public String getPayTpNm() {
        return payTpNm;
    }

    /**
     * @param payTpNm the payTpNm to set
     */
    public void setPayTpNm(String payTpNm) {
        this.payTpNm = payTpNm;
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
     * @return the consTp
     */
    public String getConsTp() {
        return consTp;
    }

    /**
     * @param consTp the consTp to set
     */
    public void setConsTp(String consTp) {
        this.consTp = consTp;
    }

    /**
     * @return the whslAmt
     */
    public Double getWhslAmt() {
        return whslAmt;
    }

    /**
     * @param whslAmt the whslAmt to set
     */
    public void setWhslAmt(Double whslAmt) {
        this.whslAmt = whslAmt;
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
     * @return the promotionAmt
     */
    public Double getPromotionAmt() {
        return promotionAmt;
    }

    /**
     * @param promotionAmt the promotionAmt to set
     */
    public void setPromotionAmt(Double promotionAmt) {
        this.promotionAmt = promotionAmt;
    }

    /**
     * @return the corpPromotionAmt
     */
    public Double getCorpPromotionAmt() {
        return corpPromotionAmt;
    }

    /**
     * @param corpPromotionAmt the corpPromotionAmt to set
     */
    public void setCorpPromotionAmt(Double corpPromotionAmt) {
        this.corpPromotionAmt = corpPromotionAmt;
    }

    /**
     * @return the dlrPromotionAmt
     */
    public Double getDlrPromotionAmt() {
        return dlrPromotionAmt;
    }

    /**
     * @param dlrPromotionAmt the dlrPromotionAmt to set
     */
    public void setDlrPromotionAmt(Double dlrPromotionAmt) {
        this.dlrPromotionAmt = dlrPromotionAmt;
    }

    /**
     * @return the pointAmt
     */
    public Double getPointAmt() {
        return pointAmt;
    }

    /**
     * @param pointAmt the pointAmt to set
     */
    public void setPointAmt(Double pointAmt) {
        this.pointAmt = pointAmt;
    }

    /**
     * @return the blueMembershipPointVal
     */
    public Double getBlueMembershipPointVal() {
        return blueMembershipPointVal;
    }

    /**
     * @param blueMembershipPointVal the blueMembershipPointVal to set
     */
    public void setBlueMembershipPointVal(Double blueMembershipPointVal) {
        this.blueMembershipPointVal = blueMembershipPointVal;
    }

    /**
     * @return the bluePointApplyRate
     */
    public Double getBluePointApplyRate() {
        return bluePointApplyRate;
    }

    /**
     * @param bluePointApplyRate the bluePointApplyRate to set
     */
    public void setBluePointApplyRate(Double bluePointApplyRate) {
        this.bluePointApplyRate = bluePointApplyRate;
    }

    /**
     * @return the sbstAmt
     */
    public Double getSbstAmt() {
        return sbstAmt;
    }

    /**
     * @param sbstAmt the sbstAmt to set
     */
    public void setSbstAmt(Double sbstAmt) {
        this.sbstAmt = sbstAmt;
    }

    /**
     * @return the goodsAmt
     */
    public Double getGoodsAmt() {
        return goodsAmt;
    }

    /**
     * @param goodsAmt the goodsAmt to set
     */
    public void setGoodsAmt(Double goodsAmt) {
        this.goodsAmt = goodsAmt;
    }

    /**
     * @return the consAmt
     */
    public Double getConsAmt() {
        return consAmt;
    }

    /**
     * @param consAmt the consAmt to set
     */
    public void setConsAmt(Double consAmt) {
        this.consAmt = consAmt;
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
     * @return the reservContAmt
     */
    public Double getReservContAmt() {
        return reservContAmt;
    }

    /**
     * @param reservContAmt the reservContAmt to set
     */
    public void setReservContAmt(Double reservContAmt) {
        this.reservContAmt = reservContAmt;
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
     * @return the uatcCarPurcYn
     */
    public String getUatcCarPurcYn() {
        return uatcCarPurcYn;
    }

    /**
     * @param uatcCarPurcYn the uatcCarPurcYn to set
     */
    public void setUatcCarPurcYn(String uatcCarPurcYn) {
        this.uatcCarPurcYn = uatcCarPurcYn;
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
     * @return the dstbChnCd
     */
    public String getDstbChnCd() {
        return dstbChnCd;
    }

    /**
     * @param dstbChnCd the dstbChnCd to set
     */
    public void setDstbChnCd(String dstbChnCd) {
        this.dstbChnCd = dstbChnCd;
    }

    /**
     * @return the retlTp
     */
    public String getRetlTp() {
        return retlTp;
    }

    /**
     * @param retlTp the retlTp to set
     */
    public void setRetlTp(String retlTp) {
        this.retlTp = retlTp;
    }

    /**
     * @return the cancDt
     */
    public Date getCancDt() {
        return cancDt;
    }

    /**
     * @param cancDt the cancDt to set
     */
    public void setCancDt(Date cancDt) {
        this.cancDt = cancDt;
    }

    /**
     * @return the cancReasonCd
     */
    public String getCancReasonCd() {
        return cancReasonCd;
    }

    /**
     * @param cancReasonCd the cancReasonCd to set
     */
    public void setCancReasonCd(String cancReasonCd) {
        this.cancReasonCd = cancReasonCd;
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
     * @return the remark1
     */
    public String getRemark1() {
        return remark1;
    }

    /**
     * @param remark1 the remark1 to set
     */
    public void setRemark1(String remark1) {
        this.remark1 = remark1;
    }

    /**
     * @return the lv2DlrOrdCd
     */
    public String getLv2DlrOrdCd() {
        return lv2DlrOrdCd;
    }

    /**
     * @param lv2DlrOrdCd the lv2DlrOrdCd to set
     */
    public void setLv2DlrOrdCd(String lv2DlrOrdCd) {
        this.lv2DlrOrdCd = lv2DlrOrdCd;
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
     * @return the saleOpptNo
     */
    public String getSaleOpptNo() {
        return saleOpptNo;
    }

    /**
     * @param saleOpptNo the saleOpptNo to set
     */
    public void setSaleOpptNo(String saleOpptNo) {
        this.saleOpptNo = saleOpptNo;
    }

    /**
     * @return the saleOpptSeq
     */
    public String getSaleOpptSeq() {
        return saleOpptSeq;
    }

    /**
     * @param saleOpptSeq the saleOpptSeq to set
     */
    public void setSaleOpptSeq(String saleOpptSeq) {
        this.saleOpptSeq = saleOpptSeq;
    }

    /**
     * @return the introDlrCd
     */
    public String getIntroDlrCd() {
        return introDlrCd;
    }

    /**
     * @param introDlrCd the introDlrCd to set
     */
    public void setIntroDlrCd(String introDlrCd) {
        this.introDlrCd = introDlrCd;
    }

    /**
     * @return the goodsContractNo
     */
    public String getGoodsContractNo() {
        return goodsContractNo;
    }

    /**
     * @param goodsContractNo the goodsContractNo to set
     */
    public void setGoodsContractNo(String goodsContractNo) {
        this.goodsContractNo = goodsContractNo;
    }

    /**
     * @return the grpContractNo
     */
    public String getGrpContractNo() {
        return grpContractNo;
    }

    /**
     * @param grpContractNo the grpContractNo to set
     */
    public void setGrpContractNo(String grpContractNo) {
        this.grpContractNo = grpContractNo;
    }

    /**
     * @return the estimateNo
     */
    public String getEstimateNo() {
        return estimateNo;
    }

    /**
     * @param estimateNo the estimateNo to set
     */
    public void setEstimateNo(String estimateNo) {
        this.estimateNo = estimateNo;
    }

    /**
     * @return the beforeNo
     */
    public String getBeforeNo() {
        return beforeNo;
    }

    /**
     * @param beforeNo the beforeNo to set
     */
    public void setBeforeNo(String beforeNo) {
        this.beforeNo = beforeNo;
    }

    /**
     * @return the beBeforeNo
     */
    public String getBeBeforeNo() {
        return beBeforeNo;
    }

    /**
     * @param beBeforeNo the beBeforeNo to set
     */
    public void setBeBeforeNo(String beBeforeNo) {
        this.beBeforeNo = beBeforeNo;
    }
    
    /**
     * @return the beforeImplyYn
     */
    public String getBeforeImplyYn() {
        return beforeImplyYn;
    }

    /**
     * @param beforeImplyYn the beforeImplyYn to set
     */
    public void setBeforeImplyYn(String beforeImplyYn) {
        this.beforeImplyYn = beforeImplyYn;
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
     * @return the dcLvlCd
     */
    public String getDcLvlCd() {
        return dcLvlCd;
    }

    /**
     * @param dcLvlCd the dcLvlCd to set
     */
    public void setDcLvlCd(String dcLvlCd) {
        this.dcLvlCd = dcLvlCd;
    }

    /**
     * @return the dcApproveYn
     */
    public String getDcApproveYn() {
        return dcApproveYn;
    }

    /**
     * @param dcApproveYn the dcApproveYn to set
     */
    public void setDcApproveYn(String dcApproveYn) {
        this.dcApproveYn = dcApproveYn;
    }

    /**
     * @return the dcApproveDt
     */
    public Date getDcApproveDt() {
        return dcApproveDt;
    }

    /**
     * @param dcApproveDt the dcApproveDt to set
     */
    public void setDcApproveDt(Date dcApproveDt) {
        this.dcApproveDt = dcApproveDt;
    }

    /**
     * @return the custCcd
     */
    public String getCustCcd() {
        return custCcd;
    }

    /**
     * @param custCcd the custCcd to set
     */
    public void setCustCcd(String custCcd) {
        this.custCcd = custCcd;
    }

    /**
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
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
     * @return the taxPayNo
     */
    public String getTaxPayNo() {
        return taxPayNo;
    }

    /**
     * @param taxPayNo the taxPayNo to set
     */
    public void setTaxPayNo(String taxPayNo) {
        this.taxPayNo = taxPayNo;
    }

    /**
     * @return the purcMngNm
     */
    public String getPurcMngNm() {
        return purcMngNm;
    }

    /**
     * @param purcMngNm the purcMngNm to set
     */
    public void setPurcMngNm(String purcMngNm) {
        this.purcMngNm = purcMngNm;
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
     * @return the ssnCrnTp
     */
    public String getSsnCrnTp() {
        return ssnCrnTp;
    }

    /**
     * @param ssnCrnTp the ssnCrnTp to set
     */
    public void setSsnCrnTp(String ssnCrnTp) {
        this.ssnCrnTp = ssnCrnTp;
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
     * @return the addrTp
     */
    public String getAddrTp() {
        return addrTp;
    }

    /**
     * @param addrTp the addrTp to set
     */
    public void setAddrTp(String addrTp) {
        this.addrTp = addrTp;
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
     * @return the drvCustCd
     */
    public String getDrvCustCd() {
        return drvCustCd;
    }

    /**
     * @param drvCustCd the drvCustCd to set
     */
    public void setDrvCustCd(String drvCustCd) {
        this.drvCustCd = drvCustCd;
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
     * @return the drvTaxPayNo
     */
    public String getDrvTaxPayNo() {
        return drvTaxPayNo;
    }

    /**
     * @param drvTaxPayNo the drvTaxPayNo to set
     */
    public void setDrvTaxPayNo(String drvTaxPayNo) {
        this.drvTaxPayNo = drvTaxPayNo;
    }

    /**
     * @return the drvPurcMngNm
     */
    public String getDrvPurcMngNm() {
        return drvPurcMngNm;
    }

    /**
     * @param drvPurcMngNm the drvPurcMngNm to set
     */
    public void setDrvPurcMngNm(String drvPurcMngNm) {
        this.drvPurcMngNm = drvPurcMngNm;
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
     * @return the drvSsnCrnTp
     */
    public String getDrvSsnCrnTp() {
        return drvSsnCrnTp;
    }

    /**
     * @param drvSsnCrnTp the drvSsnCrnTp to set
     */
    public void setDrvSsnCrnTp(String drvSsnCrnTp) {
        this.drvSsnCrnTp = drvSsnCrnTp;
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
     * @return the drvAddrTp
     */
    public String getDrvAddrTp() {
        return drvAddrTp;
    }

    /**
     * @param drvAddrTp the drvAddrTp to set
     */
    public void setDrvAddrTp(String drvAddrTp) {
        this.drvAddrTp = drvAddrTp;
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
     * @return the usrVinNo
     */
    public String getUsrVinNo() {
        return usrVinNo;
    }

    /**
     * @param usrVinNo the usrVinNo to set
     */
    public void setUsrVinNo(String usrVinNo) {
        this.usrVinNo = usrVinNo;
    }

    /**
     * @return the usrSbstAmt
     */
    public Double getUsrSbstAmt() {
        return usrSbstAmt;
    }

    /**
     * @param usrSbstAmt the usrSbstAmt to set
     */
    public void setUsrSbstAmt(Double usrSbstAmt) {
        this.usrSbstAmt = usrSbstAmt;
    }

    /**
     * @return the purcNo
     */
    public String getPurcNo() {
        return purcNo;
    }

    /**
     * @param purcNo the purcNo to set
     */
    public void setPurcNo(String purcNo) {
        this.purcNo = purcNo;
    }

    /**
     * @return the beforPurcNo
     */
    public String getBeforPurcNo() {
        return beforPurcNo;
    }

    /**
     * @param beforPurcNo the beforPurcNo to set
     */
    public void setBeforPurcNo(String beforPurcNo) {
        this.beforPurcNo = beforPurcNo;
    }

    /**
     * @return the usrVinNoSrYn
     */
    public String getUsrVinNoSrYn() {
        return usrVinNoSrYn;
    }

    /**
     * @param usrVinNoSrYn the usrVinNoSrYn to set
     */
    public void setUsrVinNoSrYn(String usrVinNoSrYn) {
        this.usrVinNoSrYn = usrVinNoSrYn;
    }

    /**
     * @return the sbusTp
     */
    public String getSbusTp() {
        return sbusTp;
    }

    /**
     * @param sbusTp the sbusTp to set
     */
    public void setSbusTp(String sbusTp) {
        this.sbusTp = sbusTp;
    }

    /**
     * @return the subsidyAmt
     */
    public double getSubsidyAmt() {
        return subsidyAmt;
    }

    /**
     * @param subsidyAmt the subsidyAmt to set
     */
    public void setSubsidyAmt(double subsidyAmt) {
        this.subsidyAmt = subsidyAmt;
    }

    /**
     * @return the consZipCd
     */
    public String getConsZipCd() {
        return consZipCd;
    }

    /**
     * @param consZipCd the consZipCd to set
     */
    public void setConsZipCd(String consZipCd) {
        this.consZipCd = consZipCd;
    }

    /**
     * @return the consSungCd
     */
    public String getConsSungCd() {
        return consSungCd;
    }

    /**
     * @param consSungCd the consSungCd to set
     */
    public void setConsSungCd(String consSungCd) {
        this.consSungCd = consSungCd;
    }

    /**
     * @return the consCityCd
     */
    public String getConsCityCd() {
        return consCityCd;
    }

    /**
     * @param consCityCd the consCityCd to set
     */
    public void setConsCityCd(String consCityCd) {
        this.consCityCd = consCityCd;
    }

    /**
     * @return the consDistCd
     */
    public String getConsDistCd() {
        return consDistCd;
    }

    /**
     * @param consDistCd the consDistCd to set
     */
    public void setConsDistCd(String consDistCd) {
        this.consDistCd = consDistCd;
    }

    /**
     * @return the consSungNm
     */
    public String getConsSungNm() {
        return consSungNm;
    }

    /**
     * @param consSungNm the consSungNm to set
     */
    public void setConsSungNm(String consSungNm) {
        this.consSungNm = consSungNm;
    }

    /**
     * @return the consCityNm
     */
    public String getConsCityNm() {
        return consCityNm;
    }

    /**
     * @param consCityNm the consCityNm to set
     */
    public void setConsCityNm(String consCityNm) {
        this.consCityNm = consCityNm;
    }

    /**
     * @return the consDistNm
     */
    public String getConsDistNm() {
        return consDistNm;
    }

    /**
     * @param consDistNm the consDistNm to set
     */
    public void setConsDistNm(String consDistNm) {
        this.consDistNm = consDistNm;
    }

    /**
     * @return the consAddrNm
     */
    public String getConsAddrNm() {
        return consAddrNm;
    }

    /**
     * @param consAddrNm the consAddrNm to set
     */
    public void setConsAddrNm(String consAddrNm) {
        this.consAddrNm = consAddrNm;
    }

    /**
     * @return the consAddrDetlCont
     */
    public String getConsAddrDetlCont() {
        return consAddrDetlCont;
    }

    /**
     * @param consAddrDetlCont the consAddrDetlCont to set
     */
    public void setConsAddrDetlCont(String consAddrDetlCont) {
        this.consAddrDetlCont = consAddrDetlCont;
    }

    /**
     * @return the consConsAmt
     */
    public String getConsConsAmt() {
        return consConsAmt;
    }

    /**
     * @param consConsAmt the consConsAmt to set
     */
    public void setConsConsAmt(String consConsAmt) {
        this.consConsAmt = consConsAmt;
    }

    /**
     * @return the consTelNo
     */
    public String getConsTelNo() {
        return consTelNo;
    }

    /**
     * @param consTelNo the consTelNo to set
     */
    public void setConsTelNo(String consTelNo) {
        this.consTelNo = consTelNo;
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
     * @return the purcTaxPreAmt
     */
    public Double getPurcTaxPreAmt() {
        return purcTaxPreAmt;
    }

    /**
     * @param purcTaxPreAmt the purcTaxPreAmt to set
     */
    public void setPurcTaxPreAmt(Double purcTaxPreAmt) {
        this.purcTaxPreAmt = purcTaxPreAmt;
    }

    /**
     * @return the realPurcTaxAmt
     */
    public Double getRealPurcTaxAmt() {
        return realPurcTaxAmt;
    }

    /**
     * @param realPurcTaxAmt the realPurcTaxAmt to set
     */
    public void setRealPurcTaxAmt(Double realPurcTaxAmt) {
        this.realPurcTaxAmt = realPurcTaxAmt;
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
     * @return the implyYn
     */
    public String getImplyYn() {
        return implyYn;
    }

    /**
     * @param implyYn the implyYn to set
     */
    public void setImplyYn(String implyYn) {
        this.implyYn = implyYn;
    }

    /**
     * @return the finImplyYn
     */
    public String getFinImplyYn() {
        return finImplyYn;
    }

    /**
     * @param finImplyYn the finImplyYn to set
     */
    public void setFinImplyYn(String finImplyYn) {
        this.finImplyYn = finImplyYn;
    }

    /**
     * @return the incCustNm
     */
    public String getIncCustNm() {
        return incCustNm;
    }

    /**
     * @param incCustNm the incCustNm to set
     */
    public void setIncCustNm(String incCustNm) {
        this.incCustNm = incCustNm;
    }

    /**
     * @return the incCustTelNo
     */
    public String getIncCustTelNo() {
        return incCustTelNo;
    }

    /**
     * @param incCustTelNo the incCustTelNo to set
     */
    public void setIncCustTelNo(String incCustTelNo) {
        this.incCustTelNo = incCustTelNo;
    }

    /**
     * @return the incPconCustNm
     */
    public String getIncPconCustNm() {
        return incPconCustNm;
    }

    /**
     * @param incPconCustNm the incPconCustNm to set
     */
    public void setIncPconCustNm(String incPconCustNm) {
        this.incPconCustNm = incPconCustNm;
    }

    /**
     * @return the incPconCustTelNo
     */
    public String getIncPconCustTelNo() {
        return incPconCustTelNo;
    }

    /**
     * @param incPconCustTelNo the incPconCustTelNo to set
     */
    public void setIncPconCustTelNo(String incPconCustTelNo) {
        this.incPconCustTelNo = incPconCustTelNo;
    }

    /**
     * @return the fincYn
     */
    public String getFincYn() {
        return fincYn;
    }

    /**
     * @param fincYn the fincYn to set
     */
    public void setFincYn(String fincYn) {
        this.fincYn = fincYn;
    }

    /**
     * @return the frcIncAmt
     */
    public double getFrcIncAmt() {
        return frcIncAmt;
    }

    /**
     * @param frcIncAmt the frcIncAmt to set
     */
    public void setFrcIncAmt(double frcIncAmt) {
        this.frcIncAmt = frcIncAmt;
    }

    /**
     * @return the busIncAmt
     */
    public double getBusIncAmt() {
        return busIncAmt;
    }

    /**
     * @param busIncAmt the busIncAmt to set
     */
    public void setBusIncAmt(double busIncAmt) {
        this.busIncAmt = busIncAmt;
    }

    /**
     * @return the transIncTaxAmt
     */
    public double getTransIncTaxAmt() {
        return transIncTaxAmt;
    }

    /**
     * @param transIncTaxAmt the transIncTaxAmt to set
     */
    public void setTransIncTaxAmt(double transIncTaxAmt) {
        this.transIncTaxAmt = transIncTaxAmt;
    }

    /**
     * @return the fincBurdAmt
     */
    public double getFincBurdAmt() {
        return fincBurdAmt;
    }

    /**
     * @param fincBurdAmt the fincBurdAmt to set
     */
    public void setFincBurdAmt(double fincBurdAmt) {
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
     * @return the fincLoadRate
     */
    public Double getFincLoadRate() {
        return fincLoadRate;
    }

    /**
     * @param fincLoadRate the fincLoadRate to set
     */
    public void setFincLoadRate(Double fincLoadRate) {
        this.fincLoadRate = fincLoadRate;
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

    /**
     * @return the prcNregYn
     */
    public String getPrcNregYn() {
        return prcNregYn;
    }

    /**
     * @param prcNregYn the prcNregYn to set
     */
    public void setPrcNregYn(String prcNregYn) {
        this.prcNregYn = prcNregYn;
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
     * @return the beforVinNo
     */
    public String getBeforVinNo() {
        return beforVinNo;
    }

    /**
     * @param beforVinNo the beforVinNo to set
     */
    public void setBeforVinNo(String beforVinNo) {
        this.beforVinNo = beforVinNo;
    }

    /**
     * @return the carRetlAmt
     */
    public Double getCarRetlAmt() {
        return carRetlAmt;
    }

    /**
     * @param carRetlAmt the carRetlAmt to set
     */
    public void setCarRetlAmt(Double carRetlAmt) {
        this.carRetlAmt = carRetlAmt;
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
     * @return the carBrandNm
     */
    public String getCarBrandNm() {
        return carBrandNm;
    }

    /**
     * @param carBrandNm the carBrandNm to set
     */
    public void setCarBrandNm(String carBrandNm) {
        this.carBrandNm = carBrandNm;
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
     * @return the cnclDt
     */
    public Date getCnclDt() {
        return cnclDt;
    }

    /**
     * @param cnclDt the cnclDt to set
     */
    public void setCnclDt(Date cnclDt) {
        this.cnclDt = cnclDt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}