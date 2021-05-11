package chn.bhmc.dms.crm.mcm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
//import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateListDeserializer;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 마케팅 캠패인  VO
 *
 * @ClassName : MarketingCampaignVO.java
 * @Description : MarketingCampaignVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since   author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="dlrCd"            , mesgKey="global.lbl.dlrCd")
     ,@ValidField(field="dlrNm"            , mesgKey="global.lbl.dlrNm")
    ,@ValidField(field="pltCd"            , mesgKey="global.lbl.pltCd")
    ,@ValidField(field="makCd"            , mesgKey="global.lbl.crNo")
    ,@ValidField(field="makNm"            , mesgKey="global.lbl.makNm")
    ,@ValidField(field="hostCd"           , mesgKey="global.lbl.hostCd")
    ,@ValidField(field="hostTeamCd"       , mesgKey="global.lbl.hostTeamCd")
    ,@ValidField(field="makTpCd"          , mesgKey="global.lbl.type")
    ,@ValidField(field="makSubTpCd"       , mesgKey="global.lbl.type")
    ,@ValidField(field="rcpeNm"           , mesgKey="global.lbl.rcpeNm")
    ,@ValidField(field="startDt"          , mesgKey="global.lbl.startDt")
    ,@ValidField(field="endDt"            , mesgKey="global.lbl.EndDt")
    ,@ValidField(field="prid"             , mesgKey="global.lbl.term")
    ,@ValidField(field="placeNm"          , mesgKey="global.lbl.placeNm")
    ,@ValidField(field="aapCmpNm"         , mesgKey="global.lbl.aapCmpNm")
    ,@ValidField(field="budgetAmt"        , mesgKey="global.lbl.budgetAmt")
    ,@ValidField(field="statCd"           , mesgKey="global.lbl.statNm")
    ,@ValidField(field="targCustCnt"      , mesgKey="global.lbl.targCustCnt")
    ,@ValidField(field="pgssRate"         , mesgKey="global.lbl.pgssRate")
    ,@ValidField(field="activeNm"         , mesgKey="global.lbl.activeNm")
    ,@ValidField(field="activeCont"       , mesgKey="global.lbl.activeCont")
    ,@ValidField(field="activeFileDocNo"  , mesgKey="global.lbl.activeFileDocNo")
    ,@ValidField(field="adInvtHm"         , mesgKey="global.lbl.adInvtHm")
    ,@ValidField(field="adMediaCd"        , mesgKey="global.lbl.adMediaCd")
    ,@ValidField(field="adCostAmt"        , mesgKey="global.lbl.adCostAmt")
    ,@ValidField(field="adStartDt"        , mesgKey="global.lbl.adStartDt")
    ,@ValidField(field="adEndDt"          , mesgKey="global.lbl.adEndDt")
    ,@ValidField(field="apprDocNo"        , mesgKey="global.lbl.apprDocNo")
    ,@ValidField(field="delYn"            , mesgKey="global.lbl.delYn")
    ,@ValidField(field="rcpeAutoYn"       , mesgKey="global.lbl.rcpeAutoYn")

    ,@ValidField(field="activeMthSeq"     , mesgKey="global.lbl.activeMthSeq")
    ,@ValidField(field="activeMthTpCd"    , mesgKey="global.lbl.activeMthTpCd")
    ,@ValidField(field="carlineCd"        , mesgKey="global.lbl.carlineCd")
    ,@ValidField(field="modelCd"          , mesgKey="global.lbl.modelCd")

    ,@ValidField(field="seq"              , mesgKey="global.lbl.seq")
    ,@ValidField(field="targCd"           , mesgKey="global.lbl.targ")
    ,@ValidField(field="targNm"           , mesgKey="global.lbl.targ")
    ,@ValidField(field="targCntVal"       , mesgKey="global.lbl.targCntVal")
    ,@ValidField(field="targRsltVal"      , mesgKey="global.lbl.targRsltVal")

    ,@ValidField(field="custDlrCd"          , mesgKey="crm.lbl.custDlrCd")
    ,@ValidField(field="extrDgreCnt"        , mesgKey="crm.lbl.extrDgreCnt")
    ,@ValidField(field="custExtrTermNo"     , mesgKey="crm.lbl.custExtrTermNo")
    ,@ValidField(field="custExtrTitleNm"    , mesgKey="crm.lbl.custExtrTitleNm")
    ,@ValidField(field="extrStatCd"         , mesgKey="crm.lbl.extrStatCd")
    ,@ValidField(field="extrDt"             , mesgKey="crm.lbl.extrDt")
    ,@ValidField(field="useYn"              , mesgKey="crm.lbl.useYn")
    ,@ValidField(field="custExtrAutoYn"     , mesgKey="crm.lbl.custExtrAutoYn")
    ,@ValidField(field="custExtrCycleCont"  , mesgKey="crm.lbl.custExtrCycleCont")
    ,@ValidField(field="dupYn"              , mesgKey="crm.lbl.dupYn")

    ,@ValidField(field="budgetCd"         , mesgKey="global.lbl.budgetCd")
    ,@ValidField(field="budgetDetlCont"   , mesgKey="global.lbl.budgetDetlCont")
    ,@ValidField(field="corpBudnRate"     , mesgKey="global.lbl.corpBudnRate")
    ,@ValidField(field="imsSuptAmt"       , mesgKey="global.lbl.imsSuptAmt")

    ,@ValidField(field="ivstTp"           , mesgKey="global.lbl.ivstTp")
    ,@ValidField(field="prsnOpnCont"      , mesgKey="global.lbl.prsnOpnCont")
    ,@ValidField(field="stsfIvstRsltSeq"  , mesgKey="global.lbl.stsfIvstRsltSeq")
    ,@ValidField(field="empId"            , mesgKey="global.lbl.empId")
    ,@ValidField(field="makCont"          , mesgKey="global.lbl.remark")
    })

