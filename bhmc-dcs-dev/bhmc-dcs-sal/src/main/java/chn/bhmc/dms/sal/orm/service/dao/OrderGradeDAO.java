package chn.bhmc.dms.sal.orm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.orm.vo.OrderGradeSearchVO;
import chn.bhmc.dms.sal.orm.vo.OrderGradeVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderGradeDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

@Mapper("orderGradeDAO")
public interface OrderGradeDAO {

    /**
     * Searching Order Grade Condition.
     */
   public List<OrderGradeVO> selectOrderGradeCondition(OrderGradeSearchVO searchVO);

   /**
    *  Counting of Order Grade Condition.
    */
   public int selectOrderGradeConditionCnt(OrderGradeSearchVO searchVO);

}
