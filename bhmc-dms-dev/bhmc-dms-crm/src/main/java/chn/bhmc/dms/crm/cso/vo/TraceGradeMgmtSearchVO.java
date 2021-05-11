package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 추적 등급별 다음 추적일 설정 조회 SearchVO
 * </pre>
 *
 * @ClassName   : TraceGradeMgmtSerchVO.java
 * @Description : TraceGradeMgmtSerchVO
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

public class TraceGradeMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4171708774150325263L;

    /* CR_0221T*/
    private String sDlrCd; // 딜러코드
    private String sTraceGradeCd; // 추적등급 코드
    private String sTraceIvalDay; // 다음 추적 일수
    private String sRegUsrId; // 등록자

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt; // 등록일

    private String sUpdtUsrId; // 업데이트 등록자

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUpdtDt; // 업데이트 등록일


    /* CM_0303T*/
    private String sCmmCdNm; // 추적등급
    private String sCmmCd; // 추적등급 코드
    private String sCmmGrpCd; // 공통코드 Crm363

    /* CM_0801T*/
    private String SUsrNm; // 등록자 이름



    /**
     * @return the dlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the traceGradeCd
     */
    public String getsTraceGradeCd() {
        return sTraceGradeCd;
    }

    /**
     * @param traceGradeCd the traceGradeCd to set
     */
    public void setsTraceGradeCd(String sTraceGradeCd) {
        this.sTraceGradeCd = sTraceGradeCd;
    }

    /**
     * @return the traceIvalDay
     */
    public String getsTraceIvalDay() {
        return sTraceIvalDay;
    }

    /**
     * @param traceIvalDay the traceIvalDay to set
     */
    public void setsTraceIvalDay(String sTraceIvalDay) {
        this.sTraceIvalDay = sTraceIvalDay;
    }

    /**
     * @return the regUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }

    /**
     * @return the cmmCdNm
     */
    public String getsCmmCdNm() {
        return sCmmCdNm;
    }

    /**
     * @param cmmCdNm the cmmCdNm to set
     */
    public void setsCmmCdNm(String sCmmCdNm) {
        this.sCmmCdNm = sCmmCdNm;
    }

    /**
     * @return the cmmCd
     */
    public String getCmmCd() {
        return sCmmCd;
    }

    /**
     * @param cmmCd the cmmCd to set
     */
    public void setCmmCd(String sCmmCd) {
        this.sCmmCd = sCmmCd;
    }

    /**
     * @return the cmmGrpCd
     */
    public String getsCmmGrpCd() {
        return sCmmGrpCd;
    }

    /**
     * @param cmmGrpCd the cmmGrpCd to set
     */
    public void setsCmmGrpCd(String sCmmGrpCd) {
        this.sCmmGrpCd = sCmmGrpCd;
    }

    /**
     * @param sUsrNm the sUsrNm to set
     */
    public void setSUsrNm(String sUsrNm) {
        SUsrNm = sUsrNm;
    }

    /**
     * @return the sUsrNm
     */
    public String getSUsrNm() {
        return SUsrNm;
    }

}
