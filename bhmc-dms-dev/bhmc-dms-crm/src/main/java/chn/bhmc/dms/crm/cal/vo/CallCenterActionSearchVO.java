package chn.bhmc.dms.crm.cal.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 콜센터실행 관리 조회 SearchVO
 *
 * @ClassName   : CallCenterActionSearchVO.java
 * @Description : CallCenterActionSearchVO Class
 * @author in moon lee
 * @since 2016.05.17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.17.     in moon lee     최초 생성
 * </pre>
 */

public class CallCenterActionSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1103061946253859410L;

    private  String              sDlrCd;            // 딜러코드     [콜조회, 콜센터(OB)배정]
    private  String              sCustNm;           // 고객명        [콜조회]
    private  String              sHpNo;             // 휴대전화     [콜조회]
    private  String              sTelNo;            // 집전화         [콜조회]
    private  String              sCallProcEndYn;    // 콜상태          [콜조회]
    private  String              sBizCd;            // 업무코드 CRM361      [콜조회, 콜센터(OB)배정]
    private  String              sBizSubCd;         // 업무코드SUB      [콜조회, 콜센터(OB)배정]
    private  String              sCallPrsnId;       // 콜담당자ID           [콜센터(OB)배정]
    private  String              sCallSeq;          // 콜SEQ           [콜상세조회]
    private  int                 sSeq;              // 만족도조사 SEQ           [콜상세조회]
    private  String              sRefKeyNm;         // refKeyNm (만족도조사인경우 stsfIvstRsltSeq ) [콜상세조회]

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartRegDt;                     // 콜센터 등록 시작일 [콜센터(OB)배정]
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndRegDt;                       // 콜센터 등록 종료일 [콜센터(OB)배정]

    private String sAssignYn;                     // 배정여부 [콜센터(OB)배정]

    private String sCust;                           // 고객정보 like 검색 [콜상세조회]
    private String sCallBizTitleNm;                   // 콜업무타이틀명 like 검색 [OB배정관리]
    private String sAllView;                        // Role에 따른 전체 조회 여부
    private String sListTp;                        // A : 배정 / R : 실행

    private int sCallCnt;

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
     * @return the sCallProcEndYn
     */
    public String getsCallProcEndYn() {
        return sCallProcEndYn;
    }

    /**
     * @param sCallProcEndYn the sCallProcEndYn to set
     */
    public void setsCallProcEndYn(String sCallProcEndYn) {
        this.sCallProcEndYn = sCallProcEndYn;
    }

    /**
     * @return the sBizCd
     */
    public String getsBizCd() {
        return sBizCd;
    }

    /**
     * @param sBizCd the sBizCd to set
     */
    public void setsBizCd(String sBizCd) {
        this.sBizCd = sBizCd;
    }

    /**
     * @return the sBizSubCd
     */
    public String getsBizSubCd() {
        return sBizSubCd;
    }

    /**
     * @param sBizSubCd the sBizSubCd to set
     */
    public void setsBizSubCd(String sBizSubCd) {
        this.sBizSubCd = sBizSubCd;
    }

    /**
     * @return the sCallPrsnId
     */
    public String getsCallPrsnId() {
        return sCallPrsnId;
    }

    /**
     * @param sCallPrsnId the sCallPrsnId to set
     */
    public void setsCallPrsnId(String sCallPrsnId) {
        this.sCallPrsnId = sCallPrsnId;
    }

    /**
     * @return the sCallSeq
     */
    public String getsCallSeq() {
        return sCallSeq;
    }

    /**
     * @param sCallSeq the sCallSeq to set
     */
    public void setsCallSeq(String sCallSeq) {
        this.sCallSeq = sCallSeq;
    }

    /**
     * @return the sStartRegDt
     */
    public Date getsStartRegDt() {
        return sStartRegDt;
    }

    /**
     * @param sStartRegDt the sStartRegDt to set
     */
    public void setsStartRegDt(Date sStartRegDt) {
        this.sStartRegDt = sStartRegDt;
    }

    /**
     * @return the sEndRegDt
     */
    public Date getsEndRegDt() {
        return sEndRegDt;
    }

    /**
     * @param sEndRegDt the sEndRegDt to set
     */
    public void setsEndRegDt(Date sEndRegDt) {
        this.sEndRegDt = sEndRegDt;
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

    /**
     * @return the sCust
     */
    public String getsCust() {
        return sCust;
    }

    /**
     * @param sCust the sCust to set
     */
    public void setsCust(String sCust) {
        this.sCust = sCust;
    }

    /**
     * @return the sCallBizTitleNm
     */
    public String getsCallBizTitleNm() {
        return sCallBizTitleNm;
    }

    /**
     * @param sCallBizTitleNm the sCallBizTitleNm to set
     */
    public void setsCallBizTitleNm(String sCallBizTitleNm) {
        this.sCallBizTitleNm = sCallBizTitleNm;
    }

    /**
     * @return the sAllView
     */
    public String getsAllView() {
        return sAllView;
    }

    /**
     * @param sAllView the sAllView to set
     */
    public void setsAllView(String sAllView) {
        this.sAllView = sAllView;
    }




    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
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
     * @return the sCallCnt
     */
    public int getsCallCnt() {
        return sCallCnt;
    }

    /**
     * @param sCallCnt the sCallCnt to set
     */
    public void setsCallCnt(int sCallCnt) {
        this.sCallCnt = sCallCnt;
    }

    /**
     * @return the sListTp
     */
    public String getsListTp() {
        return sListTp;
    }

    /**
     * @param sListTp the sListTp to set
     */
    public void setsListTp(String sListTp) {
        this.sListTp = sListTp;
    }

}