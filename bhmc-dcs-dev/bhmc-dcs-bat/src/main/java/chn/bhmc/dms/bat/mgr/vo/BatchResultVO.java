package chn.bhmc.dms.bat.mgr.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchResultVO.java
 * @Description : 배치결과 VO
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
public class BatchResultVO  extends BaseVO {

    /**
     * 배치실행 성공
     */
    public static final String BATCH_STATUS_SUCCESS = "S";

    /**
     * 배치실행 실패
     */
    public static final String BATCH_STATUS_FAIL = "F";

    /**
     * 배치실행중
     */
    public static final String BATCH_STATUS_PROCESSING = "R";

	private static final long serialVersionUID = -4116058772994825097L;

	/**
	 * 배치결과ID
	 */
	private String batRsltId;

	/**
	 * 배치작업ID
	 */
	private String batOperId;

	/**
	 * 배치스케쥴ID
	 */
	private String batScheduleId;

	/**
	 * 배치파라메터
	 */
	private String batParamVal;

	/**
	 * 배치수행상태
	 */
	private String batOperRsltCd;

	/**
	 * 에러메세지
	 */
	private String errMesgTxt;

	/**
	 * 배치실행 시작시간
	 */
	private String batStartTm;

	/**
	 * 배치실행 종료시간
	 */
	private String batEndTm;


	/**
     * @return the batRsltId
     */
    public String getBatRsltId() {
        return batRsltId;
    }
    /**
     * @param batRsltId the batRsltId to set
     */
    public void setBatRsltId(String batRsltId) {
        this.batRsltId = batRsltId;
    }
    /**
     * @return the batOperId
     */
    public String getBatOperId() {
        return batOperId;
    }
    /**
     * @param batOperId the batOperId to set
     */
    public void setBatOperId(String batOperId) {
        this.batOperId = batOperId;
    }
    /**
     * @return the batScheduleId
     */
    public String getBatScheduleId() {
        return batScheduleId;
    }
    /**
     * @param batScheduleId the batScheduleId to set
     */
    public void setBatScheduleId(String batScheduleId) {
        this.batScheduleId = batScheduleId;
    }
    /**
     * @return the batParamVal
     */
    public String getBatParamVal() {
        return batParamVal;
    }
    /**
     * @param batParamVal the batParamVal to set
     */
    public void setBatParamVal(String batParamVal) {
        this.batParamVal = batParamVal;
    }
    /**
     * @return the batOperRsltCd
     */
    public String getBatOperRsltCd() {
        return batOperRsltCd;
    }
    /**
     * @param batOperRsltCd the batOperRsltCd to set
     */
    public void setBatOperRsltCd(String batOperRsltCd) {
        this.batOperRsltCd = batOperRsltCd;
    }
    /**
     * @return the errMesgTxt
     */
    public String getErrMesgTxt() {
        return errMesgTxt;
    }
    /**
     * @param errMesgTxt the errMesgTxt to set
     */
    public void setErrMesgTxt(String errMesgTxt) {
        this.errMesgTxt = errMesgTxt;
    }
    /**
     * @return the batStartTm
     */
    public String getBatStartTm() {
        return batStartTm;
    }
    /**
     * @param batStartTm the batStartTm to set
     */
    public void setBatStartTm(String batStartTm) {
        this.batStartTm = batStartTm;
    }
    /**
     * @return the batEndTm
     */
    public String getBatEndTm() {
        return batEndTm;
    }
    /**
     * @param batEndTm the batEndTm to set
     */
    public void setBatEndTm(String batEndTm) {
        this.batEndTm = batEndTm;
    }

    public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
