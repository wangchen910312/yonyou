package chn.bhmc.dms.sal.orm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.orm.service.OrderPriorityManagementService;
import chn.bhmc.dms.sal.orm.service.dao.OrderPriorityManagementDAO;
import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementSaveVO;
import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementSearchVO;
import chn.bhmc.dms.sal.orm.vo.OrderPriorityManagementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderPriorityManagementServiceImpl
 * @Description : 오더 우선순위 관리
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

@Service("orderPriorityManagementService")
public class OrderPriorityManagementServiceImpl extends HService implements OrderPriorityManagementService {

    /**
     * 로컬옵션 DAO 선언
     */
    @Resource(name="orderPriorityManagementDAO")
    OrderPriorityManagementDAO orderPriorityManagementDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<OrderPriorityManagementVO> selectOrderPriorityManagementByCondition(OrderPriorityManagementSearchVO searchVO) throws Exception {
        return orderPriorityManagementDAO.selectOrderPriorityManagementByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectOrderPriorityManagementByConditionCnt(OrderPriorityManagementSearchVO searchVO)  throws Exception {
        return orderPriorityManagementDAO.selectOrderPriorityManagementByConditionCnt(searchVO);
    }

    @Override
    public void updateOrderPriorityManagement(OrderPriorityManagementSaveVO obj) throws Exception {

        for(OrderPriorityManagementVO OrderPriorityManagementVO : obj.getUpdateList()){

            orderPriorityManagementDAO.updateOrderPriorityManagement(OrderPriorityManagementVO);

            orderPriorityManagementDAO.procPenaltyOrdReq(OrderPriorityManagementVO);
        }
    }

}
