package chn.bhmc.dms.crm.cal.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 콜센터실행 VO
 *
 * @ClassName   : CallCenterActionVO.java
 * @Description : CallCenterActionVO Class
 * @author in moon lee
 * @since 2016.05.17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.17     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"            , mesgKey="global.lbl.dlrCd")             //딜러코드
    ,@ValidField(field="callSeq"          , mesgKey="crm.lbl.callSeq")              //콜번호
    ,@ValidField(field="callTp"           , mesgKey="crm.lbl.callTp")               //콜유형
    ,@ValidField(field="refTableNm"       , mesgKey="global.lbl.refTableNm")        //출처테이블
    ,@ValidField(field="refKeyNm"         , mesgKey="global.lbl.refKeyNm")          //출처키
    ,@ValidField(field="bizCd"            , mesgKey="crm.lbl.bizCd")                //업무구분
    ,@ValidField(field="callPrsnId"       , mesgKey="crm.lbl.callPrsnId")           //콜담당자ID
    ,@ValidField(field="callRsltCd"       , mesgKey="crm.lbl.callRsltCd")           //콜결과코드
    ,@ValidField(field="recFileId"        , mesgKey="crm.lbl.recFileId")            //녹취파일ID
    ,@ValidField(field="callCont"         , mesgKey="crm.lbl.callCont")             //콜내용
    ,@ValidField(field="scheCallDt"       , mesgKey="crm.lbl.scheCallDt")           //예정콜일자
    ,@ValidField(field="realCallDt"       , mesgKey="crm.lbl.realCallDt")           //실제콜일자
    ,@ValidField(field="callPrsnAllocDt"  , mesgKey="crm.lbl.callPrsnAllocDt")      //콜담당배정일자
    ,@ValidField(field="regUsrId"         , mesgKey="global.lbl.regUsrId")          // 등록자
    ,@ValidField(field="regDt"            , mesgKey="global.lbl.regDt")             // 등록일
    ,@ValidField(field="updtUsrId"        , mesgKey="global.lbl.updtUsrId")         // 수정자
    ,@ValidField(field="updtDt"           , mesgKey="global.lbl.updtDt")            // 수정일
    ,@ValidField(field="callStartDt"      , mesgKey="crm.lbl.callStartDt")          // 콜시작일자
    ,@ValidField(field="callEndDt"        , mesgKey="crm.lbl.callEndDt")            // 콜종료일자
    ,@ValidField(field="callVsitResvDt"   , mesgKey="crm.lbl.callVsitResvDt")       // 콜내방예약일자
    ,@ValidField(field="remark"           , mesgKey="crm.lbl.remark")               // 비고
    ,@ValidField(field="callProcEndYn"    , mesgKey="crm.lbl.callProcEndYn")          // 콜센터처리완료여부
})

