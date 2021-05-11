package chn.bhmc.dms.cmm.apr.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 결재문서 조회조건 설정
 * </pre>
 *
 * @ClassName   : SignSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SignSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    /**
     * 결재양식ID
     */
    private String sSignDocId;

    /**
     * 결재문서번호
     */
    private String sSignDocNo;

    /**
     * 결재양식명
     */
    private String sSignDocNm;

    /**
     * 결재요청제목
     */
    private String sReqTitleNm;

    /**
     * 기안자ID
     */
    private String sReqUsrId;

    /**
     * 기안자명
     */
    private String sReqUsrNm;

    /**
     * 결재자ID
     */
    private String sSignUsrId;

    /**
     * 결재상신문서 결재진행상태
     */
    private String sSignStatCd;

    /**
     * 결재선 결재처리코드
     */
    private String sSignRsltCd;

    /**
     * 기안일자 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartReqDt;

    /**
     * 기안일자 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndReqDt;

    /**
     * 결재일자 조회 시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartSignEndDt;

    /**
     * 결재일자 조회 종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndSignEndDt;

    /**
     * 임시저장여부
     */
    private String sTempSaveYn;

    /**
     * @return the sSignDocId
     */
    public String getsSignDocId() {
        return sSignDocId;
    }

    /**
     * @param sSignDocId the sSignDocId to set
     */
    public void setsSignDocId(String sSignDocId) {
        this.sSignDocId = sSignDocId;
    }

    /**
     * @return the sSignDocNo
     */
    public String getsSignDocNo() {
        return sSignDocNo;
    }

    /**
     * @param sSignDocNo the sSignDocNo to set
     */
    public void setsSignDocNo(String sSignDocNo) {
        this.sSignDocNo = sSignDocNo;
    }

    /**
     * @return the sSignDocNm
     */
    public String getsSignDocNm() {
        return sSignDocNm;
    }

    /**
     * @param sSignDocNm the sSignDocNm to set
     */
    public void setsSignDocNm(String sSignDocNm) {
        this.sSignDocNm = sSignDocNm;
    }

    /**
     * @return the sReqTitleNm
     */
    public String getsReqTitleNm() {
        return sReqTitleNm;
    }

    /**
     * @param sReqTitleNm the sReqTitleNm to set
     */
    public void setsReqTitleNm(String sReqTitleNm) {
        this.sReqTitleNm = sReqTitleNm;
    }

    /**
     * @return the sReqUsrId
     */
    public String getsReqUsrId() {
        return sReqUsrId;
    }

    /**
     * @param sReqUsrId the sReqUsrId to set
     */
    public void setsReqUsrId(String sReqUsrId) {
        this.sReqUsrId = sReqUsrId;
    }

    /**
     * @return the sReqUsrNm
     */
    public String getsReqUsrNm() {
        return sReqUsrNm;
    }

    /**
     * @param sReqUsrNm the sReqUsrNm to set
     */
    public void setsReqUsrNm(String sReqUsrNm) {
        this.sReqUsrNm = sReqUsrNm;
    }

    /**
     * @return the sSignUsrId
     */
    public String getsSignUsrId() {
        return sSignUsrId;
    }

    /**
     * @param sSignUsrId the sSignUsrId to set
     */
    public void setsSignUsrId(String sSignUsrId) {
        this.sSignUsrId = sSignUsrId;
    }

    /**
     * @return the sSignStatCd
     */
    public String getsSignStatCd() {
        return sSignStatCd;
    }

    /**
     * @param sSignStatCd the sSignStatCd to set
     */
    public void setsSignStatCd(String sSignStatCd) {
        this.sSignStatCd = sSignStatCd;
    }

    /**
     * @return the sSignRsltCd
     */
    public String getsSignRsltCd() {
        return sSignRsltCd;
    }

    /**
     * @param sSignRsltCd the sSignRsltCd to set
     */
    public void setsSignRsltCd(String sSignRsltCd) {
        this.sSignRsltCd = sSignRsltCd;
    }

    /**
     * @return the sStartReqDt
     */
    public Date getsStartReqDt() {
        return sStartReqDt;
    }

    /**
     * @param sStartReqDt the sStartReqDt to set
     */
    public void setsStartReqDt(Date sStartReqDt) {
        this.sStartReqDt = sStartReqDt;
    }

    /**
     * @return the sEndReqDt
     */
    public Date getsEndReqDt() {
        return sEndReqDt;
    }

    /**
     * @param sEndReqDt the sEndReqDt to set
     */
    public void setsEndReqDt(Date sEndReqDt) {
        this.sEndReqDt = sEndReqDt;
    }

    /**
     * @return the sStartSignEndDt
     */
    public Date getsStartSignEndDt() {
        return sStartSignEndDt;
    }

    /**
     * @param sStartSignEndDt the sStartSignEndDt to set
     */
    public void setsStartSignEndDt(Date sStartSignEndDt) {
        this.sStartSignEndDt = sStartSignEndDt;
    }

    /**
     * @return the sEndSignEndDt
     */
    public Date getsEndSignEndDt() {
        return sEndSignEndDt;
    }

    /**
     * @param sEndSignEndDt the sEndSignEndDt to set
     */
    public void setsEndSignEndDt(Date sEndSignEndDt) {
        this.sEndSignEndDt = sEndSignEndDt;
    }

    /**
     * @return the sTempSaveYn
     */
    public String getsTempSaveYn() {
        return sTempSaveYn;
    }

    /**
     * @param sTempSaveYn the sTempSaveYn to set
     */
    public void setsTempSaveYn(String sTempSaveYn) {
        this.sTempSaveYn = sTempSaveYn;
    }
}