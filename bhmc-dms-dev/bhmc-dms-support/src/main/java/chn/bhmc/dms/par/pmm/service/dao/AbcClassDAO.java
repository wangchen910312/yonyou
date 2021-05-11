package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.AbcClassSearchVO;
import chn.bhmc.dms.par.pmm.vo.AbcClassVO;

/**
 * ABC CLASS에 관한 데이터처리 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Mapper("abcClassDAO")
public interface AbcClassDAO {

    /**
     * ABC CLASS 정보를 등록한다.
     * @param abcClassVO - 등록할 정보가 담긴 AbcClassVO
     * @return 등록된 목록수
     */
    public int insertAbcClass(AbcClassVO abcClassVO);

    /**
     * ABC CLASS 정보를 수정한다.
     * @param abcClassVO - 수정할 정보가 담긴 AbcClassVO
     * @return 수정된 목록수
     */
    public int updateAbcClass(AbcClassVO abcClassVO);

    /**
     * ABC CLASS 정보를 삭제한다.
     * @param abcClassVO - 삭제할 정보가 담긴 AbcClassVO
     * @return 삭제된 목록수
     */
    public int deleteAbcClass(AbcClassVO abcClassVO);

    /**
     * Key에 해당하는 ABC CLASS 정보를 조회한다.
     * @param cntryCd - ABC CLASS(2자리)
     * @param langCd - 언어코드
     * @return 조회한 ABC CLASS 정보
     */
    public AbcClassVO selectAbcClassByKey(AbcClassSearchVO abcClassSearchVO);

    /**
     * 조회 조건에 해당하는 ABC CLASS 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AbcClassSearchVO
     * @return 조회 목록
     */
    public List<AbcClassVO> selectAbcClassByCondition(AbcClassSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 ABC CLASS 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AbcClassSearchVO
     * @return
     */
    public int selectAbcClassByConditionCnt(AbcClassSearchVO searchVO);

}
