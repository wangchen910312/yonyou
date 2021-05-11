package chn.bhmc.dms.cmm.sci.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 언어코드 VO
 *
 * @ClassName   : LanguageCodeVO.java
 * @Description : LanguageCodeVO Class
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

public class LanguageCodeVO extends BaseVO {


	/**
	 *
	 */
	private static final long serialVersionUID = 4834201495387732047L;


	/**
	 * 언어코드
	 */
	@NotBlank
	@Length(min=2, max=2)
	private String langCd;

	/**
	 * 언어명
	 */
	@NotBlank
	private String langNm;

	/**
	 * <pre>
	 * 활성화 여부
	 * 'Y' : 활성화
     * 'N' : 비활성화
	 * </pre>
	 */
	@NotBlank
	private String enabledYn;


    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    /**
     * @return the langNm
     */
    public String getLangNm() {
        return langNm;
    }

    /**
     * @param langNm the langNm to set
     */
    public void setLangNm(String langNm) {
        this.langNm = langNm;
    }

    /**
     * @return the enabledYn
     */
    public String getEnabledYn() {
        return enabledYn;
    }

    /**
     * @param enabledYn the enabledYn to set
     */
    public void setEnabledYn(String enabledYn) {
        this.enabledYn = enabledYn;
    }

}
