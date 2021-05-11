package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO;
import chn.bhmc.dms.par.pmm.vo.MovementTypeVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;

/**
 * 수불유형 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("movementTypeDAO")
public interface MovementTypeDAO {

    /**
     * 수불유형 정보를 등록한다.
     * @param movementTypeVO - 등록할 정보가 담긴 MovementTypeVO
     * @return 등록된 목록수
     */
    public int insertMovementType(MovementTypeVO movementTypeVO);

    /**
     * 수불유형 정보를 수정한다.
     * @param movementTypeVO - 수정할 정보가 담긴 MovementTypeVO
     * @return 수정된 목록수
     */
    public int updateMovementType(MovementTypeVO movementTypeVO);

    /**
     * 수불유형 정보를 삭제한다.
     * @param movementTypeVO - 삭제할 정보가 담긴 MovementTypeVO
     * @return 삭제된 목록수
     */
    public int deleteMovementType(MovementTypeVO movementTypeVO);

    /**
     * Key에 해당하는 수불유형 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형 코드
     * @return 조회한 수불유형 정보
     */
    public MovementTypeVO selectMovementTypeByKey(@Param("dlrCd") String dlrCd, @Param("mvtTp") String mvtTp);

    /**
     * Key에 해당하는 상대수불유형 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형 코드
     * @return 조회한 수불유형 정보
     */
    public MovementTypeVO selectCombiMovementTypeByKey(@Param("dlrCd") String dlrCd, @Param("mvtTp") String mvtTp);

    /**
     * 조회 조건에 해당하는 수불유형 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     * @return 조회 목록
     */
    public List<MovementTypeVO> selectMovementTypesByCondition(MovementTypeSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 수불유형 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     * @return 조회 목록 수
     */
    public int selectMovementTypesByConditionCnt(MovementTypeSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 수불 문서를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectMvtDocItemsByCondition(MovementTypeSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 수불 문서를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     * @return 조회 목록 수
     */
    public int selectMvtDocItemsByConditionCnt(MovementTypeSearchVO searchVO);

    /**
     * 입출고에 해당하는 수불유형 정보를 조회한다.(역방향도 제외)
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     * @return 조회 목록
     */
    public List<MovementTypeVO> selectGrGiMovementTypes(MovementTypeSearchVO searchVO);

}
