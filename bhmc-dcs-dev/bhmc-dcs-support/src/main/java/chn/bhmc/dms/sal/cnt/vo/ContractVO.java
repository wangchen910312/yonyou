package chn.bhmc.dms.sal.cnt.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

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
 * @ClassName   : ContractSearchVO
 * @Description : 계약정보 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 2. 04.    Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"                 , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="contractNo"            , mesgKey="sal.lbl.contractNo")
   ,@ValidField(field="contractTp"            , mesgKey="sal.lbl.contractTp")
   ,@ValidField(field="contractStatCd"        , mesgKey="sal.lbl.contractStatCd")
   ,@ValidField(field="contractDt"            , mesgKey="sal.lbl.contractDt")
   ,@ValidField(field="saleEmpNo"             , mesgKey="sal.lbl.saleEmpNo")
   ,@ValidField(field="contractCustNo"        , mesgKey="sal.lbl.contractCustNo")
   ,@ValidField(field="realDriverCustNo"      , mesgKey="sal.lbl.realDriverCustNo")
   ,@ValidField(field="realDriverSameYn"      , mesgKey="sal.lbl.realDriverSameYn")
   ,@ValidField(field="introDlrCd"            , mesgKey="sal.lbl.introDlrCd")
   ,@ValidField(field="carlineCd"             , mesgKey="sal.lbl.carlineCd")
   ,@ValidField(field="carlineNm"             , mesgKey="sal.lbl.carlineNm")
   ,@ValidField(field="modelCd"               , mesgKey="sal.lbl.modelCd")
   ,@ValidField(field="modelNm"               , mesgKey="sal.lbl.modelNm")
   ,@ValidField(field="ocnCd"                 , mesgKey="sal.lbl.ocnCd")
   ,@ValidField(field="extColorCd"            , mesgKey="sal.lbl.extColorCd")
   ,@ValidField(field="extColorNm"            , mesgKey="sal.lbl.extColorNm")
   ,@ValidField(field="intColorCd"            , mesgKey="sal.lbl.intColorCd")
   ,@ValidField(field="intColorNm"            , mesgKey="sal.lbl.intColorNm")
   ,@ValidField(field="consTp"                , mesgKey="sal.lbl.consTp")
   ,@ValidField(field="consZipCd"             , mesgKey="sal.lbl.consZipCd")
   ,@ValidField(field="consAddr1"             , mesgKey="sal.lbl.consAddr1")
   ,@ValidField(field="consAddr2"             , mesgKey="sal.lbl.consAddr2")
   ,@ValidField(field="consAmt"               , mesgKey="sal.lbl.consAmt")
   ,@ValidField(field="taxTp"                 , mesgKey="sal.lbl.taxTp")
   ,@ValidField(field="totAmt"                , mesgKey="sal.lbl.totAmt")
   ,@ValidField(field="carAmt"                , mesgKey="sal.lbl.carAmt")
   ,@ValidField(field="dcAmt"                 , mesgKey="sal.lbl.dcAmt")
   ,@ValidField(field="goodsTotAmt"           , mesgKey="sal.lbl.goodsTotAmt")
   ,@ValidField(field="vattaxAmt"             , mesgKey="sal.lbl.vattaxAmt")
   ,@ValidField(field="otherTaxAmt"           , mesgKey="sal.lbl.otherTaxAmt")
   ,@ValidField(field="otherAmt"              , mesgKey="sal.lbl.otherAmt")
   ,@ValidField(field="goodsNm"               , mesgKey="sal.lbl.goodsNm")
   ,@ValidField(field="goodsAmt"              , mesgKey="sal.lbl.goodsAmt")
   ,@ValidField(field="optionAmt"             , mesgKey="sal.lbl.optionAmt")
   ,@ValidField(field="contractAmtPayTp"      , mesgKey="sal.lbl.contractAmtPayTp")
   ,@ValidField(field="contractPdpstNm"       , mesgKey="sal.lbl.contractPdpstNm")
   ,@ValidField(field="contractRcptNo"        , mesgKey="sal.lbl.contractRcptNo")
   ,@ValidField(field="contractAmt"           , mesgKey="sal.lbl.contractAmt")
   ,@ValidField(field="dlAmtPayTp"            , mesgKey="sal.lbl.dlAmtPayTp")
   ,@ValidField(field="dlAmt"                 , mesgKey="sal.lbl.dlAmt")
   ,@ValidField(field="regTp"                 , mesgKey="sal.lbl.regTp")
   ,@ValidField(field="regDistCd"             , mesgKey="sal.lbl.regDistCd")
   ,@ValidField(field="regNameNm"             , mesgKey="sal.lbl.regNameNm")
   ,@ValidField(field="regSbodtAmt"           , mesgKey="sal.lbl.regSbodtAmt")
   ,@ValidField(field="incAapCd"              , mesgKey="sal.lbl.incAapCd")
   ,@ValidField(field="incCmpCd"              , mesgKey="sal.lbl.incCmpCd")
   ,@ValidField(field="incJoinDt"             , mesgKey="sal.lbl.incJoinDt")
   ,@ValidField(field="incAmt"                , mesgKey="sal.lbl.incAmt")
   ,@ValidField(field="fincReqYn"             , mesgKey="sal.lbl.fincReqYn")
   ,@ValidField(field="fincCmpCd"             , mesgKey="sal.lbl.fincCmpCd")
   ,@ValidField(field="fincItemCd"            , mesgKey="sal.lbl.fincItemCd")
   ,@ValidField(field="fincReqDt"             , mesgKey="sal.lbl.fincReqDt")
   ,@ValidField(field="fincReqAmt"            , mesgKey="sal.lbl.fincReqAmt")
   ,@ValidField(field="fincEndDt"             , mesgKey="sal.lbl.fincEndDt")
   ,@ValidField(field="estimateNo"            , mesgKey="sal.lbl.estimateNo")
   ,@ValidField(field="uatcCarPurcYn"         , mesgKey="sal.lbl.uatcCarPurcYn")
   ,@ValidField(field="contractApproveReqDt"  , mesgKey="sal.lbl.contractApproveReqDt")
   ,@ValidField(field="contractApproveDt"     , mesgKey="sal.lbl.contractApproveDt")
   ,@ValidField(field="allocQueNo"            , mesgKey="sal.lbl.allocQueNo")
   ,@ValidField(field="allocDt"               , mesgKey="sal.lbl.allocDt")
   ,@ValidField(field="giReqDt"               , mesgKey="sal.lbl.giReqDt")
   ,@ValidField(field="giDt"                  , mesgKey="sal.lbl.giDt")
   ,@ValidField(field="dlReqDt"               , mesgKey="sal.lbl.dlReqDt")
   ,@ValidField(field="dlScheDt"              , mesgKey="sal.lbl.dlScheDt")
   ,@ValidField(field="realDlDt"              , mesgKey="sal.lbl.realDlDt")
   ,@ValidField(field="tovrNm"                , mesgKey="sal.lbl.tovrNm")
   ,@ValidField(field="tovrRelCd"             , mesgKey="sal.lbl.tovrRelCd")
   ,@ValidField(field="cancReqDt"             , mesgKey="sal.lbl.cancReqDt")
   ,@ValidField(field="cancDt"                , mesgKey="sal.lbl.cancDt")
   ,@ValidField(field="cancReasonCd"          , mesgKey="sal.lbl.cancReasonCd")
   ,@ValidField(field="retlTp"                , mesgKey="sal.lbl.retlTp")
   ,@ValidField(field="fileDocId"             , mesgKey="sal.lbl.fileDocId")
   ,@ValidField(field="remark"                , mesgKey="sal.lbl.remark")
   ,@ValidField(field="regUsrId"              , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"                 , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"             , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"                , mesgKey="sal.lbl.updtDt")
   ,@ValidField(field="custCd"                , mesgKey="sal.lbl.custCd")
   ,@ValidField(field="custTp"                , mesgKey="sal.lbl.custTp")
   ,@ValidField(field="custNm"                , mesgKey="sal.lbl.custNm")
   ,@ValidField(field="telNo1"                , mesgKey="sal.lbl.telNo1")
   ,@ValidField(field="telNo2"                , mesgKey="sal.lbl.telNo2")
   ,@ValidField(field="emailNm"               , mesgKey="sal.lbl.emailNm")
   ,@ValidField(field="crnNo"                 , mesgKey="sal.lbl.crnNo")
   ,@ValidField(field="zipCd"                 , mesgKey="sal.lbl.zipCd")
   ,@ValidField(field="addr1"                 , mesgKey="sal.lbl.addr1")
   ,@ValidField(field="addr2"                 , mesgKey="sal.lbl.addr2")
   ,@ValidField(field="drvCustCd"             , mesgKey="sal.lbl.drvCustCd")
   ,@ValidField(field="drvCustTp"             , mesgKey="sal.lbl.drvCustTp")
   ,@ValidField(field="drvCustNm"             , mesgKey="sal.lbl.drvCustNm")
   ,@ValidField(field="drvTelNo1"             , mesgKey="sal.lbl.drvTelNo1")
   ,@ValidField(field="drvTelNo2"             , mesgKey="sal.lbl.drvTelNo2")
   ,@ValidField(field="drvEmailNm"            , mesgKey="sal.lbl.drvEmailNm")
   ,@ValidField(field="drvCrnNo"              , mesgKey="sal.lbl.drvCrnNo")
   ,@ValidField(field="drvZipCd"              , mesgKey="sal.lbl.drvZipCd")
   ,@ValidField(field="drvAddr1"              , mesgKey="sal.lbl.drvAddr1")
   ,@ValidField(field="drvAddr2"              , mesgKey="sal.lbl.drvAddr2")
   ,@ValidField(field="corpCarDstinCd"        , mesgKey="sal.lbl.corpCarDstinCd")
   ,@ValidField(field="brandCd"               , mesgKey="sal.lbl.brandCd")
   ,@ValidField(field="useOthersModelNm"      , mesgKey="sal.lbl.useOthersModelNm")
   ,@ValidField(field="useCarlineCd"          , mesgKey="sal.lbl.useCarlineCd")
   ,@ValidField(field="useCarlineNm"          , mesgKey="sal.lbl.useCarlineNm")
   ,@ValidField(field="useModelCd"            , mesgKey="sal.lbl.useModelCd")
   ,@ValidField(field="useModelNm"            , mesgKey="sal.lbl.useModelNm")
   ,@ValidField(field="useOcnCd"              , mesgKey="sal.lbl.useOcnCd")
   ,@ValidField(field="useOcnNm"              , mesgKey="sal.lbl.useOcnNm")
   ,@ValidField(field="useExtColorCd"         , mesgKey="sal.lbl.useExtColorCd")
   ,@ValidField(field="useExtColorNm"         , mesgKey="sal.lbl.useExtColorNm")
   ,@ValidField(field="useIntColorCd"         , mesgKey="sal.lbl.useIntColorCd")
   ,@ValidField(field="useIntColorNm"         , mesgKey="sal.lbl.useIntColorNm")

   ,@ValidField(field="carRunDistVal"         , mesgKey="sal.lbl.carRunDistVal")
   ,@ValidField(field="carNo"                 , mesgKey="sal.lbl.carNo")
   ,@ValidField(field="vinNo"                 , mesgKey="sal.lbl.vinNo")
   ,@ValidField(field="carDrvMthCd"           , mesgKey="sal.lbl.carDrvMthCd")
   ,@ValidField(field="fuelCd"                , mesgKey="sal.lbl.fuelCd")
   ,@ValidField(field="pcDstinCd"             , mesgKey="sal.lbl.pcDstinCd")
   ,@ValidField(field="carLmtVal"             , mesgKey="sal.lbl.carLmtVal")
   ,@ValidField(field="carYyCd"               , mesgKey="sal.lbl.carYyCd")
   ,@ValidField(field="carDispQty"            , mesgKey="sal.lbl.carDispQty")
   ,@ValidField(field="carRegDt"              , mesgKey="sal.lbl.carRegDt")
   ,@ValidField(field="evalScheDt"            , mesgKey="sal.lbl.evalScheDt")
   })
