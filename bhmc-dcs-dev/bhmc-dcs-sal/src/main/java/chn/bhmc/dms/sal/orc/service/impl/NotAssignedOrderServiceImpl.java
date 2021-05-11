package chn.bhmc.dms.sal.orc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.orc.service.NotAssignedOrderService;
import chn.bhmc.dms.sal.orc.service.dao.NotAssignedOrderDAO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotAssignedOrderServiceImpl.java
 * @Description : 미배정 주문조회 Service
 * @author
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.      Bong               최초 생성
 * </pre>
 */

@Service("notAssignedOrderService")
public class NotAssignedOrderServiceImpl extends HService implements NotAssignedOrderService {

    /**
     * 미배정 주문조회 DAO 선언
     */
    @Resource(name="notAssignedOrderDAO")
    NotAssignedOrderDAO notAssignedOrderDAO;

    /**
     * 조회 건수
     */
    @Override
    public int selectNotAssignedOrderCnt(NotAssignedOrderSearchVO searchVO)  throws Exception {
        return notAssignedOrderDAO.selectNotAssignedOrderCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 정보를 조회한다.
     */
    @Override
    public List<NotAssignedOrderVO> selectNotAssignedOrder(NotAssignedOrderSearchVO searchVO) throws Exception {
        return notAssignedOrderDAO.selectNotAssignedOrder(searchVO);
    }

}
