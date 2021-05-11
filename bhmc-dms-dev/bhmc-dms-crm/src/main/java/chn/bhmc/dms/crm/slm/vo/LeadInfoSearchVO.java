package chn.bhmc.dms.crm.slm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LeadInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"         , mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="pltCd"         , mesgKey="global.lbl.pltCd")
    ,@ValidField(field="leadNo"        , mesgKey="global.lbl.leadNo")
    ,@ValidField(field="custNo"        , mesgKey="global.lbl.custNo")
    ,@ValidField(field="opptNo"        , mesgKey="global.lbl.opptNo")
    ,@ValidField(field="hpNo"          , mesgKey="global.lbl.hpNo")
    ,@ValidField(field="telNo"         , mesgKey="global.lbl.telNo")
    ,@ValidField(field="leadSrcCd"     , mesgKey="global.lbl.leadSrcCd")
    ,@ValidField(field="bhmcYn"        , mesgKey="global.lbl.bhmcYn")
    ,@ValidField(field="bhmcLeadNo"    , mesgKey="global.lbl.bhmcLeadNo")
    ,@ValidField(field="respDeptCd"    , mesgKey="global.lbl.respDeptCd")
    ,@ValidField(field="prsnId"        , mesgKey="global.lbl.prsnId")
    ,@ValidField(field="statCd"        , mesgKey="global.lbl.statCd")
    ,@ValidField(field="ddlnDt"        , mesgKey="global.lbl.ddlnDt")
    ,@ValidField(field="opptChgDt"     , mesgKey="global.lbl.opptChgDt")
    ,@ValidField(field="expcSaleDt"    , mesgKey="global.lbl.expcSaleDt")
    ,@ValidField(field="succPrbCd"     , mesgKey="global.lbl.succPrbCd")
    ,@ValidField(field="bhmcReceiveDt" , mesgKey="global.lbl.bhmcReceiveDt")
    ,@ValidField(field="bhmcSendDt"    , mesgKey="global.lbl.bhmcSendDt")
    ,@ValidField(field="remark"        , mesgKey="global.lbl.remark")
    ,@ValidField(field="regUsrId"      , mesgKey="global.lbl.regUsrId")
    ,@ValidField(field="regDt"         , mesgKey="global.lbl.regDt")
    ,@ValidField(field="updtUsrId"     , mesgKey="global.lbl.updtUsrId")
    ,@ValidField(field="updtDt"        , mesgKey="global.lbl.updtDt")
   })

public class LeadInfoSearchVO extends SearchVO {



    /**
    * Statements
    * (long)serialVersionUID
    */
    private static final long serialVersionUID = -8937830982223545331L;

    /**
     * 딜러코드
     **/

    private  String         sDlrCd;

    /**
     * 사업장코드
     **/

    private  String         sPltCd;

    /**
     * 리드번호
     **/

    private  String         sLeadNo;

    /**
     * 고객번호
     **/

    private  String         sCustNo;

    /**
     * 기회번호
     **/

    private  String         sOpptNo;

    /**
     * 휴대폰번호
     **/

    private  String         sHpNo;

    /**
     * 전화번호
     **/

    private  String         sTelNo;

    /**
     * 리드출처코드
     **/

    private  String         sLeadSrcCd;

    /**
     * BHMC여부
     **/

    private  String         sBhmcYn;

    /**
     * BHMC리드번호
     **/

    private  String         sBhmcLeadNo;

    /**
     * 담당부서코드
     **/

    private  String         sRespDeptCd;

    /**
     * 콜업무담당자
     **/
    private  String         sPrsnId;

    /**
     * 판매고문
     **/
    private  String         sMngScId;

    /**
     * 상태코드
     **/

    private  String         sStatCd;

    private  String         sRefTableNm;
    private  String         sRefKeyNm;

    private  String          sCallStatCd;

    private  String         sCallListCd;


    /**
     * 마감일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sDdlnDt;

    /**
     * 기회전환일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sOpptChgDt;

    /**
     * 예상판매일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sExpcSaleDt;

    /**
     * 성공확률코드
     **/

    private  String         sSuccPrbCd;

    /**
     * BHMC수신일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sBhmcReceiveDt;

    /**
     * BHNC송신일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sBhmcSendDt;

    /**
     * 비고
     **/

