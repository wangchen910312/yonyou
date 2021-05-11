package chn.bhmc.dms.crm.cif.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoSearchVO.java
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

public class CustomerInfoSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 449340642116084691L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 고객번호
     **/
    private String sCustNo;

    /**
     * 고객명
     **/
    private String sCustNm;

    /**
     * 고객코드
     **/
    private String sCustCd;

    /**
     * 주민사업자등록번호
     **/
    private String sSsnCrnNo;

    /**
     * 고객유형
     **/
    private String sCustTp;

    /**
     * 관리SCID
     **/
    private String sMngScId;

    /**
     * 판매SCID
     **/
    private String sSaleScId;

    /**
     * 관리TechManID
     **/
    private String sMngTecId;

    /**
     * 이메일명
     **/
    private String sEmailNm;

    /**
     * 이메일도메인명
     **/
    private String sEmailDomainNm;

    /**
     * 위쳇ID
     **/
    private String sWechatId;

    /**
     * 페이스북ID
     **/
    private String sFacebookId;

    /**
     * 트위터ID
     **/
    private String sTwitterId;

    /**
     * 선호연락방법코드
     **/
    private String sPrefCommMthCd;

    /**
     * 블루멤버쉽번호
     **/
    private String sBlueMembershipJoinYn;
    private String sBlueMemberCd;

    /**
     * 전화번호
     **/
    private String sTelNo;

    /**
     * 휴대폰번호
     **/
    private String sHpNo;

    /**
     * 우편번호
     **/
    private String sZipCd;

    /**
     * 주소1
     **/
    private String sAddr1;

    /**
     * 주소2
     **/
    private String sAddr2;

    /**
     * 직업코드
     **/
    private String sJobCd;

    /**
     * 직업상세코드
     **/
    private String sJobDetlCd;

    /**
     * 직장명
     **/
    private String sOfficeNm;

    /**
     * 부서명
     **/
    private String sDeptNm;

    /**
     * 직위명
     **/
    private String sPsitNm;

    /**
     * 직장전화번호
     **/
    private String sOfficeTelNo;

    /**
     * 직장팩스번호
     **/
    private String sOfficeFaxNo;

    /**
     * 직장우편번호
     **/
    private String sOfficeZipCd;

    /**
     * 직장주소1
     **/
    private String sOfficeAddr1;

    /**
     * 직장주소2
     **/
    private String sOfficeAddr2;

    /**
     * 업종명
     **/
    private String sBizCondNm;

    /**
     * 업태명
     **/
    private String sBizTpNm;

    /**
     * 대표자주민등록번호
     **/
    private String sOwnRgstSsnNo;

    /**
     * 대표자명
     **/
    private String sOwnRgstNm;

    /**
     * 회사구분
     **/
    private String sCmpTp;

    /**
     * 회사규모내용
     **/
    private String sCmpScaleCont;

    /**
     * 주요인증문서종류
     **/
    private String sMathDocTp;

    /**
     * ID카드번호
     **/
    private String sIdCardNo;

    /**
     * 운전면허증번호
     **/
    private String sDrivingNo;

    /**
     * 관증번호
     **/
    private String sOfficeNo;

    /**
     * 기타번호
     **/
    private String sOtherNo;

    /**
     * 신분증우편번호
     **/
    private String sIdZipCd;

    /**
     * 신분증 주소1
     **/
    private String sIdAddr1;

    /**
     * 신분증 주소2
     **/
    private String sIdAddr2;

    /**
     * DM장소코드
     **/
    private String sDmPlaceCd;

    /**
     * DM명
     **/
    private String sDmNm;

    /**
     * SMS수신여부
     **/
    private String sSmsReceiveYn;

    /**
     * 전화수신여부
     **/
    private String sTelReceiveYn;

    /**
     * DM수신여부
     **/
    private String sDmDeceiveYn;

    /**
     * 이메일수신여부
     **/
    private String sEmailReceiveYn;

    /**
     * DM반송여부
     **/
    private String sDmReturnYn;

    /**
     * 이메일반송여부
     **/
    private String sEmailReturnYn;

    /**
     * 출고여부
     **/
    private String sRelsYn;

    /**
     * 폐기여부
     **/
    private String sDisuseYn;

    /**
     * 폐기코드
     **/
    private String sDisuseCd;

    /**
     * 법인등록번호
     **/
    private String sCorpRegNo;

    /**
     * 고객등급코드
     **/
    private String sCustGradeCd;

    /**
     * 고객서비스관리등급코드
     **/
    private String sCustSerMngGradeCd;

    /**
     * 관리유형
     **/
    private String sMngTp;

    /**
     * 관리유형변경일자
     **/
    private String sMngTpChgDt;

    /**
     * 고객확보유형
     **/
    private String sCustHoldTp;

    /**
     * 고객확보유형상세
     **/
    private String sCustHoldTpDtl;

    /**
     * 고객확보일자
     **/
    private String sCustHoldDt;

    /**
     * 성별코드
     **/
    private String sSexCd;

    /**
     * 결혼기념일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sMarryDt;

    /**
     * 결혼코드
     **/
    private String sMarryCd;

    /**
     * 관심차종명1
     **/
    private String sIntrCarlineNm1;

    /**
     * 관심차종명2
     **/
    private String sIntrCarlineNm2;

    /**
     * 취미코드
     **/
    private String sHobbyCd;

    /**
     * 기타취미명
     **/
    private String sOtherHobbyNm;

    /**
     * 타사관심차종명
     **/
    private String sOcmpIntrCarlineNm;

    /**
     * 이전관리SCID
     **/
    private String sBefMngScId;

    /**
     * 이벤트번호
     **/
    private String sEventNo;

    /**
     * 연락할사람명
     **/
    private String sPcontactNm;

    /**
     * 연락할사람고객번호
     **/
    private String sPcontactCustNo;

    /**
     * 개인정보동의여부
     **/
    private String sPerInfoAgreeYn;

    /**
     * 실명확인여부
     **/
    private String sNameChkYn;

    /**
     * 전자세금계산서이메일명
     **/
    private String sInvoiceEmailNm;

    /**
     * 학력코드
     **/
    private String sAcCareerCd;

    /**
     * 소득레벨코드
     **/
    private String sIncomeLvlCd;

    /**
     * 나이코드
     **/
    private String sAgeCd;

    /**
     * 가족수
     **/
    private int sFamilyCnt;

    /**
     * 운전자종류
     **/
    private String sDriverTp;

    /**
     * 소개횟수
     **/
    private String sIntroCnt;

    /**
     * 구매사유코드
     **/
    private String sBuyReasonCd;

    /**
     * 등록차량브랜드코드
     **/
    private String sRegCarBrandCd;

    /**
     * 등록차량브랜드모델코드
     **/
    private String sRegCarBrandModelCd;

    /**
     * 이전소유자처분채널코드
     **/
    private String sBefOwnerSellChnCd;

    /**
     * 이전소유자보유기간
     **/
    private String sBefOwnerHoldPrid;

    /**
     * 차량구매형식코드
     **/
    private String sCarBuyClassCd;

    /**
     * 소개자유형
     **/
    private String sPintroTp;

    /**
     * 소개자명
     **/
    private String sPintroNm;

    /**
     * 이메일도메인코드
     **/
    private String sEmailDomainCd;

    /**
     * 비교차량브랜드코드
     **/
    private String sCompareCarBrandCd;

    /**
     * 비교차량모델코드
     **/
    private String sCompareCarModelCd;

    /**
     * 구매전차량브랜드코드
     **/
    private String sBuyBefCarBrandCd;

    /**
     * 구매전차량모델코드
     **/
    private String sBuyBefCarModelCd;

    /**
     * 병합여부
     **/
    private String sMergeYn;

    /**
     * 삭제여부
     **/
    private String sDelYn;

    /**
     * SIEBEL ROW ID
     **/
    private String sSiebelRowId;

    /**
     * 등록자ID
     **/
    private String sRegUsrId;

    /**
     * 등록일자
     **/
    private Date sRegDt;

    /**
     * 수정자ID
     **/
    private String sUpdtUsrId;

    /**
     * 수정일자
     **/
    private Date sUpdtDt;

    private String sItemCd;

    private String sItemNm;

    private String sPrefCommNo;
    private String sPrefContactMthCd;
    private String sPrefContactTimeCd;
    private String sPerInfoUseYn;
    private String grpTp;
    private String sBhmcYn;
    private String sVinNo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtTo;

    /*
     * 판매일자 시작
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSaleDtFrom;

    /*
     * 판매일자 끝
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSaleDtTo;

    private String sBhmcYnSearch;
    private String sAssignYn;

    private List<CustomerGroupVO> groupDS = new ArrayList<CustomerGroupVO>();

    private List<String> tagDS;

    private String sCommand;

    /**
     * 검색 범위
     * ALL : 전체고객
     * DLR : 딜러고객
     * MY  : 내 고객
     */
    private String sSearchRange;

    private String sPltCd;

    private String sHpNoInvldYn = "N";
    private String sHpNoAddImposYn = "N";
    private String sBuyCnt;
    private String sChgBuyYn = "N";
    private String sPurcCarBrandCd;
    private String sPurcCarModelNm;
    private String sAgeDtl;
    private String sChinaZodiacSignCd;
    private String sZodiacSignCd;
    private String sBloodTp;
    private String sChildrenCnt;
    private String sDutyCd;

    private String sDocId;

    private String sOldCustNm;
    private String sOldHpNo;
    private String sOldMathDocTp;
    private String sOldSsnCrnNo;

    private String sCust;                           // 고객정보 like 검색 [담당영업사원배정]

    private String sLangCd;

    /**
     * 딜러멤버십여부
     **/
    private String sDlrMbrYn;

    private String sCarRegNo;

    private String sSelCondi;   // 조회 분류에 따라 Condition  체크  (캠페인의 고객 업로드시 고객 정보 조회 : MARKCUSTIMP)
    private String sMembershipStan; // 멤버십 기준
    
    private String sHyundaiYn;
    

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
     * @return the sCustCd
     */
    public String getsCustCd() {
        return sCustCd;
    }

    /**
     * @param sCustCd the sCustCd to set
     */
    public void setsCustCd(String sCustCd) {
        this.sCustCd = sCustCd;
    }

    /**
     * @return the sSsnCrnNo
     */
    public String getsSsnCrnNo() {
        return sSsnCrnNo;
    }

    /**
     * @param sSsnCrnNo the sSsnCrnNo to set
     */
    public void setsSsnCrnNo(String sSsnCrnNo) {
        this.sSsnCrnNo = sSsnCrnNo;
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
     * @return the sSaleScId
     */
    public String getsSaleScId() {
        return sSaleScId;
    }

    /**
     * @param sSaleScId the sSaleScId to set
     */
    public void setsSaleScId(String sSaleScId) {
        this.sSaleScId = sSaleScId;
    }

    /**
     * @return the sMngTecId
     */
    public String getsMngTecId() {
        return sMngTecId;
    }

    /**
     * @param sMngTecId the sMngTecId to set
     */
    public void setsMngTecId(String sMngTecId) {
        this.sMngTecId = sMngTecId;
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
     * @return the sEmailDomainNm
     */
    public String getsEmailDomainNm() {
        return sEmailDomainNm;
    }

    /**
     * @param sEmailDomainNm the sEmailDomainNm to set
     */
    public void setsEmailDomainNm(String sEmailDomainNm) {
        this.sEmailDomainNm = sEmailDomainNm;
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
     * @return the sFacebookId
     */
    public String getsFacebookId() {
        return sFacebookId;
    }

    /**
     * @param sFacebookId the sFacebookId to set
     */
    public void setsFacebookId(String sFacebookId) {
        this.sFacebookId = sFacebookId;
    }

    /**
     * @return the sTwitterId
     */
    public String getsTwitterId() {
        return sTwitterId;
    }

    /**
     * @param sTwitterId the sTwitterId to set
     */
    public void setsTwitterId(String sTwitterId) {
        this.sTwitterId = sTwitterId;
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
     * @return the sBlueMemberCd
     */
    public String getsBlueMemberCd() {
        return sBlueMemberCd;
    }

    /**
     * @param sBlueMemberCd the sBlueMemberCd to set
     */
    public void setsBlueMemberCd(String sBlueMemberCd) {
        this.sBlueMemberCd = sBlueMemberCd;
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
     * @return the sZipCd
     */
    public String getsZipCd() {
        return sZipCd;
    }

    /**
     * @param sZipCd the sZipCd to set
     */
    public void setsZipCd(String sZipCd) {
        this.sZipCd = sZipCd;
    }

    /**
     * @return the sAddr1
     */
    public String getsAddr1() {
        return sAddr1;
    }

    /**
     * @param sAddr1 the sAddr1 to set
     */
    public void setsAddr1(String sAddr1) {
        this.sAddr1 = sAddr1;
    }

    /**
     * @return the sAddr2
     */
    public String getsAddr2() {
        return sAddr2;
    }

    /**
     * @param sAddr2 the sAddr2 to set
     */
    public void setsAddr2(String sAddr2) {
        this.sAddr2 = sAddr2;
    }

    /**
     * @return the sJobCd
     */
    public String getsJobCd() {
        return sJobCd;
    }

    /**
     * @param sJobCd the sJobCd to set
     */
    public void setsJobCd(String sJobCd) {
        this.sJobCd = sJobCd;
    }

    /**
     * @return the sJobDetlCd
     */
    public String getsJobDetlCd() {
        return sJobDetlCd;
    }

    /**
     * @param sJobDetlCd the sJobDetlCd to set
     */
    public void setsJobDetlCd(String sJobDetlCd) {
        this.sJobDetlCd = sJobDetlCd;
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
     * @return the sPsitNm
     */
    public String getsPsitNm() {
        return sPsitNm;
    }

    /**
     * @param sPsitNm the sPsitNm to set
     */
    public void setsPsitNm(String sPsitNm) {
        this.sPsitNm = sPsitNm;
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
     * @return the sOfficeZipCd
     */
    public String getsOfficeZipCd() {
        return sOfficeZipCd;
    }

    /**
     * @param sOfficeZipCd the sOfficeZipCd to set
     */
    public void setsOfficeZipCd(String sOfficeZipCd) {
        this.sOfficeZipCd = sOfficeZipCd;
    }

    /**
     * @return the sOfficeAddr1
     */
    public String getsOfficeAddr1() {
        return sOfficeAddr1;
    }

    /**
     * @param sOfficeAddr1 the sOfficeAddr1 to set
     */
    public void setsOfficeAddr1(String sOfficeAddr1) {
        this.sOfficeAddr1 = sOfficeAddr1;
    }

    /**
     * @return the sOfficeAddr2
     */
    public String getsOfficeAddr2() {
        return sOfficeAddr2;
    }

    /**
     * @param sOfficeAddr2 the sOfficeAddr2 to set
     */
    public void setsOfficeAddr2(String sOfficeAddr2) {
        this.sOfficeAddr2 = sOfficeAddr2;
    }

    /**
     * @return the sBizCondNm
     */
    public String getsBizCondNm() {
        return sBizCondNm;
    }

    /**
     * @param sBizCondNm the sBizCondNm to set
     */
    public void setsBizCondNm(String sBizCondNm) {
        this.sBizCondNm = sBizCondNm;
    }

    /**
     * @return the sBizTpNm
     */
    public String getsBizTpNm() {
        return sBizTpNm;
    }

    /**
     * @param sBizTpNm the sBizTpNm to set
     */
    public void setsBizTpNm(String sBizTpNm) {
        this.sBizTpNm = sBizTpNm;
    }

    /**
     * @return the sOwnRgstSsnNo
     */
    public String getsOwnRgstSsnNo() {
        return sOwnRgstSsnNo;
    }

    /**
     * @param sOwnRgstSsnNo the sOwnRgstSsnNo to set
     */
    public void setsOwnRgstSsnNo(String sOwnRgstSsnNo) {
        this.sOwnRgstSsnNo = sOwnRgstSsnNo;
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
     * @return the sCmpTp
     */
    public String getsCmpTp() {
        return sCmpTp;
    }

    /**
     * @param sCmpTp the sCmpTp to set
     */
    public void setsCmpTp(String sCmpTp) {
        this.sCmpTp = sCmpTp;
    }

    /**
     * @return the sCmpScaleCont
     */
    public String getsCmpScaleCont() {
        return sCmpScaleCont;
    }

    /**
     * @param sCmpScaleCont the sCmpScaleCont to set
     */
    public void setsCmpScaleCont(String sCmpScaleCont) {
        this.sCmpScaleCont = sCmpScaleCont;
    }

    /**
     * @return the sMathDocTp
     */
    public String getsMathDocTp() {
        return sMathDocTp;
    }

    /**
     * @param sMathDocTp the sMathDocTp to set
     */
    public void setsMathDocTp(String sMathDocTp) {
        this.sMathDocTp = sMathDocTp;
    }

    /**
     * @return the sIdCardNo
     */
    public String getsIdCardNo() {
        return sIdCardNo;
    }

    /**
     * @param sIdCardNo the sIdCardNo to set
     */
    public void setsIdCardNo(String sIdCardNo) {
        this.sIdCardNo = sIdCardNo;
    }

    /**
     * @return the sDrivingNo
     */
    public String getsDrivingNo() {
        return sDrivingNo;
    }

    /**
     * @param sDrivingNo the sDrivingNo to set
     */
    public void setsDrivingNo(String sDrivingNo) {
        this.sDrivingNo = sDrivingNo;
    }

    /**
     * @return the sOfficeNo
     */
    public String getsOfficeNo() {
        return sOfficeNo;
    }

    /**
     * @param sOfficeNo the sOfficeNo to set
     */
    public void setsOfficeNo(String sOfficeNo) {
        this.sOfficeNo = sOfficeNo;
    }

    /**
     * @return the sOtherNo
     */
    public String getsOtherNo() {
        return sOtherNo;
    }

    /**
     * @param sOtherNo the sOtherNo to set
     */
    public void setsOtherNo(String sOtherNo) {
        this.sOtherNo = sOtherNo;
    }

    /**
     * @return the sIdZipCd
     */
    public String getsIdZipCd() {
        return sIdZipCd;
    }

    /**
     * @param sIdZipCd the sIdZipCd to set
     */
    public void setsIdZipCd(String sIdZipCd) {
        this.sIdZipCd = sIdZipCd;
    }

    /**
     * @return the sIdAddr1
     */
    public String getsIdAddr1() {
        return sIdAddr1;
    }

    /**
     * @param sIdAddr1 the sIdAddr1 to set
     */
    public void setsIdAddr1(String sIdAddr1) {
        this.sIdAddr1 = sIdAddr1;
    }

    /**
     * @return the sIdAddr2
     */
    public String getsIdAddr2() {
        return sIdAddr2;
    }

    /**
     * @param sIdAddr2 the sIdAddr2 to set
     */
    public void setsIdAddr2(String sIdAddr2) {
        this.sIdAddr2 = sIdAddr2;
    }

    /**
     * @return the sDmPlaceCd
     */
    public String getsDmPlaceCd() {
        return sDmPlaceCd;
    }

    /**
     * @param sDmPlaceCd the sDmPlaceCd to set
     */
    public void setsDmPlaceCd(String sDmPlaceCd) {
        this.sDmPlaceCd = sDmPlaceCd;
    }

    /**
     * @return the sDmNm
     */
    public String getsDmNm() {
        return sDmNm;
    }

    /**
     * @param sDmNm the sDmNm to set
     */
    public void setsDmNm(String sDmNm) {
        this.sDmNm = sDmNm;
    }

    /**
     * @return the sSmsReceiveYn
     */
    public String getsSmsReceiveYn() {
        return sSmsReceiveYn;
    }

    /**
     * @param sSmsReceiveYn the sSmsReceiveYn to set
     */
    public void setsSmsReceiveYn(String sSmsReceiveYn) {
        this.sSmsReceiveYn = sSmsReceiveYn;
    }

    /**
     * @return the sTelReceiveYn
     */
    public String getsTelReceiveYn() {
        return sTelReceiveYn;
    }

    /**
     * @param sTelReceiveYn the sTelReceiveYn to set
     */
    public void setsTelReceiveYn(String sTelReceiveYn) {
        this.sTelReceiveYn = sTelReceiveYn;
    }

    /**
     * @return the sDmDeceiveYn
     */
    public String getsDmDeceiveYn() {
        return sDmDeceiveYn;
    }

    /**
     * @param sDmDeceiveYn the sDmDeceiveYn to set
     */
    public void setsDmDeceiveYn(String sDmDeceiveYn) {
        this.sDmDeceiveYn = sDmDeceiveYn;
    }

    /**
     * @return the sEmailReceiveYn
     */
    public String getsEmailReceiveYn() {
        return sEmailReceiveYn;
    }

    /**
     * @param sEmailReceiveYn the sEmailReceiveYn to set
     */
    public void setsEmailReceiveYn(String sEmailReceiveYn) {
        this.sEmailReceiveYn = sEmailReceiveYn;
    }

    /**
     * @return the sDmReturnYn
     */
    public String getsDmReturnYn() {
        return sDmReturnYn;
    }

    /**
     * @param sDmReturnYn the sDmReturnYn to set
     */
    public void setsDmReturnYn(String sDmReturnYn) {
        this.sDmReturnYn = sDmReturnYn;
    }

    /**
     * @return the sEmailReturnYn
     */
    public String getsEmailReturnYn() {
        return sEmailReturnYn;
    }

    /**
     * @param sEmailReturnYn the sEmailReturnYn to set
     */
    public void setsEmailReturnYn(String sEmailReturnYn) {
        this.sEmailReturnYn = sEmailReturnYn;
    }

    /**
     * @return the sRelsYn
     */
    public String getsRelsYn() {
        return sRelsYn;
    }

    /**
     * @param sRelsYn the sRelsYn to set
     */
    public void setsRelsYn(String sRelsYn) {
        this.sRelsYn = sRelsYn;
    }

    /**
     * @return the sDisuseYn
     */
    public String getsDisuseYn() {
        return sDisuseYn;
    }

    /**
     * @param sDisuseYn the sDisuseYn to set
     */
    public void setsDisuseYn(String sDisuseYn) {
        this.sDisuseYn = sDisuseYn;
    }

    /**
     * @return the sDisuseCd
     */
    public String getsDisuseCd() {
        return sDisuseCd;
    }

    /**
     * @param sDisuseCd the sDisuseCd to set
     */
    public void setsDisuseCd(String sDisuseCd) {
        this.sDisuseCd = sDisuseCd;
    }

    /**
     * @return the sCorpRegNo
     */
    public String getsCorpRegNo() {
        return sCorpRegNo;
    }

    /**
     * @param sCorpRegNo the sCorpRegNo to set
     */
    public void setsCorpRegNo(String sCorpRegNo) {
        this.sCorpRegNo = sCorpRegNo;
    }

    /**
     * @return the sCustGradeCd
     */
    public String getsCustGradeCd() {
        return sCustGradeCd;
    }

    /**
     * @param sCustGradeCd the sCustGradeCd to set
     */
    public void setsCustGradeCd(String sCustGradeCd) {
        this.sCustGradeCd = sCustGradeCd;
    }

    /**
     * @return the sCustSerMngGradeCd
     */
    public String getsCustSerMngGradeCd() {
        return sCustSerMngGradeCd;
    }

    /**
     * @param sCustSerMngGradeCd the sCustSerMngGradeCd to set
     */
    public void setsCustSerMngGradeCd(String sCustSerMngGradeCd) {
        this.sCustSerMngGradeCd = sCustSerMngGradeCd;
    }

    /**
     * @return the sMngTp
     */
    public String getsMngTp() {
        return sMngTp;
    }

    /**
     * @param sMngTp the sMngTp to set
     */
    public void setsMngTp(String sMngTp) {
        this.sMngTp = sMngTp;
    }

    /**
     * @return the sMngTpChgDt
     */
    public String getsMngTpChgDt() {
        return sMngTpChgDt;
    }

    /**
     * @param sMngTpChgDt the sMngTpChgDt to set
     */
    public void setsMngTpChgDt(String sMngTpChgDt) {
        this.sMngTpChgDt = sMngTpChgDt;
    }

    /**
     * @return the sCustHoldTp
     */
    public String getsCustHoldTp() {
        return sCustHoldTp;
    }

    /**
     * @param sCustHoldTp the sCustHoldTp to set
     */
    public void setsCustHoldTp(String sCustHoldTp) {
        this.sCustHoldTp = sCustHoldTp;
    }

    /**
     * @return the sCustHoldDt
     */
    public String getsCustHoldDt() {
        return sCustHoldDt;
    }

    /**
     * @param sCustHoldDt the sCustHoldDt to set
     */
    public void setsCustHoldDt(String sCustHoldDt) {
        this.sCustHoldDt = sCustHoldDt;
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
     * @return the sMarryCd
     */
    public String getsMarryCd() {
        return sMarryCd;
    }

    /**
     * @param sMarryCd the sMarryCd to set
     */
    public void setsMarryCd(String sMarryCd) {
        this.sMarryCd = sMarryCd;
    }

    /**
     * @return the sIntrCarlineNm1
     */
    public String getsIntrCarlineNm1() {
        return sIntrCarlineNm1;
    }

    /**
     * @param sIntrCarlineNm1 the sIntrCarlineNm1 to set
     */
    public void setsIntrCarlineNm1(String sIntrCarlineNm1) {
        this.sIntrCarlineNm1 = sIntrCarlineNm1;
    }

    /**
     * @return the sIntrCarlineNm2
     */
    public String getsIntrCarlineNm2() {
        return sIntrCarlineNm2;
    }

    /**
     * @param sIntrCarlineNm2 the sIntrCarlineNm2 to set
     */
    public void setsIntrCarlineNm2(String sIntrCarlineNm2) {
        this.sIntrCarlineNm2 = sIntrCarlineNm2;
    }

    /**
     * @return the sHobbyCd
     */
    public String getsHobbyCd() {
        return sHobbyCd;
    }

    /**
     * @param sHobbyCd the sHobbyCd to set
     */
    public void setsHobbyCd(String sHobbyCd) {
        this.sHobbyCd = sHobbyCd;
    }

    /**
     * @return the sOtherHobbyNm
     */
    public String getsOtherHobbyNm() {
        return sOtherHobbyNm;
    }

    /**
     * @param sOtherHobbyNm the sOtherHobbyNm to set
     */
    public void setsOtherHobbyNm(String sOtherHobbyNm) {
        this.sOtherHobbyNm = sOtherHobbyNm;
    }

    /**
     * @return the sOcmpIntrCarlineNm
     */
    public String getsOcmpIntrCarlineNm() {
        return sOcmpIntrCarlineNm;
    }

    /**
     * @param sOcmpIntrCarlineNm the sOcmpIntrCarlineNm to set
     */
    public void setsOcmpIntrCarlineNm(String sOcmpIntrCarlineNm) {
        this.sOcmpIntrCarlineNm = sOcmpIntrCarlineNm;
    }

    /**
     * @return the sBefMngScId
     */
    public String getsBefMngScId() {
        return sBefMngScId;
    }

    /**
     * @param sBefMngScId the sBefMngScId to set
     */
    public void setsBefMngScId(String sBefMngScId) {
        this.sBefMngScId = sBefMngScId;
    }

    /**
     * @return the sEventNo
     */
    public String getsEventNo() {
        return sEventNo;
    }

    /**
     * @param sEventNo the sEventNo to set
     */
    public void setsEventNo(String sEventNo) {
        this.sEventNo = sEventNo;
    }

    /**
     * @return the sPcontactNm
     */
    public String getsPcontactNm() {
        return sPcontactNm;
    }

    /**
     * @param sPcontactNm the sPcontactNm to set
     */
    public void setsPcontactNm(String sPcontactNm) {
        this.sPcontactNm = sPcontactNm;
    }

    /**
     * @return the sPcontactCustNo
     */
    public String getsPcontactCustNo() {
        return sPcontactCustNo;
    }

    /**
     * @param sPcontactCustNo the sPcontactCustNo to set
     */
    public void setsPcontactCustNo(String sPcontactCustNo) {
        this.sPcontactCustNo = sPcontactCustNo;
    }

    /**
     * @return the sPerInfoAgreeYn
     */
    public String getsPerInfoAgreeYn() {
        return sPerInfoAgreeYn;
    }

    /**
     * @param sPerInfoAgreeYn the sPerInfoAgreeYn to set
     */
    public void setsPerInfoAgreeYn(String sPerInfoAgreeYn) {
        this.sPerInfoAgreeYn = sPerInfoAgreeYn;
    }

    /**
     * @return the sNameChkYn
     */
    public String getsNameChkYn() {
        return sNameChkYn;
    }

    /**
     * @param sNameChkYn the sNameChkYn to set
     */
    public void setsNameChkYn(String sNameChkYn) {
        this.sNameChkYn = sNameChkYn;
    }

    /**
     * @return the sInvoiceEmailNm
     */
    public String getsInvoiceEmailNm() {
        return sInvoiceEmailNm;
    }

    /**
     * @param sInvoiceEmailNm the sInvoiceEmailNm to set
     */
    public void setsInvoiceEmailNm(String sInvoiceEmailNm) {
        this.sInvoiceEmailNm = sInvoiceEmailNm;
    }

    /**
     * @return the sAcCareerCd
     */
    public String getsAcCareerCd() {
        return sAcCareerCd;
    }

    /**
     * @param sAcCareerCd the sAcCareerCd to set
     */
    public void setsAcCareerCd(String sAcCareerCd) {
        this.sAcCareerCd = sAcCareerCd;
    }

    /**
     * @return the sIncomeLvlCd
     */
    public String getsIncomeLvlCd() {
        return sIncomeLvlCd;
    }

    /**
     * @param sIncomeLvlCd the sIncomeLvlCd to set
     */
    public void setsIncomeLvlCd(String sIncomeLvlCd) {
        this.sIncomeLvlCd = sIncomeLvlCd;
    }

    /**
     * @return the sAgeCd
     */
    public String getsAgeCd() {
        return sAgeCd;
    }

    /**
     * @param sAgeCd the sAgeCd to set
     */
    public void setsAgeCd(String sAgeCd) {
        this.sAgeCd = sAgeCd;
    }

    /**
     * @return the sFamilyCnt
     */
    public int getsFamilyCnt() {
        return sFamilyCnt;
    }

    /**
     * @param sFamilyCnt the sFamilyCnt to set
     */
    public void setsFamilyCnt(int sFamilyCnt) {
        this.sFamilyCnt = sFamilyCnt;
    }

    /**
     * @return the sDriverTp
     */
    public String getsDriverTp() {
        return sDriverTp;
    }

    /**
     * @param sDriverTp the sDriverTp to set
     */
    public void setsDriverTp(String sDriverTp) {
        this.sDriverTp = sDriverTp;
    }

    /**
     * @return the sIntroCnt
     */
    public String getsIntroCnt() {
        return sIntroCnt;
    }

    /**
     * @param sIntroCnt the sIntroCnt to set
     */
    public void setsIntroCnt(String sIntroCnt) {
        this.sIntroCnt = sIntroCnt;
    }

    /**
     * @return the sBuyReasonCd
     */
    public String getsBuyReasonCd() {
        return sBuyReasonCd;
    }

    /**
     * @param sBuyReasonCd the sBuyReasonCd to set
     */
    public void setsBuyReasonCd(String sBuyReasonCd) {
        this.sBuyReasonCd = sBuyReasonCd;
    }

    /**
     * @return the sRegCarBrandCd
     */
    public String getsRegCarBrandCd() {
        return sRegCarBrandCd;
    }

    /**
     * @param sRegCarBrandCd the sRegCarBrandCd to set
     */
    public void setsRegCarBrandCd(String sRegCarBrandCd) {
        this.sRegCarBrandCd = sRegCarBrandCd;
    }

    /**
     * @return the sRegCarBrandModelCd
     */
    public String getsRegCarBrandModelCd() {
        return sRegCarBrandModelCd;
    }

    /**
     * @param sRegCarBrandModelCd the sRegCarBrandModelCd to set
     */
    public void setsRegCarBrandModelCd(String sRegCarBrandModelCd) {
        this.sRegCarBrandModelCd = sRegCarBrandModelCd;
    }

    /**
     * @return the sBefOwnerSellChnCd
     */
    public String getsBefOwnerSellChnCd() {
        return sBefOwnerSellChnCd;
    }

    /**
     * @param sBefOwnerSellChnCd the sBefOwnerSellChnCd to set
     */
    public void setsBefOwnerSellChnCd(String sBefOwnerSellChnCd) {
        this.sBefOwnerSellChnCd = sBefOwnerSellChnCd;
    }

    /**
     * @return the sBefOwnerHoldPrid
     */
    public String getsBefOwnerHoldPrid() {
        return sBefOwnerHoldPrid;
    }

    /**
     * @param sBefOwnerHoldPrid the sBefOwnerHoldPrid to set
     */
    public void setsBefOwnerHoldPrid(String sBefOwnerHoldPrid) {
        this.sBefOwnerHoldPrid = sBefOwnerHoldPrid;
    }

    /**
     * @return the sCarBuyClassCd
     */
    public String getsCarBuyClassCd() {
        return sCarBuyClassCd;
    }

    /**
     * @param sCarBuyClassCd the sCarBuyClassCd to set
     */
    public void setsCarBuyClassCd(String sCarBuyClassCd) {
        this.sCarBuyClassCd = sCarBuyClassCd;
    }

    /**
     * @return the sPintroTp
     */
    public String getsPintroTp() {
        return sPintroTp;
    }

    /**
     * @param sPintroTp the sPintroTp to set
     */
    public void setsPintroTp(String sPintroTp) {
        this.sPintroTp = sPintroTp;
    }

    /**
     * @return the sPintroNm
     */
    public String getsPintroNm() {
        return sPintroNm;
    }

    /**
     * @param sPintroNm the sPintroNm to set
     */
    public void setsPintroNm(String sPintroNm) {
        this.sPintroNm = sPintroNm;
    }

    /**
     * @return the sEmailDomainCd
     */
    public String getsEmailDomainCd() {
        return sEmailDomainCd;
    }

    /**
     * @param sEmailDomainCd the sEmailDomainCd to set
     */
    public void setsEmailDomainCd(String sEmailDomainCd) {
        this.sEmailDomainCd = sEmailDomainCd;
    }

    /**
     * @return the sCompareCarBrandCd
     */
    public String getsCompareCarBrandCd() {
        return sCompareCarBrandCd;
    }

    /**
     * @param sCompareCarBrandCd the sCompareCarBrandCd to set
     */
    public void setsCompareCarBrandCd(String sCompareCarBrandCd) {
        this.sCompareCarBrandCd = sCompareCarBrandCd;
    }

    /**
     * @return the sCompareCarModelCd
     */
    public String getsCompareCarModelCd() {
        return sCompareCarModelCd;
    }

    /**
     * @param sCompareCarModelCd the sCompareCarModelCd to set
     */
    public void setsCompareCarModelCd(String sCompareCarModelCd) {
        this.sCompareCarModelCd = sCompareCarModelCd;
    }

    /**
     * @return the sBuyBefCarBrandCd
     */
    public String getsBuyBefCarBrandCd() {
        return sBuyBefCarBrandCd;
    }

    /**
     * @param sBuyBefCarBrandCd the sBuyBefCarBrandCd to set
     */
    public void setsBuyBefCarBrandCd(String sBuyBefCarBrandCd) {
        this.sBuyBefCarBrandCd = sBuyBefCarBrandCd;
    }

    /**
     * @return the sBuyBefCarModelCd
     */
    public String getsBuyBefCarModelCd() {
        return sBuyBefCarModelCd;
    }

    /**
     * @param sBuyBefCarModelCd the sBuyBefCarModelCd to set
     */
    public void setsBuyBefCarModelCd(String sBuyBefCarModelCd) {
        this.sBuyBefCarModelCd = sBuyBefCarModelCd;
    }

    /**
     * @return the sMergeYn
     */
    public String getsMergeYn() {
        return sMergeYn;
    }

    /**
     * @param sMergeYn the sMergeYn to set
     */
    public void setsMergeYn(String sMergeYn) {
        this.sMergeYn = sMergeYn;
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
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }

    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
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
     * @return the sPrefContactTimeCd
     */
    public String getsPrefContactTimeCd() {
        return sPrefContactTimeCd;
    }

    /**
     * @param sPrefContactTimeCd the sPrefContactTimeCd to set
     */
    public void setsPrefContactTimeCd(String sPrefContactTimeCd) {
        this.sPrefContactTimeCd = sPrefContactTimeCd;
    }

    /**
     * @return the sPerInfoUseYn
     */
    public String getsPerInfoUseYn() {
        return sPerInfoUseYn;
    }

    /**
     * @param sPerInfoUseYn the sPerInfoUseYn to set
     */
    public void setsPerInfoUseYn(String sPerInfoUseYn) {
        this.sPerInfoUseYn = sPerInfoUseYn;
    }

    /**
     * @return the sSearchRange
     */
    public String getsSearchRange() {
        return sSearchRange;
    }

    /**
     * @param sSearchRange the sSearchRange to set
     */
    public void setsSearchRange(String sSearchRange) {
        this.sSearchRange = sSearchRange;
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
     * @return the groupDS
     */
    public List<CustomerGroupVO> getGroupDS() {
        return groupDS;
    }

    /**
     * @param groupDS the groupDS to set
     */
    public void setGroupDS(List<CustomerGroupVO> groupDS) {
        this.groupDS = groupDS;
    }

    /**
     * @return the grpTp
     */
    public String getGrpTp() {
        return grpTp;
    }

    /**
     * @param grpTp the grpTp to set
     */
    public void setGrpTp(String grpTp) {
        this.grpTp = grpTp;
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
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
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
     * @return the sBhmcYnSearch
     */
    public String getsBhmcYnSearch() {
        return sBhmcYnSearch;
    }

    /**
     * @param sBhmcYnSearch the sBhmcYnSearch to set
     */
    public void setsBhmcYnSearch(String sBhmcYnSearch) {
        this.sBhmcYnSearch = sBhmcYnSearch;
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
     * @return the sCustHoldTpDtl
     */
    public String getsCustHoldTpDtl() {
        return sCustHoldTpDtl;
    }

    /**
     * @param sCustHoldTpDtl the sCustHoldTpDtl to set
     */
    public void setsCustHoldTpDtl(String sCustHoldTpDtl) {
        this.sCustHoldTpDtl = sCustHoldTpDtl;
    }

    /**
     * @return the sHpNoInvldYn
     */
    public String getsHpNoInvldYn() {
        return sHpNoInvldYn;
    }

    /**
     * @param sHpNoInvldYn the sHpNoInvldYn to set
     */
    public void setsHpNoInvldYn(String sHpNoInvldYn) {
        this.sHpNoInvldYn = sHpNoInvldYn;
    }

    /**
     * @return the sHpNoAddImposYn
     */
    public String getsHpNoAddImposYn() {
        return sHpNoAddImposYn;
    }

    /**
     * @param sHpNoAddImposYn the sHpNoAddImposYn to set
     */
    public void setsHpNoAddImposYn(String sHpNoAddImposYn) {
        this.sHpNoAddImposYn = sHpNoAddImposYn;
    }

    /**
     * @return the sBuyCnt
     */
    public String getsBuyCnt() {
        return sBuyCnt;
    }

    /**
     * @param sBuyCnt the sBuyCnt to set
     */
    public void setsBuyCnt(String sBuyCnt) {
        this.sBuyCnt = sBuyCnt;
    }

    /**
     * @return the sChgBuyYn
     */
    public String getsChgBuyYn() {
        return sChgBuyYn;
    }

    /**
     * @param sChgBuyYn the sChgBuyYn to set
     */
    public void setsChgBuyYn(String sChgBuyYn) {
        this.sChgBuyYn = sChgBuyYn;
    }

    /**
     * @return the sPurcCarBrandCd
     */
    public String getsPurcCarBrandCd() {
        return sPurcCarBrandCd;
    }

    /**
     * @param sPurcCarBrandCd the sPurcCarBrandCd to set
     */
    public void setsPurcCarBrandCd(String sPurcCarBrandCd) {
        this.sPurcCarBrandCd = sPurcCarBrandCd;
    }

    /**
     * @return the sPurcCarModelNm
     */
    public String getsPurcCarModelNm() {
        return sPurcCarModelNm;
    }

    /**
     * @param sPurcCarModelNm the sPurcCarModelNm to set
     */
    public void setsPurcCarModelNm(String sPurcCarModelNm) {
        this.sPurcCarModelNm = sPurcCarModelNm;
    }

    /**
     * @return the sAgeDtl
     */
    public String getsAgeDtl() {
        return sAgeDtl;
    }

    /**
     * @param sAgeDtl the sAgeDtl to set
     */
    public void setsAgeDtl(String sAgeDtl) {
        this.sAgeDtl = sAgeDtl;
    }

    /**
     * @return the sChinaZodiacSignCd
     */
    public String getsChinaZodiacSignCd() {
        return sChinaZodiacSignCd;
    }

    /**
     * @param sChinaZodiacSignCd the sChinaZodiacSignCd to set
     */
    public void setsChinaZodiacSignCd(String sChinaZodiacSignCd) {
        this.sChinaZodiacSignCd = sChinaZodiacSignCd;
    }

    /**
     * @return the sZodiacSignCd
     */
    public String getsZodiacSignCd() {
        return sZodiacSignCd;
    }

    /**
     * @param sZodiacSignCd the sZodiacSignCd to set
     */
    public void setsZodiacSignCd(String sZodiacSignCd) {
        this.sZodiacSignCd = sZodiacSignCd;
    }

    /**
     * @return the sBloodTp
     */
    public String getsBloodTp() {
        return sBloodTp;
    }

    /**
     * @param sBloodTp the sBloodTp to set
     */
    public void setsBloodTp(String sBloodTp) {
        this.sBloodTp = sBloodTp;
    }

    /**
     * @return the sChildrenCnt
     */
    public String getsChildrenCnt() {
        return sChildrenCnt;
    }

    /**
     * @param sChildrenCnt the sChildrenCnt to set
     */
    public void setsChildrenCnt(String sChildrenCnt) {
        this.sChildrenCnt = sChildrenCnt;
    }

    /**
     * @return the sDutyCd
     */
    public String getsDutyCd() {
        return sDutyCd;
    }

    /**
     * @param sDutyCd the sDutyCd to set
     */
    public void setsDutyCd(String sDutyCd) {
        this.sDutyCd = sDutyCd;
    }

    /**
     * @return the sMarryDt
     */
    public Date getsMarryDt() {
        return sMarryDt;
    }

    /**
     * @param sMarryDt the sMarryDt to set
     */
    public void setsMarryDt(Date sMarryDt) {
        this.sMarryDt = sMarryDt;
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
     * @return the sOldCustNm
     */
    public String getsOldCustNm() {
        return sOldCustNm;
    }

    /**
     * @param sOldCustNm the sOldCustNm to set
     */
    public void setsOldCustNm(String sOldCustNm) {
        this.sOldCustNm = sOldCustNm;
    }

    /**
     * @return the sOldHpNo
     */
    public String getsOldHpNo() {
        return sOldHpNo;
    }

    /**
     * @param sOldHpNo the sOldHpNo to set
     */
    public void setsOldHpNo(String sOldHpNo) {
        this.sOldHpNo = sOldHpNo;
    }

    /**
     * @return the sOldMathDocTp
     */
    public String getsOldMathDocTp() {
        return sOldMathDocTp;
    }

    /**
     * @param sOldMathDocTp the sOldMathDocTp to set
     */
    public void setsOldMathDocTp(String sOldMathDocTp) {
        this.sOldMathDocTp = sOldMathDocTp;
    }

    /**
     * @return the sOldSsnCrnNo
     */
    public String getsOldSsnCrnNo() {
        return sOldSsnCrnNo;
    }

    /**
     * @param sOldSsnCrnNo the sOldSsnCrnNo to set
     */
    public void setsOldSsnCrnNo(String sOldSsnCrnNo) {
        this.sOldSsnCrnNo = sOldSsnCrnNo;
    }

    /**
     * @param tagDS the tagDS to set
     */
    public void setTagDS(List<String> tagDS) {
        this.tagDS = tagDS;
    }

    /**
     * @return the tagDS
     */
    public List<String> getTagDS() {
        return tagDS;
    }

    /**
     * @param sCommand the sCommand to set
     */
    public void setsCommand(String sCommand) {
        this.sCommand = sCommand;
    }

    /**
     * @return the sCommand
     */
    public String getsCommand() {
        return sCommand;
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
     * @return the sLangCd
     */
    public String getsLangCd() {
        return sLangCd;
    }

    /**
     * @param sLangCd the sLangCd to set
     */
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
    }

    /**
     * @return the sSaleDtFrom
     */
    public Date getsSaleDtFrom() {
        return sSaleDtFrom;
    }

    /**
     * @param sSaleDtFrom the sSaleDtFrom to set
     */
    public void setsSaleDtFrom(Date sSaleDtFrom) {
        this.sSaleDtFrom = sSaleDtFrom;
    }

    /**
     * @return the sSaleDtTo
     */
    public Date getsSaleDtTo() {
        return sSaleDtTo;
    }

    /**
     * @param sSaleDtTo the sSaleDtTo to set
     */
    public void setsSaleDtTo(Date sSaleDtTo) {
        this.sSaleDtTo = sSaleDtTo;
    }

    /**
     * @return the sDlrMbrYn
     */
    public String getsDlrMbrYn() {
        return sDlrMbrYn;
    }

    /**
     * @param sDlrMbrYn the sDlrMbrYn to set
     */
    public void setsDlrMbrYn(String sDlrMbrYn) {
        this.sDlrMbrYn = sDlrMbrYn;
    }

    /**
     * @return the sCarRegNo
     */
    public String getsCarRegNo() {
        return sCarRegNo;
    }

    /**
     * @param sCarRegNo the sCarRegNo to set
     */
    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }

    /**
     * @return the sBlueMembershipJoinYn
     */
    public String getsBlueMembershipJoinYn() {
        return sBlueMembershipJoinYn;
    }

    /**
     * @param sBlueMembershipJoinYn the sBlueMembershipJoinYn to set
     */
    public void setsBlueMembershipJoinYn(String sBlueMembershipJoinYn) {
        this.sBlueMembershipJoinYn = sBlueMembershipJoinYn;
    }

    /**
     * @return the sSelCondi
     */
    public String getsSelCondi() {
        return sSelCondi;
    }

    /**
     * @param sSelCondi the sSelCondi to set
     */
    public void setsSelCondi(String sSelCondi) {
        this.sSelCondi = sSelCondi;
    }

    /**
     * @return the sMembershipStan
     */
    public String getsMembershipStan() {
        return sMembershipStan;
    }

    /**
     * @param sMembershipStan the sMembershipStan to set
     */
    public void setsMembershipStan(String sMembershipStan) {
        this.sMembershipStan = sMembershipStan;
    }

    /**
     * @return the sHyundaiYn
     */
    public String getsHyundaiYn() {
        return sHyundaiYn;
    }

    /**
     * @param sHyundaiYn the sHyundaiYn to set
     */
    public void setsHyundaiYn(String sHyundaiYn) {
        this.sHyundaiYn = sHyundaiYn;
    }

}
