package chn.bhmc.dms.cmm.sci.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 국가코드 VO
 *
 * @ClassName   : CountryVO.java
 * @Description : CountryVO Class
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

public class CountryVO extends BaseVO {


	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8981619931846928390L;

    /**
	 * 국가코드
	 */
	@NotBlank
	@Length(min=2, max=2)
	private String cntryCd;

	/**
	 * 언어코드
	 */
	@NotBlank
	@Length(min=2, max=2)
	private String langCd;

	/**
	 * 국가명
	 */
	@NotBlank
	private String cntryNm;

	/**
     * @return the cntryCd
     */
    public String getCntryCd() {
        return cntryCd;
    }

    /**
     * @param cntryCd the cntryCd to set
     */
    public void setCntryCd(String cntryCd) {
        this.cntryCd = cntryCd;
    }

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

    public String getCntryNm() {
		return cntryNm;
	}

	public void setCntryNm(String cntryNm) {
		this.cntryNm = cntryNm;
	}

}
