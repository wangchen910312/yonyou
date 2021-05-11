package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.NotAssignedOrderVO;



/**
 * 미배정 주문 조회
 *
 * @author Bong
 * @since 2016. 3. 10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                     수정자                       수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.10          Bong            최초 생성
 * </pre>
 */

public interface SalesNotAssignedOrderService {

    public int selectNotAssignedOrderCnt(NotAssignedOrderSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotAssignedOrderSearchVO
     * @return 조회 목록
     */
	public List<NotAssignedOrderVO> selectNotAssignedOrder(NotAssignedOrderSearchVO searchVO) throws Exception;
	
	public int selectNotAssignedOrderDetailCnt(NotAssignedOrderSearchVO searchVO) throws Exception;
	
	/**
	 * 조회 조건에 해당하는 정보를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 NotAssignedOrderSearchVO
	 * @return 조회 목록
	 */
	public List<NotAssignedOrderVO> selectNotAssignedOrderDetail(NotAssignedOrderSearchVO searchVO) throws Exception;

}