public class CallCenterActionVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2902895359185678353L;

    /**
     * 딜러코드
     **/
    private  String            dlrCd;

    /**
     * 콜일련번호
     **/
    private  String            callSeq;

    /**
     * 콜유형
     **/
    private  String            callTp;

    /**
     * 참조테이블명
     **/
    private  String            refTableNm;

    /**
     * 참조키명
     **/
    private  String            refKeyNm;

    /**
     * 업무코드
     **/
    private  String            bizCd;

    /**
     * 업무 SUB 코드
     **/
    private  String            bizSubCd;
    private  String            bizSubCdNm;

    /**
     * 콜담당자ID
     **/
    private  String            callPrsnId;

    /**
     * 콜결과코드
     **/
    private  String            callRsltCd;

    /**
     * 녹취파일ID
     **/
    private  String            recFileId;

    /**
     * 콜내용
     **/
    private  String            callCont;

    /**
     * 예정콜일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              scheCallDt;

    /**
     * 실제콜일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              realCallDt;

    /**
     * 콜담당자배정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              callPrsnAllocDt;

    /**
     * 등록자ID
     **/
    private  String            regUsrId;

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

    /**
     * 콜시작일자
     **/
    @NotNull(groups=Modify.class)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              callStartDt;

    /**
     * 콜종료일자
     **/
    @NotNull(groups=Modify.class)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              callEndDt;

    /**
     * 콜내방예약일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              callVsitResvDt;

    /**
     * 만족도조사 완료일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              stsfIvstDt;

    /**
     * 콜수
     **/
    private  int               callCnt;

    /**
     * 고객추출조건번호
     **/
    private  int               extrDgreCnt;

    /**
     * 고객번호
     **/
    private  String            custNo;

    /**
     * 전화번호
     **/
    private  String            telNo;

    /**
     * 휴대폰번호
     **/
    private  String            hpNo;

    /**
     * 위챗ID
     **/
    private  String            wechatId;

    /**
     * 이메일명
     **/
    private  String            emailNm;

    /**
     * 성명
     **/
    private  String            sungNm;

    /**
     * 도시명
     **/
    private  String            cityNm;

    /**
     * 지역명
     **/
    private  String            distNm;

    /**
     * 우편번호
     **/
    private  String            zipCd;

    /**
     * 확장우편번호
     **/
    private  String            extZipCd;

    /**
     * 주소명
     **/
    private  String            addrNm;

    /**
     * 주소상세내용
     **/
    private  String            addrDetlCont;

    private  String            custNm;          // 고객명
    private  String            custCd;          // 보유/가망고객
    private  String            regUsrNm;        // 등록자
    private  String            callPrsnNm;      // 콜담당자

    private  String            custCareCont;    // [고객케어] 고객케어내용

    private  String            makCd;           // [캠페인] 캠페인 번호
    private  String            talkPlan;        // [캠페인] 화술방안
    private  String            activeCont;      // [캠페인] 요약설명
    private  String            activeFileDocNo; // [캠페인] 첨부파일

    private  String            stsfIvstMthCd;   // [만족도조사] 조사유형
    private  String            startDt;         // [만족도조사] 시작일
    private  String            endDt;           // [만족도조사] 종료일
    private  int               stsfIvstRsltSeq; // [만족도조사] 만족도조사 결과 일련번호
    private  int               seq;             // [만족도조사] 만족도조사 번호


    private  String            remark;           // 비고
    private  String            callProcEndYn = "N";           // 콜 close 여부

    private String bizCdNm;             //업무코드
    private String callRsltCdNm;        //콜결과코드
    private String assignYn;        //배정여부
    private String assignYnNm;        //배정여부
    private String callBizTitleNm;        //콜센터 업무 이름

    private  int               callHisSeq;          // 디바이스 정보 히스토리 번호
    private  String mngScId;          // 방문예약시 지정한 책임자 아이디

    private  String holdTp;         // 리드출처
    private  int holdDetlTpSeq;  // 리드출처 상세 ( 캠페인인경우 )

    private  String callValidYn;    // 유효통화여부

    private String callDialNum;

    private String mngUsrNm;  //고객 담당자명
    private String purcMngNm; //법인 연계인 이름
    private String useCustNm; //사용처 연계 고객명
    private String useHpNo;   //사용처 연계 핸드폰 번호
    private String custTp;  //고객구분(개인/법인)
    private String callAssignIdNm;  //배정인
    private String callAssignId;    //배정인


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
     * @return the callSeq
     */
    public String getCallSeq() {
        return callSeq;
    }
    /**
     * @param callSeq the callSeq to set
     */
    public void setCallSeq(String callSeq) {
        this.callSeq = callSeq;
    }
    /**
     * @return the callTp
     */
    public String getCallTp() {
        return callTp;
    }
    /**
     * @param callTp the callTp to set
     */
    public void setCallTp(String callTp) {
        this.callTp = callTp;
    }
    /**
     * @return the refTableNm
     */
    public String getRefTableNm() {
        return refTableNm;
    }
    /**
     * @param refTableNm the refTableNm to set
     */
    public void setRefTableNm(String refTableNm) {
        this.refTableNm = refTableNm;
    }
    /**
     * @return the refKeyNm
     */
    public String getRefKeyNm() {
        return refKeyNm;
    }
    /**
     * @param refKeyNm the refKeyNm to set
     */
    public void setRefKeyNm(String refKeyNm) {
        this.refKeyNm = refKeyNm;
    }
    /**
     * @return the bizCd
     */
    public String getBizCd() {
        return bizCd;
    }
    /**
     * @param bizCd the bizCd to set
     */
    public void setBizCd(String bizCd) {
        this.bizCd = bizCd;
    }

    /**
     * @return the bizSubCd
     */
    public String getBizSubCd() {
        return bizSubCd;
    }
    /**
     * @param bizSubCd the bizSubCd to set
     */
    public void setBizSubCd(String bizSubCd) {
        this.bizSubCd = bizSubCd;
    }

    /**
     * @return the bizSubCdNm
     */
    public String getBizSubCdNm() {
        return bizSubCdNm;
    }
    /**
     * @param bizSubCdNm the bizSubCdNm to set
     */
    public void setBizSubCdNm(String bizSubCdNm) {
        this.bizSubCdNm = bizSubCdNm;
    }

    /**
     * @return the callPrsnId
     */
    public String getCallPrsnId() {
        return callPrsnId;
    }
    /**
     * @param callPrsnId the callPrsnId to set
     */
    public void setCallPrsnId(String callPrsnId) {
        this.callPrsnId = callPrsnId;
    }
    /**
     * @return the callRsltCd
     */
    public String getCallRsltCd() {
        return callRsltCd;
    }
    /**
     * @param callRsltCd the callRsltCd to set
     */
    public void setCallRsltCd(String callRsltCd) {
        this.callRsltCd = callRsltCd;
    }
    /**
     * @return the recFileId
     */
    public String getRecFileId() {
        return recFileId;
    }
    /**
     * @param recFileId the recFileId to set
     */
    public void setRecFileId(String recFileId) {
        this.recFileId = recFileId;
    }
    /**
     * @return the callCont
     */
    public String getCallCont() {
        return callCont;
    }
    /**
     * @param callCont the callCont to set
     */
    public void setCallCont(String callCont) {
        this.callCont = callCont;
    }
    /**
     * @return the scheCallDt
     */
    public Date getScheCallDt() {
        return scheCallDt;
    }
    /**
     * @param scheCallDt the scheCallDt to set
     */
    public void setScheCallDt(Date scheCallDt) {
        this.scheCallDt = scheCallDt;
    }
    /**
     * @return the realCallDt
     */
    public Date getRealCallDt() {
        return realCallDt;
    }
    /**
     * @param realCallDt the realCallDt to set
     */
    public void setRealCallDt(Date realCallDt) {
        this.realCallDt = realCallDt;
    }
    /**
     * @return the callPrsnAllocDt
     */
    public Date getCallPrsnAllocDt() {
        return callPrsnAllocDt;
    }
    /**
     * @param callPrsnAllocDt the callPrsnAllocDt to set
     */
    public void setCallPrsnAllocDt(Date callPrsnAllocDt) {
        this.callPrsnAllocDt = callPrsnAllocDt;
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
     * @return the callCnt
     */
    public int getCallCnt() {
        return callCnt;
    }
    /**
     * @param callCnt the callCnt to set
     */
    public void setCallCnt(int callCnt) {
        this.callCnt = callCnt;
    }
    /**
     * @return the extrDgreCnt
     */
    public int getExtrDgreCnt() {
        return extrDgreCnt;
    }
    /**
     * @param extrDgreCnt the extrDgreCnt to set
     */
    public void setExtrDgreCnt(int extrDgreCnt) {
        this.extrDgreCnt = extrDgreCnt;
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
     * @return the extZipCd
     */
    public String getExtZipCd() {
        return extZipCd;
    }
    /**
     * @param extZipCd the extZipCd to set
     */
    public void setExtZipCd(String extZipCd) {
        this.extZipCd = extZipCd;
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
     * @return the custCareCont
     */
    public String getCustCareCont() {
        return custCareCont;
    }
    /**
     * @param custCareCont the custCareCont to set
     */
    public void setCustCareCont(String custCareCont) {
        this.custCareCont = custCareCont;
    }
    /**
     * @return the startDt
     */
    public String getStartDt() {
        return startDt;
    }
    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }
    /**
     * @return the endDt
     */
    public String getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }


    /**
     * @return the callPrsnNm
     */
    public String getCallPrsnNm() {
        return callPrsnNm;
    }
    /**
     * @param callPrsnNm the callPrsnNm to set
     */
    public void setCallPrsnNm(String callPrsnNm) {
        this.callPrsnNm = callPrsnNm;
    }
    /**
     * @return the talkPlan
     */
    public String getTalkPlan() {
        return talkPlan;
    }
    /**
     * @param talkPlan the talkPlan to set
     */
    public void setTalkPlan(String talkPlan) {
        this.talkPlan = talkPlan;
    }


    /**
     * @return the activeCont
     */
    public String getActiveCont() {
        return activeCont;
    }
    /**
     * @param activeCont the activeCont to set
     */
    public void setActiveCont(String activeCont) {
        this.activeCont = activeCont;
    }
    /**
     * @return the activeFileDocNo
     */
    public String getActiveFileDocNo() {
        return activeFileDocNo;
    }
    /**
     * @param activeFileDocNo the activeFileDocNo to set
     */
    public void setActiveFileDocNo(String activeFileDocNo) {
        this.activeFileDocNo = activeFileDocNo;
    }

    /**
     * @return the stsfIvstMthCd
     */
    public String getStsfIvstMthCd() {
        return stsfIvstMthCd;
    }
    /**
     * @param stsfIvstMthCd the stsfIvstMthCd to set
     */
    public void setStsfIvstMthCd(String stsfIvstMthCd) {
        this.stsfIvstMthCd = stsfIvstMthCd;
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
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the stsfIvstRsltSeq
     */
    public int getStsfIvstRsltSeq() {
        return stsfIvstRsltSeq;
    }
    /**
     * @param stsfIvstRsltSeq the stsfIvstRsltSeq to set
     */
    public void setStsfIvstRsltSeq(int stsfIvstRsltSeq) {
        this.stsfIvstRsltSeq = stsfIvstRsltSeq;
    }

    /**
     * @return the callStartDt
     */
    public Date getCallStartDt() {
        return callStartDt;
    }
    /**
     * @param callStartDt the callStartDt to set
     */
    public void setCallStartDt(Date callStartDt) {
        this.callStartDt = callStartDt;
    }
    /**
     * @return the callEndDt
     */
    public Date getCallEndDt() {
        return callEndDt;
    }
    /**
     * @param callEndDt the callEndDt to set
     */
    public void setCallEndDt(Date callEndDt) {
        this.callEndDt = callEndDt;
    }
    /**
     * @return the callVsitResvDt
     */
    public Date getCallVsitResvDt() {
        return callVsitResvDt;
    }
    /**
     * @param callVsitResvDt the callVsitResvDt to set
     */
    public void setCallVsitResvDt(Date callVsitResvDt) {
        this.callVsitResvDt = callVsitResvDt;
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
     * @return the callProcEndYn
     */
    public String getCallProcEndYn() {
        return callProcEndYn;
    }
    /**
     * @param callProcEndYn the callProcEndYn to set
     */
    public void setCallProcEndYn(String callProcEndYn) {
        this.callProcEndYn = callProcEndYn;
    }

    /**
     * @return the bizCdNm
     */
    public String getBizCdNm() {
        return bizCdNm;
    }
    /**
     * @param bizCdNm the bizCdNm to set
     */
    public void setBizCdNm(String bizCdNm) {
        this.bizCdNm = bizCdNm;
    }
    /**
     * @return the callRsltCdNm
     */
    public String getCallRsltCdNm() {
        return callRsltCdNm;
    }
    /**
     * @param callRsltCdNm the callRsltCdNm to set
     */
    public void setCallRsltCdNm(String callRsltCdNm) {
        this.callRsltCdNm = callRsltCdNm;
    }
    /**
     * @return the assignYn
     */
    public String getAssignYn() {
        return assignYn;
    }
    /**
     * @param assignYn the assignYn to set
     */
    public void setAssignYn(String assignYn) {
        this.assignYn = assignYn;
    }

    /**
     * @return the assignYnNm
     */
    public String getAssignYnNm() {
        return assignYnNm;
    }
    /**
     * @param assignYnNm the assignYnNm to set
     */
    public void setAssignYnNm(String assignYnNm) {
        this.assignYnNm = assignYnNm;
    }

    /**
     * @return the callBizTitleNm
     */
    public String getCallBizTitleNm() {
        return callBizTitleNm;
    }
    /**
     * @param callBizTitleNm the callBizTitleNm to set
     */
    public void setCallBizTitleNm(String callBizTitleNm) {
        this.callBizTitleNm = callBizTitleNm;
    }
    /**
     * @return the stsfIvstDt
     */
    public Date getStsfIvstDt() {
        return stsfIvstDt;
    }
    /**
     * @param stsfIvstDt the stsfIvstDt to set
     */
    public void setStsfIvstDt(Date stsfIvstDt) {
        this.stsfIvstDt = stsfIvstDt;
    }

    /**
     * @return the callHisSeq
     */
    public int getCallHisSeq() {
        return callHisSeq;
    }
    /**
     * @param callHisSeq the callHisSeq to set
     */
    public void setCallHisSeq(int callHisSeq) {
        this.callHisSeq = callHisSeq;
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
     * @return the holdDetlTpSeq
     */
    public int getHoldDetlTpSeq() {
        return holdDetlTpSeq;
    }
    /**
     * @param holdDetlTpSeq the holdDetlTpSeq to set
     */
    public void setHoldDetlTpSeq(int  holdDetlTpSeq) {
        this.holdDetlTpSeq = holdDetlTpSeq;
    }

    /**
     * @return the callValidYn
     */
    public String getCallValidYn() {
        return callValidYn;
    }
    /**
     * @param callValidYn the callValidYn to set
     */
    public void setCallValidYn(String callValidYn) {
        this.callValidYn = callValidYn;
    }

    /**
     * @return the callDialNum
     */
    public String getCallDialNum() {
        return callDialNum;
    }
    /**
     * @param callDialNum the callDialNum to set
     */
    public void setCallDialNum(String callDialNum) {
        this.callDialNum = callDialNum;
    }
    /**
     * @return the useCustNm
     */
    public String getUseCustNm() {
        return useCustNm;
    }
    /**
     * @param useCustNm the useCustNm to set
     */
    public void setUseCustNm(String useCustNm) {
        this.useCustNm = useCustNm;
    }
    /**
     * @return the useHpNo
     */
    public String getUseHpNo() {
        return useHpNo;
    }
    /**
     * @param useHpNo the useHpNo to set
     */
    public void setUseHpNo(String useHpNo) {
        this.useHpNo = useHpNo;
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
     * @return the mngUsrNm
     */
    public String getMngUsrNm() {
        return mngUsrNm;
    }
    /**
     * @param mngUsrNm the mngUsrNm to set
     */
    public void setMngUsrNm(String mngUsrNm) {
        this.mngUsrNm = mngUsrNm;
    }
    /**
     * @return the callAssignIdNm
     */
    public String getCallAssignIdNm() {
        return callAssignIdNm;
    }
    /**
     * @param callAssignIdNm the callAssignIdNm to set
     */
    public void setCallAssignIdNm(String callAssignIdNm) {
        this.callAssignIdNm = callAssignIdNm;
    }
    /**
     * @return the callAssignId
     */
    public String getCallAssignId() {
        return callAssignId;
    }
    /**
     * @param callAssignId the callAssignId to set
     */
    public void setCallAssignId(String callAssignId) {
        this.callAssignId = callAssignId;
    }


}