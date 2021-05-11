package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.CastleSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.CastleSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.CastleVO;

/**
 * 성정보 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface CastleService {

    /**
     * 성정보 정보를 등록한다.
     * @param castleVO - 등록할 정보가 담긴 CastleVO
     * @return 등록된 목록수
     */
    public int insertCastle(CastleVO castleVO) throws Exception;

    /**
     * 성정보 정보를 수정한다.
     * @param castleVO - 수정할 정보가 담긴 CastleVO
     * @return 수정된 목록수
     */
    public int updateCastle(CastleVO castleVO) throws Exception;

    /**
     * 성정보 정보를 삭제한다.
     * @param castleVO - 삭제할 정보가 담긴 CastleVO
     * @return 삭제된 목록수
     */
    public int deleteCastle(CastleVO castleVO) throws Exception;

    /**
     * 성정보 정보를 등록/수정/삭제 처리한다.
     * @param castleSaveVO
     */
    public void multiCastles(CastleSaveVO castleSaveVO) throws Exception;

    /**
     * Key에 해당하는 성정보 정보를 조회한다.
     * @param cstlCd 성정보코드
     * @return 조회한 성정보 정보
     */
    public CastleVO selectCastleByKey(String cstlCd) throws Exception;

    /**
     * 조회 조건에 해당하는 성정보 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 CastleSearchVO
     * @return 조회 목록
     */
    public List<CastleVO> selectCastlesByCondition(CastleSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 성정보 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 CastleSearchVO
     * @return
     */
    public int selectCastlesByConditionCnt(CastleSearchVO searchVO) throws Exception;
}
