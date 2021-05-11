package chn.bhmc.dms.crm.cso.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;


/**
 * 판매기회프로세스  VO
 *
 * @ClassName   : SalesOpptProcessMgmtVO.java
 * @Description : SalesOpptProcessMgmtVO
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     kyo jin lee      Created First
 * </pre>
 */

public class SalesOpptProcessMgmtVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1359406153916127489L;

    /**
     * 일련번호
     **/
    private String seq;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 고객번호
     **/
    //CUST_NO
    private String custNo;

    /**
     * 고객명
     **/
    //CUST_NM
    private String custNm;

    /**
     * 고객유형
     **/
    //CUST_TP
    private String custTp;

    /**
     * 고객타입
     **/
    //CUST_CD
    private String custCd;
    private String custCdNm;

    /**
     * 관리SCID
     **/
    //MNG_SC_ID
    private String mngScId;
    private String befMngScId;
    private String befMngScNm;
    private String custMngScId;   // 고객읜 판매고문

    /**
     * 이메일명
     **/
    //EMAIL_NM
    private String emailNm;

    /**
     * 위챗ID
     **/
    //WECHAT_ID
    private String wechatId;

    /**
     * 선호연락방법코드
     **/
    //PREF_COMM_MTH_CD
    private String prefCommMthCd;

    /**
     * 선호연락번호
     **/
    //PREF_COMM_NO

    private String prefCommNo;

    /**
     * 선호접촉방법코드
     **/
    //PREF_CONTACT_MTH_CD

    private String prefContactMthCd;

    /**
     * 선호접촉시간코드
     **/
    //PREF_CONTACT_HM_CD

    private String prefContactHmCd;

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
     * 직장명
     **/
    //OFFICE_NM

    private String officeNm;

    /**
     * 부서명
     **/
    //DEPT_NM

    private String deptNm;

    /**
     * 직장전화번호
     **/
    //OFFICE_TEL_NO

    private String officeTelNo;

    /**
     * 직장팩스번호
     **/
    //OFFICE_FAX_NO

    private String officeFaxNo;

    /**
     * 대표자명
     **/
    //OWN_RGST_NM

    private String ownRgstNm;

    /**
     * 성별코드
     **/
    //SEX_CD

    private String sexCd;

    /**
     * 삭제여부
     **/


    private String delYn;

    /**
     * BHMC여부
     **/


    private String bhmcYn;

    /**
     * SIEBEL ROW ID
     **/
    //SIEBEL_ROW_ID

    private String siebelRowId;

    /**
     * 문서ID
     **/
    //DOC_ID

    private String docId;

    /**
     * 동행자명
     **/
    //WITH_PRSN_NM

    private String withPrsnNm;

    /**
     * 재방문여부
     **/

    private String rvsitYn;
    private String rvsitYnNm;
    /**
     * 방문예약일자
     **/
    //VSIT_RESV_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitResvDt;

    /**
     * 방문일자
     **/
    //VSIT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitDt;

    /**
     * 방문자수
     **/
    //VSIT_PRSN_CNT

    private  Integer                 vsitPrsnCnt;

    /**
     * 방문종료일자
     **/
    //VSIT_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitEndDt;

    /**
     * 정보유형
     **/
    //INFO_TP

    private String infoTp;

    /**
     * 정보경로코드
     **/
    //INFO_PATH_CD

    private String infoPathCd;

    /**
     * 지불유형
     **/
    //PAY_TP

    private String payTp;

    /**
     * 관심브랜드코드
     **/
    //INTR_BRAND_CD

    private String intrBrandCd;

    /**
     * 관심차종코드
     **/
    //INTR_CARLINE_CD

    private String intrCarlineCd;

    /**
     * 관심모델코드
     **/
    //INTR_MODEL_CD

    private String intrModelCd;

    /**
     * 현지번호판예정번호
     **/
    //NAT_NOF_SCHE_NO

    private String natNofScheNo;
    private String localCarRegNoYn;

    /**
     * 견적내용
     **/
    //ESTIMATE_CONT

    private String estimateCont;

    /**
     * 영업내용
     **/
    //SALES_CONT

    private String salesCont;

    /**
     * 비고
     **/
    //REMARK

    private String remark;

    /**
     * 리드레벨코드
     **/
    //LEAD_LVL_CD

    private String leadLvlCd;

    /**
     * 리드상태코드
     **/
    //LEAD_STAT_CD

    private String leadStatCd;
    private String bfLeadStatCd;

    /**
     * OB담당자ID
     **/
    //OB_PRSN_ID

    private String obPrsnId;

    /**
     * 등록자ID
     **/


    private String regUsrId;

    /**
     * 등록일자
     **/

    @JsonDeserialize(using=JsonDateDeserializer.class)
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
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 선호색상코드
     **/
    //INTR_COLOR_CD

    private String intrColorCd;

    /**
     * 추적등급코드
     **/
    //TRACE_GRADE_CD

    private String traceGradeCd;

    /**
     * 유효등급코드
     **/
    //VALID_GRADE_CD

    private String validGradeCd;

    /**
     * 무효원인코드
     **/
    //INVALID_CAU_CD

    private String invalidCauCd;

    /**
     * 실패원인코드
     **/
    //FAIL_CAU_CD

    private String failCauCd;

    /**
     * 실패원인사유내용
     **/
    //FAIL_CAU_REASON_CONT

    private String failCauReasonCont;

    /**
     * 구매선택차종코드
     **/
    //PURC_SEL_CARLINE_CD

    private String purcSelCarlineCd;

    /**
     * 구매선택모델코드
     **/
    //PURC_SEL_MODEL_CD

    private String purcSelModelCd;

    /**
     * 예상구매시간코드
     **/
    //EXPC_PURC_HM_CD

    private String expcPurcHmCd;

    /**
     * 예상구매일자
     **/
    //EXPC_PURC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcPurcDt;

    /**
     * 예상거래가격
     **/
    //EXPC_DEAL_PRC
    //@Digits(integer=100,fraction=0)
    private  Integer                 expcDealPrc;

    /**
     * 추적일자
     **/
    //TRACE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date traceDt;

    /**
     * 추적방법코드
     **/
    //TRACE_MTH_CD

    private String traceMthCd;

    /**
     * 다음추적일자
     **/
    //NEXT_TRACE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date nextTraceDt;
    private String nextTraceDtNullUpdYn;

    /**
     * 다음추적방법코드
     **/
    //NEXT_TRACE_MTH_CD

    private String nextTraceMthCd;

    private String custTpNm;    // CUST_TP_NM
    private String prefCommMthNm;    // PREF_COMM_MTH_NM
    private String prefContactMthNm;    // PREF_CONTACT_MTH_NM
    private String prefContactHmNm;    // PREF_CONTACT_HM_NM
    private String sexNm;    // SEX_NM
    private String infoTpNm;    // INFO_TP_NM
    private String infoPathNm;    // INFO_PATH_NM
    private String payTpNm;    // PAY_TP_NM
    private String leadLvlNm;    // LEAD_LVL_NM
    private String leadStatNm;    // LEAD_STAT_NM
    private String traceGradeNm;    // TRACE_GRADE_NM
    private String validGradeNm;    // VALID_GRADE_NM
    private String invalidCauNm;    // INVALID_CAU_NM
    private String failCauNm;    // FAIL_CAU_NM
    private String expcPurcHmNm;    // EXPC_PURC_HM_NM
    private String traceMthNm;    // TRACE_MTH_NM
    private String nextTraceMthNm;    // NEXT_TRACE_MTH_NM
    private String custHoldTpNm;
    private String custHoldTpDtlNm;

    private String custHoldTp;
    private String custHoldTpDtl;

    private String intrCarlineNm;
    private String intrModelNm;
    private String purcSelCarlineNm;
    private String purcSelModelNm;
    private String intrColorNm;

    private String holdTp;
    private Integer holdDetlTpSeq;
    private String holdTpNm;
    private String holdDetlTpSeqNm;
    private String holdDetlTpNm;

    /**
     * 증거유형
     */
    private String mathDocTp;
    private String mathDocTpNm;

    /**
     * 증거번호
     */
    private String ssnCrnNo;

    private String mngScNm;

    private String exhvFlakSeq;

    private String saleOpptSeq;

    /*
     * 같은그리드에서 '판매기회(SALESOPPT)', '전시장 방문(SHOWROOM)' 데이터
     * 함께 사용할때 구분하기 위한 구분값
     */
    private String dataTable;

    private String onDutyYn;

    private String dupSeq;

    private String siebelLeadRowId;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date submitDt;

    /* 전출유형 */
    private String trsfTp;
    private String trsfTpNm;

    /* 심사코드 */
    private String evalCd;
    private String evalNm;


    /* 전체주소 (주요) */
    private String addrFull;

    /**
     * 업종
     */
    private String bizcondCd;
    private String bizcondNm;

    /**
     * 자동전출 값
     */
    private String autoTrsfConf;

    /**
     * 이전판매기회상태코드
     */
    private String befLeadStatCd;
    private String befLeadStatNm;

    /**
     * 생일
     */
    private String birthDt;

    /**
     * 연계인 시퀀스 (법인 연계인)
     */
    private String relSeq;
    private String relCustNo;
    private String relCustNm;
    private String relCustHpNo;
    private String relBefCustNo;

    /**
     * 실패 시 다른 브랜드 입력 필드
     */
    private String otherBrandCd;
    private String otherBrandNm;

    /**
     * 캠페인코드
     */
    private String makCd;

    /**
     * 구매담당자명
     */
    private String purcMngNm;

    private String errorsStr;

    private String reloadFromFailYn;

    private String contractNo;

    private String currLeadStatCd;          // 현재 DB에 있는 LeadStatCd
    private String nextLeadStatCd = "";     // 화면또는 다른곳에서 보내는 LeadStatCd
    private String currMngScId = "";        // 현재 DB에 있는 MngScId
    private String nextMngScId = "";        // 화면또는 다른곳에서 보내는 MngScId


    /**
     * 다음 계약형태
     * NEXT_CONTRACT_TP
     */
    private String nextContractTp;

    /**
     * 계약판매 번호
     * BEFORE_NO
     */
    private String beforeNo;


    /**
     * 판매기회시작 일자 - 최초 또는 다시 라이브 상태(01,02)로 될때
     * LEAD_START_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date leadStartDt;

    /**
     * 진행중이 아닌 판매기회를 신규 등록 시 데이터 리셋.
     */
    private String reSetYn;

    /**
     * 진행중이 아닌 판매기회를 되살림.
     * 신규등록 팝업에서 등록할때 신규 등록 구분자
     */
    private String reviveOppt;

    /**
     * 판매기회진행일련번호
     * C_SEQ
     */
    private String cSeq;

    /**
     * 의향차관
     * INTR_FSCP_MODTP_CD
     */
    private String intrFscpModtpCd;
    private String intrFscpModtpNm;

    /**
     * 구매선택차관
     * PURC_FSCP_MODTP_CD
     */
    private String purcFscpModtpCd;
    private String purcFscpModtpNm;

    /**
     * 판매채널(COM072)
     * DSTB_CHN_CD
     */
    private String dstbChnCd;
    private String dstbChnNm;
    private String purposeTagNm;//线索标签描述
    private String fmsId;//粉丝标识

    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
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
     * @return the mngScId
     */
    public String getMngScId() {
        return mngScId;
    }

    /**
     * @param mngScId the mngScId to set
     */
    public void setMngScId(String mngScId) {
        this.mngScId = mngScId;
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
     * @return the wechatId
     */
    public String getWechatId() {
        return wechatId;
    }

    /**
     * @param wechatId the wechatId to set
     */
    public void setWechatId(String wechatId) {
        this.wechatId = wechatId;
    }

    /**
     * @return the prefCommMthCd
     */
    public String getPrefCommMthCd() {
        return prefCommMthCd;
    }

    /**
     * @param prefCommMthCd the prefCommMthCd to set
     */
    public void setPrefCommMthCd(String prefCommMthCd) {
        this.prefCommMthCd = prefCommMthCd;
    }

    /**
     * @return the prefCommNo
     */
    public String getPrefCommNo() {
        return prefCommNo;
    }

    /**
     * @param prefCommNo the prefCommNo to set
     */
    public void setPrefCommNo(String prefCommNo) {
        this.prefCommNo = prefCommNo;
    }

    /**
     * @return the prefContactMthCd
     */
    public String getPrefContactMthCd() {
        return prefContactMthCd;
    }

    /**
     * @param prefContactMthCd the prefContactMthCd to set
     */
    public void setPrefContactMthCd(String prefContactMthCd) {
        this.prefContactMthCd = prefContactMthCd;
    }

    /**
     * @return the prefContactHmCd
     */
    public String getPrefContactHmCd() {
        return prefContactHmCd;
    }

    /**
     * @param prefContactHmCd the prefContactHmCd to set
     */
    public void setPrefContactHmCd(String prefContactHmCd) {
        this.prefContactHmCd = prefContactHmCd;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    /**
     * @return the officeNm
     */
    public String getOfficeNm() {
        return officeNm;
    }

    /**
     * @param officeNm the officeNm to set
     */
    public void setOfficeNm(String officeNm) {
        this.officeNm = officeNm;
    }

    /**
     * @return the deptNm
     */
    public String getDeptNm() {
        return deptNm;
    }

    /**
     * @param deptNm the deptNm to set
     */
    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }

    /**
     * @return the officeTelNo
     */
    public String getOfficeTelNo() {
        return officeTelNo;
    }

    /**
     * @param officeTelNo the officeTelNo to set
     */
    public void setOfficeTelNo(String officeTelNo) {
        this.officeTelNo = officeTelNo;
    }

    /**
     * @return the officeFaxNo
     */
    public String getOfficeFaxNo() {
        return officeFaxNo;
    }

    /**
     * @param officeFaxNo the officeFaxNo to set
     */
    public void setOfficeFaxNo(String officeFaxNo) {
        this.officeFaxNo = officeFaxNo;
    }

    /**
     * @return the ownRgstNm
     */
    public String getOwnRgstNm() {
        return ownRgstNm;
    }

    /**
     * @param ownRgstNm the ownRgstNm to set
     */
    public void setOwnRgstNm(String ownRgstNm) {
        this.ownRgstNm = ownRgstNm;
    }

    /**
     * @return the sexCd
     */
    public String getSexCd() {
        return sexCd;
    }

    /**
     * @param sexCd the sexCd to set
     */
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @return the bhmcYn
     */
    public String getBhmcYn() {
        return bhmcYn;
    }

    /**
     * @param bhmcYn the bhmcYn to set
     */
    public void setBhmcYn(String bhmcYn) {
        this.bhmcYn = bhmcYn;
    }

    /**
     * @return the siebelRowId
     */
    public String getSiebelRowId() {
        return siebelRowId;
    }

    /**
     * @param siebelRowId the siebelRowId to set
     */
    public void setSiebelRowId(String siebelRowId) {
        this.siebelRowId = siebelRowId;
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
     * @return the withPrsnNm
     */
    public String getWithPrsnNm() {
        return withPrsnNm;
    }

    /**
     * @param withPrsnNm the withPrsnNm to set
     */
    public void setWithPrsnNm(String withPrsnNm) {
        this.withPrsnNm = withPrsnNm;
    }

    /**
     * @return the rvsitYn
     */
    public String getRvsitYn() {
        return rvsitYn;
    }

    /**
     * @param rvsitYn the rvsitYn to set
     */
    public void setRvsitYn(String rvsitYn) {
        this.rvsitYn = rvsitYn;
    }

    /**
     * @return the vsitResvDt
     */
    public Date getVsitResvDt() {
        return vsitResvDt;
    }

    /**
     * @param vsitResvDt the vsitResvDt to set
     */
    public void setVsitResvDt(Date vsitResvDt) {
        this.vsitResvDt = vsitResvDt;
    }

    /**
     * @return the vsitDt
     */
    public Date getVsitDt() {
        return vsitDt;
    }

    /**
     * @param vsitDt the vsitDt to set
     */
    public void setVsitDt(Date vsitDt) {
        this.vsitDt = vsitDt;
    }

    /**
     * @return the vsitEndDt
     */
    public Date getVsitEndDt() {
        return vsitEndDt;
    }

    /**
     * @param vsitEndDt the vsitEndDt to set
     */
    public void setVsitEndDt(Date vsitEndDt) {
        this.vsitEndDt = vsitEndDt;
    }

    /**
     * @return the infoTp
     */
    public String getInfoTp() {
        return infoTp;
    }

    /**
     * @param infoTp the infoTp to set
     */
    public void setInfoTp(String infoTp) {
        this.infoTp = infoTp;
    }

    /**
     * @return the infoPathCd
     */
    public String getInfoPathCd() {
        return infoPathCd;
    }

    /**
     * @param infoPathCd the infoPathCd to set
     */
    public void setInfoPathCd(String infoPathCd) {
        this.infoPathCd = infoPathCd;
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
     * @return the intrBrandCd
     */
    public String getIntrBrandCd() {
        return intrBrandCd;
    }

    /**
     * @param intrBrandCd the intrBrandCd to set
     */
    public void setIntrBrandCd(String intrBrandCd) {
        this.intrBrandCd = intrBrandCd;
    }

    /**
     * @return the intrCarlineCd
     */
    public String getIntrCarlineCd() {
        return intrCarlineCd;
    }

    /**
     * @param intrCarlineCd the intrCarlineCd to set
     */
    public void setIntrCarlineCd(String intrCarlineCd) {
        this.intrCarlineCd = intrCarlineCd;
    }

    /**
     * @return the intrModelCd
     */
    public String getIntrModelCd() {
        return intrModelCd;
    }

    /**
     * @param intrModelCd the intrModelCd to set
     */
    public void setIntrModelCd(String intrModelCd) {
        this.intrModelCd = intrModelCd;
    }

    /**
     * @return the natNofScheNo
     */
    public String getNatNofScheNo() {
        return natNofScheNo;
    }

    /**
     * @param natNofScheNo the natNofScheNo to set
     */
    public void setNatNofScheNo(String natNofScheNo) {
        this.natNofScheNo = natNofScheNo;
    }

    /**
     * @return the estimateCont
     */
    public String getEstimateCont() {
        return estimateCont;
    }

    /**
     * @param estimateCont the estimateCont to set
     */
    public void setEstimateCont(String estimateCont) {
        this.estimateCont = estimateCont;
    }

    /**
     * @return the salesCont
     */
    public String getSalesCont() {
        return salesCont;
    }

    /**
     * @param salesCont the salesCont to set
     */
    public void setSalesCont(String salesCont) {
        this.salesCont = salesCont;
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
     * @return the leadLvlCd
     */
    public String getLeadLvlCd() {
        return leadLvlCd;
    }

    /**
     * @param leadLvlCd the leadLvlCd to set
     */
    public void setLeadLvlCd(String leadLvlCd) {
        this.leadLvlCd = leadLvlCd;
    }

    /**
     * @return the leadStatCd
     */
    public String getLeadStatCd() {
        return leadStatCd;
    }

    /**
     * @param leadStatCd the leadStatCd to set
     */
    public void setLeadStatCd(String leadStatCd) {
        this.leadStatCd = leadStatCd;
    }

    /**
     * @return the obPrsnId
     */
    public String getObPrsnId() {
        return obPrsnId;
    }

    /**
     * @param obPrsnId the obPrsnId to set
     */
    public void setObPrsnId(String obPrsnId) {
        this.obPrsnId = obPrsnId;
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
     * @return the intrColorCd
     */
    public String getIntrColorCd() {
        return intrColorCd;
    }

    /**
     * @param intrColorCd the intrColorCd to set
     */
    public void setIntrColorCd(String intrColorCd) {
        this.intrColorCd = intrColorCd;
    }

    /**
     * @return the traceGradeCd
     */
    public String getTraceGradeCd() {
        return traceGradeCd;
    }

    /**
     * @param traceGradeCd the traceGradeCd to set
     */
    public void setTraceGradeCd(String traceGradeCd) {
        this.traceGradeCd = traceGradeCd;
    }

    /**
     * @return the validGradeCd
     */
    public String getValidGradeCd() {
        return validGradeCd;
    }

    /**
     * @param validGradeCd the validGradeCd to set
     */
    public void setValidGradeCd(String validGradeCd) {
        this.validGradeCd = validGradeCd;
    }

    /**
     * @return the invalidCauCd
     */
    public String getInvalidCauCd() {
        return invalidCauCd;
    }

    /**
     * @param invalidCauCd the invalidCauCd to set
     */
    public void setInvalidCauCd(String invalidCauCd) {
        this.invalidCauCd = invalidCauCd;
    }

    /**
     * @return the failCauCd
     */
    public String getFailCauCd() {
        return failCauCd;
    }

    /**
     * @param failCauCd the failCauCd to set
     */
    public void setFailCauCd(String failCauCd) {
        this.failCauCd = failCauCd;
    }

    /**
     * @return the failCauReasonCont
     */
    public String getFailCauReasonCont() {
        return failCauReasonCont;
    }

    /**
     * @param failCauReasonCont the failCauReasonCont to set
     */
    public void setFailCauReasonCont(String failCauReasonCont) {
        this.failCauReasonCont = failCauReasonCont;
    }

    /**
     * @return the purcSelCarlineCd
     */
    public String getPurcSelCarlineCd() {
        return purcSelCarlineCd;
    }

    /**
     * @param purcSelCarlineCd the purcSelCarlineCd to set
     */
    public void setPurcSelCarlineCd(String purcSelCarlineCd) {
        this.purcSelCarlineCd = purcSelCarlineCd;
    }

    /**
     * @return the purcSelModelCd
     */
    public String getPurcSelModelCd() {
        return purcSelModelCd;
    }

    /**
     * @param purcSelModelCd the purcSelModelCd to set
     */
    public void setPurcSelModelCd(String purcSelModelCd) {
        this.purcSelModelCd = purcSelModelCd;
    }

    /**
     * @return the expcPurcHmCd
     */
    public String getExpcPurcHmCd() {
        return expcPurcHmCd;
    }

    /**
     * @param expcPurcHmCd the expcPurcHmCd to set
     */
    public void setExpcPurcHmCd(String expcPurcHmCd) {
        this.expcPurcHmCd = expcPurcHmCd;
    }

    /**
     * @return the expcPurcDt
     */
    public Date getExpcPurcDt() {
        return expcPurcDt;
    }

    /**
     * @param expcPurcDt the expcPurcDt to set
     */
    public void setExpcPurcDt(Date expcPurcDt) {
        this.expcPurcDt = expcPurcDt;
    }

    /**
     * @return the traceDt
     */
    public Date getTraceDt() {
        return traceDt;
    }

    /**
     * @param traceDt the traceDt to set
     */
    public void setTraceDt(Date traceDt) {
        this.traceDt = traceDt;
    }

    /**
     * @return the traceMthCd
     */
    public String getTraceMthCd() {
        return traceMthCd;
    }

    /**
     * @param traceMthCd the traceMthCd to set
     */
    public void setTraceMthCd(String traceMthCd) {
        this.traceMthCd = traceMthCd;
    }

    /**
     * @return the nextTraceDt
     */
    public Date getNextTraceDt() {
        return nextTraceDt;
    }

    /**
     * @param nextTraceDt the nextTraceDt to set
     */
    public void setNextTraceDt(Date nextTraceDt) {
        this.nextTraceDt = nextTraceDt;
    }

    /**
     * @return the nextTraceMthCd
     */
    public String getNextTraceMthCd() {
        return nextTraceMthCd;
    }

    /**
     * @param nextTraceMthCd the nextTraceMthCd to set
     */
    public void setNextTraceMthCd(String nextTraceMthCd) {
        this.nextTraceMthCd = nextTraceMthCd;
    }

    /**
     * @return the custTpNm
     */
    public String getCustTpNm() {
        return custTpNm;
    }

    /**
     * @param custTpNm the custTpNm to set
     */
    public void setCustTpNm(String custTpNm) {
        this.custTpNm = custTpNm;
    }

    /**
     * @return the prefCommMthNm
     */
    public String getPrefCommMthNm() {
        return prefCommMthNm;
    }

    /**
     * @param prefCommMthNm the prefCommMthNm to set
     */
    public void setPrefCommMthNm(String prefCommMthNm) {
        this.prefCommMthNm = prefCommMthNm;
    }

    /**
     * @return the prefContactMthNm
     */
    public String getPrefContactMthNm() {
        return prefContactMthNm;
    }

    /**
     * @param prefContactMthNm the prefContactMthNm to set
     */
    public void setPrefContactMthNm(String prefContactMthNm) {
        this.prefContactMthNm = prefContactMthNm;
    }

    /**
     * @return the prefContactHmNm
     */
    public String getPrefContactHmNm() {
        return prefContactHmNm;
    }

    /**
     * @param prefContactHmNm the prefContactHmNm to set
     */
    public void setPrefContactHmNm(String prefContactHmNm) {
        this.prefContactHmNm = prefContactHmNm;
    }

    /**
     * @return the sexNm
     */
    public String getSexNm() {
        return sexNm;
    }

    /**
     * @param sexNm the sexNm to set
     */
    public void setSexNm(String sexNm) {
        this.sexNm = sexNm;
    }

    /**
     * @return the infoTpNm
     */
    public String getInfoTpNm() {
        return infoTpNm;
    }

    /**
     * @param infoTpNm the infoTpNm to set
     */
    public void setInfoTpNm(String infoTpNm) {
        this.infoTpNm = infoTpNm;
    }

    /**
     * @return the infoPathNm
     */
    public String getInfoPathNm() {
        return infoPathNm;
    }

    /**
     * @param infoPathNm the infoPathNm to set
     */
    public void setInfoPathNm(String infoPathNm) {
        this.infoPathNm = infoPathNm;
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
     * @return the leadLvlNm
     */
    public String getLeadLvlNm() {
        return leadLvlNm;
    }

    /**
     * @param leadLvlNm the leadLvlNm to set
     */
    public void setLeadLvlNm(String leadLvlNm) {
        this.leadLvlNm = leadLvlNm;
    }

    /**
     * @return the leadStatNm
     */
    public String getLeadStatNm() {
        return leadStatNm;
    }

    /**
     * @param leadStatNm the leadStatNm to set
     */
    public void setLeadStatNm(String leadStatNm) {
        this.leadStatNm = leadStatNm;
    }

    /**
     * @return the traceGradeNm
     */
    public String getTraceGradeNm() {
        return traceGradeNm;
    }

    /**
     * @param traceGradeNm the traceGradeNm to set
     */
    public void setTraceGradeNm(String traceGradeNm) {
        this.traceGradeNm = traceGradeNm;
    }

    /**
     * @return the validGradeNm
     */
    public String getValidGradeNm() {
        return validGradeNm;
    }

    /**
     * @param validGradeNm the validGradeNm to set
     */
    public void setValidGradeNm(String validGradeNm) {
        this.validGradeNm = validGradeNm;
    }

    /**
     * @return the invalidCauNm
     */
    public String getInvalidCauNm() {
        return invalidCauNm;
    }

    /**
     * @param invalidCauNm the invalidCauNm to set
     */
    public void setInvalidCauNm(String invalidCauNm) {
        this.invalidCauNm = invalidCauNm;
    }

    /**
     * @return the failCauNm
     */
    public String getFailCauNm() {
        return failCauNm;
    }

    /**
     * @param failCauNm the failCauNm to set
     */
    public void setFailCauNm(String failCauNm) {
        this.failCauNm = failCauNm;
    }

    /**
     * @return the expcPurcHmNm
     */
    public String getExpcPurcHmNm() {
        return expcPurcHmNm;
    }

    /**
     * @param expcPurcHmNm the expcPurcHmNm to set
     */
    public void setExpcPurcHmNm(String expcPurcHmNm) {
        this.expcPurcHmNm = expcPurcHmNm;
    }

    /**
     * @return the traceMthNm
     */
    public String getTraceMthNm() {
        return traceMthNm;
    }

    /**
     * @param traceMthNm the traceMthNm to set
     */
    public void setTraceMthNm(String traceMthNm) {
        this.traceMthNm = traceMthNm;
    }

    /**
     * @return the nextTraceMthNm
     */
    public String getNextTraceMthNm() {
        return nextTraceMthNm;
    }

    /**
     * @param nextTraceMthNm the nextTraceMthNm to set
     */
    public void setNextTraceMthNm(String nextTraceMthNm) {
        this.nextTraceMthNm = nextTraceMthNm;
    }

    /**
     * @return the custHoldTp
     */
    public String getCustHoldTp() {
        return custHoldTp;
    }

    /**
     * @param custHoldTp the custHoldTp to set
     */
    public void setCustHoldTp(String custHoldTp) {
        this.custHoldTp = custHoldTp;
    }

    /**
     * @return the custHoldTpDtl
     */
    public String getCustHoldTpDtl() {
        return custHoldTpDtl;
    }

    /**
     * @param custHoldTpDtl the custHoldTpDtl to set
     */
    public void setCustHoldTpDtl(String custHoldTpDtl) {
        this.custHoldTpDtl = custHoldTpDtl;
    }

    /**
     * @return the custHoldTpNm
     */
    public String getCustHoldTpNm() {
        return custHoldTpNm;
    }

    /**
     * @param custHoldTpNm the custHoldTpNm to set
     */
    public void setCustHoldTpNm(String custHoldTpNm) {
        this.custHoldTpNm = custHoldTpNm;
    }

    /**
     * @return the custHoldTpDtlNm
     */
    public String getCustHoldTpDtlNm() {
        return custHoldTpDtlNm;
    }

    /**
     * @param custHoldTpDtlNm the custHoldTpDtlNm to set
     */
    public void setCustHoldTpDtlNm(String custHoldTpDtlNm) {
        this.custHoldTpDtlNm = custHoldTpDtlNm;
    }

    /**
     * @return the intrCarlineNm
     */
    public String getIntrCarlineNm() {
        return intrCarlineNm;
    }

    /**
     * @param intrCarlineNm the intrCarlineNm to set
     */
    public void setIntrCarlineNm(String intrCarlineNm) {
        this.intrCarlineNm = intrCarlineNm;
    }

    /**
     * @return the intrModelNm
     */
    public String getIntrModelNm() {
        return intrModelNm;
    }

    /**
     * @param intrModelNm the intrModelNm to set
     */
    public void setIntrModelNm(String intrModelNm) {
        this.intrModelNm = intrModelNm;
    }

    /**
     * @return the purcSelCarlineNm
     */
    public String getPurcSelCarlineNm() {
        return purcSelCarlineNm;
    }

    /**
     * @param purcSelCarlineNm the purcSelCarlineNm to set
     */
    public void setPurcSelCarlineNm(String purcSelCarlineNm) {
        this.purcSelCarlineNm = purcSelCarlineNm;
    }

    /**
     * @return the purcSelModelNm
     */
    public String getPurcSelModelNm() {
        return purcSelModelNm;
    }

    /**
     * @param purcSelModelNm the purcSelModelNm to set
     */
    public void setPurcSelModelNm(String purcSelModelNm) {
        this.purcSelModelNm = purcSelModelNm;
    }

    /**
     * @return the intrColorNm
     */
    public String getIntrColorNm() {
        return intrColorNm;
    }

    /**
     * @param intrColorNm the intrColorNm to set
     */
    public void setIntrColorNm(String intrColorNm) {
        this.intrColorNm = intrColorNm;
    }

    /**
     * @return the holdTp
     */
    public String getHoldTp() {
        return holdTp;
    }

    /**
     * @param holdTp the holdTp to set
     */
    public void setHoldTp(String holdTp) {
        this.holdTp = holdTp;
    }

    /**
     * @return the holdTpNm
     */
    public String getHoldTpNm() {
        return holdTpNm;
    }

    /**
     * @param holdTpNm the holdTpNm to set
     */
    public void setHoldTpNm(String holdTpNm) {
        this.holdTpNm = holdTpNm;
    }

    /**
     * @return the holdDetlTpSeqNm
     */
    public String getHoldDetlTpSeqNm() {
        return holdDetlTpSeqNm;
    }

    /**
     * @param holdDetlTpSeqNm the holdDetlTpSeqNm to set
     */
    public void setHoldDetlTpSeqNm(String holdDetlTpSeqNm) {
        this.holdDetlTpSeqNm = holdDetlTpSeqNm;
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
     * @return the mngScNm
     */
    public String getMngScNm() {
        return mngScNm;
    }

    /**
     * @param mngScNm the mngScNm to set
     */
    public void setMngScNm(String mngScNm) {
        this.mngScNm = mngScNm;
    }

    /**
     * @return the exhvFlakSeq
     */
    public String getExhvFlakSeq() {
        return exhvFlakSeq;
    }

    /**
     * @param exhvFlakSeq the exhvFlakSeq to set
     */
    public void setExhvFlakSeq(String exhvFlakSeq) {
        this.exhvFlakSeq = exhvFlakSeq;
    }

    /**
     * @return the bfLeadStatCd
     */
    public String getBfLeadStatCd() {
        return bfLeadStatCd;
    }

    /**
     * @param bfLeadStatCd the bfLeadStatCd to set
     */
    public void setBfLeadStatCd(String bfLeadStatCd) {
        this.bfLeadStatCd = bfLeadStatCd;
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
     * @return the dataTable
     */
    public String getDataTable() {
        return dataTable;
    }

    /**
     * @param dataTable the dataTable to set
     */
    public void setDataTable(String dataTable) {
        this.dataTable = dataTable;
    }

    /**
     * @return the onDutyYn
     */
    public String getOnDutyYn() {
        return onDutyYn;
    }

    /**
     * @param onDutyYn the onDutyYn to set
     */
    public void setOnDutyYn(String onDutyYn) {
        this.onDutyYn = onDutyYn;
    }

    /**
     * @return the dupSeq
     */
    public String getDupSeq() {
        return dupSeq;
    }

    /**
     * @param dupSeq the dupSeq to set
     */
    public void setDupSeq(String dupSeq) {
        this.dupSeq = dupSeq;
    }

    /**
     * @return the localCarRegNoYn
     */
    public String getLocalCarRegNoYn() {
        return localCarRegNoYn;
    }

    /**
     * @param localCarRegNoYn the localCarRegNoYn to set
     */
    public void setLocalCarRegNoYn(String localCarRegNoYn) {
        this.localCarRegNoYn = localCarRegNoYn;
    }

    /**
     * @return the siebelLeadRowId
     */
    public String getSiebelLeadRowId() {
        return siebelLeadRowId;
    }

    /**
     * @param siebelLeadRowId the siebelLeadRowId to set
     */
    public void setSiebelLeadRowId(String siebelLeadRowId) {
        this.siebelLeadRowId = siebelLeadRowId;
    }

    /**
     * @return the holdDetlTpNm
     */
    public String getHoldDetlTpNm() {
        return holdDetlTpNm;
    }

    /**
     * @param holdDetlTpNm the holdDetlTpNm to set
     */
    public void setHoldDetlTpNm(String holdDetlTpNm) {
        this.holdDetlTpNm = holdDetlTpNm;
    }

    /**
     * @return the submitDt
     */
    public Date getSubmitDt() {
        return submitDt;
    }

    /**
     * @param submitDt the submitDt to set
     */
    public void setSubmitDt(Date submitDt) {
        this.submitDt = submitDt;
    }

    /**
     * @return the trsfTp
     */
    public String getTrsfTp() {
        return trsfTp;
    }

    /**
     * @param trsfTp the trsfTp to set
     */
    public void setTrsfTp(String trsfTp) {
        this.trsfTp = trsfTp;
    }

    /**
     * @return the evalCd
     */
    public String getEvalCd() {
        return evalCd;
    }

    /**
     * @param evalCd the evalCd to set
     */
    public void setEvalCd(String evalCd) {
        this.evalCd = evalCd;
    }

    /**
     * @return the addrFull
     */
    public String getAddrFull() {
        return addrFull;
    }

    /**
     * @param addrFull the addrFull to set
     */
    public void setAddrFull(String addrFull) {
        this.addrFull = addrFull;
    }

    /**
     * @return the bizcondCd
     */
    public String getBizcondCd() {
        return bizcondCd;
    }

    /**
     * @param bizcondCd the bizcondCd to set
     */
    public void setBizcondCd(String bizcondCd) {
        this.bizcondCd = bizcondCd;
    }

    /**
     * @return the trsfTpNm
     */
    public String getTrsfTpNm() {
        return trsfTpNm;
    }

    /**
     * @param trsfTpNm the trsfTpNm to set
     */
    public void setTrsfTpNm(String trsfTpNm) {
        this.trsfTpNm = trsfTpNm;
    }

    /**
     * @return the evalNm
     */
    public String getEvalNm() {
        return evalNm;
    }

    /**
     * @param evalNm the evalNm to set
     */
    public void setEvalNm(String evalNm) {
        this.evalNm = evalNm;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {

        try{
            switch(cellNo){
                //case 0:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 0:this.setCustNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setCustTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setHpNo(ExcelDataBinderUtil.toString(value).trim()); break;
                //case 4:this.setOfficeTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
                //case 5:this.setRelCustNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3:this.setPurcMngNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4:this.setIntrCarlineCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5:this.setInfoTp(ExcelDataBinderUtil.toString(value).trim()); break;
                //case 7:this.setHoldTp(ExcelDataBinderUtil.toString(value).trim()); break;
                //case 8:this.setMakCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 6:this.setOfficeTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 7:this.setMngScId(ExcelDataBinderUtil.toString(value).trim()); break;
                case 8:this.setEmailNm(ExcelDataBinderUtil.toString(value).trim()); break;
                //case 12:this.setTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 9:this.setWechatId(ExcelDataBinderUtil.toString(value).trim()); break;
                case 10:this.setSexCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 11:this.setMathDocTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 12:this.setSsnCrnNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 13:this.setPayTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 14:this.setEstimateCont(ExcelDataBinderUtil.toString(value).trim()); break;
                case 15:this.setSalesCont(ExcelDataBinderUtil.toString(value).trim()); break;
                case 16:this.setRemark(ExcelDataBinderUtil.toString(value).trim()); break;
                case 17:this.setLocalCarRegNoYn(ExcelDataBinderUtil.toString(value).trim()); break;

                default :
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
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        String msg = "";
        // 딜러코드
//        if(StringUtils.isBlank(this.getDlrCd())) {
//            msg = messageSource.getMessage(
//                "global.info.required.field"
//                , new String[]{
//                        messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())
//                }
//                , LocaleContextHolder.getLocale()
//            );
//
//            errors.add(new ExcelUploadError(context.getRow(), 0, this.getDlrCd(), msg));
//        }
        // 고객명
        if(StringUtils.isBlank(this.getCustNm())) {
            msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getCustNm(), msg));
        }
        // 고객유형
        if(StringUtils.isBlank(this.getCustTp())) {
            msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 2, this.getCustTp(), msg));
        }

        // 이동전화
        if(StringUtils.isBlank(this.getHpNo())) {
            msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 3, this.getHpNo(), msg));

        } else {
            if (this.getHpNo().length() != 11) {
                msg = messageSource.getMessage(
                        "crm.info.hpno11DigitRequired"
                        , null
                        , LocaleContextHolder.getLocale()
                );
                errors.add(new ExcelUploadError(context.getRow(), 3, this.getHpNo(), msg));
            }

        }

        if("02".equals(this.getCustTp())){
            // 연계인명 (구매담당자)
            if(StringUtils.isBlank(this.getPurcMngNm())) {
                msg = messageSource.getMessage(
                        "global.info.required.field"
                        , new String[]{
                                messageSource.getMessage("crm.lbl.corpPurcMng", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                );
                errors.add(new ExcelUploadError(context.getRow(), 4, this.getPurcMngNm(), msg));
            }
        }

        // 의향차종
        if(StringUtils.isBlank(this.getIntrCarlineCd())) {
            msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("crm.lbl.intentionCarline", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 5, this.getIntrCarlineCd(), msg));
        }


        // 정보유형
        if(StringUtils.isBlank(this.getInfoTp())) {
            msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("crm.lbl.infoType", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 6, this.getInfoTp(), msg));
        }

        // 정보경로
//        if(StringUtils.isBlank(this.getHoldTp())) {
//            msg = messageSource.getMessage(
//                    "global.info.required.field"
//                    , new String[]{
//                            messageSource.getMessage("crm.lbl.approchLocation", null, LocaleContextHolder.getLocale())
//                    }
//                    , LocaleContextHolder.getLocale()
//            );
//            errors.add(new ExcelUploadError(context.getRow(), 8, this.getHoldTp(), msg));
//        }

        // 정보경로가 시장활동일 경우 캠페인 번호 확인
//        if("03".equals(this.getHoldTp())){
//            // 시장활동
//            if(StringUtils.isBlank(this.getMakCd())) {
//                msg = messageSource.getMessage(
//                        "global.info.required.field"
//                        , new String[]{
//                                messageSource.getMessage("global.lbl.crNo", null, LocaleContextHolder.getLocale())
//                        }
//                        , LocaleContextHolder.getLocale()
//                );
//                errors.add(new ExcelUploadError(context.getRow(), 9, this.getCustTp(), msg));
//            }
//        }

        return errors;
    }

    /**
     * @return the mathDocTpNm
     */
    public String getMathDocTpNm() {
        return mathDocTpNm;
    }

    /**
     * @param mathDocTpNm the mathDocTpNm to set
     */
    public void setMathDocTpNm(String mathDocTpNm) {
        this.mathDocTpNm = mathDocTpNm;
    }

    /**
     * @return the bizcondNm
     */
    public String getBizcondNm() {
        return bizcondNm;
    }

    /**
     * @param bizcondNm the bizcondNm to set
     */
    public void setBizcondNm(String bizcondNm) {
        this.bizcondNm = bizcondNm;
    }

    /**
     * @return the autoTrsfConf
     */
    public String getAutoTrsfConf() {
        return autoTrsfConf;
    }

    /**
     * @param autoTrsfConf the autoTrsfConf to set
     */
    public void setAutoTrsfConf(String autoTrsfConf) {
        this.autoTrsfConf = autoTrsfConf;
    }

    /**
     * @return the befLeadStatCd
     */
    public String getBefLeadStatCd() {
        return befLeadStatCd;
    }

    /**
     * @param befLeadStatCd the befLeadStatCd to set
     */
    public void setBefLeadStatCd(String befLeadStatCd) {
        this.befLeadStatCd = befLeadStatCd;
    }

    /**
     * @return the befLeadStatNm
     */
    public String getBefLeadStatNm() {
        return befLeadStatNm;
    }

    /**
     * @param befLeadStatNm the befLeadStatNm to set
     */
    public void setBefLeadStatNm(String befLeadStatNm) {
        this.befLeadStatNm = befLeadStatNm;
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
     * @return the birthDt
     */
    public String getBirthDt() {
        return birthDt;
    }

    /**
     * @param birthDt the birthDt to set
     */
    public void setBirthDt(String birthDt) {
        this.birthDt = birthDt;
    }

    /**
     * @return the relSeq
     */
    public String getRelSeq() {
        return relSeq;
    }

    /**
     * @param relSeq the relSeq to set
     */
    public void setRelSeq(String relSeq) {
        this.relSeq = relSeq;
    }

    /**
     * @return the relCustNo
     */
    public String getRelCustNo() {
        return relCustNo;
    }

    /**
     * @param relCustNo the relCustNo to set
     */
    public void setRelCustNo(String relCustNo) {
        this.relCustNo = relCustNo;
    }

    /**
     * @return the relCustNm
     */
    public String getRelCustNm() {
        return relCustNm;
    }

    /**
     * @param relCustNm the relCustNm to set
     */
    public void setRelCustNm(String relCustNm) {
        this.relCustNm = relCustNm;
    }

    /**
     * @return the relCustHpNo
     */
    public String getRelCustHpNo() {
        return relCustHpNo;
    }

    /**
     * @param relCustHpNo the relCustHpNo to set
     */
    public void setRelCustHpNo(String relCustHpNo) {
        this.relCustHpNo = relCustHpNo;
    }

    /**
     * @return the befMngScId
     */
    public String getBefMngScId() {
        return befMngScId;
    }

    /**
     * @param befMngScId the befMngScId to set
     */
    public void setBefMngScId(String befMngScId) {
        this.befMngScId = befMngScId;
    }

    /**
     * @return the befMngScNm
     */
    public String getBefMngScNm() {
        return befMngScNm;
    }

    /**
     * @param befMngScNm the befMngScNm to set
     */
    public void setBefMngScNm(String befMngScNm) {
        this.befMngScNm = befMngScNm;
    }

    /**
     * @return the otherBrandCd
     */
    public String getOtherBrandCd() {
        return otherBrandCd;
    }

    /**
     * @param otherBrandCd the otherBrandCd to set
     */
    public void setOtherBrandCd(String otherBrandCd) {
        this.otherBrandCd = otherBrandCd;
    }

    /**
     * @return the otherBrandNm
     */
    public String getOtherBrandNm() {
        return otherBrandNm;
    }

    /**
     * @param otherBrandNm the otherBrandNm to set
     */
    public void setOtherBrandNm(String otherBrandNm) {
        this.otherBrandNm = otherBrandNm;
    }

    /**
     * @return the relBefCustNo
     */
    public String getRelBefCustNo() {
        return relBefCustNo;
    }

    /**
     * @param relBefCustNo the relBefCustNo to set
     */
    public void setRelBefCustNo(String relBefCustNo) {
        this.relBefCustNo = relBefCustNo;
    }

    /**
     * @return the makCd
     */
    public String getMakCd() {
        return makCd;
    }

    /**
     * @param makCd the makCd to set
     */
    public void setMakCd(String makCd) {
        this.makCd = makCd;
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
     * @return the vsitPrsnCnt
     */
    public Integer getVsitPrsnCnt() {
        return vsitPrsnCnt;
    }

    /**
     * @param vsitPrsnCnt the vsitPrsnCnt to set
     */
    public void setVsitPrsnCnt(Integer vsitPrsnCnt) {
        this.vsitPrsnCnt = vsitPrsnCnt;
    }

    /**
     * @return the expcDealPrc
     */
    public Integer getExpcDealPrc() {
        return expcDealPrc;
    }

    /**
     * @param expcDealPrc the expcDealPrc to set
     */
    public void setExpcDealPrc(Integer expcDealPrc) {
        this.expcDealPrc = expcDealPrc;
    }

    /**
     * @return the holdDetlTpSeq
     */
    public Integer getHoldDetlTpSeq() {
        return holdDetlTpSeq;
    }

    /**
     * @param holdDetlTpSeq the holdDetlTpSeq to set
     */
    public void setHoldDetlTpSeq(Integer holdDetlTpSeq) {
        this.holdDetlTpSeq = holdDetlTpSeq;
    }

    /**
     * @return the errorsStr
     */
    public String getErrorsStr() {
        return errorsStr;
    }

    /**
     * @param errorsStr the errorsStr to set
     */
    public void setErrorsStr(String errorsStr) {
        this.errorsStr = errorsStr;
    }

    /**
     * @return the reloadFromFailYn
     */
    public String getReloadFromFailYn() {
        return reloadFromFailYn;
    }

    /**
     * @param reloadFromFailYn the reloadFromFailYn to set
     */
    public void setReloadFromFailYn(String reloadFromFailYn) {
        this.reloadFromFailYn = reloadFromFailYn;
    }

    /**
     * @return the nextTraceDtNullUpdYn
     */
    public String getNextTraceDtNullUpdYn() {
        return nextTraceDtNullUpdYn;
    }

    /**
     * @param nextTraceDtNullUpdYn the nextTraceDtNullUpdYn to set
     */
    public void setNextTraceDtNullUpdYn(String nextTraceDtNullUpdYn) {
        this.nextTraceDtNullUpdYn = nextTraceDtNullUpdYn;
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
     * @return the currLeadStatCd
     */
    public String getCurrLeadStatCd() {
        return currLeadStatCd;
    }

    /**
     * @param currLeadStatCd the currLeadStatCd to set
     */
    public void setCurrLeadStatCd(String currLeadStatCd) {
        this.currLeadStatCd = currLeadStatCd;
    }

    /**
     * @return the nextLeadStatCd
     */
    public String getNextLeadStatCd() {
        return nextLeadStatCd;
    }

    /**
     * @param nextLeadStatCd the nextLeadStatCd to set
     */
    public void setNextLeadStatCd(String nextLeadStatCd) {
        this.nextLeadStatCd = nextLeadStatCd;
    }

    /**
     * @return the currMngScId
     */
    public String getCurrMngScId() {
        return currMngScId;
    }

    /**
     * @param currMngScId the currMngScId to set
     */
    public void setCurrMngScId(String currMngScId) {
        this.currMngScId = currMngScId;
    }

    /**
     * @return the nextMngScId
     */
    public String getNextMngScId() {
        return nextMngScId;
    }

    /**
     * @param nextMngScId the nextMngScId to set
     */
    public void setNextMngScId(String nextMngScId) {
        this.nextMngScId = nextMngScId;
    }

    /**
     * @return the nextContractTp
     */
    public String getNextContractTp() {
        return nextContractTp;
    }

    /**
     * @param nextContractTp the nextContractTp to set
     */
    public void setNextContractTp(String nextContractTp) {
        this.nextContractTp = nextContractTp;
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
     * @return the custMngScId
     */
    public String getCustMngScId() {
        return custMngScId;
    }

    /**
     * @param custMngScId the custMngScId to set
     */
    public void setCustMngScId(String custMngScId) {
        this.custMngScId = custMngScId;
    }

    /**
     * @return the leadStartDt
     */
    public Date getLeadStartDt() {
        return leadStartDt;
    }

    /**
     * @param leadStartDt the leadStartDt to set
     */
    public void setLeadStartDt(Date leadStartDt) {
        this.leadStartDt = leadStartDt;
    }

    /**
     * @param rvsitYnNm the rvsitYnNm to set
     */
    public void setRvsitYnNm(String rvsitYnNm) {
        this.rvsitYnNm = rvsitYnNm;
    }

    /**
     * @return the rvsitYnNm
     */
    public String getRvsitYnNm() {
        return rvsitYnNm;
    }

    /**
     * @return the reSetYn
     */
    public String getReSetYn() {
        return reSetYn;
    }

    /**
     * @param reSetYn the reSetYn to set
     */
    public void setReSetYn(String reSetYn) {
        this.reSetYn = reSetYn;
    }

    /**
     * @return the cSeq
     */
    public String getcSeq() {
        return cSeq;
    }

    /**
     * @param cSeq the cSeq to set
     */
    public void setcSeq(String cSeq) {
        this.cSeq = cSeq;
    }

    /**
     * @return the intrFscpModtpCd
     */
    public String getIntrFscpModtpCd() {
        return intrFscpModtpCd;
    }

    /**
     * @param intrFscpModtpCd the intrFscpModtpCd to set
     */
    public void setIntrFscpModtpCd(String intrFscpModtpCd) {
        this.intrFscpModtpCd = intrFscpModtpCd;
    }

    /**
     * @return the purcFscpModtpCd
     */
    public String getPurcFscpModtpCd() {
        return purcFscpModtpCd;
    }

    /**
     * @param purcFscpModtpCd the purcFscpModtpCd to set
     */
    public void setPurcFscpModtpCd(String purcFscpModtpCd) {
        this.purcFscpModtpCd = purcFscpModtpCd;
    }

    /**
     * @return the intrFscpModtpNm
     */
    public String getIntrFscpModtpNm() {
        return intrFscpModtpNm;
    }

    /**
     * @param intrFscpModtpNm the intrFscpModtpNm to set
     */
    public void setIntrFscpModtpNm(String intrFscpModtpNm) {
        this.intrFscpModtpNm = intrFscpModtpNm;
    }

    /**
     * @return the purcFscpModtpNm
     */
    public String getPurcFscpModtpNm() {
        return purcFscpModtpNm;
    }

    /**
     * @param purcFscpModtpNm the purcFscpModtpNm to set
     */
    public void setPurcFscpModtpNm(String purcFscpModtpNm) {
        this.purcFscpModtpNm = purcFscpModtpNm;
    }

    /**
     * @return the custCdNm
     */
    public String getCustCdNm() {
        return custCdNm;
    }

    /**
     * @param custCdNm the custCdNm to set
     */
    public void setCustCdNm(String custCdNm) {
        this.custCdNm = custCdNm;
    }

    /**
     * @return the reviveOppt
     */
    public String getReviveOppt() {
        return reviveOppt;
    }

    /**
     * @param reviveOppt the reviveOppt to set
     */
    public void setReviveOppt(String reviveOppt) {
        this.reviveOppt = reviveOppt;
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
	 * @return the dstbChnNm
	 */
	public String getDstbChnNm() {
		return dstbChnNm;
	}

	/**
	 * @param dstbChnNm the dstbChnNm to set
	 */
	public void setDstbChnNm(String dstbChnNm) {
		this.dstbChnNm = dstbChnNm;
	}

	public String getPurposeTagNm() {
		return purposeTagNm;
	}

	public void setPurposeTagNm(String purposeTagNm) {
		this.purposeTagNm = purposeTagNm;
	}

	public String getFmsId() {
		return fmsId;
	}

	public void setFmsId(String fmsId) {
		this.fmsId = fmsId;
	}

}