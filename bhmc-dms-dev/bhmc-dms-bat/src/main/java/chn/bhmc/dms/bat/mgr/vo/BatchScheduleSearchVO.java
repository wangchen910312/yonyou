package chn.bhmc.dms.bat.mgr.vo;


import org.apache.commons.lang3.builder.ToStringBuilder;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSchedultSearchVO.java
 * @Description : 배치스케쥴 조회조건 SearchVO
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
public class BatchScheduleSearchVO extends SearchVO {

	/**
	 *
	 */
	private static final long serialVersionUID = 9142804417433827109L;

	/**
	 * 조회조건 - 배치스케쥴ID
	 */
	private String sBatScheduleId;

	/**
	 * 조회조건 - 배치작업ID
	 */
	private String sBatOperId;

	/**
	 * 조회조건 - 배치작업 활성여부
	 */
	private String sBatEnabledYn;

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
