package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 국가코드 조회 SearchVO
 *
 * @ClassName   : TestDriveResvSearchVO.java
 * @Description : TestDriveResvSearchVO Class
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

public class TestDriveResvSearchVO extends SearchVO {

	/**
	 *
	 */
	private static final long serialVersionUID = 1707229461890670218L;

    private  String           sDlrCd;                  // 딜러코드
    private  String           sPltCd;                  // 사업장코드

	private int sTdrvSeq;              // 시승번호 [ 시승예약, 시승관리 ]
	private String sCustNo;            // 고객번호 [내방리스트 - 시승이력]
	private String sScId;              // 영업자 아이디
	private String sTdrvStatCd;        // 방문 상태 코드
	private String sTdrvStat;          // 방문 상태 ( Y : 전체, N : 예약/방문 인것)
	private String sModelCd;           // 시승모델 [ 시승관리 ]
	private String sTdrvClineCd;        // 시승노선번호 [ 시승노선 ]

	private String sTdrvVinNo;         // 시승차대번호

	private String sCust;                           // 고객정보 like 검색 [시승관리]

	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sStartDt;             // 예약 시작 일자
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date sEndDt;               // 예약 종료 일자

	private String sCustStsfStatCd;   // 시승관리 만족도 조사 완성 여부 (CRM410)

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
     * @return the sTdrvSeq
     */
    public int getsTdrvSeq() {
        return sTdrvSeq;
    }

    /**
     * @param sTdrvSeq the sTdrvSeq to set
     */
    public void setsTdrvSeq(int sTdrvSeq) {
        this.sTdrvSeq = sTdrvSeq;
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
     * @return the sTdrvStatCd
     */
    public String getsTdrvStatCd() {
        return sTdrvStatCd;
    }

    /**
     * @param sTdrvStatCd the sTdrvStatCd to set
     */
    public void setsTdrvStatCd(String sTdrvStatCd) {
        this.sTdrvStatCd = sTdrvStatCd;
    }

    /**
     * @return the sTdrvStat
     */
    public String getsTdrvStat() {
        return sTdrvStat;
    }

    /**
     * @param sTdrvStat the sTdrvStat to set
     */
    public void setsTdrvStat(String sTdrvStat) {
        this.sTdrvStat = sTdrvStat;
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
     * @return the sTdrvClineCd
     */
    public String getsTdrvClineCd() {
        return sTdrvClineCd;
    }

    /**
     * @param sTdrvClineCd the sTdrvClineCd to set
     */
    public void setsTdrvClineCd(String sTdrvClineCd) {
        this.sTdrvClineCd = sTdrvClineCd;
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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "TestDriveResvSearchVO [sDlrCd=" + sDlrCd + ", sPltCd=" + sPltCd + ", sTdrvSeq=" + sTdrvSeq
                + ", sCustNo=" + sCustNo + ", sScId=" + sScId + ", sTdrvStatCd=" + sTdrvStatCd + ", sTdrvStat="
                + sTdrvStat + ", sModelCd=" + sModelCd + ", sTdrvClineCd=" + sTdrvClineCd + ", sCust=" + sCust
                + ", sStartDt=" + sStartDt + ", sEndDt=" + sEndDt + "]";
    }

    /**
     * @return the sCustStsfStatCd
     */
    public String getsCustStsfStatCd() {
        return sCustStsfStatCd;
    }

    /**
     * @param sCustStsfStatCd the sCustStsfStatCd to set
     */
    public void setsCustStsfStatCd(String sCustStsfStatCd) {
        this.sCustStsfStatCd = sCustStsfStatCd;
    }

    /**
     * @return the sTdrvVinNo
     */
    public String getsTdrvVinNo() {
        return sTdrvVinNo;
    }

    /**
     * @param sTdrvVinNo the sTdrvVinNo to set
     */
    public void setsTdrvVinNo(String sTdrvVinNo) {
        this.sTdrvVinNo = sTdrvVinNo;
    }
}
