package chn.bhmc.dms.sal.orc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotAssignedOrderDAO.java
 * @Description : 미배정 주문조회 DAO
 * @author Bong
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.     Bong               최초 생성
 * </pre>
 */

@Mapper("notAssignedOrderDAO")
public interface NotAssignedOrderDAO {

    /**
     *  Counting of Order Grade Condition.
     */
    public int selectNotAssignedOrderCnt(NotAssignedOrderSearchVO searchVO);

    /**
      * 조회 조건에 해당하는 정보를 조회한다.
      */
    public List<NotAssignedOrderVO> selectNotAssignedOrder(NotAssignedOrderSearchVO searchVO);

}
