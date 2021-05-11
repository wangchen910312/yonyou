package chn.bhmc.dms.crm.cal.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 콜센터실행 관리 조회 SearchVO
 *
 * @ClassName   : CallCenterActionSearchVO.java
 * @Description : CallCenterActionSearchVO Class
 * @author in moon lee
 * @since 2016.05.17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.17.     in moon lee     최초 생성
 * </pre>
 */

public class CallCenterActionSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1103061946253859410L;

    private  String              sDlrCd;            // 딜러코드
    private  String              sBizCd;            // 업무코드(CRM361      [콜센터(OB)배정]
    private  String              sCustNm;           // 고객명
    private  String              sHpNo;             // 휴대전화
    private  String              sTelNo;            // 집전화
    private  String              sRefTableNm;       // 참조테이블
    private  String              sRefKeyNm;         // 참조키
    private  String              sCallSeq;          // 콜번호
    private  String              sCallPrsnId;       // 콜담당자ID           [콜센터(OB)배정]

    private  String              sStsfIvstNm;      // 만족도 조사 명 [콜센터 실행 - 만족도]
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartStftDt;                     // 만족도조사 종료 시작일 [콜센터 실행 - 만족도]
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndStftDt;                       // 만족도조사 종료 종료일 [콜센터 실행 - 만족도]

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartRegDt;                     // 콜센터 등록 시작일 [콜센터(OB)배정]
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndRegDt;                       // 콜센터 등록 종료일 [콜센터(OB)배정]

    private String sAssignYn;                     // 배정여부 [콜센터(OB)배정]

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
     * @return the sBizCd
     */
    public String getsBizCd() {
        return sBizCd;
    }

    /**
     * @param sBizCd the sBizCd to set
     */
    public void setsBizCd(String sBizCd) {
        this.sBizCd = sBizCd;
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
     * @return the sCallSeq
     */
    public String getsCallSeq() {
        return sCallSeq;
    }

    /**
     * @param sCallSeq the sCallSeq to set
     */
    public void setsCallSeq(String sCallSeq) {
        this.sCallSeq = sCallSeq;
    }

    /**
     * @return the sCallPrsnId
     */
    public String getsCallPrsnId() {
        return sCallPrsnId;
    }

    /**
     * @param sCallPrsnId the sCallPrsnId to set
     */
    public void setsCallPrsnId(String sCallPrsnId) {
        this.sCallPrsnId = sCallPrsnId;
    }

    /**
     * @return the sStartStftDt
     */
    public Date getsStartStftDt() {
        return sStartStftDt;
    }

    /**
     * @param sStartStftDt the sStartStftDt to set
     */
    public void setsStartStftDt(Date sStartStftDt) {
        this.sStartStftDt = sStartStftDt;
    }

    /**
     * @return the sEndStftDt
     */
    public Date getsEndStftDt() {
        return sEndStftDt;
    }

    /**
     * @param sEndStftDt the sEndStftDt to set
     */
    public void setsEndStftDt(Date sEndStftDt) {
        this.sEndStftDt = sEndStftDt;
    }

    /**
     * @return the sStartRegDt
     */
    public Date getsStartRegDt() {
        return sStartRegDt;
    }

    /**
     * @param sStartRegDt the sStartRegDt to set
     */
    public void setsStartRegDt(Date sStartRegDt) {
        this.sStartRegDt = sStartRegDt;
    }

    /**
     * @return the sEndRegDt
     */
    public Date getsEndRegDt() {
        return sEndRegDt;
    }

    /**
     * @param sEndRegDt the sEndRegDt to set
     */
    public void setsEndRegDt(Date sEndRegDt) {
        this.sEndRegDt = sEndRegDt;
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
     * @return the sStsfIvstNm
     */
    public String getsStsfIvstNm() {
        return sStsfIvstNm;
    }

    /**
     * @param sStsfIvstNm the sStsfIvstNm to set
     */
    public void setsStsfIvstNm(String sStsfIvstNm) {
        this.sStsfIvstNm = sStsfIvstNm;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CallCenterActionSearchVO [sDlrCd=" + sDlrCd + ", sBizCd=" + sBizCd + ", sCustNm=" + sCustNm
                + ", sHpNo=" + sHpNo + ", sTelNo=" + sTelNo + ", sRefTableNm=" + sRefTableNm + ", sRefKeyNm="
                + sRefKeyNm + ", sCallSeq=" + sCallSeq + ", sCallPrsnId=" + sCallPrsnId + ", sStsfIvstNm="
                + sStsfIvstNm + ", sStartStftDt=" + sStartStftDt + ", sEndStftDt=" + sEndStftDt + ", sStartRegDt="
                + sStartRegDt + ", sEndRegDt=" + sEndRegDt + ", sAssignYn=" + sAssignYn + "]";
    }

}