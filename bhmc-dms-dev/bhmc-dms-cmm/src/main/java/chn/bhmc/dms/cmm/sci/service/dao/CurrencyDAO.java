package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.CurrencySearchVO;
import chn.bhmc.dms.cmm.sci.vo.CurrencyVO;

/**
 * 통화코드에 관한 데이터처리 매퍼 클래스
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

@Mapper("currencyDAO")
public interface CurrencyDAO {

    /**
     * 통화코드 정보를 등록한다.
     * @param countryVO - 등록할 정보가 담긴 CurrencyVO
     * @return 등록된 목록수
     */
    public int insertCurrency(CurrencyVO countryVO);

    /**
     * 통화코드 정보를 수정한다.
     * @param countryVO - 수정할 정보가 담긴 CurrencyVO
     * @return 수정된 목록수
     */
    public int updateCurrency(CurrencyVO countryVO);

    /**
     * 통화코드 정보를 삭제한다.
     * @param countryVO - 삭제할 정보가 담긴 CurrencyVO
     * @return 삭제된 목록수
     */
    public int deleteCurrency(CurrencyVO countryVO);

    /**
     * Key에 해당하는 통화코드 정보를 조회한다.
     * @param currencyCd - 통화코드
     * @return 조회한 통화코드 정보
     */
    public CurrencyVO selectCurrencyByKey(String currencyCd);

    /**
     * 조회 조건에 해당하는 통화코드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CurrencySearchVO
     * @return 조회 목록
     */
    public List<CurrencyVO> selectCurrenciesByCondition(CurrencySearchVO searchVO);

    /**
     * 조회 조건에 해당하는 통화코드 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CurrencySearchVO
     * @return
     */
    public int selectCurrenciesByConditionCnt(CurrencySearchVO searchVO);
}
