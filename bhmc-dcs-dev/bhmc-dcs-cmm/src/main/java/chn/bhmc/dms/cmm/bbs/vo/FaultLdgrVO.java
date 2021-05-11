package chn.bhmc.dms.cmm.bbs.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 결함관리대장 VO
 * </pre>
 *
 * @ClassName   : FaultLdgrVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class FaultLdgrVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7410183547064759967L;

    /**
     * 결함번호
     */
    private int faultNo;

    /**
     * 시스템구분
     */
    private String sysTp;

    /**
     * 식별방법
     */
    private String targetArea;

    /**
     * 대상 유형
     */
    private String targetTp;

    /**
     * 시나리오/케이스ID
     */
    private String caseId;

    /**
     * 결함유형
     */
    private String faultTp;

    /**
     * 결함상세유형
     */
    private String faultSubTp;

    /**
     * 결함내용
     */
    private String faultCont;

    /**
     * 식별자
     */
    private String faultRegUsrNm;

    /**
     * 식별일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date faultRegDt;

    /**
     * 영향분석
     */
    private String faultAnlyCont;

    /**
     * 판단
     */
    private String faultDecisionTp;

    /**
     * 심각도
     */
    private String severity;

    /**
     * 우선순위
     */
    private int priority;

    /**
     * 결함 조치계획/결과
     */
    private String resolvePlan;

    /**
     * 조치자
     */
    private String resolveUsrNm;

    /**
     * 조치 예정일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resolveDueDt;

    /**
     * 조치 완료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resolveDt;

    /**
     * 확인일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date checkDt;

    /**
     * 확인자
     */
    private String checkUsrNm;

    /**
     * 확인결과
     */
    private String checkRsltCd;

    /**
     * @return the faultNo
     */
    public int getFaultNo() {
        return faultNo;
    }

    /**
     * @param faultNo the faultNo to set
     */
    public void setFaultNo(int faultNo) {
        this.faultNo = faultNo;
    }

    /**
     * @return the sysTp
     */
    public String getSysTp() {
        return sysTp;
    }

    /**
     * @param sysTp the sysTp to set
     */
    public void setSysTp(String sysTp) {
        this.sysTp = sysTp;
    }

    /**
     * @return the targetArea
     */
    public String getTargetArea() {
        return targetArea;
    }

    /**
     * @param targetArea the targetArea to set
     */
    public void setTargetArea(String targetArea) {
        this.targetArea = targetArea;
    }

    /**
     * @return the targetTp
     */
    public String getTargetTp() {
        return targetTp;
    }

    /**
     * @param targetTp the targetTp to set
     */
    public void setTargetTp(String targetTp) {
        this.targetTp = targetTp;
    }

    /**
     * @return the caseId
     */
    public String getCaseId() {
        return caseId;
    }

    /**
     * @param caseId the caseId to set
     */
    public void setCaseId(String caseId) {
        this.caseId = caseId;
    }

    /**
     * @return the faultTp
     */
    public String getFaultTp() {
        return faultTp;
    }

    /**
     * @param faultTp the faultTp to set
     */
    public void setFaultTp(String faultTp) {
        this.faultTp = faultTp;
    }

    /**
     * @return the faultSubTp
     */
    public String getFaultSubTp() {
        return faultSubTp;
    }

    /**
     * @param faultSubTp the faultSubTp to set
     */
    public void setFaultSubTp(String faultSubTp) {
        this.faultSubTp = faultSubTp;
    }

    /**
     * @return the faultCont
     */
    public String getFaultCont() {
        return faultCont;
    }

    /**
     * @param faultCont the faultCont to set
     */
    public void setFaultCont(String faultCont) {
        this.faultCont = faultCont;
    }

    /**
     * @return the faultRegUsrNm
     */
    public String getFaultRegUsrNm() {
        return faultRegUsrNm;
    }

    /**
     * @param faultRegUsrNm the faultRegUsrNm to set
     */
    public void setFaultRegUsrNm(String faultRegUsrNm) {
        this.faultRegUsrNm = faultRegUsrNm;
    }

    /**
     * @return the faultRegDt
     */
    public Date getFaultRegDt() {
        return faultRegDt;
    }

    /**
     * @param faultRegDt the faultRegDt to set
     */
    public void setFaultRegDt(Date faultRegDt) {
        this.faultRegDt = faultRegDt;
    }

    /**
     * @return the faultAnlyCont
     */
    public String getFaultAnlyCont() {
        return faultAnlyCont;
    }

    /**
     * @param faultAnlyCont the faultAnlyCont to set
     */
    public void setFaultAnlyCont(String faultAnlyCont) {
        this.faultAnlyCont = faultAnlyCont;
    }

    /**
     * @return the faultDecisionTp
     */
    public String getFaultDecisionTp() {
        return faultDecisionTp;
    }

    /**
     * @param faultDecisionTp the faultDecisionTp to set
     */
    public void setFaultDecisionTp(String faultDecisionTp) {
        this.faultDecisionTp = faultDecisionTp;
    }

    /**
     * @return the severity
     */
    public String getSeverity() {
        return severity;
    }

    /**
     * @param severity the severity to set
     */
    public void setSeverity(String severity) {
        this.severity = severity;
    }

    /**
     * @return the priority
     */
    public int getPriority() {
        return priority;
    }

    /**
     * @param priority the priority to set
     */
    public void setPriority(int priority) {
        this.priority = priority;
    }

    /**
     * @return the resolvePlan
     */
    public String getResolvePlan() {
        return resolvePlan;
    }

    /**
     * @param resolvePlan the resolvePlan to set
     */
    public void setResolvePlan(String resolvePlan) {
        this.resolvePlan = resolvePlan;
    }

    /**
     * @return the resolveUsrNm
     */
    public String getResolveUsrNm() {
        return resolveUsrNm;
    }

    /**
     * @param resolveUsrNm the resolveUsrNm to set
     */
    public void setResolveUsrNm(String resolveUsrNm) {
        this.resolveUsrNm = resolveUsrNm;
    }

    /**
     * @return the resolveDueDt
     */
    public Date getResolveDueDt() {
        return resolveDueDt;
    }

    /**
     * @param resolveDueDt the resolveDueDt to set
     */
    public void setResolveDueDt(Date resolveDueDt) {
        this.resolveDueDt = resolveDueDt;
    }

    /**
     * @return the resolveDt
     */
    public Date getResolveDt() {
        return resolveDt;
    }

    /**
     * @param resolveDt the resolveDt to set
     */
    public void setResolveDt(Date resolveDt) {
        this.resolveDt = resolveDt;
    }

    /**
     * @return the checkDt
     */
    public Date getCheckDt() {
        return checkDt;
    }

    /**
     * @param checkDt the checkDt to set
     */
    public void setCheckDt(Date checkDt) {
        this.checkDt = checkDt;
    }

    /**
     * @return the checkUsrNm
     */
    public String getCheckUsrNm() {
        return checkUsrNm;
    }

    /**
     * @param checkUsrNm the checkUsrNm to set
     */
    public void setCheckUsrNm(String checkUsrNm) {
        this.checkUsrNm = checkUsrNm;
    }

    /**
     * @return the checkRsltCd
     */
    public String getCheckRsltCd() {
        return checkRsltCd;
    }

    /**
     * @param checkRsltCd the checkRsltCd to set
     */
    public void setCheckRsltCd(String checkRsltCd) {
        this.checkRsltCd = checkRsltCd;
    }

}
