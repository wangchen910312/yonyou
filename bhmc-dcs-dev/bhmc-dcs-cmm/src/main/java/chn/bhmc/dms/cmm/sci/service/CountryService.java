package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.CountrySearchVO;
import chn.bhmc.dms.cmm.sci.vo.CountryVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 국가코드 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

public interface CountryService {

    /**
     * 국가코드 정보를 등록한다.
     * @param countryVO - 등록할 정보가 담긴 CountryVO
     * @return 등록된 목록수
     */
    public int insertCountry(CountryVO countryVO) throws Exception;

    /**
     * 국가코드 정보를 수정한다.
     * @param countryVO - 수정할 정보가 담긴 CountryVO
     * @return 수정된 목록수
     */
    public int updateCountry(CountryVO countryVO) throws Exception;

    /**
     * 국가코드 정보를 삭제한다.
     * @param countryVO - 삭제할 정보가 담긴 CountryVO
     * @return 삭제된 목록수
     */
    public int deleteCountry(CountryVO countryVO) throws Exception;

    /**
     * Key에 해당하는 국가코드 정보를 조회한다.
     * @param cntryCd - 국가코드(2자리)
     * @param langCd - 언어코드
     * @return 조회한 국가코드 정보
     */
    public CountryVO selectCountryByKey(String cntryCd, String langCd) throws Exception;

    /**
     * 국가코드 정보를 등록/수정/삭제 처리한다.
     * @param countrySaveVO
     */
	public void multiCountries(BaseSaveVO<CountryVO> countrySaveVO) throws Exception;

	/**
     * 조회 조건에 해당하는 국가코드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CountrySearchVO
     * @return 조회 목록
     */
	public List<CountryVO> selectCountriesByCondition(CountrySearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 국가코드 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CountrySearchVO
     * @return
     */
	public int selectCountriesByConditionCnt(CountrySearchVO searchVO) throws Exception;
}