public class MarketingCampaignVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4185538189182113582L;

    private String hDlrCd;  //딜러코드
    private String tDlrCd;  //딜러코드
    private String custDlrCd; //고객딜러코드
    private String hPltCd;  //사업장코드
    private String hMakCd;  //마케팅코드
    private String tMakCd;  //마케팅코드
    private String makCd;   //마케팅코드
    private String copyNewMakCd;
    private String makNm;   //마케팅명
    private String hostCd;  //주최코드
    private String hostTeamCd;  //주최팀코드
    private String makTpCd; //마케팅유형코드
    private String befMakTpCd;      // 수정시 마케팅 유형에 따라서 목표를 재설정(삭제후 인서트) 해줘야 하기 때문에 이전 유형 코드가 꼭 필요
    private String makSubTpCd;  //마케팅서브유형코드
    private String rcpeNm;  //대상자명

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;   //시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt; //종료일자

    private int prid;   //기간

    private String placeNm; //

    /**
    * 대행업체명
    **/
    //AAP_CMP_NM
    private String aapCmpNm;

    /**
    * 예산금액
    **/
    //BUDGET_AMT
    private double budgetAmt;

    /**
    * 상태코드
    **/
    //STAT_CD
    private String statCd;

    /**
    * 목표고객수
    **/
    //TARG_CUST_CNT

    private int targCustCnt;

    /**
    * 참여인력
    **/
    //REAL_CUST_CNT

    private int realCustCnt;

    /**
    * 진도율
    **/
    //PGSS_RATE

    private int pgssRate;

    /**
    * 활동명
    **/
    //ACTIVE_NM

    private String activeNm;

    /**
    * 활동내용
    **/
    //ACTIVE_CONT

    private String activeCont;

    /**
    * 활동첨부문서번호[CM_0901T]
    **/
    //ACTIVE_FILE_DOC_NO

    private String activeFileDocNo;

    /**
    * 광고투자시간
    **/
    //AD_INVT_HM

    private int adInvtHm;

    /**
    * 광고매체코드
    **/
    //AD_MEDIA_CD

    private String adMediaCd;

    /**
    * 광고비용금액
    **/
    //AD_COST_AMT

    private int adCostAmt;

    /**
    * 광고시작일자
    **/
    //AD_START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date adStartDt;

    /**
    * 광고종료일자
    **/
    //AD_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date adEndDt;

    /**
     * 광고투자시간VIEW
     **/
     //AD_INVT_HM

     private int vAdInvtHm;

     /**
     * 광고매체코드VIEW
     **/
     //AD_MEDIA_CD

     private String vAdMediaCd;

     /**
     * 광고비용금액VIEW
     **/
     //AD_COST_AMT

     private int vAdCostAmt;

     /**
     * 광고시작일자VIEW
     **/
     //AD_START_DT
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date vAdStartDt;

     /**
     * 광고종료일자VIEW
     **/
     //AD_END_DT
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date vAdEndDt;

    /**
    * 결재문서번호[CM_1001T]
    **/
    //APPR_DOC_NO

    private String apprDocNo;

    /**
     * 결재양식ID[CM_1001T]
     **/
     //SIGN_DOC_ID

     private String signDocId;

    /**
    * 삭제여부
    **/
    //@NotEmpty

    private String delYn;

    /**
     * 대상자 자동추출 여부
     **/
     //@NotEmpty

     private String rcpeAutoYn;

    /**
    * 등록자ID
    **/
    //@NotEmpty

    private String regUsrId;

    /**
    * 등록일자
    **/
    //@NotEmpty
    // yyyy-MM-dd'T'HH:mm:ss.SSS'Z'  : 그리드   / $("#startDt").val("") : "2015-01-04 18:22:00" /  $("#startDt").data("kendoDataPinkcer").value("");  /
//    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
    * 수정자ID
    **/
    //UPDT_USR_ID

    private String updtUsrId;

    /**
    * 수정일자
    **/
    //UPDT_DT
//    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 마케팅내용
     **/
     //@NotEmpty

    private String makCont;
    private String cmmCd;
    private String cmmCdNm;
    private String hostNm;
    private String hostTeamNm;
    private String makTpSubTpNm;
    private String statNm;
    private String talkPlan;
    private String dlrCd;
    private String dlrNm;
    private String pltCd;
    private String langCd;

    private int     extractSeq;
    private int     stsfIvstScoreVal;

    //캠페인 - 활동방안(CR_0702T)
    /**
    * 활동방안일련번호
    **/
    //@NotEmpty

    private String activeMthSeq;

    /**
    * 활동방안유형코드
    **/
    //ACTIVE_MTH_TP_CD

    private String activeMthTpCd;

    /**
    * 차종코드
    **/
    //CARLINE_CD

    private String carlineCd;

    /**
     * 차종명
     **/
     //CARLINE_CD

     private String carlineNm;

    /**
    * 모델코드
    **/
    //MODEL_CD

    private String modelCd;

    /**
     * 모델코드
     **/
     //MODEL_CD
    private String modelNm;

    //캠페인 - 예산(CR_0705T)
    /**
     * 예산코드
     **/
     //@NotEmpty
     private String budgetCd;

     /**
      * 예산코드
      **/
      //@NotEmpty
      private String budgetNm;

     /**
     * 예산상세내용
     **/
     //BUDGET_DETL_CONT
     private String budgetDetlCont;

     /**
     * 자사부담율
     **/
     //CORP_BUDN_RATE
     private double corpBudnRate;

     /**
     * 제조사지원금액
     **/
     //IMS_SUPT_AMT
     private double imsSuptAmt;

    // 마케팅캠페인 - 목표(CR_0711T)
    /**
    * 일련번호
    **/
    //@NotEmpty
    private int seq;

    /**
    * 목표코드
    **/
    //TARG_CD
    private String targCd;

    /**
    * 목표명
    **/
    //TARG_NM

    private String targNm;

    /**
    * 목표수치값
    **/
    //TARG_CNT_VAL
    private int targCntVal;

    /**
    * 목표결과값
    **/
    //TARG_RSLT_VAL
    private int targRsltVal;

    //마케팅캠페인 - 결과(CR_0712T)
    /**
    * 조사유형
    **/
    //IVST_TP
    private String ivstTp;

    /**
    * 담당자의견내용
    **/
    //PRSN_OPN_CONT
    private String prsnOpnCont;

    /**
    * 만족도조사결과일련번호
    **/
    //STSF_IVST_RSLT_SEQ
    private int stsfIvstRsltSeq;

    /**
    * 사원ID
    **/
    //EMP_ID

    private String empId;

    /**
     * 사원명
     **/
     //EMP_ID
    private String empNm;

    /**
     * 만족도조사점수값
    **/
    private int ssfIvstScoreVal;

    /**
    * 만족도조사일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date stsfIvstDt;

    /**
     * 만족도조사일련번호
    **/
    private int ssfIvstSeq;

    /**
     * 만족도조사일련번호
    **/
    private int  subyTmplSeq;

 // 캠페인실행 대상자(CR_0710T)
    /**
    * 추출차수
    **/
   //@NotEmpty
    private int extrDgreCnt;

    /**
    * 고객번호
    **/
