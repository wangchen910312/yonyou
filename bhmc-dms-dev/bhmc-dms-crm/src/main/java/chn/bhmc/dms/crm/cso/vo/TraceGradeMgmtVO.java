package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 추적 등급별 다음 추적일 설정 VO
 * </pre>
 *
 * @ClassName   : TraceGradeMgmtVO.java
 * @Description : TraceGradeMgmtVO
 * @author Jin Choi
 * @since 2017. 2. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 6.     Jin Choi     최초 생성
 * </pre>
 */

public class TraceGradeMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1808482791314354503L;

    /* CR_0221T*/
    private String dlrCd; // 딜러코드
    private String traceGradeCd; // 추적등급 코드
    private String traceIvalDay; // 다음 추적 일수
    private String regUsrId; // 등록자

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt; // 등록일

    private String updtUsrId; // 업데이트 등록자

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt; // 업데이트 등록일


    /* CM_0303T*/
    private String cmmCdNm; // 추적등급
    private String cmmCd; // 추적등급 코드
    private String cmmGrpCd; // 공통코드 Crm363

    /* CM_0801T*/
    private String usrNm; // 등록자 이름


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
     * @return the traceGradeCd
     */
    public String getTraceGradeCd() {
        return traceGradeCd;
    }

    /**
     * @param traceGradeCd the traceGradeCd to set
     */
    public void setTraceGradeCd(String traceGradeCd) {
        this.traceGradeCd = traceGradeCd;
    }

    /**
     * @return the traceIvalDay
     */
    public String getTraceIvalDay() {
        return traceIvalDay;
    }

    /**
     * @param traceIvalDay the traceIvalDay to set
     */
    public void setTraceIvalDay(String traceIvalDay) {
        this.traceIvalDay = traceIvalDay;
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
     * @return the cmmCdNm
     */
    public String getCmmCdNm() {
        return cmmCdNm;
    }

    /**
     * @param cmmCdNm the cmmCdNm to set
     */
    public void setCmmCdNm(String cmmCdNm) {
        this.cmmCdNm = cmmCdNm;
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
     * @return the cmmGrpCd
     */
    public String getCmmGrpCd() {
        return cmmGrpCd;
    }

    /**
     * @param cmmGrpCd the cmmGrpCd to set
     */
    public void setCmmGrpCd(String cmmGrpCd) {
        this.cmmGrpCd = cmmGrpCd;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

}
