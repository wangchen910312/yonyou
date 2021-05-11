package chn.bhmc.dms.crm.cfw.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 내방 예약  VO
 *
 * @ClassName   : VisitCustomerVO.java
 * @Description : VisitCustomerVO Class
 * @author in moon lee
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     in moon lee     최초 생성
 * </pre>
 */
/*
 *
 * Draft : 내방 예약 ( 팝업 ) 등록/수정
 * Modify : 내방관리 등록/수정
 *
 */
@ValidDescriptor({

     @ValidField(field="dlrCd"            , mesgKey="global.lbl.dlrCd")         // 딜러코드
    ,@ValidField(field="pltCd"            , mesgKey="global.lbl.pltCd")         // 센터코드
    ,@ValidField(field="vsitNo"           , mesgKey="global.lbl.visitSeq")      // 내방번호
    ,@ValidField(field="callNo"           , mesgKey="global.lbl.callNo")        // -
    ,@ValidField(field="leadNo"           , mesgKey="global.lbl.leadNo")        // 리드번호
    ,@ValidField(field="saleOpptNo"       , mesgKey="global.lbl.saleOpptSeq")   // 판매기회번호
    ,@ValidField(field="scId"             , mesgKey="sal.lbl.salesAdvisor")     // 판매고문
    ,@ValidField(field="custNo"           , mesgKey="global.lbl.custNo")        // 고객번호
    ,@ValidField(field="custNo"           , mesgKey="global.lbl.custNm")        // 고객번호
    ,@ValidField(field="hpNo"             , mesgKey="global.lbl.hpNo")          // 휴대전화
    ,@ValidField(field="resvDt"           , mesgKey="global.lbl.resvDt")        // 예약일
    ,@ValidField(field="csltTmCd"         , mesgKey="global.lbl.csltTmCd")      // 상담시간
    ,@ValidField(field="vsitDt"           , mesgKey="global.lbl.vsitDt")        // 방문시간
    ,@ValidField(field="vsitEndDt"        , mesgKey="global.lbl.visitEndDt")    // 내방종료일
    ,@ValidField(field="vsitSrcCd"        , mesgKey="global.lbl.visitPathCd")   // 내방출처
    ,@ValidField(field="vsitSrcDetlCont"  , mesgKey="global.lbl.vsitSrcDetlCd") // 내방출처상세
    ,@ValidField(field="vsitGoalCd"       , mesgKey="global.lbl.visitPpsCd")    // 내방목적
    ,@ValidField(field="compareBrandCd"   , mesgKey="global.lbl.compareBrandCd")// 비교 타사 브랜드
    ,@ValidField(field="compareModelCd"   , mesgKey="global.lbl.compareModelCd")// 비교 타사 모델
    ,@ValidField(field="purcPridCd"       , mesgKey="global.lbl.purcPridCd")    // 구매시기
    ,@ValidField(field="remark"           , mesgKey="global.lbl.remark")        // 비고
    ,@ValidField(field="withPrsnCnt"      , mesgKey="global.lbl.withPrsCnt")    // 동행자수
    ,@ValidField(field="vsitStatCd"       , mesgKey="global.lbl.visitStatCd")   // 내방상태
    ,@ValidField(field="docId"            , mesgKey="global.lbl.docId")         // -
    ,@ValidField(field="resvVinNo1"       , mesgKey="global.lbl.resvVinNo1")    // -
    ,@ValidField(field="resvVinNo2"       , mesgKey="global.lbl.resvVinNo2")    // -
    ,@ValidField(field="regUsrId"         , mesgKey="global.lbl.regUsrId")      // 등록자
    ,@ValidField(field="regDt"            , mesgKey="global.lbl.regDt")         // 등록일
    ,@ValidField(field="updtUsrId"        , mesgKey="global.lbl.updtUsrId")     // 수정자
    ,@ValidField(field="updtDt"           , mesgKey="global.lbl.updtDt")        // 수정일
    ,@ValidField(field="tdrvYn"           , mesgKey="crm.lbl.tdrvYn")           // 시승여부

})