//    @NotEmpty
    private String custNo;

    /**
     * 고객명
     **/
//     @NotEmpty
     private String custNm;

    /**
    * 고객추출조건번호
    **/
    //CUST_EXTR_TERM_NO
    private String custExtrTermNo;

    /**
    * 전화번호
    **/
    //TEL_NO
    private String telNo;

    /**
    * 휴대폰번호
    **/
    //HP_NO
    private String hpNo;

    /**
    * 위챗ID
    **/
    //WECHAT_ID
    private String wechatId;

    /**
    * 이메일명
    **/
    //EMAIL_NM
    private String emailNm;

    /**
    * 성명
    **/
    //SUNG_NM
    private String sungNm;

    /**
    * 도시명
    **/
    //CITY_NM
    private String cityNm;

    /**
    * 지역명
    **/
    //DIST_NM
    private String distNm;

    /**
    * 우편번호
    **/
    //ZIP_CD
    private String zipCd;

    /**
    * 확장우편번호
    **/
    //EXT_ZIP_CD
    private String extZipCd;

    /**
    * 주소명
    **/
    //ADDR_NM
    private String addrNm;

    /**
    * 주소상세내용
    **/
    //ADDR_DETL_CONT
    private String addrDetlCont;
    /**
     * 딜러 멤버십 여부
     **/
    private String membershipYn;
    /**
     * 블루 멤버십 여부
     **/
    private String blueMembershipYn;

    /**
    * SMS발송일자
    **/
    //SMS_SEND_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date smsSendDt;

    /**
    * SMS발송결과내용
    **/
    //SMS_SEND_RSLT_CONT
    private String smsSendRsltCont;

    /**
    * 콜센터전송일자
    **/
    //CALL_CEN_SEND_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date callCenSendDt;

    /**
    * 콜센터결과내용
    **/
    //CALL_CEN_RSLT_CONT
    private String callCenRsltCont;

    /**
    * 판매전송일자
    **/
    //SALE_SEND_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleSendDt;

    /**
    * 판매키명
    **/
    //SALE_KEY_NM
    private String saleKeyNm;

    /**
    * 판매결과내용
    **/
    //SALE_RSLT_CONT
    private String saleRsltCont;

    /**
    * 정비전송일자
    **/
    //SER_SEND_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serSendDt;

    /**
    * 정비키명
    **/
    //SER_KEY_NM
    private String serKeyNm;

    /**
    * 정비결과내용
    **/
    //SER_RSLT_CONT
    private String serRsltCont;

    /**
    * 접촉번호
    **/
    //CONTACT_NO
    private String contactNo;

    /**
    * 콜일련번호
    **/
    //CALL_SEQ
    private int callSeq;

     /**
     * 고객추출제목명
     **/
     //CUST_EXTR_TITLE_NM
     private String custExtrTitleNm;

     /**
     * 추출상태코드
     **/
     //EXTR_STAT_CD
     private String extrStatCd;

     /**
      * 대상고객 수
      **/
      //REAL_TARGET_CNT
      private int realTargetCnt;

     /**
     * 추출일자
     **/
     //EXTR_DT
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date extrDt;

     /**
     * 사용여부
     **/
//     @NotEmpty
     private String useYn;

     /**
     * 고객추출자동여부
     **/
//     @NotEmpty
     private String custExtrAutoYn;

     /**
     * 고객추출주기내용
     **/
     //CUST_EXTR_CYCLE_CONT
     private String custExtrCycleCont;

     /**
     * 중복여부
     **/
//     @NotEmpty
     private String dupYn;

    //캠페인 마스터(정비용)
    /**
     * 생산 시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creStartDt;

    /**
     *생산 종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creEndDt;

    /**
     *판매 시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleStartDt;

    /**
     * 판매종료일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleEndDt;

    /**
     * 캠페인 종료여부
     **/
    private String crEndTp;

    /**
     * 캠페인 비고
     **/
    private String crIsaNm;


     //캠페인 상세(정비용)
    /**
     * 캠페인번호
     **/
//    @NotEmpty
    private String crNo;

    /**
     * 캠페인 유형
     */
    private String crTp;

    /**
     * 캠페인명
     **/
    private String crNm;

    /**
     * 캠페인 공임코드
     **/
    private String lbrCd;

    /**
     * 캠페인 공임명
     **/
    private String lbrNm;

    /**
     * 캠페인 공임 수량
     **/
    private int lbrQty;

    /**
     * 캠페인 공임 작업 시간
     **/
    private Double lbrHm;

    /**
     * 캠페인 공임 금액
     **/
    private Double lbrAmt;

    /**
     * 공임단가
     */
    private Double lbrRate;

    /**
     * 공임금액
     */
    private Double lbrPrc;

    /**
     * 할인금액
     **/
    private Double dsAmt;
    /**
     * 할인율
     **/
    private Double dsRate;

    /**
     * 공임합계금액
     **/
    private Double lbrTotAmt;

    /**
     * 공임유형
     **/
    private String lbrTp;


    /**
     * 캠페인 원인코드
     **/
    private String cauCd;

    /**
     * 캠페인 원인코드명
     **/
    private String cauNm;

    /**
     * 캠페인 현상코드
     **/
    private String phenCd;

    /**
     * 캠페인 현상코드명
     **/
    private String phenNm;

    /**
     * 캠페인 LTS MODEL 코드
     **/
    private String ltsModelCd;

    /**
     * 캠페인 LTS MODEL 명
     **/
    private String ltsModelNm;

    /**
     * 캠페인 원인 부품코드
     **/
    private String cauItemCd;

    /**
     * 캠페인 원인 부품명
     **/
    private String cauItemNm;

    /**
     * 캠페인 부품
     */
    private String itemCd;

    /**
     * 캠페인부품명
     */
    private String itemNm;

    /**
     * 캠페인  부품단가
     */
    private Double itemPrc;

    /**
     * 캠페인  부품금액
     */
    private Double itemAmt;

    /**
     * 캠페인 부품수량
     **/
    private int itemQty;

    /**
     * 캠페인 부품 단위
     */
    private String stockUnitCd;

    /**
     * 캠페인 부품 단위
     */
    private String itemUnitCd;

    /**
     * 캠페인  부품금액
     */
    private Double salePrcAmt;

    /**
     * 품목합계금액
     **/
    //ITEM_TOT_AMT
    private Double itemTotAmt;

    /**
     * 계산단위코드
     **/
    //CALC_UNIT_CD
    private String calcUnitCd;

    /**
     * 캠페인 대상빈
     **/
    private String vinNo;

    /**
     * 캠페인 사용일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date useDt;

    /**
     * 캠페인 승상구분
     **/
    private String pcDstinCd;

    /**
     * 입고창고코드
     */
    private String grStrgeCd;

    /**
     * 출고창고코드
     */
    private String giStrgeCd;

    private int stsfIvstSeq;

    private String custExtrCycleTp; //고객추출주기유형 ( D : 매일 / W : 매주 / S : 날짜 선택 )
    private List<String> custExtrCycleWeek;//고객추출주기 (주)
    @JsonDeserialize(using=JsonDateListDeserializer.class)
    private List<Date> custExtrCycleDt;//고객추출주기내용    ( 날짜 선택 )


    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creStartDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creEndDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleStartDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleEndDtFormat;

    private String docId;

    private Double actTotAmt;

    private String carRegNo;

    private String stsfIvstYn;


    /**
     * 대상딜러코드
     **/
