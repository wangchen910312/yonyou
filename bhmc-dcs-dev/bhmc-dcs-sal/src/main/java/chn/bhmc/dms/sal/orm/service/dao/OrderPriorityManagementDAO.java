package chn.bhmc.dms.sal.orm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementSearchVO;
import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderPriorityManagementDAO
 * @Description : 완성차 입고확정 DAO
 * @author Bong
 * @since 2016. 3. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.14         Bong            최초 생성
 * </pre>
 */

@Mapper("orderPriorityManagementDAO")
public interface OrderPriorityManagementDAO {


    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<OrderPriorityManagementVO> selectOrderPriorityManagementByCondition(OrderPriorityManagementSearchVO searchVO);

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectOrderPriorityManagementByConditionCnt(OrderPriorityManagementSearchVO searchVO);

    /**
     * 완성차 입고확정 및 확정취소 한다.
     * @param LocalOptionVO
     * @return
     */
    public int updateOrderPriorityManagement(OrderPriorityManagementVO LocalVO);
    /**
     * 완성차 입고확정 및 확정취소 한다.
     * @param LocalOptionVO
     * @return
     */
    public int updateOrderPriorityManagement2(OrderPriorityManagementVO LocalVO);



    /**
    *
    * 위약오더주문취소 정보를 프로시져로 등록한다.
    *
    * @param saveVO - PWA 요청 부품 등록 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int procPenaltyOrdReq(OrderPriorityManagementVO LocalVO) throws Exception;

}
