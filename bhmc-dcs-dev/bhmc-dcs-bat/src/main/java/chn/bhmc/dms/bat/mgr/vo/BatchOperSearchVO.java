package chn.bhmc.dms.bat.mgr.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchOperSearchVO.java
 * @Description : 배치작업 조회조건 SearchVO
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
public class BatchOperSearchVO extends SearchVO {

	/**
	 *
	 */
	private static final long serialVersionUID = -858712232406084709L;

	/**
	 * 조회조건 - 배치작업ID
	 */
	private String sBatOperId;

	/**
	 * 조회조건 - 배치작업명
	 */
	private String sBatOperNm;

	/**
	 * 조회조건 - 배치유형
	 * Shell : 쉘프로그램
	 * QuartzJob : Quartz Job
	 */
	private String sBatTp;

	/**
	 * 조회조건 - 배치프로그램
	 */
	private String sBatPrgmNm;

	/**
	 * 조회조건 - 활성여부
	 * Y : 활성
	 * N : 비활성
	 */
	private String sBatEnabledYn;


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
     * @return the sBatOperNm
     */
    public String getsBatOperNm() {
        return sBatOperNm;
    }
    /**
     * @param sBatOperNm the sBatOperNm to set
     */
    public void setsBatOperNm(String sBatOperNm) {
        this.sBatOperNm = sBatOperNm;
    }
    /**
     * @return the sBatTp
     */
    public String getsBatTp() {
        return sBatTp;
    }
    /**
     * @param sBatTp the sBatTp to set
     */
    public void setsBatTp(String sBatTp) {
        this.sBatTp = sBatTp;
    }
    /**
     * @return the sBatPrgmNm
     */
    public String getsBatPrgmNm() {
        return sBatPrgmNm;
    }
    /**
     * @param sBatPrgmNm the sBatPrgmNm to set
     */
    public void setsBatPrgmNm(String sBatPrgmNm) {
        this.sBatPrgmNm = sBatPrgmNm;
    }
    /**
     * @return the sBatEnabledYn
     */
    public String getsBatEnabledYn() {
        return sBatEnabledYn;
    }
    /**
     * @param sBatEnabledYn the sBatEnabledYn to set
     */
    public void setsBatEnabledYn(String sBatEnabledYn) {
        this.sBatEnabledYn = sBatEnabledYn;
    }

    public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
