package chn.bhmc.dms.mob.api.repair.vo;

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
 * @ClassName   : RepairOrderSearchVO.java
 * @Description : RO SearchVO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.    KyungMok Kim     최초 생성
 * </pre>
 */

public class RepairOrderSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8942495594871858205L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     *  RO번호
     **/
    private String sRoDocNo;

    /**
     *  RO그룹번호
     **/
    private String sRoGrpNo;

    /**
     *  예약번호
     **/
    private String sResvDocNo;

    /**
     *  주행거리
     **/
    private String sRunDistVal;

    /**
     *  SA명
     **/
    private String sSaId;

    /**
     *  SA명
     **/
    private String sSaNm;

    /**
     *  VIN
     **/
    private String sVinNo;

    /**
     *  운전자ID
     **/
    private String sDriverId;

    /**
     *  운전자
     **/
    private String sDriverNm;

    /**
     *  소유자
     **/
    private String sCarOwnerNm;

    /**
     *  소유자
     **/
    private String sCarOwnerId;

    /**
     *  테크니션
     **/
    private String sTecNm;

    /**
     *  베이
     **/
    private String sBayNo;

    /**
     *  RO상태
     **/
    private String sRoStatCd;

    /**
     *  차량번호
     **/
    private String sCarRegNo;

    /**
     *  페인트상태
     **/
    private String sPaintStatCd;

    /**
     *  세차상태
     **/
    private String sCarWashStatCd;

    /**
     *  품질검사상태
     **/
    private String sQtTestStatCd;

    /**
     *  도로 테스트 여부
     **/
    private String sRoadTestCd;

    /**
     *  RO유형
     **/
    private String sRoTp;

    /**
     *  RO유형
     **/
    private List<String> sRoTpList;

    /**
     * 공임번호
     */
    private String sLbrCd;

    /**
     * 공임명
     */
    private String sLbrNm;

    /**
     * 부품번호
     */
    private String sItemCd;

    /**
     * 부품명
     */
    private String sItemNm;

    /**
     * LTS MODEL CD
     */
    private String sLtsModelCd;

    /**
     *  RO발행일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoFromDt;

    /**
     *  RO발행일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoToDt;

    /**
     *  RO일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoDt;

    /**
     *  예정인도시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sExpcDlFromDt;

    /**
     *  예정인도시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sExpcDlToDt;

    /**
     *  조회 조건(AL:배정, WRK:작업배정, QT:품질, DL:인도, RS:현황)
     **/
    private String sListType;

    /**
     *  미배정 테이타 안 보여줌
     **/
    private String sRoTp1;

     /**
     *  RO작업시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoStartDt;

    /**
     *  RO작업종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoEndDt;

    private int sRunDistFromVal;

    private int sRunDistToVal;

    /**
     * 품질검사 확인 여부
     */
    private String sQtTestYn;

    /**
     *  세차여부
     **/
    private String sCarWashYn;

    /**
     *  배정상태
     **/
    private String sAllocStatCd;

    private String sRegUsrId;

    private String sRegUsrNm;

    /**
     *  일시정지원인코드
     **/
    private String sPauseCauCd;

    /**
     *  작업진도상태
     **/
    private String sWrkStatCd;

    /**
     *  검색구분
     **/
    private String sSearchGubun;

    /**
     *  사전점검일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPreChkFromDt;

    /**
     *  사전점검일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPreChkToDt;

    /**
     *  세차자
     **/
    private String sCarWashPrsnNm;

    /**
     *  세차시작시간(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarWashStartFromDt;

    /**
     *  세차시작시간(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarWashStartToDt;

    /**
     *  세차완료시간(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarWashEndFromDt;

    /**
     *  세차완료시간(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCarWashEndToDt;

    /**
     *  차종명
     **/
    private String sCarlineNm;

    /**
     *  품질검사자
     **/
    private String sQtTestPrsnNm;

    /**
     *  인도상태
     **/
    private String sDlStatCd;

    /**
     *  수리유형
     **/
    private String sLbrTp;

    /**
     *  PDI 여부
     **/
    private String sPdiYn;

    /**
     *  정비정산자
     **/
    private String sCalcPrsnNm;

    /**
     *  서비스정산번호
     **/
    private String sCalcDocNo;

    /**
     *  자체RO유형
     **/
    private String sDlrRoTp;

    /**
     *  고객의견코드
     **/
    private String sCustReqCd;

    /**
     *  고객의견내용
     **/
    private String sCustReqCont;

    /**
     *  기타사항코드
     **/
    private String sEtcTpCd;

    /**
     *  정산일자 (From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcFromDt;

    /**
     *  정산일자 (To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcToDt;

    /**
     *  캠페인번호
     **/
    private String sCrNm;

    /**
     *  캠페인유형
     **/
    private String sCrTp;

    /**
     *  지불완료일자 (From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPayFromDt;

    /**
     *  지불완료일자 (To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPayToDt;

    /**
     *  배정완료일자 (From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sAssignFromDt;

    /**
     *  배정완료일자 (To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sAssignToDt;

    /**
     *  작업완료일자 (From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sWorkFromDt;

    /**
     *  작업완료일자 (To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sWorkToDt;

    /**
     *  품질점검완료일자 (From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sQtTestFromDt;

    /**
     *  품질점검완료일자 (To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sQtTestToDt;

    /**
     *  인도확인일자 (From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlChkFromDt;

    /**
     *  인도확인일자 (To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlChkToDt;

    /**
     *  판매딜러
     **/
    private String sOrdDlrCd;

    /**
     *  BM회원번호
     **/
    private String sBlueMembershipNo;

    /**
     *  차량판매일 (From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleFromDt;

    /**
     *  차량판매일 (To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleToDt;

    /**
     *  지불완료시간 (From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPayEndFromDt;

    /**
     *  지불완료시간 (To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPayEndToDt;


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
     * @return the sRegUsrNm
     */
    public String getsRegUsrNm() {
        return sRegUsrNm;
    }

    /**
     * @param sRegUsrNm the sRegUsrNm to set
     */
    public void setsRegUsrNm(String sRegUsrNm) {
        this.sRegUsrNm = sRegUsrNm;
    }

    /**
     *  고품처리유형
     **/
    private String sAtqProcTp;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsRoDocNo() {
        return sRoDocNo;
    }

    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    /**
     * @return the sRoGrpNo
     */
    public String getsRoGrpNo() {
        return sRoGrpNo;
    }

    /**
     * @param sRoGrpNo the sRoGrpNo to set
     */
    public void setsRoGrpNo(String sRoGrpNo) {
        this.sRoGrpNo = sRoGrpNo;
    }

    public String getsResvDocNo() {
        return sResvDocNo;
    }

    public void setsResvDocNo(String sResvDocNo) {
        this.sResvDocNo = sResvDocNo;
    }

    public String getsRunDistVal() {
        return sRunDistVal;
    }

    public void setsRunDistVal(String sRunDistVal) {
        this.sRunDistVal = sRunDistVal;
    }

    public String getsSaNm() {
        return sSaNm;
    }

    public void setsSaNm(String sSaNm) {
        this.sSaNm = sSaNm;
    }

    public String getsVinNo() {
        return sVinNo;
    }

    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }
    /**
     * @return the sDriverId
     */
    public String getsDriverId() {
        return sDriverId;
    }

    /**
     * @param sDriverId the sDriverId to set
     */
    public void setsDriverId(String sDriverId) {
        this.sDriverId = sDriverId;
    }

    public String getsDriverNm() {
        return sDriverNm;
    }

    public void setsDriverNm(String sDriverNm) {
        this.sDriverNm = sDriverNm;
    }

    public String getsTecNm() {
        return sTecNm;
    }

    public void setsTecNm(String sTecNm) {
        this.sTecNm = sTecNm;
    }

    public String getsBayNo() {
        return sBayNo;
    }

    public void setsBayNo(String sBayNo) {
        this.sBayNo = sBayNo;
    }

    /**
     * @return the sRoStatCd
     */
    public String getsRoStatCd() {
        return sRoStatCd;
    }

    /**
     * @param sRoStatCd the sRoStatCd to set
     */
    public void setsRoStatCd(String sRoStatCd) {
        this.sRoStatCd = sRoStatCd;
    }

    public Date getsRoFromDt() {
        return sRoFromDt;
    }

    public void setsRoFromDt(Date sRoFromDt) {
        this.sRoFromDt = sRoFromDt;
    }

    public Date getsRoToDt() {
        return sRoToDt;
    }

    public void setsRoToDt(Date sRoToDt) {
        this.sRoToDt = sRoToDt;
    }

    public Date getsRoDt() {
        return sRoDt;
    }

    public void setsRoDt(Date sRoDt) {
        this.sRoDt = sRoDt;
    }

    public String getsCarRegNo() {
        return sCarRegNo;
    }

    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }

    public String getsPaintStatCd() {
        return sPaintStatCd;
    }

    public void setsPaintStatCd(String sPaintStatCd) {
        this.sPaintStatCd = sPaintStatCd;
    }

    public String getsCarWashStatCd() {
        return sCarWashStatCd;
    }

    public void setsCarWashStatCd(String sCarWashStatCd) {
        this.sCarWashStatCd = sCarWashStatCd;
    }

    public String getsQtTestStatCd() {
        return sQtTestStatCd;
    }

    public void setsQtTestStatCd(String sQtTestStatCd) {
        this.sQtTestStatCd = sQtTestStatCd;
    }

    public String getsRoTp() {
        return sRoTp;
    }

    public void setsRoTp(String sRoTp) {
        this.sRoTp = sRoTp;
    }

    /**
     * @return the sRoTpList
     */
    public List<String> getsRoTpList() {
        return sRoTpList;
    }

    /**
     * @param sRoTpList the sRoTpList to set
     */
    public void setsRoTpList(List<String> sRoTpList) {
        this.sRoTpList = sRoTpList;
    }

    /**
     * @return the sCarOwnerNm
     */
    public String getsCarOwnerNm() {
        return sCarOwnerNm;
    }

    /**
     * @param sCarOwnerNm the sCarOwnerNm to set
     */
    public void setsCarOwnerNm(String sCarOwnerNm) {
        this.sCarOwnerNm = sCarOwnerNm;
    }

    /**
     * @return the sCarOwnerId
     */
    public String getsCarOwnerId() {
        return sCarOwnerId;
    }

    /**
     * @param sCarOwnerId the sCarOwnerId to set
     */
    public void setsCarOwnerId(String sCarOwnerId) {
        this.sCarOwnerId = sCarOwnerId;
    }

    public Date getsExpcDlFromDt() {
        return sExpcDlFromDt;
    }

    public void setsExpcDlFromDt(Date sExpcDlFromDt) {
        this.sExpcDlFromDt = sExpcDlFromDt;
    }

    public Date getsExpcDlToDt() {
        return sExpcDlToDt;
    }

    public void setsExpcDlToDt(Date sExpcDlToDt) {
        this.sExpcDlToDt = sExpcDlToDt;
    }

    /**
     * @return the sListType
     */
    public String getsListType() {
        return sListType;
    }

    /**
     * @param sListType the sListType to set
     */
    public void setsListType(String sListType) {
        this.sListType = sListType;
    }

    public Date getsRoStartDt() {
        return sRoStartDt;
    }

    public void setsRoStartDt(Date sRoStartDt) {
        this.sRoStartDt = sRoStartDt;
    }

    public Date getsRoEndDt() {
        return sRoEndDt;
    }

    public void setsRoEndDt(Date sRoEndDt) {
        this.sRoEndDt = sRoEndDt;
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

    public String getsRoTp1() {
        return sRoTp1;
    }

    public void setsRoTp1(String sRoTp1) {
        this.sRoTp1 = sRoTp1;
    }

    /**
     * @return the sRunDistFromVal
     */
    public int getsRunDistFromVal() {
        return sRunDistFromVal;
    }

    /**
     * @param sRunDistFromVal the sRunDistFromVal to set
     */
    public void setsRunDistFromVal(int sRunDistFromVal) {
        this.sRunDistFromVal = sRunDistFromVal;
    }

    /**
     * @return the sRunDistToVal
     */
    public int getsRunDistToVal() {
        return sRunDistToVal;
    }

    /**
     * @param sRunDistToVal the sRunDistToVal to set
     */
    public void setsRunDistToVal(int sRunDistToVal) {
        this.sRunDistToVal = sRunDistToVal;
    }

    /**
     * @return the sSaId
     */
    public String getsSaId() {
        return sSaId;
    }

    /**
     * @param sSaId the sSaId to set
     */
    public void setsSaId(String sSaId) {
        this.sSaId = sSaId;
    }

    /**
     * @return the sRoadTestCd
     */
    public String getsRoadTestCd() {
        return sRoadTestCd;
    }

    /**
     * @param sRoadTestCd the sRoadTestCd to set
     */
    public void setsRoadTestCd(String sRoadTestCd) {
        this.sRoadTestCd = sRoadTestCd;
    }

    /**
     * @return the sLbrCd
     */
    public String getsLbrCd() {
        return sLbrCd;
    }

    /**
     * @param sLbrCd the sLbrCd to set
     */
    public void setsLbrCd(String sLbrCd) {
        this.sLbrCd = sLbrCd;
    }

    /**
     * @return the sLbrNm
     */
    public String getsLbrNm() {
        return sLbrNm;
    }

    /**
     * @param sLbrNm the sLbrNm to set
     */
    public void setsLbrNm(String sLbrNm) {
        this.sLbrNm = sLbrNm;
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
     * @return the sCarWashYn
     */
    public String getsCarWashYn() {
        return sCarWashYn;
    }

    /**
     * @param sCarWashYn the sCarWashYn to set
     */
    public void setsCarWashYn(String sCarWashYn) {
        this.sCarWashYn = sCarWashYn;
    }

    /**
     * @return the sQtTestYn
     */
    public String getsQtTestYn() {
        return sQtTestYn;
    }

    /**
     * @param sQtTestYn the sQtTestYn to set
     */
    public void setsQtTestYn(String sQtTestYn) {
        this.sQtTestYn = sQtTestYn;
    }

    /**
     * @return the sLtsModelCd
     */
    public String getsLtsModelCd() {
        return sLtsModelCd;
    }

    /**
     * @param sLtsModelCd the sLtsModelCd to set
     */
    public void setsLtsModelCd(String sLtsModelCd) {
        this.sLtsModelCd = sLtsModelCd;
    }

    /**
     * @return the sAllocStatCd
     */
    public String getsAllocStatCd() {
        return sAllocStatCd;
    }

    /**
     * @param sAllocStatCd the sAllocStatCd to set
     */
    public void setsAllocStatCd(String sAllocStatCd) {
        this.sAllocStatCd = sAllocStatCd;
    }

    /**
     * @return the sAtqProcTp
     */
    public String getsAtqProcTp() {
        return sAtqProcTp;
    }

    /**
     * @param sAtqProcTp the sAtqProcTp to set
     */
    public void setsAtqProcTp(String sAtqProcTp) {
        this.sAtqProcTp = sAtqProcTp;
    }

    /**
     * @return the sPauseCauCd
     */
    public String getsPauseCauCd() {
        return sPauseCauCd;
    }

    /**
     * @param sPauseCauCd the sPauseCauCd to set
     */
    public void setsPauseCauCd(String sPauseCauCd) {
        this.sPauseCauCd = sPauseCauCd;
    }

    /**
     * @return the sWrkStatCd
     */
    public String getsWrkStatCd() {
        return sWrkStatCd;
    }

    /**
     * @param sWrkStatCd the sWrkStatCd to set
     */
    public void setsWrkStatCd(String sWrkStatCd) {
        this.sWrkStatCd = sWrkStatCd;
    }

    /**
     * @return the sSearchGubun
     */
    public String getsSearchGubun() {
        return sSearchGubun;
    }

    /**
     * @param sSearchGubun the sSearchGubun to set
     */
    public void setsSearchGubun(String sSearchGubun) {
        this.sSearchGubun = sSearchGubun;
    }

    /**
     * @return the sPreChkFromDt
     */
    public Date getsPreChkFromDt() {
        return sPreChkFromDt;
    }

    /**
     * @param sPreChkFromDt the sPreChkFromDt to set
     */
    public void setsPreChkFromDt(Date sPreChkFromDt) {
        this.sPreChkFromDt = sPreChkFromDt;
    }

    /**
     * @return the sPreChkToDt
     */
    public Date getsPreChkToDt() {
        return sPreChkToDt;
    }

    /**
     * @param sPreChkToDt the sPreChkToDt to set
     */
    public void setsPreChkToDt(Date sPreChkToDt) {
        this.sPreChkToDt = sPreChkToDt;
    }

    /**
     * @return the sCarWashPrsnNm
     */
    public String getsCarWashPrsnNm() {
        return sCarWashPrsnNm;
    }

    /**
     * @param sCarWashPrsnNm the sCarWashPrsnNm to set
     */
    public void setsCarWashPrsnNm(String sCarWashPrsnNm) {
        this.sCarWashPrsnNm = sCarWashPrsnNm;
    }

    /**
     * @return the sCarWashStartFromDt
     */
    public Date getsCarWashStartFromDt() {
        return sCarWashStartFromDt;
    }

    /**
     * @param sCarWashStartFromDt the sCarWashStartFromDt to set
     */
    public void setsCarWashStartFromDt(Date sCarWashStartFromDt) {
        this.sCarWashStartFromDt = sCarWashStartFromDt;
    }

    /**
     * @return the sCarWashStartToDt
     */
    public Date getsCarWashStartToDt() {
        return sCarWashStartToDt;
    }

    /**
     * @param sCarWashStartToDt the sCarWashStartToDt to set
     */
    public void setsCarWashStartToDt(Date sCarWashStartToDt) {
        this.sCarWashStartToDt = sCarWashStartToDt;
    }

    /**
     * @return the sCarWashEndFromDt
     */
    public Date getsCarWashEndFromDt() {
        return sCarWashEndFromDt;
    }

    /**
     * @param sCarWashEndFromDt the sCarWashEndFromDt to set
     */
    public void setsCarWashEndFromDt(Date sCarWashEndFromDt) {
        this.sCarWashEndFromDt = sCarWashEndFromDt;
    }

    /**
     * @return the sCarWashEndToDt
     */
    public Date getsCarWashEndToDt() {
        return sCarWashEndToDt;
    }

    /**
     * @param sCarWashEndToDt the sCarWashEndToDt to set
     */
    public void setsCarWashEndToDt(Date sCarWashEndToDt) {
        this.sCarWashEndToDt = sCarWashEndToDt;
    }

    /**
     * @return the sCarlineNm
     */
    public String getsCarlineNm() {
        return sCarlineNm;
    }

    /**
     * @param sCarlineNm the sCarlineNm to set
     */
    public void setsCarlineNm(String sCarlineNm) {
        this.sCarlineNm = sCarlineNm;
    }

    /**
     * @return the sQtTestPrsnNm
     */
    public String getsQtTestPrsnNm() {
        return sQtTestPrsnNm;
    }

    /**
     * @param sQtTestPrsnNm the sQtTestPrsnNm to set
     */
    public void setsQtTestPrsnNm(String sQtTestPrsnNm) {
        this.sQtTestPrsnNm = sQtTestPrsnNm;
    }

    /**
     * @return the sDlStatCd
     */
    public String getsDlStatCd() {
        return sDlStatCd;
    }

    /**
     * @param sDlStatCd the sDlStatCd to set
     */
    public void setsDlStatCd(String sDlStatCd) {
        this.sDlStatCd = sDlStatCd;
    }

    public String getsLbrTp() {
        return sLbrTp;
    }

    public void setsLbrTp(String sLbrTp) {
        this.sLbrTp = sLbrTp;
    }

    /**
     * @return the sPdiYn
     */
    public String getsPdiYn() {
        return sPdiYn;
    }

    /**
     * @param sPdiYn the sPdiYn to set
     */
    public void setsPdiYn(String sPdiYn) {
        this.sPdiYn = sPdiYn;
    }

    /**
     * @param sCalcPrsnNm the sCalcPrsnNm to set
     */
    public void setsCalcPrsnNm(String sCalcPrsnNm) {
        this.sCalcPrsnNm = sCalcPrsnNm;
    }

    /**
     * @return the sCalcPrsnNm
     */
    public String getsCalcPrsnNm() {
        return sCalcPrsnNm;
    }

    /**
     * @param sCalcDocNo the sCalcDocNo to set
     */
    public void setsCalcDocNo(String sCalcDocNo) {
        this.sCalcDocNo = sCalcDocNo;
    }

    /**
     * @return the sCalcDocNo
     */
    public String getsCalcDocNo() {
        return sCalcDocNo;
    }

    /**
     * @param sDlrRoTp the sDlrRoTp to set
     */
    public void setsDlrRoTp(String sDlrRoTp) {
        this.sDlrRoTp = sDlrRoTp;
    }

    /**
     * @return the sDlrRoTp
     */
    public String getsDlrRoTp() {
        return sDlrRoTp;
    }

    /**
     * @return the sCustReqCd
     */
    public String getsCustReqCd() {
        return sCustReqCd;
    }

    /**
     * @param sCustReqCd the sCustReqCd to set
     */
    public void setsCustReqCd(String sCustReqCd) {
        this.sCustReqCd = sCustReqCd;
    }

    /**
     * @return the sCustReqCont
     */
    public String getsCustReqCont() {
        return sCustReqCont;
    }

    /**
     * @param sCustReqCont the sCustReqCont to set
     */
    public void setsCustReqCont(String sCustReqCont) {
        this.sCustReqCont = sCustReqCont;
    }

    /**
     * @param sEtcTpCd the sEtcTpCd to set
     */
    public void setsEtcTpCd(String sEtcTpCd) {
        this.sEtcTpCd = sEtcTpCd;
    }

    /**
     * @return the sEtcTpCd
     */
    public String getsEtcTpCd() {
        return sEtcTpCd;
    }

    /**
     * @param sCalcFromDt the sCalcFromDt to set
     */
    public void setsCalcFromDt(Date sCalcFromDt) {
        this.sCalcFromDt = sCalcFromDt;
    }

    /**
     * @return the sCalcFromDt
     */
    public Date getsCalcFromDt() {
        return sCalcFromDt;
    }

    /**
     * @param sCalcToDt the sCalcToDt to set
     */
    public void setsCalcToDt(Date sCalcToDt) {
        this.sCalcToDt = sCalcToDt;
    }

    /**
     * @return the sCalcToDt
     */
    public Date getsCalcToDt() {
        return sCalcToDt;
    }

    /**
     * @param sCrNm the sCrNm to set
     */
    public void setsCrNm(String sCrNm) {
        this.sCrNm = sCrNm;
    }

    /**
     * @return the sCrNm
     */
    public String getsCrNm() {
        return sCrNm;
    }

    /**
     * @param sCrTp the sCrTp to set
     */
    public void setsCrTp(String sCrTp) {
        this.sCrTp = sCrTp;
    }

    /**
     * @return the sCrTp
     */
    public String getsCrTp() {
        return sCrTp;
    }

    /**
     * @param sPayFromDt the sPayFromDt to set
     */
    public void setsPayFromDt(Date sPayFromDt) {
        this.sPayFromDt = sPayFromDt;
    }

    /**
     * @return the sPayFromDt
     */
    public Date getsPayFromDt() {
        return sPayFromDt;
    }

    /**
     * @param sPayToDt the sPayToDt to set
     */
    public void setsPayToDt(Date sPayToDt) {
        this.sPayToDt = sPayToDt;
    }

    /**
     * @return the sPayToDt
     */
    public Date getsPayToDt() {
        return sPayToDt;
    }

    /**
     * @return the sAssignFromDt
     */
    public Date getsAssignFromDt() {
        return sAssignFromDt;
    }

    /**
     * @param sAssignFromDt the sAssignFromDt to set
     */
    public void setsAssignFromDt(Date sAssignFromDt) {
        this.sAssignFromDt = sAssignFromDt;
    }

    /**
     * @return the sAssignToDt
     */
    public Date getsAssignToDt() {
        return sAssignToDt;
    }

    /**
     * @param sAssignToDt the sAssignToDt to set
     */
    public void setsAssignToDt(Date sAssignToDt) {
        this.sAssignToDt = sAssignToDt;
    }

    /**
     * @return the sWorkFromDt
     */
    public Date getsWorkFromDt() {
        return sWorkFromDt;
    }

    /**
     * @param sWorkFromDt the sWorkFromDt to set
     */
    public void setsWorkFromDt(Date sWorkFromDt) {
        this.sWorkFromDt = sWorkFromDt;
    }

    /**
     * @return the sWorkToDt
     */
    public Date getsWorkToDt() {
        return sWorkToDt;
    }

    /**
     * @param sWorkToDt the sWorkToDt to set
     */
    public void setsWorkToDt(Date sWorkToDt) {
        this.sWorkToDt = sWorkToDt;
    }

    /**
     * @return the sQtTestFromDt
     */
    public Date getsQtTestFromDt() {
        return sQtTestFromDt;
    }

    /**
     * @param sQtTestFromDt the sQtTestFromDt to set
     */
    public void setsQtTestFromDt(Date sQtTestFromDt) {
        this.sQtTestFromDt = sQtTestFromDt;
    }

    /**
     * @return the sQtTestToDt
     */
    public Date getsQtTestToDt() {
        return sQtTestToDt;
    }

    /**
     * @param sQtTestToDt the sQtTestToDt to set
     */
    public void setsQtTestToDt(Date sQtTestToDt) {
        this.sQtTestToDt = sQtTestToDt;
    }

    /**
     * @return the sDlChkFromDt
     */
    public Date getsDlChkFromDt() {
        return sDlChkFromDt;
    }

    /**
     * @param sDlChkFromDt the sDlChkFromDt to set
     */
    public void setsDlChkFromDt(Date sDlChkFromDt) {
        this.sDlChkFromDt = sDlChkFromDt;
    }

    /**
     * @return the sDlChkToDt
     */
    public Date getsDlChkToDt() {
        return sDlChkToDt;
    }

    /**
     * @param sDlChkToDt the sDlChkToDt to set
     */
    public void setsDlChkToDt(Date sDlChkToDt) {
        this.sDlChkToDt = sDlChkToDt;
    }

    /**
     * @param sOrdDlrCd the sOrdDlrCd to set
     */
    public void setsOrdDlrCd(String sOrdDlrCd) {
        this.sOrdDlrCd = sOrdDlrCd;
    }

    /**
     * @return the sOrdDlrCd
     */
    public String getsOrdDlrCd() {
        return sOrdDlrCd;
    }

    /**
     * @param sBlueMembershipNo the sBlueMembershipNo to set
     */
    public void setsBlueMembershipNo(String sBlueMembershipNo) {
        this.sBlueMembershipNo = sBlueMembershipNo;
    }

    /**
     * @return the sBlueMembershipNo
     */
    public String getsBlueMembershipNo() {
        return sBlueMembershipNo;
    }

    /**
     * @param sCustSaleFromDt the sCustSaleFromDt to set
     */
    public void setsCustSaleFromDt(Date sCustSaleFromDt) {
        this.sCustSaleFromDt = sCustSaleFromDt;
    }

    /**
     * @return the sCustSaleFromDt
     */
    public Date getsCustSaleFromDt() {
        return sCustSaleFromDt;
    }

    /**
     * @param sCustSaleToDt the sCustSaleToDt to set
     */
    public void setsCustSaleToDt(Date sCustSaleToDt) {
        this.sCustSaleToDt = sCustSaleToDt;
    }

    /**
     * @return the sCustSaleToDt
     */
    public Date getsCustSaleToDt() {
        return sCustSaleToDt;
    }

    /**
     * @param sPayEndFromDt the sPayEndFromDt to set
     */
    public void setsPayEndFromDt(Date sPayEndFromDt) {
        this.sPayEndFromDt = sPayEndFromDt;
    }

    /**
     * @return the sPayEndFromDt
     */
    public Date getsPayEndFromDt() {
        return sPayEndFromDt;
    }

    /**
     * @param sPayEndToDt the sPayEndToDt to set
     */
    public void setsPayEndToDt(Date sPayEndToDt) {
        this.sPayEndToDt = sPayEndToDt;
    }

    /**
     * @return the sPayEndToDt
     */
    public Date getsPayEndToDt() {
        return sPayEndToDt;
    }

}