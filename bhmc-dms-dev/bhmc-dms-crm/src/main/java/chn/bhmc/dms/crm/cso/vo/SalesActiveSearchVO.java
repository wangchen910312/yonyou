package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 영업활동 조회 SearchVO
 *
 * @ClassName   : SalesActiveSearchVO.java
 * @Description : SalesActiveSearchVO Class
 * @author in moon lee
 * @since 2016.04.27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.27.     in moon lee     최초 생성
 * </pre>
 */

public class SalesActiveSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -870562470961786110L;

    private  String              sDlrCd;                // 딜러코드
    private  String              sSalesActiveNo;        // 영업활동번호

    private  String              sScId;                 // 판매고문         [ 영업활동 시행내역 ]
    private  String              sCommMthCd;            // 연락방식         [ 영업활동 시행내역 ]
    private  String              sSalesActiveTpCd;      // 영업활동유형   [ 영업활동 시행내역 ]
    private  String              sSalesActiveStatCd;    // 영업활동상태   [ 영업활동 시행내역 ]
    private  String              sCustNm;               // 고객명             [ 영업활동 시행내역 ]
    @JsonDeserialize(using=JsonDateDeserializer.class)  // 시작일자          [ 영업활동 시행내역 ]
    private  Date                sStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)  // 종료일자
    private  Date                sEndDt;

    private  String              sSaleOpptNo;           // 판매기회번호

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
     * @return the sSalesActiveNo
     */
    public String getsSalesActiveNo() {
        return sSalesActiveNo;
    }

    /**
     * @param sSalesActiveNo the sSalesActiveNo to set
     */
    public void setsSalesActiveNo(String sSalesActiveNo) {
        this.sSalesActiveNo = sSalesActiveNo;
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
     * @return the sCommMthCd
     */
    public String getsCommMthCd() {
        return sCommMthCd;
    }

    /**
     * @param sCommMthCd the sCommMthCd to set
     */
    public void setsCommMthCd(String sCommMthCd) {
        this.sCommMthCd = sCommMthCd;
    }

    /**
     * @return the sSalesActiveTpCd
     */
    public String getsSalesActiveTpCd() {
        return sSalesActiveTpCd;
    }

    /**
     * @param sSalesActiveTpCd the sSalesActiveTpCd to set
     */
    public void setsSalesActiveTpCd(String sSalesActiveTpCd) {
        this.sSalesActiveTpCd = sSalesActiveTpCd;
    }

    /**
     * @return the sSalesActiveStatCd
     */
    public String getsSalesActiveStatCd() {
        return sSalesActiveStatCd;
    }

    /**
     * @param sSalesActiveStatCd the sSalesActiveStatCd to set
     */
    public void setsSalesActiveStatCd(String sSalesActiveStatCd) {
        this.sSalesActiveStatCd = sSalesActiveStatCd;
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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SalesActiveSearchVO [sDlrCd=" + sDlrCd + ", sSalesActiveNo=" + sSalesActiveNo + ", sScId=" + sScId
                + ", sCommMthCd=" + sCommMthCd + ", sSalesActiveTpCd=" + sSalesActiveTpCd + ", sSalesActiveStatCd="
                + sSalesActiveStatCd + ", sCustNm=" + sCustNm + ", sStartDt=" + sStartDt + ", sEndDt=" + sEndDt
                + ", sSaleOpptNo=" + sSaleOpptNo + "]";
    }

}