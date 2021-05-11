package chn.bhmc.dms.par.cpm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemVO;

/**
 * 방치품 서비스
 *
 * @author In Bo Shim
 * @since 2016. 7. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 7. 15.     In Bo Shim      최초 생성
 * </pre>
 */

public interface LeaveItemService {

    /**
     * 방치품  정보를 수정한다.
     * @param leavItemVO - 수정할 정보가 담긴 LeaveItemVO
     * @return 수정된 목록수
     */
    public int updateLeaveItem(LeaveItemVO leaveItemVO) throws Exception;

    /**
     * 방치품  정보를 전체 수정한다.
     * @param leavItemVO - 수정할 정보가 담긴 LeaveItemVO
     * @return 수정된 목록수
     */
    public int updateLeaveItemAll(LeaveItemVO leaveItemVO) throws Exception;

    /**
     * 방치품  정보를 삭제한다.
     * @param leavItemVO - 삭제할 정보가 담긴 LeaveItemVO
     * @return 삭제된 목록수
     */
    public int deleteLeaveItem(LeaveItemVO leaveItemVO) throws Exception;

    /**
     * 방치품  정보를 등록/수정/삭제한다.
     * @param leavItemVO - 삭제할 정보가 담긴 LeaveItemVO
     * @return 등록/수정/삭제 목록수
     */
    public void multiLeaveItem(BaseSaveVO<LeaveItemVO> saveVO) throws Exception;

    /**
     * Key에 해당하는 방치품  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 부품번호
     * @return 조회한 방치품  정보
     */
    public LeaveItemVO selectLeaveItemByKey(String dlrCd, String itemCd) throws Exception;

    /**
     * 조회 조건에 해당하는 방치품  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemSearchVO
     * @return 조회 목록
     */
    public List<LeaveItemVO> selectLeaveItemsByCondition(LeaveItemSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 방치품  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemSearchVO
     * @return 조회 목록 수
     */
    public int selectLeaveItemsByConditionCnt(LeaveItemSearchVO searchVO) throws Exception;
}
