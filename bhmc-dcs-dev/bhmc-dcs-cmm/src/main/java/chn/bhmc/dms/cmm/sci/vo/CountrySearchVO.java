package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 국가코드 조회 SearchVO
 *
 * @ClassName   : CountrySearchVO.java
 * @Description : CountrySearchVO Class
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CountrySearchVO extends SearchVO {


	/**
	 *
	 */
	private static final long serialVersionUID = 1707229461890670218L;

	/**
	 * 조회조건 - 국가코드
	 */
	private String sCntryCd;

	/**
	 * 조회조건 - 국가명
	 */
	private String sCntryNm;

	public String getsCntryCd() {
		return sCntryCd;
	}

	public void setsCntryCd(String sCntryCd) {
		this.sCntryCd = sCntryCd;
	}

	public String getsCntryNm() {
		return sCntryNm;
	}

	public void setsCntryNm(String sCntryNm) {
		this.sCntryNm = sCntryNm;
	}

}
