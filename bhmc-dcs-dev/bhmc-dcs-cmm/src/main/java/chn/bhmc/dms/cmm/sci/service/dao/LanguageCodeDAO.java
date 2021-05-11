package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.LanguageCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.LanguageCodeVO;

/**
 * 언어코드에 관한 데이터처리 매퍼 클래스
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

@Mapper("languageCodeDAO")
public interface LanguageCodeDAO {

    /**
     * 언어코드 정보를 등록한다.
     * @param languageCodeVO - 등록할 정보가 담긴 LanguageCodeVO
     * @return 등록된 목록수
     */
    public int insertLanguageCode(LanguageCodeVO languageCodeVO);

    /**
     * 언어코드 정보를 수정한다.
     * @param languageCodeVO - 수정할 정보가 담긴 LanguageCodeVO
     * @return 수정된 목록수
     */
    public int updateLanguageCode(LanguageCodeVO languageCodeVO);

    /**
     * 언어코드 정보를 삭제한다.
     * @param languageCodeVO - 삭제할 정보가 담긴 LanguageCodeVO
     * @return 삭제된 목록수
     */
    public int deleteLanguageCode(LanguageCodeVO languageCodeVO);

    /**
     * Key에 해당하는 언어코드 정보를 조회한다.
     * @param langCd - 언어코드
     * @return 조회한 언어코드 정보
     */
    public LanguageCodeVO selectLanguageCodeByKey(String langCd);

    /**
     * 조회 조건에 해당하는 언어코드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LanguageCodeSearchVO
     * @return 조회 목록
     */
    public List<LanguageCodeVO> selectLanguageCodesByCondition(LanguageCodeSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 언어코드 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LanguageCodeSearchVO
     * @return
     */
    public int selectLanguageCodesByConditionCnt(LanguageCodeSearchVO searchVO);
}
