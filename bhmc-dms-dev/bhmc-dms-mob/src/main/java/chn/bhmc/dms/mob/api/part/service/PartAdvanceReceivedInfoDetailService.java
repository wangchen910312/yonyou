package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoDetailVO;
import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoSearchVO;



/**
 * 선수금 상세 서비스
 *
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim      최초 생성
 * </pre>
 */

public interface PartAdvanceReceivedInfoDetailService {

    /**
     * 조회 조건에 해당하는 선수금 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return 조회 목록
     */
    public List<AdvanceReceivedInfoDetailVO> selectAdvanceReceivedInfoDetailsByCondition(AdvanceReceivedInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 선수금 상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return 조회 목록 수
     */
   public int selectAdvanceReceivedInfoDetailsByConditionCnt(AdvanceReceivedInfoSearchVO searchVO) throws Exception;
}
