package chn.bhmc.dms.crm.cfw.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 내방 예약 조회 SearchVO
 *
 * @ClassName   : VisitCustomerSearchVO.java
 * @Description : VisitCustomerSearchVO Class
 * @author in moon lee
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     in moon lee     최초 생성
 * </pre>
 */

public class VisitCustomerSearchVO extends SearchVO {

	/**
	 *
	 */
	private static final long serialVersionUID = 1707229461890670218L;

	private String sVsitNo;                        // 내방번호 [내방리스트-상세조회]
	private String sCustNm;                        // 고객명 [내방리스트]
	private String sCustNo;                        // 고객번호 [내방리스트-내방이력]
	private String sHpNo;                          // 연락처 [내방리스트]
	private String sScId;                          // 영업자 아이디  [내방리스트]
	private String sVsitStatCd;                    // 내방상태 코드  [내방리스트]
	private String sVsitStat;                      // 방문 상태 ( N : 예약/방문 인것)
	private String sVsitListTp;                      // 전시장유동량관리에서 담당고문이 있는경우만  조회.

    private String sDlrCd;                          // 딜러코드
    private String sPltCd;                          // 사업장코드

	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sStartDt;                     // 내방 예약 시작 일자  [내방스케줄러]
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sEndDt;                       // 내방 예약 종료 일자  [내방스케줄러]

	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sStartVsitDt;                     // 내방 시작 일자    [내방리스트]
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sEndVsitDt;                       // 내방 종료 일자    [내방리스트]

	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sStartRegDt;                     // 등록일 ( 시작 )[내방리스트]
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sEndRegDt;                       // 등록일 ( 종료 ) [내방리스트]
    /**
     * @return the sVsitNo
     */
    public String getsVsitNo() {
        return sVsitNo;
    }
    /**
     * @param sVsitNo the sVsitNo to set
     */
    public void setsVsitNo(String sVsitNo) {
        this.sVsitNo = sVsitNo;
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
     * @return the sVsitStatCd
     */
    public String getsVsitStatCd() {
        return sVsitStatCd;
    }
    /**
     * @param sVsitStatCd the sVsitStatCd to set
     */
    public void setsVsitStatCd(String sVsitStatCd) {
        this.sVsitStatCd = sVsitStatCd;
    }
    /**
     * @return the sVsitStat
     */
    public String getsVsitStat() {
        return sVsitStat;
    }
    /**
     * @param sVsitStat the sVsitStat to set
     */
    public void setsVsitStat(String sVsitStat) {
        this.sVsitStat = sVsitStat;
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
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }
    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
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
     * @return the sStartVsitDt
     */
    public Date getsStartVsitDt() {
        return sStartVsitDt;
    }
    /**
     * @param sStartVsitDt the sStartVsitDt to set
     */
    public void setsStartVsitDt(Date sStartVsitDt) {
        this.sStartVsitDt = sStartVsitDt;
    }
    /**
     * @return the sEndVsitDt
     */
    public Date getsEndVsitDt() {
        return sEndVsitDt;
    }
    /**
     * @param sEndVsitDt the sEndVsitDt to set
     */
    public void setsEndVsitDt(Date sEndVsitDt) {
        this.sEndVsitDt = sEndVsitDt;
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
     * @return the sVsitListTp
     */
    public String getsVsitListTp() {
        return sVsitListTp;
    }
    /**
     * @param sVsitListTp the sVsitListTp to set
     */
    public void setsVsitListTp(String sVsitListTp) {
        this.sVsitListTp = sVsitListTp;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "VisitCustomerSearchVO [sVsitNo=" + sVsitNo + ", sCustNm=" + sCustNm + ", sCustNo=" + sCustNo
                + ", sHpNo=" + sHpNo + ", sScId=" + sScId + ", sVsitStatCd=" + sVsitStatCd + ", sVsitStat=" + sVsitStat
                + ", sDlrCd=" + sDlrCd + ", sPltCd=" + sPltCd + ", sStartDt=" + sStartDt + ", sEndDt=" + sEndDt
                + ", sStartVsitDt=" + sStartVsitDt + ", sEndVsitDt=" + sEndVsitDt + ", sStartRegDt=" + sStartRegDt
                + ", sEndRegDt=" + sEndRegDt + "]";
    }


}