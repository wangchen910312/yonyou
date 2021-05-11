package chn.bhmc.dms.bat.mgr.vo;

import javax.validation.constraints.Pattern;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchScheduleVO.java
 * @Description : 배치스케쥴 VO
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
public class BatchScheduleVO extends BaseVO {

	/**
	 *
	 */
	private static final long serialVersionUID = 3244037395135397036L;

	/**
     * 배치작업ID
     */
	@NotEmpty
    private String batOperId;

    /**
     * 배치작업명
     */
    private String batOperNm;

    /**
     * 배치유형
     * Shell : 쉘프로그램
     * QuartzJob : Quartz Job
     */
    private String batTp;

    /**
     * 배치프로그램
     */
    private String batPrgmNm;

    /**
     * 배치파라메터
     */
    private String batParamVal;

    /**
     * 활성여부
     */
    private String batEnabledYn;

	/**
	 * 배치스케쥴  ID
	 */
    @NotEmpty
    @Pattern(regexp="BTS-[0-9]{5,}")
	private String batScheduleId;

	/**
	 * 크라운 표현식
	 * <a href="http://www.quartz-scheduler.net/documentation/quartz-2.x/tutorial/crontriggers.html">http://www.quartz-scheduler.net/documentation/quartz-2.x/tutorial/crontriggers.html</a>
	 */
	@NotEmpty
	private String cronExpressionTxt;

	/**
	 * 타임존 ID
	 */
	@NotEmpty
	private String timezoneId;

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
     * @return the batOperNm
     */
    public String getBatOperNm() {
        return batOperNm;
    }

    /**
     * @param batOperNm the batOperNm to set
     */
    public void setBatOperNm(String batOperNm) {
        this.batOperNm = batOperNm;
    }

    /**
     * @return the batTp
     */
    public String getBatTp() {
        return batTp;
    }

    /**
     * @param batTp the batTp to set
     */
    public void setBatTp(String batTp) {
        this.batTp = batTp;
    }

    /**
     * @return the batPrgmNm
     */
    public String getBatPrgmNm() {
        return batPrgmNm;
    }

    /**
     * @param batPrgmNm the batPrgmNm to set
     */
    public void setBatPrgmNm(String batPrgmNm) {
        this.batPrgmNm = batPrgmNm;
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
     * @return the batEnabledYn
     */
    public String getBatEnabledYn() {
        return batEnabledYn;
    }

    /**
     * @param batEnabledYn the batEnabledYn to set
     */
    public void setBatEnabledYn(String batEnabledYn) {
        this.batEnabledYn = batEnabledYn;
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
     * @return the cronExpressionTxt
     */
    public String getCronExpressionTxt() {
        return cronExpressionTxt;
    }

    /**
     * @param cronExpressionTxt the cronExpressionTxt to set
     */
    public void setCronExpressionTxt(String cronExpressionTxt) {
        this.cronExpressionTxt = cronExpressionTxt;
    }

    /**
     * @return the timezoneId
     */
    public String getTimezoneId() {
        return timezoneId;
    }

    /**
     * @param timezoneId the timezoneId to set
     */
    public void setTimezoneId(String timezoneId) {
        this.timezoneId = timezoneId;
    }

    public String toString(){
        return ToStringBuilder.reflectionToString(this);
    }

}
