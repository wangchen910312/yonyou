package chn.bhmc.dms.sal.orm.service;

import java.util.List;

import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementSaveVO;
import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementSearchVO;
import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementVO;

/**
 * 오더 우선순위 관리 서비스
 *
 * @author Bong
 * @since 2016. 3. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.17         Bong            최초 생성
 * </pre>
 */

public interface OrderPriorityManagementService {

	/**
     * 조회 조건에 해당하는 오더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OrderPriorityManagementSearchVO
     * @return 조회 목록
     */
	public List<OrderPriorityManagementVO> selectOrderPriorityManagementByCondition(OrderPriorityManagementSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 오더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OrderPriorityManagementSearchVO
     * @return
     */
	public int selectOrderPriorityManagementByConditionCnt(OrderPriorityManagementSearchVO searchVO) throws Exception;

	/**
     * 오더 삭제 처리한다
     * @param OrderPriorityManagementSaveVO- 조회 조건을 포함하는 OrderPriorityManagementVO
     * @return
     */
	public void updateOrderPriorityManagement(OrderPriorityManagementSaveVO OrderPriorityManagementSaveVO) throws Exception;



}
