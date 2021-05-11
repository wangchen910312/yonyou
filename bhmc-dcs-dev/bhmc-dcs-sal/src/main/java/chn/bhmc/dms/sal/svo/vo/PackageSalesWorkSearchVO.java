package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageSalesWorkSearchVO
 * @Description : 집단판매업무신청 목록 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.16      Kim Jin Suk      최초 생성
 * </pre>
 */

public class PackageSalesWorkSearchVO extends SearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1859123948331287366L;

    private String sDistCd;
    private String sDiviCd;
    private String sOffCd;
    private String sUsrEvalGrade;
    private String sEvalRsltYn;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 상태
     */
    private String sApproveCd;

    /**
     * 작성일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqEndDt;

    /**
     * 차종코드
     */
    private String sCarlineCd;

    /**
     * 모델코드
     */
    private String sModelCd;

    /**
     * 사용자 ID
     */
    private String sUsrId;

    /**
     * 일련번호
     */
    private String sReqSeq;
    private String sReqNo;


    private  String          sApporveDlrCd;       // 법인 딜러코드
    private  String          sApporveUsrId;       // 법인 usr id

    private  String          sWrkDstinCd; //심사 권한여부


    /**
     * @return the sApporveDlrCd
     */
    public String getsApporveDlrCd() {
        return sApporveDlrCd;
    }

    /**
     * @param sApporveDlrCd the sApporveDlrCd to set
     */
    public void setsApporveDlrCd(String sApporveDlrCd) {
        this.sApporveDlrCd = sApporveDlrCd;
    }

    /**
     * @return the sApporveUsrId
     */
    public String getsApporveUsrId() {
        return sApporveUsrId;
    }

    /**
     * @param sApporveUsrId the sApporveUsrId to set
     */
    public void setsApporveUsrId(String sApporveUsrId) {
        this.sApporveUsrId = sApporveUsrId;
    }

    /**
     * @return the sWrkDstinCd
     */
    public String getsWrkDstinCd() {
        return sWrkDstinCd;
    }

    /**
     * @param sWrkDstinCd the sWrkDstinCd to set
     */
    public void setsWrkDstinCd(String sWrkDstinCd) {
        this.sWrkDstinCd = sWrkDstinCd;
    }

    /**
     * @return the sDistCd
     */
    public String getsDistCd() {
        return sDistCd;
    }

    /**
     * @param sDistCd the sDistCd to set
     */
    public void setsDistCd(String sDistCd) {
        this.sDistCd = sDistCd;
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
     * @return the sApproveCd
     */
    public String getsApproveCd() {
        return sApproveCd;
    }

    /**
     * @param sApproveCd the sApproveCd to set
     */
    public void setsApproveCd(String sApproveCd) {
        this.sApproveCd = sApproveCd;
    }

    /**
     * @return the sReqStartDt
     */
    public Date getsReqStartDt() {
        return sReqStartDt;
    }

    /**
     * @param sReqStartDt the sReqStartDt to set
     */
    public void setsReqStartDt(Date sReqStartDt) {
        this.sReqStartDt = sReqStartDt;
    }

    /**
     * @return the sReqEndDt
     */
    public Date getsReqEndDt() {
        return sReqEndDt;
    }

    /**
     * @param sReqEndDt the sReqEndDt to set
     */
    public void setsReqEndDt(Date sReqEndDt) {
        this.sReqEndDt = sReqEndDt;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }

    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }

    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }

    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }

    /**
     * @return the sReqSeq
     */
    public String getsReqSeq() {
        return sReqSeq;
    }

    /**
     * @param sReqSeq the sReqSeq to set
     */
    public void setsReqSeq(String sReqSeq) {
        this.sReqSeq = sReqSeq;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the sDiviCd
     */
    public String getsDiviCd() {
        return sDiviCd;
    }

    /**
     * @return the sOffCd
     */
    public String getsOffCd() {
        return sOffCd;
    }

    /**
     * @param sDiviCd the sDiviCd to set
     */
    public void setsDiviCd(String sDiviCd) {
        this.sDiviCd = sDiviCd;
    }

    /**
     * @param sOffCd the sOffCd to set
     */
    public void setsOffCd(String sOffCd) {
        this.sOffCd = sOffCd;
    }

    /**
     * @return the sUsrEvalGrade
     */
    public String getsUsrEvalGrade() {
        return sUsrEvalGrade;
    }

    /**
     * @param sUsrEvalGrade the sUsrEvalGrade to set
     */
    public void setsUsrEvalGrade(String sUsrEvalGrade) {
        this.sUsrEvalGrade = sUsrEvalGrade;
    }

    /**
     * @return the sEvalRsltYn
     */
    public String getsEvalRsltYn() {
        return sEvalRsltYn;
    }

    /**
     * @param sEvalRsltYn the sEvalRsltYn to set
     */
    public void setsEvalRsltYn(String sEvalRsltYn) {
        this.sEvalRsltYn = sEvalRsltYn;
    }

    /**
     * @return the sReqNo
     */
    public String getsReqNo() {
        return sReqNo;
    }

    /**
     * @param sReqNo the sReqNo to set
     */
    public void setsReqNo(String sReqNo) {
        this.sReqNo = sReqNo;
    }

}
