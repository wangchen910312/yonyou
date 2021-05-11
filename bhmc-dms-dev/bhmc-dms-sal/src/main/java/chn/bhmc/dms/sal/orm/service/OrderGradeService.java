package chn.bhmc.dms.sal.orm.service;

import java.util.List;

import chn.bhmc.dms.sal.orm.vo.OrderGradeSearchVO;
import chn.bhmc.dms.sal.orm.vo.OrderGradeVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderGradeService.java
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

public interface OrderGradeService {

    public List<OrderGradeVO> selectOrderGradeCondition(OrderGradeSearchVO searchVO) throws Exception;

    public int selectOrderGradeConditionCnt(OrderGradeSearchVO searchVO) throws Exception;

}
