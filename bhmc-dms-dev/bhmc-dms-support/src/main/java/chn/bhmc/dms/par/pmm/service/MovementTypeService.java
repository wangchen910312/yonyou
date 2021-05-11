package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO;
import chn.bhmc.dms.par.pmm.vo.MovementTypeVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;

/**
 * 수불유형 서비스
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

public interface MovementTypeService {

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
     * @param mvtTp - 수불유형코드
     * @return 조회한 수불유형 정보
     */
    public MovementTypeVO selectMovementTypeByKey(String dlrCd, String mvtTp);

    /**
     * Key에 해당하는 상대수불유형 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형 코드
     * @return 조회한 수불유형 정보
     */
    public MovementTypeVO selectCombiMovementTypeByKey(String dlrCd, String mvtTp) throws Exception;


    /**
     * 수불유형 정보를 등록/수정 처리한다.
     * @param saveVO - 등록/수정을 포함하는 MovementTypeSaveVO
     * @return 조회 목록
     */
    public void multiMovementTypes(BaseSaveVO<MovementTypeVO> movementTypeSaveVO) throws Exception;

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
     * 조회 조건에 해당하는 수불문서 정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 MovementTypeSearchVO
     * @return 목록
     */
    public List<MvtDocItemVO> selectMvtDocItemsByCondition(MovementTypeSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 수불문서 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록 수
     */
    public int selectMvtDocItemsByConditionCnt(MovementTypeSearchVO searchVO) throws Exception;

    /**
     * 입출고에 해당하는 수불유형 정보를 조회한다.(역방향도 제외)
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     * @return 조회 목록
     */
    public List<MovementTypeVO> selectGrGiMovementTypes(MovementTypeSearchVO searchVO) throws Exception;


}
