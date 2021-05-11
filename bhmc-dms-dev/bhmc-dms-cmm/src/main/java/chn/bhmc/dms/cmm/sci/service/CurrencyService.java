package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.CurrencySaveVO;
import chn.bhmc.dms.cmm.sci.vo.CurrencySearchVO;
import chn.bhmc.dms.cmm.sci.vo.CurrencyVO;

/**
 * 통화코드 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Kang Seok Han            최초 생성
 * </pre>
 */

public interface CurrencyService {

    /**
     * 통화코드 정보를 등록한다.
     * @param countryVO - 등록할 정보가 담긴 CurrencyVO
     * @return 등록된 목록수
     */
    public int insertCurrency(CurrencyVO countryVO) throws Exception;

    /**
     * 통화코드 정보를 수정한다.
     * @param countryVO - 수정할 정보가 담긴 CurrencyVO
     * @return 수정된 목록수
     */
    public int updateCurrency(CurrencyVO countryVO) throws Exception;

    /**
     * 통화코드 정보를 삭제한다.
     * @param countryVO - 삭제할 정보가 담긴 CurrencyVO
     * @return 삭제된 목록수
     */
    public int deleteCurrency(CurrencyVO countryVO) throws Exception;

    /**
     * Key에 해당하는 통화코드 정보를 조회한다.
     * @param cntryCd
     * @return 조회한 통화코드 정보
     */
    public CurrencyVO selectCurrencyByKey(String cntryCd) throws Exception;

    /**
     * 통화코드 정보를 등록/수정/삭제 처리한다.
     * @param countrySaveVO
     */
	public void multiCurrencies(CurrencySaveVO saveVO) throws Exception;

	/**
     * 조회 조건에 해당하는 통화코드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CurrencySearchVO
     * @return 조회 목록
     */
	public List<CurrencyVO> selectCurrenciesByCondition(CurrencySearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 통화코드 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CurrencySearchVO
     * @return
     */
	public int selectCurrenciesByConditionCnt(CurrencySearchVO searchVO) throws Exception;
}
