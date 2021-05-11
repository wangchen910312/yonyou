package chn.bhmc.dms.par.cpm.service;

import java.util.List;

import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoSearchVO;

/**
 * 선수금 헤더 서비스
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

public interface AdvanceReceivedInfoHeaderService {

    /**
     * 선수금 헤더 정보를 등록한다.
     * @param advanceReceivedInfoHeaderVO 등록할 정보가 담긴 AdvanceReceivedInfoHeaderVO
     * @return 등록된 목록수
     */
    public int insertAdvanceReceivedInfoHeader(AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO) throws Exception;

    /**
     * 선수금  헤더 정보를 수정한다.
     * @param advanceReceivedInfoHeaderVO - 수정할 정보가 담긴 AdvanceReceivedInfoHeaderVO
     * @return 수정된 목록수
     */
    public int updateAdvanceReceivedInfoHeader(AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO) throws Exception;

    /**
     * 선수금  헤더 정보를 삭제한다.
     * @param advanceReceivedInfoHeaderVO - 삭제할 정보가 담긴 AdvanceReceivedInfoHeaderVO
     * @return 삭제된 목록수
     */
    public int deleteAdvanceReceivedInfoHeader(AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO) throws Exception;

    /**
     * Key에 해당하는 선수금 헤더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 선수금 헤더 정보
     */
    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(String dlrCd) throws Exception;

    /**
     * 조회 조건에 해당하는 선수금 헤더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return 조회 목록
     */
    public List<AdvanceReceivedInfoHeaderVO> selectAdvanceReceivedInfoHeadersByCondition(AdvanceReceivedInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 선수금 헤더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AdvanceReceivedInfoSearchVO
     * @return 조회 목록 수
     */
    public int selectAdvanceReceivedInfoHeadersByConditionCnt(AdvanceReceivedInfoSearchVO searchVO) throws Exception;
}
