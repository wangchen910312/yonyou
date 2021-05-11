package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 국가코드 조회 SearchVO
 *
 * @ClassName   : SalesOpptMgmtSearchVO.java
 * @Description : SalesOpptMgmtSearchVO.Class
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07.     in moon lee     최초 생성
 * </pre>
 */

public class SalesOpptMgmtSearchVO extends SearchVO {

    /**
     *
     */
    private static final long serialVersionUID = 1707229461890670218L;

    private  String           sDlrCd;                  // 딜러코드
    private  String           sSaleOpptNo;            // 판매기회일련번호
    private  String           sCustNm;                 // 고객명 [판매기회관리]
    private  String           sCustNo;                 // 고객명 [판매기회관리, 내방리스트-판매기회]
    private  String           sScId;                   // SCID [판매기회관리]
    private  String           sSaleOpptStepCd;         // 판매기회단계코드 [판매기회관리]
    private  String           sTrsfStatCd;             // 전출상태코드 [판매기회관리]

    private  String           sIntrCarLine;            // 관심차종
    private  String           sIntrModel;              // 관심모델

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             sStartRegDt;                // 등록 시작일 [판매기회관리]

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             sEndRegDt;                  // 등록 종료일 [판매기회관리]

    private  String sDupConfigDay;                       // 판매기회 중복 기간 설정값[판매기회등록]

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
     * @return the sSaleOpptNo
     */
    public String getsSaleOpptNo() {
        return sSaleOpptNo;
    }

    /**
     * @param sSaleOpptNo the sSaleOpptNo to set
     */
    public void setsSaleOpptNo(String sSaleOpptNo) {
        this.sSaleOpptNo = sSaleOpptNo;
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
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sScId
     */
    public String getsScId() {
        return sScId;
    }

    /**
     * @param sScId the sScId to set
     */
    public void setsScId(String sScId) {
        this.sScId = sScId;
    }

    /**
     * @return the sSaleOpptStepCd
     */
    public String getsSaleOpptStepCd() {
        return sSaleOpptStepCd;
    }

    /**
     * @param sSaleOpptStepCd the sSaleOpptStepCd to set
     */
    public void setsSaleOpptStepCd(String sSaleOpptStepCd) {
        this.sSaleOpptStepCd = sSaleOpptStepCd;
    }

    /**
     * @return the sTrsfStatCd
     */
    public String getsTrsfStatCd() {
        return sTrsfStatCd;
    }

    /**
     * @param sTrsfStatCd the sTrsfStatCd to set
     */
    public void setsTrsfStatCd(String sTrsfStatCd) {
        this.sTrsfStatCd = sTrsfStatCd;
    }

    /**
     * @return the sIntrCarLine
     */
    public String getsIntrCarLine() {
        return sIntrCarLine;
    }

    /**
     * @param sIntrCarLine the sIntrCarLine to set
     */
    public void setsIntrCarLine(String sIntrCarLine) {
        this.sIntrCarLine = sIntrCarLine;
    }

    /**
     * @return the sIntrModel
     */
    public String getsIntrModel() {
        return sIntrModel;
    }

    /**
     * @param sIntrModel the sIntrModel to set
     */
    public void setsIntrModel(String sIntrModel) {
        this.sIntrModel = sIntrModel;
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
     * @return the sDupConfigDay
     */
    public String getsDupConfigDay() {
        return sDupConfigDay;
    }

    /**
     * @param sDupConfigDay the sDupConfigDay to set
     */
    public void setsDupConfigDay(String sDupConfigDay) {
        this.sDupConfigDay = sDupConfigDay;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SalesOpptMgmtSearchVO [sDlrCd=" + sDlrCd + ", sSaleOpptNo=" + sSaleOpptNo + ", sCustNm=" + sCustNm
                + ", sCustNo=" + sCustNo + ", sScId=" + sScId + ", sSaleOpptStepCd=" + sSaleOpptStepCd
                + ", sTrsfStatCd=" + sTrsfStatCd + ", sIntrCarLine=" + sIntrCarLine + ", sIntrModel=" + sIntrModel
                + ", sStartRegDt=" + sStartRegDt + ", sEndRegDt=" + sEndRegDt + ", sDupConfigDay=" + sDupConfigDay
                + "]";
    }



}