public class VisitCustomerVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1882625883233739027L;

       /**
        * 딜러코드
        **/
       private  String            dlrCd;

       /**
        * 센터코드
        **/
       private  String            pltCd;

       /**
        * 내방번호
        **/
       private  String            vsitNo;

       /**
        * 콜번호
        **/
       private  String            callNo;

       /**
        * 리드번호
        **/
       private  String            leadNo;

       /**
        * 판매기회번호
        **/
       private  String            saleOpptNo;

       /**
        * SCID
        **/
       @NotBlank(groups=Draft.class)
       private  String            scId;
       private  String            scNm;

       /**
        * 고객번호
        **/
       @NotBlank(groups=Draft.class)
       private  String            custNo;
       @NotBlank(groups=Modify.class)
       private  String            custNm;

       /**
        * 휴대폰번호
        **/
       @NotBlank(groups=Draft.class)
       private  String            hpNo;

       // 예약 스케줄 일자
       private  Date              resvSchStartDt;
       private  Date              resvSchEndDt;

       // 내방 스케즐 일자
       private  Date              vsitSchStartDt;
       private  Date              vsitSchEndDt;

       /**
        * 상담시간코드
        **/
       @NotBlank(groups=Draft.class)
       private  String            csltTmCd;

       /**
        * 예약일자
        **/
       @NotNull(groups=Draft.class)
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date              resvDt;

       /**
        * 내방일자
        **/
       @NotNull(groups=Modify.class)
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date              vsitDt;

       /**
        * 내방종료일자
        **/
       @NotNull(groups=Modify.class)
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date              vsitEndDt;

       /**
        * 내방출처코드
        **/
       @NotBlank(groups=Draft.class)
       private  String            vsitSrcCd;

       /**
        * 내방출처상세내용
        **/
       private  String            vsitSrcDetlCont;

       /**
        * 내방목적코드
        **/
       private  String            vsitGoalCd;

       /**
        * 비교브랜드코드
        **/
       private  String            compareBrandCd;

       /**
        * 비교모델코드
        **/
       private  String            compareModelCd;

       /**
        * 구매기간코드
        **/
       private  String            purcPridCd;

       /**
        * 비고
        **/
       private  String            remark;

       /**
        * 동행자수
        **/
       private  int               withPrsnCnt;

       /**
        * 내방상태코드
        **/
       @NotBlank(groups={Draft.class, Modify.class})
       private  String            vsitStatCd;

       /**
        * 문서ID
        **/
       private  String            docId;

       /**
        * 예약차대번호1
        **/
       private  String            resvVinNo1;

       /**
        * 예약차대번호2
        **/
       private  String            resvVinNo2;

       /**
        * 등록자ID
        **/
       private  String            regUsrId;
       private  String            regUsrNm;

       /**
        * 등록일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date              regDt;

       /**
        * 수정자ID
        **/
       private  String            updtUsrId;

       /**
        * 수정일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date              updtDt;

       private  String               saleOpptYn;                // 기회여부 기회여부 -> 판매기회단계 상태 : 진행중 (실패/성공이 아닌것)
       private  String               modelCd;
       private  String               modelNm;
       private  String               carLineCd;
       private  String               carLineNm;
       private  String               reVsitYn;                 // 재방문 여부 -> 판매기회 등록 이후, 판매기회상태가 진행중인 상태에 방문한경우 재방문으로 인식한다.
       private  String               saleOpptStepCd;            // 판매기회단계
       private  String               custCd;                    // 잠재/보유고객
       private  String               sexCd;                     // 성별
       private  String               tdrvYn = "N";                    // 시승여부



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
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }
    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }
    /**
     * @return the vsitNo
     */
    public String getVsitNo() {
        return vsitNo;
    }
    /**
     * @param vsitNo the vsitNo to set
     */
    public void setVsitNo(String vsitNo) {
        this.vsitNo = vsitNo;
    }
    /**
     * @return the callNo
     */
    public String getCallNo() {
        return callNo;
    }
    /**
     * @param callNo the callNo to set
     */
    public void setCallNo(String callNo) {
        this.callNo = callNo;
    }
    /**
     * @return the leadNo
     */
    public String getLeadNo() {
        return leadNo;
    }
    /**
     * @param leadNo the leadNo to set
     */
    public void setLeadNo(String leadNo) {
        this.leadNo = leadNo;
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
     * @return the scId
     */
    public String getScId() {
        return scId;
    }
    /**
     * @param scId the scId to set
     */
    public void setScId(String scId) {
        this.scId = scId;
    }
    /**
     * @return the scNm
     */
    public String getScNm() {
        return scNm;
    }
    /**
     * @param scNm the scNm to set
     */
    public void setScNm(String scNm) {
        this.scNm = scNm;
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
     * @return the resvDt
     */
    public Date getResvDt() {
        return resvDt;
    }
    /**
     * @param resvDt the resvDt to set
     */
    public void setResvDt(Date resvDt) {
        this.resvDt = resvDt;
    }
    /**
     * @return the resvStartDt
     */
    /**
     * @return the csltTmCd
     */
    public String getCsltTmCd() {
        return csltTmCd;
    }
    /**
     * @param csltTmCd the csltTmCd to set
     */
    public void setCsltTmCd(String csltTmCd) {
        this.csltTmCd = csltTmCd;
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
     * @return the vsitSrcCd
     */
    public String getVsitSrcCd() {
        return vsitSrcCd;
    }
    /**
     * @param vsitSrcCd the vsitSrcCd to set
     */
    public void setVsitSrcCd(String vsitSrcCd) {
        this.vsitSrcCd = vsitSrcCd;
    }
    /**
     * @return the vsitSrcDetlCont
     */
    public String getVsitSrcDetlCont() {
        return vsitSrcDetlCont;
    }
    /**
     * @param vsitSrcDetlCont the vsitSrcDetlCont to set
     */
    public void setVsitSrcDetlCont(String vsitSrcDetlCont) {
        this.vsitSrcDetlCont = vsitSrcDetlCont;
    }
    /**
     * @return the vsitGoalCd
     */
    public String getVsitGoalCd() {
        return vsitGoalCd;
    }
    /**
     * @param vsitGoalCd the vsitGoalCd to set
     */
    public void setVsitGoalCd(String vsitGoalCd) {
        this.vsitGoalCd = vsitGoalCd;
    }
    /**
     * @return the compareBrandCd
     */
    public String getCompareBrandCd() {
        return compareBrandCd;
    }
    /**
     * @param compareBrandCd the compareBrandCd to set
     */
    public void setCompareBrandCd(String compareBrandCd) {
        this.compareBrandCd = compareBrandCd;
    }
    /**
     * @return the compareModelCd
     */
    public String getCompareModelCd() {
        return compareModelCd;
    }
    /**
     * @param compareModelCd the compareModelCd to set
     */
    public void setCompareModelCd(String compareModelCd) {
        this.compareModelCd = compareModelCd;
    }
    /**
     * @return the purcPridCd
     */
    public String getPurcPridCd() {
        return purcPridCd;
    }
    /**
     * @param purcPridCd the purcPridCd to set
     */
    public void setPurcPridCd(String purcPridCd) {
        this.purcPridCd = purcPridCd;
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
     * @return the withPrsnCnt
     */
    public int getWithPrsnCnt() {
        return withPrsnCnt;
    }
    /**
     * @param withPrsnCnt the withPrsnCnt to set
     */
    public void setWithPrsnCnt(int withPrsnCnt) {
        this.withPrsnCnt = withPrsnCnt;
    }
    /**
     * @return the vsitStatCd
     */
    public String getVsitStatCd() {
        return vsitStatCd;
    }
    /**
     * @param vsitStatCd the vsitStatCd to set
     */
    public void setVsitStatCd(String vsitStatCd) {
        this.vsitStatCd = vsitStatCd;
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
     * @return the resvVinNo1
     */
    public String getResvVinNo1() {
        return resvVinNo1;
    }
    /**
     * @param resvVinNo1 the resvVinNo1 to set
     */
    public void setResvVinNo1(String resvVinNo1) {
        this.resvVinNo1 = resvVinNo1;
    }
    /**
     * @return the resvVinNo2
     */
    public String getResvVinNo2() {
        return resvVinNo2;
    }
    /**
     * @param resvVinNo2 the resvVinNo2 to set
     */
    public void setResvVinNo2(String resvVinNo2) {
        this.resvVinNo2 = resvVinNo2;
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
     * @return the saleOpptYn
     */
    public String getSaleOpptYn() {
        return saleOpptYn;
    }
    /**
     * @param saleOpptYn the saleOpptYn to set
     */
    public void setSaleOpptYn(String saleOpptYn) {
        this.saleOpptYn = saleOpptYn;
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
     * @return the carLineCd
     */
    public String getCarLineCd() {
        return carLineCd;
    }
    /**
     * @param carLineCd the carLineCd to set
     */
    public void setCarLineCd(String carLineCd) {
        this.carLineCd = carLineCd;
    }
    /**
     * @return the carLineNm
     */
    public String getCarLineNm() {
        return carLineNm;
    }
    /**
     * @param carLineNm the carLineNm to set
     */
    public void setCarLineNm(String carLineNm) {
        this.carLineNm = carLineNm;
    }
    /**
     * @return the reVsitYn
     */
    public String getReVsitYn() {
        return reVsitYn;
    }
    /**
     * @param reVsitYn the reVsitYn to set
     */
    public void setReVsitYn(String reVsitYn) {
        this.reVsitYn = reVsitYn;
    }
    /**
     * @return the saleOpptStepCd
     */
    public String getSaleOpptStepCd() {
        return saleOpptStepCd;
    }
    /**
     * @param saleOpptStepCd the saleOpptStepCd to set
     */
    public void setSaleOpptStepCd(String saleOpptStepCd) {
        this.saleOpptStepCd = saleOpptStepCd;
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
     * @return the resvSchStartDt
     */
    public Date getResvSchStartDt() {
        return resvSchStartDt;
    }
    /**
     * @param resvSchStartDt the resvSchStartDt to set
     */
    public void setResvSchStartDt(Date resvSchStartDt) {
        this.resvSchStartDt = resvSchStartDt;
    }
    /**
     * @return the resvSchEndDt
     */
    public Date getResvSchEndDt() {
        return resvSchEndDt;
    }
    /**
     * @param resvSchEndDt the resvSchEndDt to set
     */
    public void setResvSchEndDt(Date resvSchEndDt) {
        this.resvSchEndDt = resvSchEndDt;
    }
    /**
     * @return the vsitSchStartDt
     */
    public Date getVsitSchStartDt() {
        return vsitSchStartDt;
    }
    /**
     * @param vsitSchStartDt the vsitSchStartDt to set
     */
    public void setVsitSchStartDt(Date vsitSchStartDt) {
        this.vsitSchStartDt = vsitSchStartDt;
    }
    /**
     * @return the vsitSchEndDt
     */
    public Date getVsitSchEndDt() {
        return vsitSchEndDt;
    }
    /**
     * @param vsitSchEndDt the vsitSchEndDt to set
     */
    public void setVsitSchEndDt(Date vsitSchEndDt) {
        this.vsitSchEndDt = vsitSchEndDt;
    }
    /**
     * @return the tdrvYn
     */
    public String getTdrvYn() {
        return tdrvYn;
    }
    /**
     * @param tdrvYn the tdrvYn to set
     */
    public void setTdrvYn(String tdrvYn) {
        this.tdrvYn = tdrvYn;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "VisitCustomerVO [dlrCd=" + dlrCd + ", pltCd=" + pltCd + ", vsitNo=" + vsitNo + ", callNo=" + callNo
                + ", leadNo=" + leadNo + ", saleOpptNo=" + saleOpptNo + ", scId=" + scId + ", scNm=" + scNm
                + ", custNo=" + custNo + ", custNm=" + custNm + ", hpNo=" + hpNo + ", resvSchStartDt=" + resvSchStartDt
                + ", resvSchEndDt=" + resvSchEndDt + ", vsitSchStartDt=" + vsitSchStartDt + ", vsitSchEndDt="
                + vsitSchEndDt + ", csltTmCd=" + csltTmCd + ", resvDt=" + resvDt + ", vsitDt=" + vsitDt
                + ", vsitEndDt=" + vsitEndDt + ", vsitSrcCd=" + vsitSrcCd + ", vsitSrcDetlCont=" + vsitSrcDetlCont
                + ", vsitGoalCd=" + vsitGoalCd + ", compareBrandCd=" + compareBrandCd + ", compareModelCd="
                + compareModelCd + ", purcPridCd=" + purcPridCd + ", remark=" + remark + ", withPrsnCnt=" + withPrsnCnt
                + ", vsitStatCd=" + vsitStatCd + ", docId=" + docId + ", resvVinNo1=" + resvVinNo1 + ", resvVinNo2="
                + resvVinNo2 + ", regUsrId=" + regUsrId + ", regUsrNm=" + regUsrNm + ", regDt=" + regDt
                + ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt + ", saleOpptYn=" + saleOpptYn + ", modelCd="
                + modelCd + ", modelNm=" + modelNm + ", carLineCd=" + carLineCd + ", carLineNm=" + carLineNm
                + ", reVsitYn=" + reVsitYn + ", saleOpptStepCd=" + saleOpptStepCd + ", custCd=" + custCd + ", sexCd="
                + sexCd + ", tdrvYn=" + tdrvYn + "]";
    }



//
//    private  int                  callSeq;
//    private  int                  leadSeq;
//    private  int                  optySeq;
//    @Min(value = 0)
//    private  int                  visitSeq;
//    @NotBlank(groups={Modify.class})
//    private  String               custNo;
//    private  String               custNm;
//    private  String               custCd;
//    private  String               sexCd;
//    @NotBlank
//    private  String               hpNo;             // 전화번호 trim 필수
//    @NotBlank(groups=Draft.class)
//    private  String               csltTmCd;
//    // TODO 날짜는 validate groups가 안먹음.. 하나씩은되는데....
//    @NotNull
//    @JsonDeserialize(using=JsonDateDeserializer.class)
//    private  Date                 resvDt;
//    private  Date                 resvEndDt;
//    @JsonDeserialize(using=JsonDateDeserializer.class)
//    private  Date                 visitDt;
//    private  Date                 visitEndDt;
//    @JsonDeserialize(using=JsonDateDeserializer.class)
//    private  Date                 visitEndRealDt;
//    @NotBlank
//    private  String               scId;
//    private  String               scNm;
//    @NotBlank
//    private  String               visitPathCd;          // 내방 출처
//    private  String               vsitSrcDetlCd;        // 내방 출처 상세
//    private  String               visitPpsCd;        // 내방목적
//    @NotBlank
//    private  String               visitStatCd;          // 내방상태
//    @Min(value = 0)
//    private  int                  withPrsnCnt;          // 동행자수
//    private  String               compareBrandCd;       // 비교타사브랜드
//    private  String               compareModelCd;       // 비교타사모델
//    private  String               regUsrId;
//    private  String               regUsrNm;
//    private  Date                 regDt;
//    private  String               updtUsrId;
//    private  Date                 updtDt;
//    private  String               remark;
//    private  String               saleOpptYn;         // 기회여부 기회여부 -> 판매기회단계 상태 : 진행중 (실패/성공이 아닌것)
//    private  String               modelCd;
//    private  String               modelNm;
//    private  String               carLineCd;
//    private  String               carLineNm;
//    private  String               reVisitYn;                // 재방문 여부 -> 판매기회 등록 이후, 판매기회상태가 진행중인 상태에 방문한경우 재방문으로 인식한다.
//    private  String               saleOpptStepCd;            // 판매기회단계
//
//private String docId;
//






}