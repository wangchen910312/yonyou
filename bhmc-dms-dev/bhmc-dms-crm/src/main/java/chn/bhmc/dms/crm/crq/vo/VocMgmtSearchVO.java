package chn.bhmc.dms.crm.crq.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 마케팅 캠패인 조회 SearchVO
 *
 * @ClassName   : VocMgmtSearchVO.java
 * @Description : VocMgmtSearchVO Class
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

public class VocMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6891084794312677186L;

    private String sDlrCd;        // 딜러코드
    private String langCd;        // 언어코드
    private String cmmCd;         // 유형코드
    private String sCmmGrpCd;     // SUB 유형코드
    private String sMngScId;      // 처리담당자
    private String sCust;         // 고객정보 like 검색 [VOC마스터 조회]
    private String sBhmcVocNo;    // sieble voc no
    private String sVocSubCd;     // VOC SUB CD ( 서비스에서 사용  )
    private int sVocActiveNo;
    private String sPprocIdNm;     // 처리인 이름 검색 조건
    private String sBhmcYn;        // 서비스요청출처

    /**
    * VOC번호
    **/
    private  String                 sVocNo;
    
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEvalAllocDtStart;
    
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEvalAllocDtEnd;

    public Date getsEvalAllocDtStart() {
		return sEvalAllocDtStart;
	}

	public void setsEvalAllocDtStart(Date sEvalAllocDtStart) {
		this.sEvalAllocDtStart = sEvalAllocDtStart;
	}

	public Date getsEvalAllocDtEnd() {
		return sEvalAllocDtEnd;
	}

	public void setsEvalAllocDtEnd(Date sEvalAllocDtEnd) {
		this.sEvalAllocDtEnd = sEvalAllocDtEnd;
	}

	/**
    * 등록시작일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sRegStartDt;

    /**
    * 등록종료일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sRegEndDt;

    /**
     * VOC유형
     **/
     private  String                 sVocTpCd;

     /**
     * VOC상태
     **/
     private  String                 sVocStatCd;

     /**
     * 불만원인
     **/
     private  String                 sCmplCauCd;

     /**
      * 처리담당부서
      **/
     private  String                 sPprocDeptNm;

     /**
      * 처리담당부서
      **/
     private  String                 sAssignYn;

     private String                  sDateTp;            // M : 월 / D : 일
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date                   sRegDt;             // 등록시작일자


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
     * @return the sVocNo
     */
    public String getsVocNo() {
        return sVocNo;
    }

    /**
     * @param sVocNo the sVocNo to set
     */
    public void setsVocNo(String sVocNo) {
        this.sVocNo = sVocNo;
    }

    /**
     * @return the sRegStartDt
     */
    public Date getsRegStartDt() {
        return sRegStartDt;
    }

    /**
     * @param sRegStartDt the sRegStartDt to set
     */
    public void setsRegStartDt(Date sRegStartDt) {
        this.sRegStartDt = sRegStartDt;
    }

    /**
     * @return the sRegEndDt
     */
    public Date getsRegEndDt() {
        return sRegEndDt;
    }

    /**
     * @param sRegEndDt the sRegEndDt to set
     */
    public void setsRegEndDt(Date sRegEndDt) {
        this.sRegEndDt = sRegEndDt;
    }

    /**
     * @return the sVocTpCd
     */
    public String getsVocTpCd() {
        return sVocTpCd;
    }

    /**
     * @param sVocTpCd the sVocTpCd to set
     */
    public void setsVocTpCd(String sVocTpCd) {
        this.sVocTpCd = sVocTpCd;
    }

    /**
     * @return the sVocStatCd
     */
    public String getsVocStatCd() {
        return sVocStatCd;
    }

    /**
     * @param sVocStatCd the sVocStatCd to set
     */
    public void setsVocStatCd(String sVocStatCd) {
        this.sVocStatCd = sVocStatCd;
    }

    /**
     * @return the sCmplCauCd
     */
    public String getsCmplCauCd() {
        return sCmplCauCd;
    }

    /**
     * @param sCmplCauCd the sCmplCauCd to set
     */
    public void setsCmplCauCd(String sCmplCauCd) {
        this.sCmplCauCd = sCmplCauCd;
    }

    /**
     * @return the sPprocDeptNm
     */
    public String getsPprocDeptNm() {
        return sPprocDeptNm;
    }

    /**
     * @param sPprocDeptNm the sPprocDeptNm to set
     */
    public void setsPprocDeptNm(String sPprocDeptNm) {
        this.sPprocDeptNm = sPprocDeptNm;
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
     * @return the sCmmGrpCd
     */
    public String getsCmmGrpCd() {
        return sCmmGrpCd;
    }

    /**
     * @param sCmmGrpCd the sCmmGrpCd to set
     */
    public void setsCmmGrpCd(String sCmmGrpCd) {
        this.sCmmGrpCd = sCmmGrpCd;
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
     * @return the sBhmcVocNo
     */
    public String getsBhmcVocNo() {
        return sBhmcVocNo;
    }

    /**
     * @param sBhmcVocNo the sBhmcVocNo to set
     */
    public void setsBhmcVocNo(String sBhmcVocNo) {
        this.sBhmcVocNo = sBhmcVocNo;
    }

    /**
     * @return the sVocActiveNo
     */
    public int getsVocActiveNo() {
        return sVocActiveNo;
    }

    /**
     * @param sVocActiveNo the sVocActiveNo to set
     */
    public void setsVocActiveNo(int sVocActiveNo) {
        this.sVocActiveNo = sVocActiveNo;
    }

    /**
     * @return the sVocSubCd
     */
    public String getsVocSubCd() {
        return sVocSubCd;
    }

    /**
     * @param sVocSubCd the sVocSubCd to set
     */
    public void setsVocSubCd(String sVocSubCd) {
        this.sVocSubCd = sVocSubCd;
    }

    /**
     * @return the sPprocIdNm
     */
    public String getsPprocIdNm() {
        return sPprocIdNm;
    }

    /**
     * @param sPprocIdNm the sPprocIdNm to set
     */
    public void setsPprocIdNm(String sPprocIdNm) {
        this.sPprocIdNm = sPprocIdNm;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "VocMgmtSearchVO [sDlrCd=" + sDlrCd + ", langCd=" + langCd + ", cmmCd=" + cmmCd + ", sCmmGrpCd="
                + sCmmGrpCd + ", sMngScId=" + sMngScId + ", sCust=" + sCust + ", sBhmcVocNo=" + sBhmcVocNo
                + ", sVocSubCd=" + sVocSubCd + ", sVocActiveNo=" + sVocActiveNo + ", sPprocIdNm=" + sPprocIdNm
                + ", sVocNo=" + sVocNo + ", sRegStartDt=" + sRegStartDt + ", sRegEndDt=" + sRegEndDt + ", sVocTpCd="
                + sVocTpCd + ", sVocStatCd=" + sVocStatCd + ", sCmplCauCd=" + sCmplCauCd + ", sPprocDeptNm="
                + sPprocDeptNm + ", sAssignYn=" + sAssignYn + "sEvalAllocDtStart="
                        + sEvalAllocDtStart + ", sEvalAllocDtEnd=" + sEvalAllocDtEnd + "]";
    }

    /**
     * @return the sDateTp
     */
    public String getsDateTp() {
        return sDateTp;
    }

    /**
     * @param sDateTp the sDateTp to set
     */
    public void setsDateTp(String sDateTp) {
        this.sDateTp = sDateTp;
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



}