//    @NotEmpty

    private  String targDlrCd;

    /**
     * 대상딜러명
     **/

    private  String targDlrNm;

    /**
     * 대상여부
     **/

    private  String targYn;

    /**
     * 체크박스 플래그
     **/

    private  String flagYn;


    public String gethDlrCd() {
        return hDlrCd;
    }

    public void sethDlrCd(String hDlrCd) {
        this.hDlrCd = hDlrCd;
    }

    public String gettDlrCd() {
        return tDlrCd;
    }

    public void settDlrCd(String tDlrCd) {
        this.tDlrCd = tDlrCd;
    }

    public String gethPltCd() {
        return hPltCd;
    }

    public void sethPltCd(String hPltCd) {
        this.hPltCd = hPltCd;
    }

    public String gethMakCd() {
        return hMakCd;
    }

    public void sethMakCd(String hMakCd) {
        this.hMakCd = hMakCd;
    }

    public String gettMakCd() {
        return tMakCd;
    }

    public void settMakCd(String tMakCd) {
        this.tMakCd = tMakCd;
    }

    public String getMakCd() {
        return makCd;
    }

    public void setMakCd(String makCd) {
        this.makCd = makCd;
    }

    public String getMakNm() {
        return makNm;
    }

    public void setMakNm(String makNm) {
        this.makNm = makNm;
    }

    public String getHostCd() {
        return hostCd;
    }

    public void setHostCd(String hostCd) {
        this.hostCd = hostCd;
    }

    public String getHostTeamCd() {
        return hostTeamCd;
    }

    public void setHostTeamCd(String hostTeamCd) {
        this.hostTeamCd = hostTeamCd;
    }

    public String getMakTpCd() {
        return makTpCd;
    }

    public void setMakTpCd(String makTpCd) {
        this.makTpCd = makTpCd;
    }

    public String getMakSubTpCd() {
        return makSubTpCd;
    }

    public void setMakSubTpCd(String makSubTpCd) {
        this.makSubTpCd = makSubTpCd;
    }

    public String getRcpeNm() {
        return rcpeNm;
    }

    public void setRcpeNm(String rcpeNm) {
        this.rcpeNm = rcpeNm;
    }

    public Date getStartDt() {
        return startDt;
    }

    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    public Date getEndDt() {
        return endDt;
    }

    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }

    public int getPrid() {
        return prid;
    }

    public void setPrid(int prid) {
        this.prid = prid;
    }

    public String getPlaceNm() {
        return placeNm;
    }

    public void setPlaceNm(String placeNm) {
        this.placeNm = placeNm;
    }

    public String getAapCmpNm() {
        return aapCmpNm;
    }

    public void setAapCmpNm(String aapCmpNm) {
        this.aapCmpNm = aapCmpNm;
    }

    public String getStatCd() {
        return statCd;
    }

    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }

    public int getTargCustCnt() {
        return targCustCnt;
    }

    public void setTargCustCnt(int targCustCnt) {
        this.targCustCnt = targCustCnt;
    }

    public int getRealCustCnt() {
        return realCustCnt;
    }

    public void setRealCustCnt(int realCustCnt) {
        this.realCustCnt = realCustCnt;
    }

    public int getPgssRate() {
        return pgssRate;
    }

    public void setPgssRate(int pgssRate) {
        this.pgssRate = pgssRate;
    }

    public String getActiveNm() {
        return activeNm;
    }

    public void setActiveNm(String activeNm) {
        this.activeNm = activeNm;
    }

    public String getActiveCont() {
        return activeCont;
    }

    public void setActiveCont(String activeCont) {
        this.activeCont = activeCont;
    }

    public String getActiveFileDocNo() {
        return activeFileDocNo;
    }

    public void setActiveFileDocNo(String activeFileDocNo) {
        this.activeFileDocNo = activeFileDocNo;
    }

    public int getAdInvtHm() {
        return adInvtHm;
    }

    public void setAdInvtHm(int adInvtHm) {
        this.adInvtHm = adInvtHm;
    }

    public String getAdMediaCd() {
        return adMediaCd;
    }

    public void setAdMediaCd(String adMediaCd) {
        this.adMediaCd = adMediaCd;
    }

    public int getAdCostAmt() {
        return adCostAmt;
    }

    public void setAdCostAmt(int adCostAmt) {
        this.adCostAmt = adCostAmt;
    }

    public Date getAdStartDt() {
        return adStartDt;
    }

    public void setAdStartDt(Date adStartDt) {
        this.adStartDt = adStartDt;
    }

    public Date getAdEndDt() {
        return adEndDt;
    }

    public void setAdEndDt(Date adEndDt) {
        this.adEndDt = adEndDt;
    }

    public int getvAdInvtHm() {
        return vAdInvtHm;
    }

    public void setvAdInvtHm(int vAdInvtHm) {
        this.vAdInvtHm = vAdInvtHm;
    }

    public String getvAdMediaCd() {
        return vAdMediaCd;
    }

    public void setvAdMediaCd(String vAdMediaCd) {
        this.vAdMediaCd = vAdMediaCd;
    }

    public int getvAdCostAmt() {
        return vAdCostAmt;
    }

    public void setvAdCostAmt(int vAdCostAmt) {
        this.vAdCostAmt = vAdCostAmt;
    }

    public Date getvAdStartDt() {
        return vAdStartDt;
    }

    public void setvAdStartDt(Date vAdStartDt) {
        this.vAdStartDt = vAdStartDt;
    }

    public Date getvAdEndDt() {
        return vAdEndDt;
    }

    public void setvAdEndDt(Date vAdEndDt) {
        this.vAdEndDt = vAdEndDt;
    }

    public String getApprDocNo() {
        return apprDocNo;
    }

    public void setApprDocNo(String apprDocNo) {
        this.apprDocNo = apprDocNo;
    }

    public String getSignDocId() {
        return signDocId;
    }

    public void setSignDocId(String signDocId) {
        this.signDocId = signDocId;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    public String getRcpeAutoYn() {
        return rcpeAutoYn;
    }

    public void setRcpeAutoYn(String rcpeAutoYn) {
        this.rcpeAutoYn = rcpeAutoYn;
    }

    public String getRegUsrId() {
        return regUsrId;
    }

    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    public String getUpdtUsrId() {
        return updtUsrId;
    }

    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    public Date getUpdtDt() {
        return updtDt;
    }

    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    public String getMakCont() {
        return makCont;
    }

    public void setMakCont(String makCont) {
        this.makCont = makCont;
    }

    public String getCmmCd() {
        return cmmCd;
    }

    public void setCmmCd(String cmmCd) {
        this.cmmCd = cmmCd;
    }

    public String getCmmCdNm() {
        return cmmCdNm;
    }

    public void setCmmCdNm(String cmmCdNm) {
        this.cmmCdNm = cmmCdNm;
    }

    public String getHostNm() {
        return hostNm;
    }

    public void setHostNm(String hostNm) {
        this.hostNm = hostNm;
    }

    public String getHostTeamNm() {
        return hostTeamNm;
    }

    public void setHostTeamNm(String hostTeamNm) {
        this.hostTeamNm = hostTeamNm;
    }

    public String getMakTpSubTpNm() {
        return makTpSubTpNm;
    }

    public void setMakTpSubTpNm(String makTpSubTpNm) {
        this.makTpSubTpNm = makTpSubTpNm;
    }

    public String getStatNm() {
        return statNm;
    }

    public void setStatNm(String statNm) {
        this.statNm = statNm;
    }

    public String getTalkPlan() {
        return talkPlan;
    }

    public void setTalkPlan(String talkPlan) {
        this.talkPlan = talkPlan;
    }

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getPltCd() {
        return pltCd;
    }

    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    public String getLangCd() {
        return langCd;
    }

    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    public String getActiveMthSeq() {
        return activeMthSeq;
    }

    public void setActiveMthSeq(String activeMthSeq) {
        this.activeMthSeq = activeMthSeq;
    }

    public String getActiveMthTpCd() {
        return activeMthTpCd;
    }

    public void setActiveMthTpCd(String activeMthTpCd) {
        this.activeMthTpCd = activeMthTpCd;
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

    public String getBudgetCd() {
        return budgetCd;
    }

    public void setBudgetCd(String budgetCd) {
        this.budgetCd = budgetCd;
    }

    public String getBudgetNm() {
        return budgetNm;
    }

    public void setBudgetNm(String budgetNm) {
        this.budgetNm = budgetNm;
    }

    public String getBudgetDetlCont() {
        return budgetDetlCont;
    }

    public void setBudgetDetlCont(String budgetDetlCont) {
        this.budgetDetlCont = budgetDetlCont;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getTargCd() {
        return targCd;
    }

    public void setTargCd(String targCd) {
        this.targCd = targCd;
    }

    public String getTargNm() {
        return targNm;
    }

    public void setTargNm(String targNm) {
        this.targNm = targNm;
    }

    public int getTargCntVal() {
        return targCntVal;
    }

    public void setTargCntVal(int targCntVal) {
        this.targCntVal = targCntVal;
    }

    public int getTargRsltVal() {
        return targRsltVal;
    }

    public void setTargRsltVal(int targRsltVal) {
        this.targRsltVal = targRsltVal;
    }

    public String getIvstTp() {
        return ivstTp;
    }

    public void setIvstTp(String ivstTp) {
        this.ivstTp = ivstTp;
    }

    public String getPrsnOpnCont() {
        return prsnOpnCont;
    }

    public void setPrsnOpnCont(String prsnOpnCont) {
        this.prsnOpnCont = prsnOpnCont;
    }

    public int getStsfIvstRsltSeq() {
        return stsfIvstRsltSeq;
    }

    public void setStsfIvstRsltSeq(int stsfIvstRsltSeq) {
        this.stsfIvstRsltSeq = stsfIvstRsltSeq;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getEmpNm() {
        return empNm;
    }

    public void setEmpNm(String empNm) {
        this.empNm = empNm;
    }

    public int getSsfIvstScoreVal() {
        return ssfIvstScoreVal;
    }

    public void setSsfIvstScoreVal(int ssfIvstScoreVal) {
        this.ssfIvstScoreVal = ssfIvstScoreVal;
    }

    public Date getStsfIvstDt() {
        return stsfIvstDt;
    }

    public void setStsfIvstDt(Date stsfIvstDt) {
        this.stsfIvstDt = stsfIvstDt;
    }

    public int getSsfIvstSeq() {
        return ssfIvstSeq;
    }

    public void setSsfIvstSeq(int ssfIvstSeq) {
        this.ssfIvstSeq = ssfIvstSeq;
    }

    public int getSubyTmplSeq() {
        return subyTmplSeq;
    }

    public void setSubyTmplSeq(int subyTmplSeq) {
        this.subyTmplSeq = subyTmplSeq;
    }

    public int getExtrDgreCnt() {
        return extrDgreCnt;
    }

    public void setExtrDgreCnt(int extrDgreCnt) {
        this.extrDgreCnt = extrDgreCnt;
    }

    public String getCustNo() {
        return custNo;
    }

    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    public String getCustNm() {
        return custNm;
    }

    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    public String getCustExtrTermNo() {
        return custExtrTermNo;
    }

    public void setCustExtrTermNo(String custExtrTermNo) {
        this.custExtrTermNo = custExtrTermNo;
    }

    public String getTelNo() {
        return telNo;
    }

    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    public String getHpNo() {
        return hpNo;
    }

    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    public String getWechatId() {
        return wechatId;
    }

    public void setWechatId(String wechatId) {
        this.wechatId = wechatId;
    }

    public String getEmailNm() {
        return emailNm;
    }

    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
    }

    public String getSungNm() {
        return sungNm;
    }

    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }

    public String getCityNm() {
        return cityNm;
    }

    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }

    public String getDistNm() {
        return distNm;
    }

    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    public String getZipCd() {
        return zipCd;
    }

    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }

    public String getExtZipCd() {
        return extZipCd;
    }

    public void setExtZipCd(String extZipCd) {
        this.extZipCd = extZipCd;
    }

    public String getAddrNm() {
        return addrNm;
    }

    public void setAddrNm(String addrNm) {
        this.addrNm = addrNm;
    }

    public String getAddrDetlCont() {
        return addrDetlCont;
    }

    public void setAddrDetlCont(String addrDetlCont) {
        this.addrDetlCont = addrDetlCont;
    }

    public Date getSmsSendDt() {
        return smsSendDt;
    }

    public void setSmsSendDt(Date smsSendDt) {
        this.smsSendDt = smsSendDt;
    }

    public String getSmsSendRsltCont() {
        return smsSendRsltCont;
    }

    public void setSmsSendRsltCont(String smsSendRsltCont) {
        this.smsSendRsltCont = smsSendRsltCont;
    }

    public Date getCallCenSendDt() {
        return callCenSendDt;
    }

    public void setCallCenSendDt(Date callCenSendDt) {
        this.callCenSendDt = callCenSendDt;
    }

    public String getCallCenRsltCont() {
        return callCenRsltCont;
    }

    public void setCallCenRsltCont(String callCenRsltCont) {
        this.callCenRsltCont = callCenRsltCont;
    }

    public Date getSaleSendDt() {
        return saleSendDt;
    }

    public void setSaleSendDt(Date saleSendDt) {
        this.saleSendDt = saleSendDt;
    }

    public String getSaleKeyNm() {
        return saleKeyNm;
    }

    public void setSaleKeyNm(String saleKeyNm) {
        this.saleKeyNm = saleKeyNm;
    }

    public String getSaleRsltCont() {
        return saleRsltCont;
    }

    public void setSaleRsltCont(String saleRsltCont) {
        this.saleRsltCont = saleRsltCont;
    }

    public Date getSerSendDt() {
        return serSendDt;
    }

    public void setSerSendDt(Date serSendDt) {
        this.serSendDt = serSendDt;
    }

    public String getSerKeyNm() {
        return serKeyNm;
    }

    public void setSerKeyNm(String serKeyNm) {
        this.serKeyNm = serKeyNm;
    }

    public String getSerRsltCont() {
        return serRsltCont;
    }

    public void setSerRsltCont(String serRsltCont) {
        this.serRsltCont = serRsltCont;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public int getCallSeq() {
        return callSeq;
    }

    public void setCallSeq(int callSeq) {
        this.callSeq = callSeq;
    }

    public String getCustExtrTitleNm() {
        return custExtrTitleNm;
    }

    public void setCustExtrTitleNm(String custExtrTitleNm) {
        this.custExtrTitleNm = custExtrTitleNm;
    }

    public String getExtrStatCd() {
        return extrStatCd;
    }

    public void setExtrStatCd(String extrStatCd) {
        this.extrStatCd = extrStatCd;
    }

    public int getRealTargetCnt() {
        return realTargetCnt;
    }

    public void setRealTargetCnt(int realTargetCnt) {
        this.realTargetCnt = realTargetCnt;
    }

    public Date getExtrDt() {
        return extrDt;
    }

    public void setExtrDt(Date extrDt) {
        this.extrDt = extrDt;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getCustExtrAutoYn() {
        return custExtrAutoYn;
    }

    public void setCustExtrAutoYn(String custExtrAutoYn) {
        this.custExtrAutoYn = custExtrAutoYn;
    }

    public String getCustExtrCycleCont() {
        return custExtrCycleCont;
    }

    public void setCustExtrCycleCont(String custExtrCycleCont) {
        this.custExtrCycleCont = custExtrCycleCont;
    }

    public String getDupYn() {
        return dupYn;
    }

    public void setDupYn(String dupYn) {
        this.dupYn = dupYn;
    }

    public Date getCreStartDt() {
        return creStartDt;
    }

    public void setCreStartDt(Date creStartDt) {
        this.creStartDt = creStartDt;
    }

    public Date getCreEndDt() {
        return creEndDt;
    }

    public void setCreEndDt(Date creEndDt) {
        this.creEndDt = creEndDt;
    }

    public Date getSaleStartDt() {
        return saleStartDt;
    }

    public void setSaleStartDt(Date saleStartDt) {
        this.saleStartDt = saleStartDt;
    }

    public Date getSaleEndDt() {
        return saleEndDt;
    }

    public void setSaleEndDt(Date saleEndDt) {
        this.saleEndDt = saleEndDt;
    }

    public String getCrEndTp() {
        return crEndTp;
    }

    public void setCrEndTp(String crEndTp) {
        this.crEndTp = crEndTp;
    }

    public String getCrIsaNm() {
        return crIsaNm;
    }

    public void setCrIsaNm(String crIsaNm) {
        this.crIsaNm = crIsaNm;
    }

    public String getCrNo() {
        return crNo;
    }

    public void setCrNo(String crNo) {
        this.crNo = crNo;
    }

    public String getCrTp() {
        return crTp;
    }

    public void setCrTp(String crTp) {
        this.crTp = crTp;
    }

    public String getCrNm() {
        return crNm;
    }

    public void setCrNm(String crNm) {
        this.crNm = crNm;
    }

    public String getLbrCd() {
        return lbrCd;
    }

    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    public String getLbrNm() {
        return lbrNm;
    }

    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    public int getLbrQty() {
        return lbrQty;
    }

    public void setLbrQty(int lbrQty) {
        this.lbrQty = lbrQty;
    }

    public Double getLbrHm() {
        return lbrHm;
    }

    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }

    public Double getLbrAmt() {
        return lbrAmt;
    }

    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    public Double getLbrRate() {
        return lbrRate;
    }

    public void setLbrRate(Double lbrRate) {
        this.lbrRate = lbrRate;
    }

    public Double getLbrPrc() {
        return lbrPrc;
    }

    public void setLbrPrc(Double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    public Double getDsAmt() {
        return dsAmt;
    }

    public void setDsAmt(Double dsAmt) {
        this.dsAmt = dsAmt;
    }

    public Double getDsRate() {
        return dsRate;
    }

    public void setDsRate(Double dsRate) {
        this.dsRate = dsRate;
    }

    public Double getLbrTotAmt() {
        return lbrTotAmt;
    }

    public void setLbrTotAmt(Double lbrTotAmt) {
        this.lbrTotAmt = lbrTotAmt;
    }

    public String getLbrTp() {
        return lbrTp;
    }

    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    public String getCauCd() {
        return cauCd;
    }

    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    public String getCauNm() {
        return cauNm;
    }

    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    public String getPhenCd() {
        return phenCd;
    }

    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    public String getPhenNm() {
        return phenNm;
    }

    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
    }

    public String getLtsModelCd() {
        return ltsModelCd;
    }

    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    public String getLtsModelNm() {
        return ltsModelNm;
    }

    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }

    public String getCauItemCd() {
        return cauItemCd;
    }

    public void setCauItemCd(String cauItemCd) {
        this.cauItemCd = cauItemCd;
    }

    public String getCauItemNm() {
        return cauItemNm;
    }

    public void setCauItemNm(String cauItemNm) {
        this.cauItemNm = cauItemNm;
    }

    public String getItemCd() {
        return itemCd;
    }

    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    public String getItemNm() {
        return itemNm;
    }

    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    public Double getItemPrc() {
        return itemPrc;
    }

    public void setItemPrc(Double itemPrc) {
        this.itemPrc = itemPrc;
    }

    public Double getItemAmt() {
        return itemAmt;
    }

    public void setItemAmt(Double itemAmt) {
        this.itemAmt = itemAmt;
    }

    public int getItemQty() {
        return itemQty;
    }

    public void setItemQty(int itemQty) {
        this.itemQty = itemQty;
    }

    public String getStockUnitCd() {
        return stockUnitCd;
    }

    public void setStockUnitCd(String stockUnitCd) {
        this.stockUnitCd = stockUnitCd;
    }


    public String getItemUnitCd() {
        return itemUnitCd;
    }

    public void setItemUnitCd(String itemUnitCd) {
        this.itemUnitCd = itemUnitCd;
    }

    public Double getSalePrcAmt() {
        return salePrcAmt;
    }

    public void setSalePrcAmt(Double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
    }

    public Double getItemTotAmt() {
        return itemTotAmt;
    }

    public void setItemTotAmt(Double itemTotAmt) {
        this.itemTotAmt = itemTotAmt;
    }

    public String getCalcUnitCd() {
        return calcUnitCd;
    }

    public void setCalcUnitCd(String calcUnitCd) {
        this.calcUnitCd = calcUnitCd;
    }

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public Date getUseDt() {
        return useDt;
    }

    public void setUseDt(Date useDt) {
        this.useDt = useDt;
    }

    public String getPcDstinCd() {
        return pcDstinCd;
    }

    public void setPcDstinCd(String pcDstinCd) {
        this.pcDstinCd = pcDstinCd;
    }

    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
    }

    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    public String getCustExtrCycleTp() {
        return custExtrCycleTp;
    }

    public void setCustExtrCycleTp(String custExtrCycleTp) {
        this.custExtrCycleTp = custExtrCycleTp;
    }

    public List<String> getCustExtrCycleWeek() {
        return custExtrCycleWeek;
    }

    public void setCustExtrCycleWeek(List<String> custExtrCycleWeek) {
        this.custExtrCycleWeek = custExtrCycleWeek;
    }

    public List<Date> getCustExtrCycleDt() {
        return custExtrCycleDt;
    }

    public void setCustExtrCycleDt(List<Date> custExtrCycleDt) {
        this.custExtrCycleDt = custExtrCycleDt;
    }

    public Date getRegDtFormat() {
        return regDtFormat;
    }

    public void setRegDtFormat(Date regDtFormat) {
        this.regDtFormat = regDtFormat;
    }

    public Date getStartDtFormat() {
        return startDtFormat;
    }

    public void setStartDtFormat(Date startDtFormat) {
        this.startDtFormat = startDtFormat;
    }

    public Date getEndDtFormat() {
        return endDtFormat;
    }

    public void setEndDtFormat(Date endDtFormat) {
        this.endDtFormat = endDtFormat;
    }

    public Date getCreStartDtFormat() {
        return creStartDtFormat;
    }

    public void setCreStartDtFormat(Date creStartDtFormat) {
        this.creStartDtFormat = creStartDtFormat;
    }

    public Date getCreEndDtFormat() {
        return creEndDtFormat;
    }

    public void setCreEndDtFormat(Date creEndDtFormat) {
        this.creEndDtFormat = creEndDtFormat;
    }

    public Date getSaleStartDtFormat() {
        return saleStartDtFormat;
    }

    public void setSaleStartDtFormat(Date saleStartDtFormat) {
        this.saleStartDtFormat = saleStartDtFormat;
    }

    public Date getSaleEndDtFormat() {
        return saleEndDtFormat;
    }

    public void setSaleEndDtFormat(Date saleEndDtFormat) {
        this.saleEndDtFormat = saleEndDtFormat;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0  : this.setCustNo(ExcelDataBinderUtil.toString(value).trim());       break;    //고객번호
                case 1  : this.setCustNm(ExcelDataBinderUtil.toString(value).trim());       break;    //고객명
                case 2  : this.setTelNo(ExcelDataBinderUtil.toString(value).trim());        break;    //전화번호
                case 3  : this.setHpNo(ExcelDataBinderUtil.toString(value).trim());         break;    //휴대폰번호
                case 4  : this.setWechatId(ExcelDataBinderUtil.toString(value).trim());     break;    //위챗ID
                case 5  : this.setEmailNm(ExcelDataBinderUtil.toString(value).trim());      break;    //이메일명
                case 6  : this.setSungNm(ExcelDataBinderUtil.toString(value).trim());       break;    //성명
                case 7  : this.setCityNm(ExcelDataBinderUtil.toString(value).trim());       break;    //도시명
                case 8  : this.setDistNm(ExcelDataBinderUtil.toString(value).trim());       break;    //지역명
                case 9  : this.setZipCd(ExcelDataBinderUtil.toString(value).trim());        break;    //우편번호
                case 10 : this.setExtZipCd(ExcelDataBinderUtil.toString(value).trim());     break;    //확장우편번호
                case 11 : this.setAddrNm(ExcelDataBinderUtil.toString(value).trim());       break;    //주소명
                case 12 : this.setAddrDetlCont(ExcelDataBinderUtil.toString(value).trim()); break;    //주소상세내용
                case 13 : this.setBlueMembershipYn(ExcelDataBinderUtil.toString(value).trim()); break;    //블루멤버십회원
                case 14 : this.setMembershipYn(ExcelDataBinderUtil.toString(value).trim()); break;    //딜러회원
                case 15 : this.setCarRegNo(ExcelDataBinderUtil.toString(value).trim()); break;    //차량등록번호
                case 16 : this.setCarlineCd(ExcelDataBinderUtil.toString(value).trim()); break;    //차종
                case 17 : this.setModelCd(ExcelDataBinderUtil.toString(value).trim()); break;    //차관(모델)
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        //고객번호
        if(StringUtils.isBlank(this.getCustNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCustNo(), msg));
        }

        //고객명
        if(StringUtils.isBlank(this.getCustNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCustNm(), msg));
        }

        return errors;
    }

    /**
     * @return the membershipYn
     */
    public String getMembershipYn() {
        return membershipYn;
    }

    /**
     * @param membershipYn the membershipYn to set
     */
    public void setMembershipYn(String membershipYn) {
        this.membershipYn = membershipYn;
    }

    /**
     * @return the blueMembershipYn
     */
    public String getBlueMembershipYn() {
        return blueMembershipYn;
    }

    /**
     * @param blueMembershipYn the blueMembershipYn to set
     */
    public void setBlueMembershipYn(String blueMembershipYn) {
        this.blueMembershipYn = blueMembershipYn;
    }

    /**
     * @return the stsfIvstSeq
     */
    public int getStsfIvstSeq() {
        return stsfIvstSeq;
    }

    /**
     * @param stsfIvstSeq the stsfIvstSeq to set
     */
    public void setStsfIvstSeq(int stsfIvstSeq) {
        this.stsfIvstSeq = stsfIvstSeq;
    }

    /**
     * @return the extractSeq
     */
    public int getExtractSeq() {
        return extractSeq;
    }

    /**
     * @param extractSeq the extractSeq to set
     */
    public void setExtractSeq(int extractSeq) {
        this.extractSeq = extractSeq;
    }

    /**
     * @return the docId
     */
    public String getDocId() {
        return docId;
    }

    /**
     * @param docId the docId to set
     */
    public void setDocId(String docId) {
        this.docId = docId;
    }

    /**
     * @return the stsfIvstScoreVal
     */
    public int getStsfIvstScoreVal() {
        return stsfIvstScoreVal;
    }

    /**
     * @param stsfIvstScoreVal the stsfIvstScoreVal to set
     */
    public void setStsfIvstScoreVal(int stsfIvstScoreVal) {
        this.stsfIvstScoreVal = stsfIvstScoreVal;
    }

    /**
     * @return the actTotAmt
     */
    public Double getActTotAmt() {
        return actTotAmt;
    }

    /**
     * @param actTotAmt the actTotAmt to set
     */
    public void setActTotAmt(Double actTotAmt) {
        this.actTotAmt = actTotAmt;
    }

    /**
     * @return the befMakTpCd
     */
    public String getBefMakTpCd() {
        return befMakTpCd;
    }

    /**
     * @param befMakTpCd the befMakTpCd to set
     */
    public void setBefMakTpCd(String befMakTpCd) {
        this.befMakTpCd = befMakTpCd;
    }

    /**
     * @return the stsfIvstYn
     */
    public String getStsfIvstYn() {
        return stsfIvstYn;
    }

    /**
     * @param stsfIvstYn the stsfIvstYn to set
     */
    public void setStsfIvstYn(String stsfIvstYn) {
        this.stsfIvstYn = stsfIvstYn;
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
     * @return the copyNewMakCd
     */
    public String getCopyNewMakCd() {
        return copyNewMakCd;
    }

    /**
     * @param copyNewMakCd the copyNewMakCd to set
     */
    public void setCopyNewMakCd(String copyNewMakCd) {
        this.copyNewMakCd = copyNewMakCd;
    }

    /**
     * @return the targDlrCd
     */
    public String getTargDlrCd() {
        return targDlrCd;
    }

    /**
     * @param targDlrCd the targDlrCd to set
     */
    public void setTargDlrCd(String targDlrCd) {
        this.targDlrCd = targDlrCd;
    }

    /**
     * @return the targDlrNm
     */
    public String getTargDlrNm() {
        return targDlrNm;
    }

    /**
     * @param targDlrNm the targDlrNm to set
     */
    public void setTargDlrNm(String targDlrNm) {
        this.targDlrNm = targDlrNm;
    }

    /**
     * @return the targYn
     */
    public String getTargYn() {
        return targYn;
    }

    /**
     * @param targYn the targYn to set
     */
    public void setTargYn(String targYn) {
        this.targYn = targYn;
    }

    /**
     * @return the flagYn
     */
    public String getFlagYn() {
        return flagYn;
    }

    /**
     * @param flagYn the flagYn to set
     */
    public void setFlagYn(String flagYn) {
        this.flagYn = flagYn;
    }

    /**
     * @param custDlrCd the custDlrCd to set
     */
    public void setCustDlrCd(String custDlrCd) {
        this.custDlrCd = custDlrCd;
    }

    /**
     * @return the custDlrCd
     */
    public String getCustDlrCd() {
        return custDlrCd;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @return the budgetAmt
     */
    public double getBudgetAmt() {
        return budgetAmt;
    }

    /**
     * @param budgetAmt the budgetAmt to set
     */
    public void setBudgetAmt(double budgetAmt) {
        this.budgetAmt = budgetAmt;
    }

    /**
     * @return the corpBudnRate
     */
    public double getCorpBudnRate() {
        return corpBudnRate;
    }

    /**
     * @param corpBudnRate the corpBudnRate to set
     */
    public void setCorpBudnRate(double corpBudnRate) {
        this.corpBudnRate = corpBudnRate;
    }

    /**
     * @return the imsSuptAmt
     */
    public double getImsSuptAmt() {
        return imsSuptAmt;
    }

    /**
     * @param imsSuptAmt the imsSuptAmt to set
     */
    public void setImsSuptAmt(double imsSuptAmt) {
        this.imsSuptAmt = imsSuptAmt;
    }

}