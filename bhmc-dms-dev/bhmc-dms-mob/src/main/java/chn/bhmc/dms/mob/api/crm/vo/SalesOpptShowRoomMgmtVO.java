package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


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


public class SalesOpptShowRoomMgmtVO extends BaseVO {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5902417028302809811L;

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
     * 관리SCID
     **/
    //MNG_SC_ID
    private String mngScId;

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

    private Integer                 vsitPrsnCnt;

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
    private String leadStatCd;
    private String befLeadStatCd;
    private String cuLeadStatCd;

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

    private int expcDealPrc;

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

    private String mathDocTp;
    private String ssnCrnNo;//주민번호

    private String mngScNm;

    private String exhvFlakSeq;

    private String saleOpptSeq;

    private String dataTable;

    /* 전체주소 (주요) */
    private String addrFull;

    private String bizcondCd;

  //생일
    private String birthDt;

    /**
     * 연계인 시퀀스 (법인 연계인)
     */
    private String relSeq;
    private String relCustNo;
    private String relCustNm;
    private String relCustHpNo;

    private String purcMngNm;

    /**
     * 시승여부
     */
    private String testDrvYn;

    /**
     * 방문한 면담 시간 (분)
     **/
    private String vistPrdmm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date leadStartDt;

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
     * 매장내수
     */
    private int stayRoomCnt;

    /**
     * 떠난 수
     */
    private int leaveRoomCnt;

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
     * @return the expcDealPrc
     */
    public int getExpcDealPrc() {
        return expcDealPrc;
    }

    /**
     * @param expcDealPrc the expcDealPrc to set
     */
    public void setExpcDealPrc(int expcDealPrc) {
        this.expcDealPrc = expcDealPrc;
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
     * @return the testDrvYn
     */
    public String getTestDrvYn() {
        return testDrvYn;
    }

    /**
     * @param testDrvYn the testDrvYn to set
     */
    public void setTestDrvYn(String testDrvYn) {
        this.testDrvYn = testDrvYn;
    }

    /**
     * @return the vistPrdmm
     */
    public String getVistPrdmm() {
        return vistPrdmm;
    }

    /**
     * @param vistPrdmm the vistPrdmm to set
     */
    public void setVistPrdmm(String vistPrdmm) {
        this.vistPrdmm = vistPrdmm;
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
     * @return the cuLeadStatCd
     */
    public String getCuLeadStatCd() {
        return cuLeadStatCd;
    }

    /**
     * @param cuLeadStatCd the cuLeadStatCd to set
     */
    public void setCuLeadStatCd(String cuLeadStatCd) {
        this.cuLeadStatCd = cuLeadStatCd;
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
     * @return the stayRoomCnt
     */
    public int getStayRoomCnt() {
        return stayRoomCnt;
    }

    /**
     * @param stayRoomCnt the stayRoomCnt to set
     */
    public void setStayRoomCnt(int stayRoomCnt) {
        this.stayRoomCnt = stayRoomCnt;
    }

    /**
     * @return the leaveRoomCnt
     */
    public int getLeaveRoomCnt() {
        return leaveRoomCnt;
    }

    /**
     * @param leaveRoomCnt the leaveRoomCnt to set
     */
    public void setLeaveRoomCnt(int leaveRoomCnt) {
        this.leaveRoomCnt = leaveRoomCnt;
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


}