package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 조회 SearchVO
 *
 * @ClassName   : SalesOpptShowRoomMgmtSearchVO
 * @Description : SalesOpptShowRoomMgmtSearchVO
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07.     in moon lee     최초 생성
 * </pre>
 */

public class SalesOpptShowRoomMgmtSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8377461872605631583L;

    /**
     * 일련번호
     **/

    private  String              sSeq;

    /**
     * 딜러코드
     **/

    private  String              sDlrCd;

    /**
     * 고객번호
     **/

    private  String              sCustNo;


    /**
     * 고객명
     **/

    private  String              sCustNm;

    /**
     * 고객유형
     **/

    private  String              sCustTp;

    /**
     * 관리SCID
     **/

    private  String              sMngScId;

    /**
     * 이메일명
     **/

    private  String              sEmailNm;

    /**
     * 위챗ID
     **/

    private  String              sWechatId;

    /**
     * 선호연락방법코드
     **/

    private  String              sPrefCommMthCd;

    /**
     * 선호연락번호
     **/

    private  String              sPrefCommNo;

    /**
     * 선호접촉방법코드
     **/

    private  String              sPrefContactMthCd;

    /**
     * 선호접촉시간코드
     **/

    private  String              sPrefContactHmCd;

    /**
     * 전화번호
     **/

    private  String              sTelNo;

    /**
     * 휴대폰번호
     **/

    private  String              sHpNo;

    /**
     * 직장명
     **/

    private  String              sOfficeNm;

    /**
     * 부서명
     **/

    private  String              sDeptNm;

    /**
     * 직장전화번호
     **/

    private  String              sOfficeTelNo;

    /**
     * 직장팩스번호
     **/

    private  String              sOfficeFaxNo;

    /**
     * 대표자명
     **/

    private  String              sOwnRgstNm;

    /**
     * 성별코드
     **/

    private  String              sSexCd;

    /**
     * 삭제여부
     **/

    private  String              sDelYn;

    /**
     * BHMC여부
     **/

    private  String              sBhmcYn;

    /**
     * SIEBEL ROW ID
     **/

    private  String              sSiebelRowId;

    /**
     * 문서ID
     **/

    private  String              sDocId;

    /**
     * 동행자명
     **/

    private  String              sWithPrsnNm;

    /**
     * 재방문여부
     **/

    private  String              sRvsitYn;

    /**
     * 방문예약일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sVsitResvDt;

    /**
     * 방문일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sVsitDt;

    /**
     * 방문자수
     **/

    private  int                 sVsitPrsnCnt;

    /**
     * 방문종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sVsitEndDt;

    /**
     * 정보유형
     **/

    private  String              sInfoTp;

    /**
     * 정보경로코드
     **/

    private  String              sInfoPathCd;

    /**
     * 지불유형
     **/

    private  String              sPayTp;

    /**
     * 관심브랜드코드
     **/

    private  String              sIntrBrandCd;

    /**
     * 관심차종코드
     **/

    private  String              sIntrCarlineCd;

    /**
     * 관심모델코드
     **/

    private  String              sIntrModelCd;

    /**
     * 의향차관
     **/

    private  String              sIntrFscpModtpCd;

    /**
     * 현지번호판예정번호
     **/

    private  String              sNatNofScheNo;

    /**
     * 견적내용
     **/

    private  String              sEstimateCont;

    /**
     * 영업내용
     **/

    private  String              sSalesCont;

    /**
     * 비고
     **/

    private  String              sRemark;

    /**
     * 리드레벨코드
     **/

    private  String              sLeadLvlCd;

    /**
     * 리드상태코드
     **/

    private  String              sLeadStatCd;

    /**
     * OB담당자ID
     **/

    private  String              sObPrsnId;

    /**
     * 등록자ID
     **/

    private  String              sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sRegDt;

    /**
     * 수정자ID
     **/

    private  String              sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sUpdtDt;

    /**
     * 선호색상코드
     **/

    private  String              sIntrColorCd;

    /**
     * 추적등급코드
     **/

    private  String              sTraceGradeCd;

    /**
     * 유효등급코드
     **/

    private  String              sValidGradeCd;

    /**
     * 무효원인코드
     **/

    private  String              sInvalidCauCd;

    /**
     * 실패원인코드
     **/

    private  String              sFailCauCd;

    /**
     * 실패원인사유내용
     **/

    private  String              sFailCauReasonCont;

    /**
     * 구매선택차종코드
     **/

    private  String              sPurcSelCarlineCd;

    /**
     * 구매선택모델코드
     **/

    private  String              sPurcSelModelCd;

    /**
     * 예상구매시간코드
     **/

    private  String              sExpcPurcHmCd;

    /**
     * 예상구매일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sExpcPurcDt;

    /**
     * 예상거래가격
     **/

    private  int                 sExpcDealPrc;

    /**
     * 추적일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sTraceDt;

    /**
     * 추적방법코드
     **/

    private  String              sTraceMthCd;

    /**
     * 다음추적일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sNextTraceDt;

    /**
     * 다음추적방법코드
     **/

    private  String              sNextTraceMthCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sRegDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sRegDtTo;

    private String               sCust;

    private String               sPassword;
    private String sHoldTp;
    private String sHoldDetlTpSeq;
    private String sExhvFlakSeq;
    private String sTestDrvYn;

    /**
     * @return the sTestDrvYn
     */
    public String getsTestDrvYn() {
        return sTestDrvYn;
    }

    /**
     * @param sTestDrvYn the sTestDrvYn to set
     */
    public void setsTestDrvYn(String sTestDrvYn) {
        this.sTestDrvYn = sTestDrvYn;
    }

    /**
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

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
     * @return the sCustTp
     */
    public String getsCustTp() {
        return sCustTp;
    }

    /**
     * @param sCustTp the sCustTp to set
     */
    public void setsCustTp(String sCustTp) {
        this.sCustTp = sCustTp;
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
     * @return the sEmailNm
     */
    public String getsEmailNm() {
        return sEmailNm;
    }

    /**
     * @param sEmailNm the sEmailNm to set
     */
    public void setsEmailNm(String sEmailNm) {
        this.sEmailNm = sEmailNm;
    }

    /**
     * @return the sWechatId
     */
    public String getsWechatId() {
        return sWechatId;
    }

    /**
     * @param sWechatId the sWechatId to set
     */
    public void setsWechatId(String sWechatId) {
        this.sWechatId = sWechatId;
    }

    /**
     * @return the sPrefCommMthCd
     */
    public String getsPrefCommMthCd() {
        return sPrefCommMthCd;
    }

    /**
     * @param sPrefCommMthCd the sPrefCommMthCd to set
     */
    public void setsPrefCommMthCd(String sPrefCommMthCd) {
        this.sPrefCommMthCd = sPrefCommMthCd;
    }

    /**
     * @return the sPrefCommNo
     */
    public String getsPrefCommNo() {
        return sPrefCommNo;
    }

    /**
     * @param sPrefCommNo the sPrefCommNo to set
     */
    public void setsPrefCommNo(String sPrefCommNo) {
        this.sPrefCommNo = sPrefCommNo;
    }

    /**
     * @return the sPrefContactMthCd
     */
    public String getsPrefContactMthCd() {
        return sPrefContactMthCd;
    }

    /**
     * @param sPrefContactMthCd the sPrefContactMthCd to set
     */
    public void setsPrefContactMthCd(String sPrefContactMthCd) {
        this.sPrefContactMthCd = sPrefContactMthCd;
    }

    /**
     * @return the sPrefContactHmCd
     */
    public String getsPrefContactHmCd() {
        return sPrefContactHmCd;
    }

    /**
     * @param sPrefContactHmCd the sPrefContactHmCd to set
     */
    public void setsPrefContactHmCd(String sPrefContactHmCd) {
        this.sPrefContactHmCd = sPrefContactHmCd;
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
     * @return the sOfficeNm
     */
    public String getsOfficeNm() {
        return sOfficeNm;
    }

    /**
     * @param sOfficeNm the sOfficeNm to set
     */
    public void setsOfficeNm(String sOfficeNm) {
        this.sOfficeNm = sOfficeNm;
    }

    /**
     * @return the sDeptNm
     */
    public String getsDeptNm() {
        return sDeptNm;
    }

    /**
     * @param sDeptNm the sDeptNm to set
     */
    public void setsDeptNm(String sDeptNm) {
        this.sDeptNm = sDeptNm;
    }

    /**
     * @return the sOfficeTelNo
     */
    public String getsOfficeTelNo() {
        return sOfficeTelNo;
    }

    /**
     * @param sOfficeTelNo the sOfficeTelNo to set
     */
    public void setsOfficeTelNo(String sOfficeTelNo) {
        this.sOfficeTelNo = sOfficeTelNo;
    }

    /**
     * @return the sOfficeFaxNo
     */
    public String getsOfficeFaxNo() {
        return sOfficeFaxNo;
    }

    /**
     * @param sOfficeFaxNo the sOfficeFaxNo to set
     */
    public void setsOfficeFaxNo(String sOfficeFaxNo) {
        this.sOfficeFaxNo = sOfficeFaxNo;
    }

    /**
     * @return the sOwnRgstNm
     */
    public String getsOwnRgstNm() {
        return sOwnRgstNm;
    }

    /**
     * @param sOwnRgstNm the sOwnRgstNm to set
     */
    public void setsOwnRgstNm(String sOwnRgstNm) {
        this.sOwnRgstNm = sOwnRgstNm;
    }

    /**
     * @return the sSexCd
     */
    public String getsSexCd() {
        return sSexCd;
    }

    /**
     * @param sSexCd the sSexCd to set
     */
    public void setsSexCd(String sSexCd) {
        this.sSexCd = sSexCd;
    }

    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
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
     * @return the sSiebelRowId
     */
    public String getsSiebelRowId() {
        return sSiebelRowId;
    }

    /**
     * @param sSiebelRowId the sSiebelRowId to set
     */
    public void setsSiebelRowId(String sSiebelRowId) {
        this.sSiebelRowId = sSiebelRowId;
    }

    /**
     * @return the sDocId
     */
    public String getsDocId() {
        return sDocId;
    }

    /**
     * @param sDocId the sDocId to set
     */
    public void setsDocId(String sDocId) {
        this.sDocId = sDocId;
    }

    /**
     * @return the sWithPrsnNm
     */
    public String getsWithPrsnNm() {
        return sWithPrsnNm;
    }

    /**
     * @param sWithPrsnNm the sWithPrsnNm to set
     */
    public void setsWithPrsnNm(String sWithPrsnNm) {
        this.sWithPrsnNm = sWithPrsnNm;
    }

    /**
     * @return the sRvsitYn
     */
    public String getsRvsitYn() {
        return sRvsitYn;
    }

    /**
     * @param sRvsitYn the sRvsitYn to set
     */
    public void setsRvsitYn(String sRvsitYn) {
        this.sRvsitYn = sRvsitYn;
    }

    /**
     * @return the sVsitResvDt
     */
    public Date getsVsitResvDt() {
        return sVsitResvDt;
    }

    /**
     * @param sVsitResvDt the sVsitResvDt to set
     */
    public void setsVsitResvDt(Date sVsitResvDt) {
        this.sVsitResvDt = sVsitResvDt;
    }

    /**
     * @return the sVsitDt
     */
    public Date getsVsitDt() {
        return sVsitDt;
    }
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sVsitDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sVsitDtTo;

    /**
     * @param sVsitDt the sVsitDt to set
     */
    public void setsVsitDt(Date sVsitDt) {
        this.sVsitDt = sVsitDt;
    }

    /**
     * @return the sVsitPrsnCnt
     */
    public int getsVsitPrsnCnt() {
        return sVsitPrsnCnt;
    }

    /**
     * @param sVsitPrsnCnt the sVsitPrsnCnt to set
     */
    public void setsVsitPrsnCnt(int sVsitPrsnCnt) {
        this.sVsitPrsnCnt = sVsitPrsnCnt;
    }

    /**
     * @return the sVsitEndDt
     */
    public Date getsVsitEndDt() {
        return sVsitEndDt;
    }

    /**
     * @param sVsitEndDt the sVsitEndDt to set
     */
    public void setsVsitEndDt(Date sVsitEndDt) {
        this.sVsitEndDt = sVsitEndDt;
    }

    /**
     * @return the sInfoTp
     */
    public String getsInfoTp() {
        return sInfoTp;
    }

    /**
     * @param sInfoTp the sInfoTp to set
     */
    public void setsInfoTp(String sInfoTp) {
        this.sInfoTp = sInfoTp;
    }

    /**
     * @return the sInfoPathCd
     */
    public String getsInfoPathCd() {
        return sInfoPathCd;
    }

    /**
     * @param sInfoPathCd the sInfoPathCd to set
     */
    public void setsInfoPathCd(String sInfoPathCd) {
        this.sInfoPathCd = sInfoPathCd;
    }

    /**
     * @return the sPayTp
     */
    public String getsPayTp() {
        return sPayTp;
    }

    /**
     * @param sPayTp the sPayTp to set
     */
    public void setsPayTp(String sPayTp) {
        this.sPayTp = sPayTp;
    }

    /**
     * @return the sIntrBrandCd
     */
    public String getsIntrBrandCd() {
        return sIntrBrandCd;
    }

    /**
     * @param sIntrBrandCd the sIntrBrandCd to set
     */
    public void setsIntrBrandCd(String sIntrBrandCd) {
        this.sIntrBrandCd = sIntrBrandCd;
    }

    /**
     * @return the sIntrCarlineCd
     */
    public String getsIntrCarlineCd() {
        return sIntrCarlineCd;
    }

    /**
     * @param sIntrCarlineCd the sIntrCarlineCd to set
     */
    public void setsIntrCarlineCd(String sIntrCarlineCd) {
        this.sIntrCarlineCd = sIntrCarlineCd;
    }

    /**
     * @return the sIntrModelCd
     */
    public String getsIntrModelCd() {
        return sIntrModelCd;
    }

    /**
     * @param sIntrModelCd the sIntrModelCd to set
     */
    public void setsIntrModelCd(String sIntrModelCd) {
        this.sIntrModelCd = sIntrModelCd;
    }

    /**
     * @return the sNatNofScheNo
     */
    public String getsNatNofScheNo() {
        return sNatNofScheNo;
    }

    /**
     * @param sNatNofScheNo the sNatNofScheNo to set
     */
    public void setsNatNofScheNo(String sNatNofScheNo) {
        this.sNatNofScheNo = sNatNofScheNo;
    }

    /**
     * @return the sEstimateCont
     */
    public String getsEstimateCont() {
        return sEstimateCont;
    }

    /**
     * @param sEstimateCont the sEstimateCont to set
     */
    public void setsEstimateCont(String sEstimateCont) {
        this.sEstimateCont = sEstimateCont;
    }

    /**
     * @return the sSalesCont
     */
    public String getsSalesCont() {
        return sSalesCont;
    }

    /**
     * @param sSalesCont the sSalesCont to set
     */
    public void setsSalesCont(String sSalesCont) {
        this.sSalesCont = sSalesCont;
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
     * @return the sLeadLvlCd
     */
    public String getsLeadLvlCd() {
        return sLeadLvlCd;
    }

    /**
     * @param sLeadLvlCd the sLeadLvlCd to set
     */
    public void setsLeadLvlCd(String sLeadLvlCd) {
        this.sLeadLvlCd = sLeadLvlCd;
    }

    /**
     * @return the sLeadStatCd
     */
    public String getsLeadStatCd() {
        return sLeadStatCd;
    }

    /**
     * @param sLeadStatCd the sLeadStatCd to set
     */
    public void setsLeadStatCd(String sLeadStatCd) {
        this.sLeadStatCd = sLeadStatCd;
    }

    /**
     * @return the sObPrsnId
     */
    public String getsObPrsnId() {
        return sObPrsnId;
    }

    /**
     * @param sObPrsnId the sObPrsnId to set
     */
    public void setsObPrsnId(String sObPrsnId) {
        this.sObPrsnId = sObPrsnId;
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
     * @return the sIntrColorCd
     */
    public String getsIntrColorCd() {
        return sIntrColorCd;
    }

    /**
     * @param sIntrColorCd the sIntrColorCd to set
     */
    public void setsIntrColorCd(String sIntrColorCd) {
        this.sIntrColorCd = sIntrColorCd;
    }

    /**
     * @return the sTraceGradeCd
     */
    public String getsTraceGradeCd() {
        return sTraceGradeCd;
    }

    /**
     * @param sTraceGradeCd the sTraceGradeCd to set
     */
    public void setsTraceGradeCd(String sTraceGradeCd) {
        this.sTraceGradeCd = sTraceGradeCd;
    }

    /**
     * @return the sValidGradeCd
     */
    public String getsValidGradeCd() {
        return sValidGradeCd;
    }

    /**
     * @param sValidGradeCd the sValidGradeCd to set
     */
    public void setsValidGradeCd(String sValidGradeCd) {
        this.sValidGradeCd = sValidGradeCd;
    }

    /**
     * @return the sInvalidCauCd
     */
    public String getsInvalidCauCd() {
        return sInvalidCauCd;
    }

    /**
     * @param sInvalidCauCd the sInvalidCauCd to set
     */
    public void setsInvalidCauCd(String sInvalidCauCd) {
        this.sInvalidCauCd = sInvalidCauCd;
    }

    /**
     * @return the sFailCauCd
     */
    public String getsFailCauCd() {
        return sFailCauCd;
    }

    /**
     * @param sFailCauCd the sFailCauCd to set
     */
    public void setsFailCauCd(String sFailCauCd) {
        this.sFailCauCd = sFailCauCd;
    }

    /**
     * @return the sFailCauReasonCont
     */
    public String getsFailCauReasonCont() {
        return sFailCauReasonCont;
    }

    /**
     * @param sFailCauReasonCont the sFailCauReasonCont to set
     */
    public void setsFailCauReasonCont(String sFailCauReasonCont) {
        this.sFailCauReasonCont = sFailCauReasonCont;
    }

    /**
     * @return the sPurcSelCarlineCd
     */
    public String getsPurcSelCarlineCd() {
        return sPurcSelCarlineCd;
    }

    /**
     * @param sPurcSelCarlineCd the sPurcSelCarlineCd to set
     */
    public void setsPurcSelCarlineCd(String sPurcSelCarlineCd) {
        this.sPurcSelCarlineCd = sPurcSelCarlineCd;
    }

    /**
     * @return the sPurcSelModelCd
     */
    public String getsPurcSelModelCd() {
        return sPurcSelModelCd;
    }

    /**
     * @param sPurcSelModelCd the sPurcSelModelCd to set
     */
    public void setsPurcSelModelCd(String sPurcSelModelCd) {
        this.sPurcSelModelCd = sPurcSelModelCd;
    }

    /**
     * @return the sExpcPurcHmCd
     */
    public String getsExpcPurcHmCd() {
        return sExpcPurcHmCd;
    }

    /**
     * @param sExpcPurcHmCd the sExpcPurcHmCd to set
     */
    public void setsExpcPurcHmCd(String sExpcPurcHmCd) {
        this.sExpcPurcHmCd = sExpcPurcHmCd;
    }

    /**
     * @return the sExpcPurcDt
     */
    public Date getsExpcPurcDt() {
        return sExpcPurcDt;
    }

    /**
     * @param sExpcPurcDt the sExpcPurcDt to set
     */
    public void setsExpcPurcDt(Date sExpcPurcDt) {
        this.sExpcPurcDt = sExpcPurcDt;
    }

    /**
     * @return the sExpcDealPrc
     */
    public int getsExpcDealPrc() {
        return sExpcDealPrc;
    }

    /**
     * @param sExpcDealPrc the sExpcDealPrc to set
     */
    public void setsExpcDealPrc(int sExpcDealPrc) {
        this.sExpcDealPrc = sExpcDealPrc;
    }

    /**
     * @return the sTraceDt
     */
    public Date getsTraceDt() {
        return sTraceDt;
    }

    /**
     * @param sTraceDt the sTraceDt to set
     */
    public void setsTraceDt(Date sTraceDt) {
        this.sTraceDt = sTraceDt;
    }

    /**
     * @return the sTraceMthCd
     */
    public String getsTraceMthCd() {
        return sTraceMthCd;
    }

    /**
     * @param sTraceMthCd the sTraceMthCd to set
     */
    public void setsTraceMthCd(String sTraceMthCd) {
        this.sTraceMthCd = sTraceMthCd;
    }

    /**
     * @return the sNextTraceDt
     */
    public Date getsNextTraceDt() {
        return sNextTraceDt;
    }

    /**
     * @param sNextTraceDt the sNextTraceDt to set
     */
    public void setsNextTraceDt(Date sNextTraceDt) {
        this.sNextTraceDt = sNextTraceDt;
    }

    /**
     * @return the sNextTraceMthCd
     */
    public String getsNextTraceMthCd() {
        return sNextTraceMthCd;
    }

    /**
     * @param sNextTraceMthCd the sNextTraceMthCd to set
     */
    public void setsNextTraceMthCd(String sNextTraceMthCd) {
        this.sNextTraceMthCd = sNextTraceMthCd;
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
     * @return the sPassword
     */
    public String getsPassword() {
        return sPassword;
    }

    /**
     * @param sPassword the sPassword to set
     */
    public void setsPassword(String sPassword) {
        this.sPassword = sPassword;
    }

    /**
     * @return the sHoldTp
     */
    public String getsHoldTp() {
        return sHoldTp;
    }

    /**
     * @param sHoldTp the sHoldTp to set
     */
    public void setsHoldTp(String sHoldTp) {
        this.sHoldTp = sHoldTp;
    }

    /**
     * @return the sHoldDetlTpSeq
     */
    public String getsHoldDetlTpSeq() {
        return sHoldDetlTpSeq;
    }

    /**
     * @param sHoldDetlTpSeq the sHoldDetlTpSeq to set
     */
    public void setsHoldDetlTpSeq(String sHoldDetlTpSeq) {
        this.sHoldDetlTpSeq = sHoldDetlTpSeq;
    }

    /**
     * @return the sExhvFlakSeq
     */
    public String getsExhvFlakSeq() {
        return sExhvFlakSeq;
    }

    /**
     * @param sExhvFlakSeq the sExhvFlakSeq to set
     */
    public void setsExhvFlakSeq(String sExhvFlakSeq) {
        this.sExhvFlakSeq = sExhvFlakSeq;
    }

    /**
     * @param sVsitDtFrom the sVsitDtFrom to set
     */
    public void setsVsitDtFrom(Date sVsitDtFrom) {
        this.sVsitDtFrom = sVsitDtFrom;
    }

    /**
     * @return the sVsitDtFrom
     */
    public Date getsVsitDtFrom() {
        return sVsitDtFrom;
    }

    /**
     * @param sVsitDtTo the sVsitDtTo to set
     */
    public void setsVsitDtTo(Date sVsitDtTo) {
        this.sVsitDtTo = sVsitDtTo;
    }

    /**
     * @return the sVsitDtTo
     */
    public Date getsVsitDtTo() {
        return sVsitDtTo;
    }

    /**
     * @return the sIntrFscpModtpCd
     */
    public String getsIntrFscpModtpCd() {
        return sIntrFscpModtpCd;
    }

    /**
     * @param sIntrFscpModtpCd the sIntrFscpModtpCd to set
     */
    public void setsIntrFscpModtpCd(String sIntrFscpModtpCd) {
        this.sIntrFscpModtpCd = sIntrFscpModtpCd;
    }



}