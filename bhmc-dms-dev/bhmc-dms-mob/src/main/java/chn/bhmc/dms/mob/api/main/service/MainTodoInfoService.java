package chn.bhmc.dms.mob.api.main.service;

import java.util.List;

import chn.bhmc.dms.mob.api.main.vo.TodoInfoSearchVO;
import chn.bhmc.dms.mob.api.main.vo.TodoInfoVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoInfoService.java
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
public interface MainTodoInfoService {

    public List<TodoInfoVO> selectTodoInfosByCondition(TodoInfoSearchVO searchVO) throws Exception;

    public int selectTodoInfosByConditionCnt(TodoInfoSearchVO searchVO) throws Exception;
}
