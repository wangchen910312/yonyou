package chn.bhmc.dms.crm.mcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 마케팅 캠패인 조회 SearchVO
 *
 * @ClassName   : MarketingCampaignSearchVO.java
 * @Description : MarketingCampaignSearchVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MarketingCampaignSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2017. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 11.     In Moon Lee     최초 생성
 * </pre>
 */
public class MarketingCampaignSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3605744055581045654L;

    private String sDlrCd; // 딜러코드
    private String sPltCd; // 사업장코드
    private String sMakCd; // 마케팅코드
    private String sCopyNewMakCd; // 캠페인 복사시 새로 생성한 마케팅코드
    private String cmmCd; // 유형코드
    private String langCd; // 언어코드
    private String sMakNm; // 마케팅명
    private String sHostCd; // 주최코드
    private String sHostTeamCd; // 주최팀코드
    private String sMakTpCd; // 마케팅유형코드
    private String sMakSubTpCd; // 마케팅유형코드
    private String sStatCd; // 상태코드
    private String sApprDocNo; // 결재번호
    private String sTalkPlan; //화술방안
    private String sCrNo; // 캠페인 번호(정비용)
    private String sRefKeyNm;
    private String sRefTableNm;

    private int sExtrDgreCnt; // 추출차수

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt; // 마케팅 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt; // 마케팅 종료일자
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
     * @return the sMakCd
     */
    public String getsMakCd() {
        return sMakCd;
    }
    /**
     * @param sMakCd the sMakCd to set
     */
    public void setsMakCd(String sMakCd) {
        this.sMakCd = sMakCd;
    }
    /**
     * @return the sCopyNewMakCd
     */
    public String getsCopyNewMakCd() {
        return sCopyNewMakCd;
    }
    /**
     * @param sCopyNewMakCd the sCopyNewMakCd to set
     */
    public void setsCopyNewMakCd(String sCopyNewMakCd) {
        this.sCopyNewMakCd = sCopyNewMakCd;
    }
    /**
     * @return the cmmCd
     */
    public String getCmmCd() {
        return cmmCd;
    }
    /**
     * @param cmmCd the cmmCd to set
     */
    public void setCmmCd(String cmmCd) {
        this.cmmCd = cmmCd;
    }
    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }
    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }
    /**
     * @return the sMakNm
     */
    public String getsMakNm() {
        return sMakNm;
    }
    /**
     * @param sMakNm the sMakNm to set
     */
    public void setsMakNm(String sMakNm) {
        this.sMakNm = sMakNm;
    }
    /**
     * @return the sHostCd
     */
    public String getsHostCd() {
        return sHostCd;
    }
    /**
     * @param sHostCd the sHostCd to set
     */
    public void setsHostCd(String sHostCd) {
        this.sHostCd = sHostCd;
    }
    /**
     * @return the sHostTeamCd
     */
    public String getsHostTeamCd() {
        return sHostTeamCd;
    }
    /**
     * @param sHostTeamCd the sHostTeamCd to set
     */
    public void setsHostTeamCd(String sHostTeamCd) {
        this.sHostTeamCd = sHostTeamCd;
    }
    /**
     * @return the sMakTpCd
     */
    public String getsMakTpCd() {
        return sMakTpCd;
    }
    /**
     * @param sMakTpCd the sMakTpCd to set
     */
    public void setsMakTpCd(String sMakTpCd) {
        this.sMakTpCd = sMakTpCd;
    }
    /**
     * @return the sMakSubTpCd
     */
    public String getsMakSubTpCd() {
        return sMakSubTpCd;
    }
    /**
     * @param sMakSubTpCd the sMakSubTpCd to set
     */
    public void setsMakSubTpCd(String sMakSubTpCd) {
        this.sMakSubTpCd = sMakSubTpCd;
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
     * @return the sApprDocNo
     */
    public String getsApprDocNo() {
        return sApprDocNo;
    }
    /**
     * @param sApprDocNo the sApprDocNo to set
     */
    public void setsApprDocNo(String sApprDocNo) {
        this.sApprDocNo = sApprDocNo;
    }
    /**
     * @return the sTalkPlan
     */
    public String getsTalkPlan() {
        return sTalkPlan;
    }
    /**
     * @param sTalkPlan the sTalkPlan to set
     */
    public void setsTalkPlan(String sTalkPlan) {
        this.sTalkPlan = sTalkPlan;
    }
    /**
     * @return the sCrNo
     */
    public String getsCrNo() {
        return sCrNo;
    }
    /**
     * @param sCrNo the sCrNo to set
     */
    public void setsCrNo(String sCrNo) {
        this.sCrNo = sCrNo;
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
     * @return the sExtrDgreCnt
     */
    public int getsExtrDgreCnt() {
        return sExtrDgreCnt;
    }
    /**
     * @param sExtrDgreCnt the sExtrDgreCnt to set
     */
    public void setsExtrDgreCnt(int sExtrDgreCnt) {
        this.sExtrDgreCnt = sExtrDgreCnt;
    }
    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }
    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }
    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

}