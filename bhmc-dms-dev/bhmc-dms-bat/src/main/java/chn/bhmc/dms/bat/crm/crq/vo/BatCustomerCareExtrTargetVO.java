package chn.bhmc.dms.bat.crm.crq.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 대상자 목록 VO
 *
 * @ClassName   : CustomerCareExtrTargetVO.java
 * @Description : CustomerCareExtrTargetVO.Class
 * @author in moon lee
 * @since 2016.05.25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.25     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"            , mesgKey="global.lbl.dlrCd")             // 딜러코드

    ,@ValidField(field="custCareSeq"      , mesgKey="crm.lbl.custCareSeq")          // 고객케어일련번호
    ,@ValidField(field="extrDgreCnt"      , mesgKey="crm.lbl.extrDgreCnt")          // 추출차수
    ,@ValidField(field="custNo"           , mesgKey="global.lbl.custNo")            // 고객번호
    ,@ValidField(field="custExtrTermCd"   , mesgKey="crm.lbl.custExtrTermCd")       // 고객추출조건
    ,@ValidField(field="telNo"            , mesgKey="global.lbl.telNo")             // 전화번호
    ,@ValidField(field="hpNo"             , mesgKey="global.lbl.hpNo")              // 휴대전화
    ,@ValidField(field="wechatId"         , mesgKey="global.lbl.wechatId")          // Wechat ID
    ,@ValidField(field="emailNm"          , mesgKey="global.lbl.emailNm")           // 이메일
    ,@ValidField(field="sungNm"           , mesgKey="global.lbl.sungNm")            // 성 이름
    ,@ValidField(field="cityNm"           , mesgKey="global.lbl.cityNm")            // 도시명
    ,@ValidField(field="distNm"           , mesgKey="global.lbl.distNm")            // 지역명
    ,@ValidField(field="zipCd"            , mesgKey="global.lbl.zipCd")             // 우편번호
    ,@ValidField(field="extZipCd"         , mesgKey="global.lbl.extZipCd")          // 확장우편번호
    ,@ValidField(field="addrNm"           , mesgKey="crm.lbl.addrNm")               // 주소
    ,@ValidField(field="addrDetlCont"     , mesgKey="crm.lbl.addrDetlCont")         // 상세주소
    ,@ValidField(field="smsSendDt"        , mesgKey="crm.lbl.smsSendDt")            // SMS전송일자
    ,@ValidField(field="smsSendRsltCont"  , mesgKey="crm.lbl.smsSendRsltCont")      // SMS전송결과
    ,@ValidField(field="callCenSendDt"    , mesgKey="crm.lbl.callCenSendDt")        // 콜센터 전송일
    ,@ValidField(field="callCenRsltCont"  , mesgKey="crm.lbl.callCenRsltCont")      // 콜센터 결과

    ,@ValidField(field="regUsrId"         , mesgKey="global.lbl.regUsrId")            // 등록자
    ,@ValidField(field="regDt"            , mesgKey="global.lbl.regDt")               // 등록일
    ,@ValidField(field="updtUsrId"        , mesgKey="global.lbl.updtUsrId")           // 수정자
    ,@ValidField(field="updtDt"           , mesgKey="global.lbl.updtDt")              // 수정일



})

public class BatCustomerCareExtrTargetVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 823167658930758120L;

    /**
     * 딜러코드
     **/
    private  String            dlrCd;

    /**
     * 고객케어일련번호
     **/
    private  int               custCareSeq;

    /**
     * 고객케어 대상자 일련번호
     **/
    private  int               targCustSeq;

    /**
     * 추출차수
     **/
    private  int               extrDgreCnt;

    /**
     * 고객번호
     **/
    private  String            custNo;

    /**
     * 고객추출조건번호
     **/
    private  String            custExtrTermCd;

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

    /**
     * SMS발송일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              smsSendDt;

    /**
     * SMS발송결과내용
     **/
    private  String            smsSendRsltCont;

    /**
     * 콜센터전송일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              callCenSendDt;

    /**
     * 콜센터결과내용
     **/
    private  String            callCenRsltCont;

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

    private  String            custNm;          // 고객명
    //private  String            custCd;          // 보유/가망고객
    private  String            regUsrNm;        // 등록자
    private  String            activeTpCd;      // 실행유형코드
    private  String            activeTpCdNm;      // 실행유형명
    private  String            autoActiveYn;    // 자동실행여부
    private  String            custExtrAutoYn;  // 대상자자동추출
    private  int               extrSeq;         // 고객 추출 SEQ

    private  int               smsTmplUserSeq;  // SMS 전송 대상자 임시 SEQ


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
     * @return the custCareSeq
     */
    public int getCustCareSeq() {
        return custCareSeq;
    }

    /**
     * @param custCareSeq the custCareSeq to set
     */
    public void setCustCareSeq(int custCareSeq) {
        this.custCareSeq = custCareSeq;
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
     * @return the custExtrTermCd
     */
    public String getCustExtrTermCd() {
        return custExtrTermCd;
    }

    /**
     * @param custExtrTermCd the custExtrTermCd to set
     */
    public void setCustExtrTermCd(String custExtrTermCd) {
        this.custExtrTermCd = custExtrTermCd;
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
     * @return the smsSendDt
     */
    public Date getSmsSendDt() {
        return smsSendDt;
    }

    /**
     * @param smsSendDt the smsSendDt to set
     */
    public void setSmsSendDt(Date smsSendDt) {
        this.smsSendDt = smsSendDt;
    }

    /**
     * @return the smsSendRsltCont
     */
    public String getSmsSendRsltCont() {
        return smsSendRsltCont;
    }

    /**
     * @param smsSendRsltCont the smsSendRsltCont to set
     */
    public void setSmsSendRsltCont(String smsSendRsltCont) {
        this.smsSendRsltCont = smsSendRsltCont;
    }

    /**
     * @return the callCenSendDt
     */
    public Date getCallCenSendDt() {
        return callCenSendDt;
    }

    /**
     * @param callCenSendDt the callCenSendDt to set
     */
    public void setCallCenSendDt(Date callCenSendDt) {
        this.callCenSendDt = callCenSendDt;
    }

    /**
     * @return the callCenRsltCont
     */
    public String getCallCenRsltCont() {
        return callCenRsltCont;
    }

    /**
     * @param callCenRsltCont the callCenRsltCont to set
     */
    public void setCallCenRsltCont(String callCenRsltCont) {
        this.callCenRsltCont = callCenRsltCont;
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
     * @return the activeTpCd
     */
    public String getActiveTpCd() {
        return activeTpCd;
    }

    /**
     * @param activeTpCd the activeTpCd to set
     */
    public void setActiveTpCd(String activeTpCd) {
        this.activeTpCd = activeTpCd;
    }

    /**
     * @return the autoActiveYn
     */
    public String getAutoActiveYn() {
        return autoActiveYn;
    }

    /**
     * @param autoActiveYn the autoActiveYn to set
     */
    public void setAutoActiveYn(String autoActiveYn) {
        this.autoActiveYn = autoActiveYn;
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
     * @return the extrSeq
     */
    public int getExtrSeq() {
        return extrSeq;
    }

    /**
     * @param extrSeq the extrSeq to set
     */
    public void setExtrSeq(int extrSeq) {
        this.extrSeq = extrSeq;
    }
    /**
     * @return the custExtrAutoYn
     */
    public String getCustExtrAutoYn() {
        return custExtrAutoYn;
    }

    /**
     * @param custExtrAutoYn the custExtrAutoYn to set
     */
    public void setCustExtrAutoYn(String custExtrAutoYn) {
        this.custExtrAutoYn = custExtrAutoYn;
    }



    /**
     * @return the smsTmplUserSeq
     */
    public int getSmsTmplUserSeq() {
        return smsTmplUserSeq;
    }

    /**
     * @param smsTmplUserSeq the smsTmplUserSeq to set
     */
    public void setSmsTmplUserSeq(int smsTmplUserSeq) {
        this.smsTmplUserSeq = smsTmplUserSeq;
    }




    /**
     * @return the activeTpCdNm
     */
    public String getActiveTpCdNm() {
        return activeTpCdNm;
    }

    /**
     * @param activeTpCdNm the activeTpCdNm to set
     */
    public void setActiveTpCdNm(String activeTpCdNm) {
        this.activeTpCdNm = activeTpCdNm;
    }

    /**
     * @return the targCustSeq
     */
    public int getTargCustSeq() {
        return targCustSeq;
    }

    /**
     * @param targCustSeq the targCustSeq to set
     */
    public void setTargCustSeq(int targCustSeq) {
        this.targCustSeq = targCustSeq;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CustomerCareExtrTargetVO [dlrCd=" + dlrCd + ", custCareSeq=" + custCareSeq + ", targCustSeq="
                + targCustSeq + ", extrDgreCnt=" + extrDgreCnt + ", custNo=" + custNo + ", custExtrTermCd="
                + custExtrTermCd + ", telNo=" + telNo + ", hpNo=" + hpNo + ", wechatId=" + wechatId + ", emailNm="
                + emailNm + ", sungNm=" + sungNm + ", cityNm=" + cityNm + ", distNm=" + distNm + ", zipCd=" + zipCd
                + ", extZipCd=" + extZipCd + ", addrNm=" + addrNm + ", addrDetlCont=" + addrDetlCont + ", smsSendDt="
                + smsSendDt + ", smsSendRsltCont=" + smsSendRsltCont + ", callCenSendDt=" + callCenSendDt
                + ", callCenRsltCont=" + callCenRsltCont + ", regUsrId=" + regUsrId + ", regDt=" + regDt
                + ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt + ", custNm=" + custNm + ", regUsrNm=" + regUsrNm
                + ", activeTpCd=" + activeTpCd + ", activeTpCdNm=" + activeTpCdNm + ", autoActiveYn=" + autoActiveYn
                + ", custExtrAutoYn=" + custExtrAutoYn + ", extrSeq=" + extrSeq + ", smsTmplUserSeq=" + smsTmplUserSeq
                + "]";
    }



}