    private  String         sRemark;

    /**
     * 등록자ID
     **/

    private  String         sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sRegDt;

    /**
     * 수정자ID
     **/

    private  String         sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sUpdtDt;

    /**
     * 리드타입(IDCC,COMMON)
     **/
    private  String         sLeadTp;

    private  String         sCustNm;

    /**
     * 배정일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sAllocDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sAllocDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sAllocDtTo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sRegDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sRegDtTo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sNextCallDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sNextCallDtTo;

    /**
     * 지연여부
     **/
    private  String         sDelayYn = "N";

    private  String         sLeadSrcDtl;

    // 배정여부
    private  String         sAssignYn;



    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sLeadNo
     */
    public String getsLeadNo() {
        return sLeadNo;
    }

    /**
     * @param sLeadNo the sLeadNo to set
     */
    public void setsLeadNo(String sLeadNo) {
        this.sLeadNo = sLeadNo;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sOpptNo
     */
    public String getsOpptNo() {
        return sOpptNo;
    }

    /**
     * @param sOpptNo the sOpptNo to set
     */
    public void setsOpptNo(String sOpptNo) {
        this.sOpptNo = sOpptNo;
    }

    /**
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }

    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }

    /**
     * @return the sTelNo
     */
    public String getsTelNo() {
        return sTelNo;
    }

    /**
     * @param sTelNo the sTelNo to set
     */
    public void setsTelNo(String sTelNo) {
        this.sTelNo = sTelNo;
    }

    /**
     * @return the sLeadSrcCd
     */
    public String getsLeadSrcCd() {
        return sLeadSrcCd;
    }

    /**
     * @param sLeadSrcCd the sLeadSrcCd to set
     */
    public void setsLeadSrcCd(String sLeadSrcCd) {
        this.sLeadSrcCd = sLeadSrcCd;
    }

    /**
     * @return the sBhmcYn
     */
    public String getsBhmcYn() {
        return sBhmcYn;
    }

    /**
     * @param sBhmcYn the sBhmcYn to set
     */
    public void setsBhmcYn(String sBhmcYn) {
        this.sBhmcYn = sBhmcYn;
    }

    /**
     * @return the sBhmcLeadNo
     */
    public String getsBhmcLeadNo() {
        return sBhmcLeadNo;
    }

    /**
     * @param sBhmcLeadNo the sBhmcLeadNo to set
     */
    public void setsBhmcLeadNo(String sBhmcLeadNo) {
        this.sBhmcLeadNo = sBhmcLeadNo;
    }

    /**
     * @return the sRespDeptCd
     */
    public String getsRespDeptCd() {
        return sRespDeptCd;
    }

    /**
     * @param sRespDeptCd the sRespDeptCd to set
     */
    public void setsRespDeptCd(String sRespDeptCd) {
        this.sRespDeptCd = sRespDeptCd;
    }

    /**
     * @return the sPrsnId
     */
    public String getsPrsnId() {
        return sPrsnId;
    }

    /**
     * @param sPrsnId the sPrsnId to set
     */
    public void setsPrsnId(String sPrsnId) {
        this.sPrsnId = sPrsnId;
    }

    /**
     * @return the sStatCd
     */
    public String getsStatCd() {
        return sStatCd;
    }

    /**
     * @param sStatCd the sStatCd to set
     */
    public void setsStatCd(String sStatCd) {
        this.sStatCd = sStatCd;
    }

    /**
     * @return the sDdlnDt
     */
    public Date getsDdlnDt() {
        return sDdlnDt;
    }

    /**
     * @param sDdlnDt the sDdlnDt to set
     */
    public void setsDdlnDt(Date sDdlnDt) {
        this.sDdlnDt = sDdlnDt;
    }

    /**
     * @return the sOpptChgDt
     */
    public Date getsOpptChgDt() {
        return sOpptChgDt;
    }

    /**
     * @param sOpptChgDt the sOpptChgDt to set
     */
    public void setsOpptChgDt(Date sOpptChgDt) {
        this.sOpptChgDt = sOpptChgDt;
    }

    /**
     * @return the sExpcSaleDt
     */
    public Date getsExpcSaleDt() {
        return sExpcSaleDt;
    }

    /**
     * @param sExpcSaleDt the sExpcSaleDt to set
     */
    public void setsExpcSaleDt(Date sExpcSaleDt) {
        this.sExpcSaleDt = sExpcSaleDt;
    }

    /**
     * @return the sSuccPrbCd
     */
    public String getsSuccPrbCd() {
        return sSuccPrbCd;
    }

    /**
     * @param sSuccPrbCd the sSuccPrbCd to set
     */
    public void setsSuccPrbCd(String sSuccPrbCd) {
        this.sSuccPrbCd = sSuccPrbCd;
    }

    /**
     * @return the sBhmcReceiveDt
     */
    public Date getsBhmcReceiveDt() {
        return sBhmcReceiveDt;
    }

    /**
     * @param sBhmcReceiveDt the sBhmcReceiveDt to set
     */
    public void setsBhmcReceiveDt(Date sBhmcReceiveDt) {
        this.sBhmcReceiveDt = sBhmcReceiveDt;
    }

    /**
     * @return the sBhmcSendDt
     */
    public Date getsBhmcSendDt() {
        return sBhmcSendDt;
    }

    /**
     * @param sBhmcSendDt the sBhmcSendDt to set
     */
    public void setsBhmcSendDt(Date sBhmcSendDt) {
        this.sBhmcSendDt = sBhmcSendDt;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }

    /**
     * @return the sRefTableNm
     */
    public String getsRefTableNm() {
        return sRefTableNm;
    }

    /**
     * @param sRefTableNm the sRefTableNm to set
     */
    public void setsRefTableNm(String sRefTableNm) {
        this.sRefTableNm = sRefTableNm;
    }

    /**
     * @return the sRefKeyNm
     */
    public String getsRefKeyNm() {
        return sRefKeyNm;
    }

    /**
     * @param sRefKeyNm the sRefKeyNm to set
     */
    public void setsRefKeyNm(String sRefKeyNm) {
        this.sRefKeyNm = sRefKeyNm;
    }

    /**
     * @return the sLeadTp
     */
    public String getsLeadTp() {
        return sLeadTp;
    }

    /**
     * @param sLeadTp the sLeadTp to set
     */
    public void setsLeadTp(String sLeadTp) {
        this.sLeadTp = sLeadTp;
    }

    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sCallStatCd
     */
    public String getsCallStatCd() {
        return sCallStatCd;
    }

    /**
     * @param sCallStatCd the sCallStatCd to set
     */
    public void setsCallStatCd(String sCallStatCd) {
        this.sCallStatCd = sCallStatCd;
    }

    /**
     * @return the sCallListCd
     */
    public String getsCallListCd() {
        return sCallListCd;
    }

    /**
     * @param sCallListCd the sCallListCd to set
     */
    public void setsCallListCd(String sCallListCd) {
        this.sCallListCd = sCallListCd;
    }

    /**
     * @return the sAllocDt
     */
    public Date getsAllocDt() {
        return sAllocDt;
    }

    /**
     * @param sAllocDt the sAllocDt to set
     */
    public void setsAllocDt(Date sAllocDt) {
        this.sAllocDt = sAllocDt;
    }

    /**
     * @return the sDelayYn
     */
    public String getsDelayYn() {
        return sDelayYn;
    }

    /**
     * @param sDelayYn the sDelayYn to set
     */
    public void setsDelayYn(String sDelayYn) {
        this.sDelayYn = sDelayYn;
    }

    /**
     * @return the sAllocDtFrom
     */
    public Date getsAllocDtFrom() {
        return sAllocDtFrom;
    }

    /**
     * @param sAllocDtFrom the sAllocDtFrom to set
     */
    public void setsAllocDtFrom(Date sAllocDtFrom) {
        this.sAllocDtFrom = sAllocDtFrom;
    }

    /**
     * @return the sAllocDtTo
     */
    public Date getsAllocDtTo() {
        return sAllocDtTo;
    }

    /**
     * @param sAllocDtTo the sAllocDtTo to set
     */
    public void setsAllocDtTo(Date sAllocDtTo) {
        this.sAllocDtTo = sAllocDtTo;
    }

    /**
     * @return the sLeadSrcDtl
     */
    public String getsLeadSrcDtl() {
        return sLeadSrcDtl;
    }

    /**
     * @param sLeadSrcDtl the sLeadSrcDtl to set
     */
    public void setsLeadSrcDtl(String sLeadSrcDtl) {
        this.sLeadSrcDtl = sLeadSrcDtl;
    }

    /**
     * @return the sAssignYn
     */
    public String getsAssignYn() {
        return sAssignYn;
    }

    /**
     * @param sAssignYn the sAssignYn to set
     */
    public void setsAssignYn(String sAssignYn) {
        this.sAssignYn = sAssignYn;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "LeadInfoSearchVO [sDlrCd=" + sDlrCd + ", sPltCd=" + sPltCd + ", sLeadNo=" + sLeadNo + ", sCustNo="
                + sCustNo + ", sOpptNo=" + sOpptNo + ", sHpNo=" + sHpNo + ", sTelNo=" + sTelNo + ", sLeadSrcCd="
                + sLeadSrcCd + ", sBhmcYn=" + sBhmcYn + ", sBhmcLeadNo=" + sBhmcLeadNo + ", sRespDeptCd=" + sRespDeptCd
                + ", sPrsnId=" + sPrsnId + ", sStatCd=" + sStatCd + ", sRefTableNm=" + sRefTableNm + ", sRefKeyNm="
                + sRefKeyNm + ", sCallStatCd=" + sCallStatCd + ", sCallListCd=" + sCallListCd + ", sDdlnDt=" + sDdlnDt
                + ", sOpptChgDt=" + sOpptChgDt + ", sExpcSaleDt=" + sExpcSaleDt + ", sSuccPrbCd=" + sSuccPrbCd
                + ", sBhmcReceiveDt=" + sBhmcReceiveDt + ", sBhmcSendDt=" + sBhmcSendDt + ", sRemark=" + sRemark
                + ", sRegUsrId=" + sRegUsrId + ", sRegDt=" + sRegDt + ", sUpdtUsrId=" + sUpdtUsrId + ", sUpdtDt="
                + sUpdtDt + ", sLeadTp=" + sLeadTp + ", sCustNm=" + sCustNm + ", sAllocDt=" + sAllocDt
                + ", sAllocDtFrom=" + sAllocDtFrom + ", sAllocDtTo=" + sAllocDtTo + ", sDelayYn=" + sDelayYn
                + ", sLeadSrcDtl=" + sLeadSrcDtl + ", sAssignYn=" + sAssignYn + "]";
    }

    /**
     * @return the sNextCallDtFrom
     */
    public Date getsNextCallDtFrom() {
        return sNextCallDtFrom;
    }

    /**
     * @param sNextCallDtFrom the sNextCallDtFrom to set
     */
    public void setsNextCallDtFrom(Date sNextCallDtFrom) {
        this.sNextCallDtFrom = sNextCallDtFrom;
    }

    /**
     * @return the sNextCallDtTo
     */
    public Date getsNextCallDtTo() {
        return sNextCallDtTo;
    }

    /**
     * @param sNextCallDtTo the sNextCallDtTo to set
     */
    public void setsNextCallDtTo(Date sNextCallDtTo) {
        this.sNextCallDtTo = sNextCallDtTo;
    }

    /**
     * @return the sMngScId
     */
    public String getsMngScId() {
        return sMngScId;
    }

    /**
     * @param sMngScId the sMngScId to set
     */
    public void setsMngScId(String sMngScId) {
        this.sMngScId = sMngScId;
    }

    /**
     * @return the sRegDtFrom
     */
    public Date getsRegDtFrom() {
        return sRegDtFrom;
    }

    /**
     * @param sRegDtFrom the sRegDtFrom to set
     */
    public void setsRegDtFrom(Date sRegDtFrom) {
        this.sRegDtFrom = sRegDtFrom;
    }

    /**
     * @return the sRegDtTo
     */
    public Date getsRegDtTo() {
        return sRegDtTo;
    }

    /**
     * @param sRegDtTo the sRegDtTo to set
     */
    public void setsRegDtTo(Date sRegDtTo) {
        this.sRegDtTo = sRegDtTo;
    }


}
