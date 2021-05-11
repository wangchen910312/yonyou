package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.sci.vo.CountrySearchVO;
import chn.bhmc.dms.cmm.sci.vo.CountryVO;

/**
 * 국가코드에 관한 데이터처리 매퍼 클래스
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

@Mapper("countryDAO")
public interface CountryDAO {

    /**
     * 국가코드 정보를 등록한다.
     * @param countryVO - 등록할 정보가 담긴 CountryVO
     * @return 등록된 목록수
     */
    public int insertCountry(CountryVO countryVO);

    /**
     * 국가코드 정보를 수정한다.
     * @param countryVO - 수정할 정보가 담긴 CountryVO
     * @return 수정된 목록수
     */
    public int updateCountry(CountryVO countryVO);

    /**
     * 국가코드 정보를 삭제한다.
     * @param countryVO - 삭제할 정보가 담긴 CountryVO
     * @return 삭제된 목록수
     */
    public int deleteCountry(CountryVO countryVO);

    /**
     * Key에 해당하는 국가코드 정보를 조회한다.
     * @param cntryCd - 국가코드(2자리)
     * @param langCd - 언어코드
     * @return 조회한 국가코드 정보
     */
    public CountryVO selectCountryByKey(@Param("cntryCd") String cntryCd, @Param("langCd") String langCd);

    /**
     * 조회 조건에 해당하는 국가코드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CountrySearchVO
     * @return 조회 목록
     */
    public List<CountryVO> selectCountriesByCondition(CountrySearchVO searchVO);

    /**
     * 조회 조건에 해당하는 국가코드 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CountrySearchVO
     * @return
     */
    public int selectCountriesByConditionCnt(CountrySearchVO searchVO);
}
