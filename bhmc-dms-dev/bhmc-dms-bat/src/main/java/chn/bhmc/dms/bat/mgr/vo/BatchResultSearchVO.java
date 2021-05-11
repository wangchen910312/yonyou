package chn.bhmc.dms.bat.mgr.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchResultSearchVO.java
 * @Description : 배치결과 조회조건 SearchVO
 * @author Kang Seok Han
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Kang Seok Han     최초 생성
 * </pre>
 */
public class BatchResultSearchVO extends SearchVO {


	private static final long serialVersionUID = 2667005210302919627L;

	/**
	 * 배치작업ID
	 */
	private String sBatOperId;

	/**
	 * 배치스케쥴ID
	 */
	private String sBatScheduleId;

	/**
	 * 배치수행상태
	 */
	private String sBatOperRsltCd;

	/**
	 * 에러메세지
	 */
	private String sErrMesgTxt;

	/**
	 * 배치시작시간
	 */
	private String sStartTm;

	/**
	 * 배치종료시간
	 */
	private String sEndTm;

    /**
     * @return the sBatOperId
     */
    public String getsBatOperId() {
        return sBatOperId;
    }

    /**
     * @param sBatOperId the sBatOperId to set
     */
    public void setsBatOperId(String sBatOperId) {
        this.sBatOperId = sBatOperId;
    }

    /**
     * @return the sBatScheduleId
     */
    public String getsBatScheduleId() {
        return sBatScheduleId;
    }

    /**
     * @param sBatScheduleId the sBatScheduleId to set
     */
    public void setsBatScheduleId(String sBatScheduleId) {
        this.sBatScheduleId = sBatScheduleId;
    }

    /**
     * @return the sBatOperRsltCd
     */
    public String getsBatOperRsltCd() {
        return sBatOperRsltCd;
    }

    /**
     * @param sBatOperRsltCd the sBatOperRsltCd to set
     */
    public void setsBatOperRsltCd(String sBatOperRsltCd) {
        this.sBatOperRsltCd = sBatOperRsltCd;
    }

    /**
     * @return the sErrMesgTxt
     */
    public String getsErrMesgTxt() {
        return sErrMesgTxt;
    }

    /**
     * @param sErrMesgTxt the sErrMesgTxt to set
     */
    public void setsErrMesgTxt(String sErrMesgTxt) {
        this.sErrMesgTxt = sErrMesgTxt;
    }

    /**
     * @return the sStartTm
     */
    public String getsStartTm() {
        return sStartTm;
    }

    /**
     * @param sStartTm the sStartTm to set
     */
    public void setsStartTm(String sStartTm) {
        this.sStartTm = sStartTm;
    }

    /**
     * @return the sEndTm
     */
    public String getsEndTm() {
        return sEndTm;
    }

    /**
     * @param sEndTm the sEndTm to set
     */
    public void setsEndTm(String sEndTm) {
        this.sEndTm = sEndTm;
    }



}