public class ContractVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8490824621471215220L;

    /**
     * 딜러코드
     **/
    private  String                 dlrCd;

    /**
     * 계약번호
     **/
    private  String                 contractNo;

    /**
     * 2급딜러조직코드
     **/
    private  String                 lv2DlrOrdCd;
    private  String                 lv2DlrOrdNm;

    /**
     * 2급딜러여부
     **/
    private  String                 lv2DlrYn;

    /**
     * 판매기회번호
     **/
    private  String                 saleOpptNo;

    /**
     * 용품계약번호
     **/
    private  String                 goodsContractNo;

    /**
     * 계약유형
     **/
    @NotEmpty
    private  String                 contractTp;

    /**
     * 계약상태코드
     **/
    @NotEmpty
    private  String                 contractStatCd;

    /**
     * 계약일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   contractDt;

    /**
     * 판매사원번호
     **/
    @NotEmpty
    private  String                 saleEmpNo;

    /**
     * 계약고객번호
     **/
    private  String                 contractCustNo;

    /**
     * 실제운전자고객번호
     **/
    @NotEmpty
    private  String                 realDriverCustNo;

    /**
     * 실제운전자동일여부
     **/
    @NotEmpty
    private  String                 realDriverSameYn;

    /**
     * 소개딜러코드
     **/
    //INTRO_DLR_CD
    private  String                 introDlrCd;

    /**
     * 차종코드
     **/
    @NotEmpty
    private  String                 carlineCd;

    /**
     * 차종명
     **/
    private  String                 carlineNm;

    /**
     * 모델코드
     **/
    @NotEmpty
    private  String                 modelCd;

    /**
     * 모델명
     **/
    private  String                 modelNm;

    /**
     * OCN코드
     **/
    @NotEmpty
    private  String                 ocnCd;

    /**
     * OCN명
     **/
    private  String                 ocnNm;

    /**
     * 외장색상코드
     **/
    @NotEmpty
    private  String                 extColorCd;

    /**
     * 외장색
     **/
    private  String                 extColorNm;

    /**
     * 내장색상코드
     **/
    @NotEmpty
    private  String                 intColorCd;

    /**
     * 내장색명
     **/
    private  String                 intColorNm;

    /**
     * 탁송유형
     **/
    @NotEmpty
    private  String                 consTp;

    /**
     * 탁송우편번호
     **/
    //CONS_ZIP_CD
    private  String                 consZipCd;

    /**
     * 탁송주소1
     **/
    //CONS_ADDR1
    private  String                 consAddr1;

    /**
     * 탁송주소2
     **/
    //CONS_ADDR2
    private  String                 consAddr2;

    /**
     * 탁송금액
     **/
    //CONS_AMT
    private  Double                 consAmt;

    /**
     * 과세유형
     **/
    @NotEmpty
    private  String                 taxTp;

    /**
     * 총금액
     **/
    private  Double                 totAmt;

    /**
     * 차량금액
     **/
    private  Double                 carAmt;

    /**
     * 할인금액
     **/
    //DC_AMT
    private  Double                 dcAmt;

    /**
     * 용품총금액
     **/
    //GOODS_TOT_AMT
    private  Double                 goodsTotAmt;

    /**
     * 증치세금액
     **/
    //VATTAX_AMT
    private  Double                 vattaxAmt;

    /**
     * 기타세금액
     **/
    //OTHER_TAX_AMT
    private  Double                 otherTaxAmt;

    /**
     * 기타금액
     **/
    //OTHER_AMT
    private  Double                 otherAmt;

    /**
     * 용품명
     **/
    //GOODS_NM
    private  String                 goodsNm;

    /**
     * 용품금액
     **/
    //GOODS_AMT
    private  Double                 goodsAmt;

    /**
     * 옵션금액
     **/
    //OPTION_AMT
    private  Double                 optionAmt;

    /**
     * 계약금지불유형
     **/
    //CONTRACT_AMT_PAY_TP
    private  String                 contractAmtPayTp;

    /**
     * 계약입금자명
     **/
    //CONTRACT_PDPST_NM
    private  String                 contractPdpstNm;

    /**
     * 계약영수증번호
     **/
    //CONTRACT_RCPT_NO
    private  String                 contractRcptNo;

    /**
     * 계약금액
     **/
    //CONTRACT_AMT
    private  Double                 contractAmt;

    /**
     * 인도금지불유형
     **/
    //DL_AMT_PAY_TP
    private  String                 dlAmtPayTp;

    /**
     * 인도금액
     **/
    //DL_AMT
    private  Double                 dlAmt;

    /**
     * 등록유형
     **/
    //REG_TP
    private  String                 regTp;

    /**
     * 등록지역코드
     **/
    //REG_DIST_CD
    private  String                 regDistCd;

    /**
     * 등록명의자명
     **/
    //REG_NAME_NM
    private  String                 regNameNm;

    /**
     * 등록부대금액
     **/
    //REG_SBODT_AMT
    private  Double                 regSbodtAmt;

    /**
     * 보험대행여부
     **/
    //INC_AAP_YN
    private  String                 incAapCd;

    /**
     * 보험회사코드
     **/
    //INC_CMP_CD
    private  String                 incCmpCd;

    /**
     * 보험가입일자
     **/
    //INC_JOIN_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   incJoinDt;

    /**
     * 보험금액
     **/
    //INC_AMT
    private  Double                 incAmt;

    /**
     * 금융요청여부
     **/
    @NotEmpty
    private  String                 fincReqYn;

    /**
     * 금융회사코드
     **/
    //FINC_CMP_CD
    private  String                 fincCmpCd;

    /**
     * 금융상품코드
     **/
    //FINC_ITEM_CD
    private  String                 fincItemCd;

    /**
     * 금융요청일자
     **/
    //FINC_REQ_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   fincReqDt;

    /**
     * 금융요청금액
     **/
    //FINC_REQ_AMT
    private  Double                 fincReqAmt;

    /**
     * 금융만기일자
     **/
    //FINC_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   fincEndDt;

    /**
     * 견적번호
     **/
    //ESTIMATE_NO
    private  String                 estimateNo;

    /**
     * 중고차량매입여부
     **/
    @NotEmpty
    private  String                 uatcCarPurcYn;

    /**
     * 계약승인요청일자
     **/
    //CONTRACT_APPROVE_REQ_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   contractApproveReqDt;

    /**
     * 계약승인일자
     **/
    //CONTRACT_APPROVE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   contractApproveDt;

    /**
     * 배정큐번호
     **/
    //ALLOC_QUE_NO
    private  String                 allocQueNo;

    /**
     * 배정일자
     **/
    //ALLOC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   allocDt;

    /**
     * 출고요청일자
     **/
    //GI_REQ_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   giReqDt;

    /**
     * 출고일자
     **/
    //GI_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   giDt;

    /**
     * 인도요청일자
     **/
    //DL_REQ_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   dlReqDt;

    /**
     * 인도예정일자
     **/
    //DL_SCHE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   dlScheDt;

    /**
     * 실제인도일자
     **/
    //REAL_DL_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   realDlDt;

    /**
     * 인수자명
     **/
    //TOVR_NM
    private  String                 tovrNm;

    /**
     * 인수자관계코드
     **/
    //TOVR_REL_CD
    private  String                 tovrRelCd;

    /**
     * 취소요청일자
     **/
    //CANC_REQ_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   cancReqDt;

    /**
     * 취소일자
     **/
    //CANC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   cancDt;

    /**
     * 취소사유코드
     **/
    //CANC_REASON_CD
    private  String                 cancReasonCd;

    /**
     * 소매유형
     **/
    //RETL_TP
    private  String                 retlTp;

    /**
     * 파일문서ID
     **/
    //FILE_DOC_ID
    private  String                 fileDocId;

    /**
     * 비고
     **/
    //REMARK
    private  String                 remark;

    /**
     * 등록자ID
     **/
    private  String                 regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   regDt;

    /**
     * 수정자ID
     **/
    //UPDT_USR_ID
    private  String                 updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   updtDt;

    // 고객코드 : 계약자
    private  String                 custCd;
    private  String                 custTp;
    private  String                 custNm;
    private  String                 telNo1;
    private  String                 telNo2;
    private  String                 emailNm;
    private  String                 crnNo;
    private  String                 zipCd;
    private  String                 addr1;
    private  String                 addr2;

    // 고객코드 : 실제 운전자
    private  String                 drvCustCd;
    private  String                 drvCustTp;
    private  String                 drvCustNm;
    private  String                 drvTelNo1;
    private  String                 drvTelNo2;
    private  String                 drvEmailNm;
    private  String                 drvCrnNo;
    private  String                 drvZipCd;
    private  String                 drvAddr1;
    private  String                 drvAddr2;

    // 고객 파트너 유형 : SAL028 ,  C:계약자 D:실운전자
    private  String partnerTp;

    /**
     * 자사차량구분코드
     **/
    //CORP_CAR_DSTIN_CD
    private  String           corpCarDstinCd;

    /**
     * 브랜드코드
     **/
    //BRAND_CD
    private  String           brandCd;

    /**
     * 모델명
     **/
    //MODEL_NM
    private  String           useOthersModelNm;

    /**
     * 차종코드
     **/
    //CARLINE_CD
    private  String           useCarlineCd;

    private  String           useCarlineNm;

    /**
     * 모델코드
     **/
    //MODEL_CD
    private  String           useModelCd;

    private  String           useModelNm;

    /**
     * OCN코드
     **/
    //OCN_CD
    private  String           useOcnCd;

    private  String           useOcnNm;

    /**
     * 외장색상코드
     **/
    //EXT_COLOR_CD
    private  String           useExtColorCd;

    private  String           useExtColorNm;

    /**
     * 내장색상코드
     **/
    //INT_COLOR_CD
    private  String           useIntColorCd;

    private  String           useIntColorNm;

    /**
     * 차량주행거리값
     **/
    //CAR_RUN_DIST_VAL
    private  int              carRunDistVal;

    /**
     * 차량번호
     **/
    //CAR_NO
    private  String           carNo;

    /**
     * 차대번호
     **/
    //VIN_NO
    private  String           vinNo;

    /**
     * 차량구동방식코드
     **/
    //CAR_DRV_MTH_CD
    private  String           carDrvMthCd;

    /**
     * 연료코드
     **/
    //FUEL_CD
    private  String           fuelCd;

    /**
     * 승상용구분코드
     **/
    //PC_DSTIN_CD
    private  String           pcDstinCd;

    /**
     * 차량정원값
     **/
    //CAR_LMT_VAL
    private  int              carLmtVal;

    /**
     * 차량연식코드
     **/
    //CAR_YY_CD
    private  String           carYyCd;

    /**
     * 차량배기량
     **/
    //CAR_DISP_QTY
    private  int              carDispQty;

    /**
     * 차량등록일자
     **/
    //CAR_REG_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             carRegDt;

    /**
     * 평가예정일자
     **/
    //EVAL_SCHE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             evalScheDt;

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
     * @return the lv2DlrOrdNm
     */
    public String getLv2DlrOrdNm() {
        return lv2DlrOrdNm;
    }

    /**
     * @param lv2DlrOrdNm the lv2DlrOrdNm to set
     */
    public void setLv2DlrOrdNm(String lv2DlrOrdNm) {
        this.lv2DlrOrdNm = lv2DlrOrdNm;
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
     * @return the consAddr1
     */
    public String getConsAddr1() {
        return consAddr1;
    }

    /**
     * @param consAddr1 the consAddr1 to set
     */
    public void setConsAddr1(String consAddr1) {
        this.consAddr1 = consAddr1;
    }

    /**
     * @return the consAddr2
     */
    public String getConsAddr2() {
        return consAddr2;
    }

    /**
     * @param consAddr2 the consAddr2 to set
     */
    public void setConsAddr2(String consAddr2) {
        this.consAddr2 = consAddr2;
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
     * @return the taxTp
     */
    public String getTaxTp() {
        return taxTp;
    }

    /**
     * @param taxTp the taxTp to set
     */
    public void setTaxTp(String taxTp) {
        this.taxTp = taxTp;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the carAmt
     */
    public Double getCarAmt() {
        return carAmt;
    }

    /**
     * @param carAmt the carAmt to set
     */
    public void setCarAmt(Double carAmt) {
        this.carAmt = carAmt;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the goodsTotAmt
     */
    public Double getGoodsTotAmt() {
        return goodsTotAmt;
    }

    /**
     * @param goodsTotAmt the goodsTotAmt to set
     */
    public void setGoodsTotAmt(Double goodsTotAmt) {
        this.goodsTotAmt = goodsTotAmt;
    }

    /**
     * @return the vattaxAmt
     */
    public Double getVattaxAmt() {
        return vattaxAmt;
    }

    /**
     * @param vattaxAmt the vattaxAmt to set
     */
    public void setVattaxAmt(Double vattaxAmt) {
        this.vattaxAmt = vattaxAmt;
    }

    /**
     * @return the otherTaxAmt
     */
    public Double getOtherTaxAmt() {
        return otherTaxAmt;
    }

    /**
     * @param otherTaxAmt the otherTaxAmt to set
     */
    public void setOtherTaxAmt(Double otherTaxAmt) {
        this.otherTaxAmt = otherTaxAmt;
    }

    /**
     * @return the otherAmt
     */
    public Double getOtherAmt() {
        return otherAmt;
    }

    /**
     * @param otherAmt the otherAmt to set
     */
    public void setOtherAmt(Double otherAmt) {
        this.otherAmt = otherAmt;
    }

    /**
     * @return the goodsNm
     */
    public String getGoodsNm() {
        return goodsNm;
    }

    /**
     * @param goodsNm the goodsNm to set
     */
    public void setGoodsNm(String goodsNm) {
        this.goodsNm = goodsNm;
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
     * @return the optionAmt
     */
    public Double getOptionAmt() {
        return optionAmt;
    }

    /**
     * @param optionAmt the optionAmt to set
     */
    public void setOptionAmt(Double optionAmt) {
        this.optionAmt = optionAmt;
    }

    /**
     * @return the contractAmtPayTp
     */
    public String getContractAmtPayTp() {
        return contractAmtPayTp;
    }

    /**
     * @param contractAmtPayTp the contractAmtPayTp to set
     */
    public void setContractAmtPayTp(String contractAmtPayTp) {
        this.contractAmtPayTp = contractAmtPayTp;
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
     * @return the contractAmt
     */
    public Double getContractAmt() {
        return contractAmt;
    }

    /**
     * @param contractAmt the contractAmt to set
     */
    public void setContractAmt(Double contractAmt) {
        this.contractAmt = contractAmt;
    }

    /**
     * @return the dlAmtPayTp
     */
    public String getDlAmtPayTp() {
        return dlAmtPayTp;
    }

    /**
     * @param dlAmtPayTp the dlAmtPayTp to set
     */
    public void setDlAmtPayTp(String dlAmtPayTp) {
        this.dlAmtPayTp = dlAmtPayTp;
    }

    /**
     * @return the dlAmt
     */
    public Double getDlAmt() {
        return dlAmt;
    }

    /**
     * @param dlAmt the dlAmt to set
     */
    public void setDlAmt(Double dlAmt) {
        this.dlAmt = dlAmt;
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
     * @return the regNameNm
     */
    public String getRegNameNm() {
        return regNameNm;
    }

    /**
     * @param regNameNm the regNameNm to set
     */
    public void setRegNameNm(String regNameNm) {
        this.regNameNm = regNameNm;
    }

    /**
     * @return the regSbodtAmt
     */
    public Double getRegSbodtAmt() {
        return regSbodtAmt;
    }

    /**
     * @param regSbodtAmt the regSbodtAmt to set
     */
    public void setRegSbodtAmt(Double regSbodtAmt) {
        this.regSbodtAmt = regSbodtAmt;
    }

    /**
     * @return the incAapCd
     */
    public String getIncAapCd() {
        return incAapCd;
    }

    /**
     * @param incAapCd the incAapCd to set
     */
    public void setIncAapCd(String incAapCd) {
        this.incAapCd = incAapCd;
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
     * @return the contractApproveReqDt
     */
    public Date getContractApproveReqDt() {
        return contractApproveReqDt;
    }

    /**
     * @param contractApproveReqDt the contractApproveReqDt to set
     */
    public void setContractApproveReqDt(Date contractApproveReqDt) {
        this.contractApproveReqDt = contractApproveReqDt;
    }

    /**
     * @return the contractApproveDt
     */
    public Date getContractApproveDt() {
        return contractApproveDt;
    }

    /**
     * @param contractApproveDt the contractApproveDt to set
     */
    public void setContractApproveDt(Date contractApproveDt) {
        this.contractApproveDt = contractApproveDt;
    }

    /**
     * @return the allocQueNo
     */
    public String getAllocQueNo() {
        return allocQueNo;
    }

    /**
     * @param allocQueNo the allocQueNo to set
     */
    public void setAllocQueNo(String allocQueNo) {
        this.allocQueNo = allocQueNo;
    }

    /**
     * @return the allocDt
     */
    public Date getAllocDt() {
        return allocDt;
    }

    /**
     * @param allocDt the allocDt to set
     */
    public void setAllocDt(Date allocDt) {
        this.allocDt = allocDt;
    }

    /**
     * @return the giReqDt
     */
    public Date getGiReqDt() {
        return giReqDt;
    }

    /**
     * @param giReqDt the giReqDt to set
     */
    public void setGiReqDt(Date giReqDt) {
        this.giReqDt = giReqDt;
    }

    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
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
     * @return the dlScheDt
     */
    public Date getDlScheDt() {
        return dlScheDt;
    }

    /**
     * @param dlScheDt the dlScheDt to set
     */
    public void setDlScheDt(Date dlScheDt) {
        this.dlScheDt = dlScheDt;
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
     * @return the tovrNm
     */
    public String getTovrNm() {
        return tovrNm;
    }

    /**
     * @param tovrNm the tovrNm to set
     */
    public void setTovrNm(String tovrNm) {
        this.tovrNm = tovrNm;
    }

    /**
     * @return the tovrRelCd
     */
    public String getTovrRelCd() {
        return tovrRelCd;
    }

    /**
     * @param tovrRelCd the tovrRelCd to set
     */
    public void setTovrRelCd(String tovrRelCd) {
        this.tovrRelCd = tovrRelCd;
    }

    /**
     * @return the cancReqDt
     */
    public Date getCancReqDt() {
        return cancReqDt;
    }

    /**
     * @param cancReqDt the cancReqDt to set
     */
    public void setCancReqDt(Date cancReqDt) {
        this.cancReqDt = cancReqDt;
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
     * @return the crnNo
     */
    public String getCrnNo() {
        return crnNo;
    }

    /**
     * @param crnNo the crnNo to set
     */
    public void setCrnNo(String crnNo) {
        this.crnNo = crnNo;
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
     * @return the addr1
     */
    public String getAddr1() {
        return addr1;
    }

    /**
     * @param addr1 the addr1 to set
     */
    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    /**
     * @return the addr2
     */
    public String getAddr2() {
        return addr2;
    }

    /**
     * @param addr2 the addr2 to set
     */
    public void setAddr2(String addr2) {
        this.addr2 = addr2;
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
     * @return the drvCrnNo
     */
    public String getDrvCrnNo() {
        return drvCrnNo;
    }

    /**
     * @param drvCrnNo the drvCrnNo to set
     */
    public void setDrvCrnNo(String drvCrnNo) {
        this.drvCrnNo = drvCrnNo;
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
     * @return the drvAddr1
     */
    public String getDrvAddr1() {
        return drvAddr1;
    }

    /**
     * @param drvAddr1 the drvAddr1 to set
     */
    public void setDrvAddr1(String drvAddr1) {
        this.drvAddr1 = drvAddr1;
    }

    /**
     * @return the drvAddr2
     */
    public String getDrvAddr2() {
        return drvAddr2;
    }

    /**
     * @param drvAddr2 the drvAddr2 to set
     */
    public void setDrvAddr2(String drvAddr2) {
        this.drvAddr2 = drvAddr2;
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
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    /**
     * @return the useOthersModelNm
     */
    public String getUseOthersModelNm() {
        return useOthersModelNm;
    }

    /**
     * @param useOthersModelNm the useOthersModelNm to set
     */
    public void setUseOthersModelNm(String useOthersModelNm) {
        this.useOthersModelNm = useOthersModelNm;
    }

    /**
     * @return the useCarlineCd
     */
    public String getUseCarlineCd() {
        return useCarlineCd;
    }

    /**
     * @param useCarlineCd the useCarlineCd to set
     */
    public void setUseCarlineCd(String useCarlineCd) {
        this.useCarlineCd = useCarlineCd;
    }

    /**
     * @return the useCarlineNm
     */
    public String getUseCarlineNm() {
        return useCarlineNm;
    }

    /**
     * @param useCarlineNm the useCarlineNm to set
     */
    public void setUseCarlineNm(String useCarlineNm) {
        this.useCarlineNm = useCarlineNm;
    }

    /**
     * @return the useModelCd
     */
    public String getUseModelCd() {
        return useModelCd;
    }

    /**
     * @param useModelCd the useModelCd to set
     */
    public void setUseModelCd(String useModelCd) {
        this.useModelCd = useModelCd;
    }

    /**
     * @return the useModelNm
     */
    public String getUseModelNm() {
        return useModelNm;
    }

    /**
     * @param useModelNm the useModelNm to set
     */
    public void setUseModelNm(String useModelNm) {
        this.useModelNm = useModelNm;
    }

    /**
     * @return the useOcnCd
     */
    public String getUseOcnCd() {
        return useOcnCd;
    }

    /**
     * @param useOcnCd the useOcnCd to set
     */
    public void setUseOcnCd(String useOcnCd) {
        this.useOcnCd = useOcnCd;
    }

    /**
     * @return the useOcnNm
     */
    public String getUseOcnNm() {
        return useOcnNm;
    }

    /**
     * @param useOcnNm the useOcnNm to set
     */
    public void setUseOcnNm(String useOcnNm) {
        this.useOcnNm = useOcnNm;
    }

    /**
     * @return the useExtColorCd
     */
    public String getUseExtColorCd() {
        return useExtColorCd;
    }

    /**
     * @param useExtColorCd the useExtColorCd to set
     */
    public void setUseExtColorCd(String useExtColorCd) {
        this.useExtColorCd = useExtColorCd;
    }

    /**
     * @return the useExtColorNm
     */
    public String getUseExtColorNm() {
        return useExtColorNm;
    }

    /**
     * @param useExtColorNm the useExtColorNm to set
     */
    public void setUseExtColorNm(String useExtColorNm) {
        this.useExtColorNm = useExtColorNm;
    }

    /**
     * @return the useIntColorCd
     */
    public String getUseIntColorCd() {
        return useIntColorCd;
    }

    /**
     * @param useIntColorCd the useIntColorCd to set
     */
    public void setUseIntColorCd(String useIntColorCd) {
        this.useIntColorCd = useIntColorCd;
    }

    /**
     * @return the useIntColorNm
     */
    public String getUseIntColorNm() {
        return useIntColorNm;
    }

    /**
     * @param useIntColorNm the useIntColorNm to set
     */
    public void setUseIntColorNm(String useIntColorNm) {
        this.useIntColorNm = useIntColorNm;
    }

    /**
     * @return the carRunDistVal
     */
    public int getCarRunDistVal() {
        return carRunDistVal;
    }

    /**
     * @param carRunDistVal the carRunDistVal to set
     */
    public void setCarRunDistVal(int carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }

    /**
     * @return the carNo
     */
    public String getCarNo() {
        return carNo;
    }

    /**
     * @param carNo the carNo to set
     */
    public void setCarNo(String carNo) {
        this.carNo = carNo;
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
     * @return the carDrvMthCd
     */
    public String getCarDrvMthCd() {
        return carDrvMthCd;
    }

    /**
     * @param carDrvMthCd the carDrvMthCd to set
     */
    public void setCarDrvMthCd(String carDrvMthCd) {
        this.carDrvMthCd = carDrvMthCd;
    }

    /**
     * @return the fuelCd
     */
    public String getFuelCd() {
        return fuelCd;
    }

    /**
     * @param fuelCd the fuelCd to set
     */
    public void setFuelCd(String fuelCd) {
        this.fuelCd = fuelCd;
    }

    /**
     * @return the pcDstinCd
     */
    public String getPcDstinCd() {
        return pcDstinCd;
    }

    /**
     * @param pcDstinCd the pcDstinCd to set
     */
    public void setPcDstinCd(String pcDstinCd) {
        this.pcDstinCd = pcDstinCd;
    }

    /**
     * @return the carLmtVal
     */
    public int getCarLmtVal() {
        return carLmtVal;
    }

    /**
     * @param carLmtVal the carLmtVal to set
     */
    public void setCarLmtVal(int carLmtVal) {
        this.carLmtVal = carLmtVal;
    }

    /**
     * @return the carYyCd
     */
    public String getCarYyCd() {
        return carYyCd;
    }

    /**
     * @param carYyCd the carYyCd to set
     */
    public void setCarYyCd(String carYyCd) {
        this.carYyCd = carYyCd;
    }

    /**
     * @return the carDispQty
     */
    public int getCarDispQty() {
        return carDispQty;
    }

    /**
     * @param carDispQty the carDispQty to set
     */
    public void setCarDispQty(int carDispQty) {
        this.carDispQty = carDispQty;
    }

    /**
     * @return the carRegDt
     */
    public Date getCarRegDt() {
        return carRegDt;
    }

    /**
     * @param carRegDt the carRegDt to set
     */
    public void setCarRegDt(Date carRegDt) {
        this.carRegDt = carRegDt;
    }

    /**
     * @return the evalScheDt
     */
    public Date getEvalScheDt() {
        return evalScheDt;
    }

    /**
     * @param evalScheDt the evalScheDt to set
     */
    public void setEvalScheDt(Date evalScheDt) {
        this.evalScheDt = evalScheDt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
