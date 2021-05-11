package chn.bhmc.dms.mob.api.main.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.main.vo.TodoInfoSearchVO;
import chn.bhmc.dms.mob.api.main.vo.TodoInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("MainTodoInfoDAO")
public interface MainTodoInfoDAO {

    public List<TodoInfoVO> selectTodoInfosByCondition(TodoInfoSearchVO searchVO);

    public int selectTodoInfosByConditionCnt(TodoInfoSearchVO searchVO);
}
