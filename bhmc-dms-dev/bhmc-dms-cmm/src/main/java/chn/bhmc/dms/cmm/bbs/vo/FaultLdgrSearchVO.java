package chn.bhmc.dms.cmm.bbs.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 결함관리대장 SearchVO
 * </pre>
 *
 * @ClassName   : FaultLdgrSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 16.     Kang Seok Han     최초 생성
 * </pre>
 */

public class FaultLdgrSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8129381418190132421L;

    /**
     * 시스템구분
     */
    private String sSysTp;

    /**
     * 식별방법
     */
    private String sTargetArea;

    /**
     * 대상유형
     */
    private String sTargetTp;

    /**
     * 시나리오/케이스 ID
     */
    private String sCaseId;

    /**
     * 결함유형
     */
    private String sFaultTp;

    /**
     * 결함상세유형
     */
    private String sFaultSubTp;

    /**
     * 식별자
     */
    private String sFaultRegUsrNm;

    /**
     * 식별일자 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartFaultRegDt;

    /**
     * 식별일자 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndFaultRegDt;

    /**
     * 판단유형
     */
    private String sFaultDecisionTp;

    /**
     * 심각도
     */
    private String sSeverity;

    /**
     * 우선순위
     */
    private int sPriority;

    /**
     * 조치자
     */
    private String sResolveUsrNm;

    /**
     * 조치예정일 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartResolveDueDt;

    /**
     * 조치예정일 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndResolveDueDt;

    /**
     * 조치일 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartResolveDt;

    /**
     * 조치일 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndResolveDt;

    /**
     * 확인일 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartCheckDt;

    /**
     * 확인일 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndCheckDt;

    /**
     * 확인자
     */
    private String sCheckUsrNm;

    /**
     * 확인결과
     */
    private String sCheckRsltCd;

    /**
     * @return the sSysTp
     */
    public String getsSysTp() {
        return sSysTp;
    }
    /**
     * @param sSysTp the sSysTp to set
     */
    public void setsSysTp(String sSysTp) {
        this.sSysTp = sSysTp;
    }
    /**
     * @return the sTargetArea
     */
    public String getsTargetArea() {
        return sTargetArea;
    }
    /**
     * @param sTargetArea the sTargetArea to set
     */
    public void setsTargetArea(String sTargetArea) {
        this.sTargetArea = sTargetArea;
    }
    /**
     * @return the sTargetTp
     */
    public String getsTargetTp() {
        return sTargetTp;
    }
    /**
     * @param sTargetTp the sTargetTp to set
     */
    public void setsTargetTp(String sTargetTp) {
        this.sTargetTp = sTargetTp;
    }
    /**
     * @return the sCaseId
     */
    public String getsCaseId() {
        return sCaseId;
    }
    /**
     * @param sCaseId the sCaseId to set
     */
    public void setsCaseId(String sCaseId) {
        this.sCaseId = sCaseId;
    }
    /**
     * @return the sFaultTp
     */
    public String getsFaultTp() {
        return sFaultTp;
    }
    /**
     * @param sFaultTp the sFaultTp to set
     */
    public void setsFaultTp(String sFaultTp) {
        this.sFaultTp = sFaultTp;
    }
    /**
     * @return the sFaultSubTp
     */
    public String getsFaultSubTp() {
        return sFaultSubTp;
    }
    /**
     * @param sFaultSubTp the sFaultSubTp to set
     */
    public void setsFaultSubTp(String sFaultSubTp) {
        this.sFaultSubTp = sFaultSubTp;
    }
    /**
     * @return the sFaultRegUsrNm
     */
    public String getsFaultRegUsrNm() {
        return sFaultRegUsrNm;
    }
    /**
     * @param sFaultRegUsrNm the sFaultRegUsrNm to set
     */
    public void setsFaultRegUsrNm(String sFaultRegUsrNm) {
        this.sFaultRegUsrNm = sFaultRegUsrNm;
    }
    /**
     * @return the sStartFaultRegDt
     */
    public Date getsStartFaultRegDt() {
        return sStartFaultRegDt;
    }
    /**
     * @param sStartFaultRegDt the sStartFaultRegDt to set
     */
    public void setsStartFaultRegDt(Date sStartFaultRegDt) {
        this.sStartFaultRegDt = sStartFaultRegDt;
    }
    /**
     * @return the sEndFaultRegDt
     */
    public Date getsEndFaultRegDt() {
        return sEndFaultRegDt;
    }
    /**
     * @param sEndFaultRegDt the sEndFaultRegDt to set
     */
    public void setsEndFaultRegDt(Date sEndFaultRegDt) {
        this.sEndFaultRegDt = sEndFaultRegDt;
    }
    /**
     * @return the sFaultDecisionTp
     */
    public String getsFaultDecisionTp() {
        return sFaultDecisionTp;
    }
    /**
     * @param sFaultDecisionTp the sFaultDecisionTp to set
     */
    public void setsFaultDecisionTp(String sFaultDecisionTp) {
        this.sFaultDecisionTp = sFaultDecisionTp;
    }
    /**
     * @return the sSeverity
     */
    public String getsSeverity() {
        return sSeverity;
    }
    /**
     * @param sSeverity the sSeverity to set
     */
    public void setsSeverity(String sSeverity) {
        this.sSeverity = sSeverity;
    }
    /**
     * @return the sPriority
     */
    public int getsPriority() {
        return sPriority;
    }
    /**
     * @param sPriority the sPriority to set
     */
    public void setsPriority(int sPriority) {
        this.sPriority = sPriority;
    }
    /**
     * @return the sResolveUsrNm
     */
    public String getsResolveUsrNm() {
        return sResolveUsrNm;
    }
    /**
     * @param sResolveUsrNm the sResolveUsrNm to set
     */
    public void setsResolveUsrNm(String sResolveUsrNm) {
        this.sResolveUsrNm = sResolveUsrNm;
    }
    /**
     * @return the sStartResolveDueDt
     */
    public Date getsStartResolveDueDt() {
        return sStartResolveDueDt;
    }
    /**
     * @param sStartResolveDueDt the sStartResolveDueDt to set
     */
    public void setsStartResolveDueDt(Date sStartResolveDueDt) {
        this.sStartResolveDueDt = sStartResolveDueDt;
    }
    /**
     * @return the sEndResolveDueDt
     */
    public Date getsEndResolveDueDt() {
        return sEndResolveDueDt;
    }
    /**
     * @param sEndResolveDueDt the sEndResolveDueDt to set
     */
    public void setsEndResolveDueDt(Date sEndResolveDueDt) {
        this.sEndResolveDueDt = sEndResolveDueDt;
    }
    /**
     * @return the sStartResolveDt
     */
    public Date getsStartResolveDt() {
        return sStartResolveDt;
    }
    /**
     * @param sStartResolveDt the sStartResolveDt to set
     */
    public void setsStartResolveDt(Date sStartResolveDt) {
        this.sStartResolveDt = sStartResolveDt;
    }
    /**
     * @return the sEndResolveDt
     */
    public Date getsEndResolveDt() {
        return sEndResolveDt;
    }
    /**
     * @param sEndResolveDt the sEndResolveDt to set
     */
    public void setsEndResolveDt(Date sEndResolveDt) {
        this.sEndResolveDt = sEndResolveDt;
    }
    /**
     * @return the sStartCheckDt
     */
    public Date getsStartCheckDt() {
        return sStartCheckDt;
    }
    /**
     * @param sStartCheckDt the sStartCheckDt to set
     */
    public void setsStartCheckDt(Date sStartCheckDt) {
        this.sStartCheckDt = sStartCheckDt;
    }
    /**
     * @return the sEndCheckDt
     */
    public Date getsEndCheckDt() {
        return sEndCheckDt;
    }
    /**
     * @param sEndCheckDt the sEndCheckDt to set
     */
    public void setsEndCheckDt(Date sEndCheckDt) {
        this.sEndCheckDt = sEndCheckDt;
    }
    /**
     * @return the sCheckUsrNm
     */
    public String getsCheckUsrNm() {
        return sCheckUsrNm;
    }
    /**
     * @param sCheckUsrNm the sCheckUsrNm to set
     */
    public void setsCheckUsrNm(String sCheckUsrNm) {
        this.sCheckUsrNm = sCheckUsrNm;
    }
    /**
     * @return the sCheckRsltCd
     */
    public String getsCheckRsltCd() {
        return sCheckRsltCd;
    }
    /**
     * @param sCheckRsltCd the sCheckRsltCd to set
     */
    public void setsCheckRsltCd(String sCheckRsltCd) {
        this.sCheckRsltCd = sCheckRsltCd;
    }
}
