package chn.bhmc.dms.sal.orc.service;

import java.util.List;

import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSaveVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderVO;

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

public interface NotAssignedOrderService {

    public int selectNotAssignedOrderCnt(NotAssignedOrderSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotAssignedOrderSearchVO
     * @return 조회 목록
     */
	public List<NotAssignedOrderVO> selectNotAssignedOrder(NotAssignedOrderSearchVO searchVO) throws Exception;

	/**
	 * 미배정 주문조회 합산금 조회
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public NotAssignedOrderVO selectNotAssignedOrderSumSearch(NotAssignedOrderSearchVO searchVO) throws Exception;

    public int updateNotAssignedOrder(NotAssignedOrderSaveVO saveVO) throws Exception;

    /**
     * 미배정 취소계획 조회
     * @param saveVO
     * @return
     * @throws Exception
     **/
    public boolean orderCancelPlanChk(NotAssignedOrderVO searchVO) throws Exception;

    /**
     * 미배정 취소신청
     * @param saveVO
     * @return
     * @throws Exception
     **/
    public boolean notAssignedOrderCancelAsk(NotAssignedOrderVO saveVO) throws Exception;

    /**
     * 미배정 오더취소 내역 조회
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectNotAssignedOrderCancelSearchCnt(NotAssignedOrderSearchVO saveVO) throws Exception;
    public List<NotAssignedOrderVO> selectNotAssignedOrderCancelSearch(NotAssignedOrderSearchVO saveVO) throws Exception;

}
