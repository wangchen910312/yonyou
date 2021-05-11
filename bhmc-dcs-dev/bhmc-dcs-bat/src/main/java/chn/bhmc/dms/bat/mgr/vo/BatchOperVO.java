package chn.bhmc.dms.bat.mgr.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchOperVO.java
 * @Description : 배치작업 VO
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
public class BatchOperVO  extends BaseVO {

    /**
     * 배치유형 - 쉘프로그램
     */
    public static final String BATCH_TYPE_SHELL = "02";

    /**
     * 배치유형 - Quartz Job
     */
    public static final String BATCH_TYPE_QUARTZJOB = "01";

	/**
	 *
	 */
	private static final long serialVersionUID = 1252013119156068074L;

	/**
	 * 배치작업ID
	 */
	@NotEmpty
	@Pattern(regexp="BTO-[0-9]{5,}")
	private String batOperId;

	/**
	 * 배치작업명
	 */
	@NotEmpty
	private String batOperNm;

	/**
	 * 배치유형
	 * 01 :QuartzJob
	 * 01: Shell
	 */
	@NotEmpty
	@Pattern(regexp="0[1-2]")
	private String batTp;

	/**
	 * 배치프로그램
	 */
	@NotEmpty
	private String batPrgmNm;

	/**
	 * 배치파라메터
	 */
	private String batParamVal;

	/**
	 * 활성여부
	 */
	@NotEmpty
	private String batEnabledYn;


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




}
