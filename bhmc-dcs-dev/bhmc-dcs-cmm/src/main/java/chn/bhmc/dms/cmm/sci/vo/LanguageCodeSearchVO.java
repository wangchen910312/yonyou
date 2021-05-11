package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 언어코드 조회 SearchVO
 *
 * @ClassName   : LanguageCodeSearchVO.java
 * @Description : LanguageCodeSearchVO Class
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

public class LanguageCodeSearchVO extends SearchVO {

    private static final long serialVersionUID = -5074266492215156313L;


	/**
	 * 조회조건 - 언어명
	 */
	private String sLangNm;

	/**
	 * 조회조건 - 활성여부
	 */
	private String sEnabledYn;


    /**
     * @return the sLangNm
     */
    public String getsLangNm() {
        return sLangNm;
    }


    /**
     * @param sLangNm the sLangNm to set
     */
    public void setsLangNm(String sLangNm) {
        this.sLangNm = sLangNm;
    }


    /**
     * @return the sEnabledYn
     */
    public String getsEnabledYn() {
        return sEnabledYn;
    }


    /**
     * @param sEnabledYn the sEnabledYn to set
     */
    public void setsEnabledYn(String sEnabledYn) {
        this.sEnabledYn = sEnabledYn;
    }



}
