package chn.bhmc.dms.mob.api.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.main.dao.MainTodoInfoDAO;
import chn.bhmc.dms.mob.api.main.service.MainTodoInfoService;
import chn.bhmc.dms.mob.api.main.vo.TodoInfoSearchVO;
import chn.bhmc.dms.mob.api.main.vo.TodoInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 4.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("MainTodoInfoService")
public class MainTodoInfoServiceImpl extends HService implements MainTodoInfoService {

    @Resource(name="MainTodoInfoDAO")
    MainTodoInfoDAO MainTodoInfoDAO;

    @Override
    public List<TodoInfoVO> selectTodoInfosByCondition(TodoInfoSearchVO searchVO) throws Exception {
        return MainTodoInfoDAO.selectTodoInfosByCondition(searchVO);
    }

    @Override
    public int selectTodoInfosByConditionCnt(TodoInfoSearchVO searchVO) throws Exception {
        return MainTodoInfoDAO.selectTodoInfosByConditionCnt(searchVO);
    }

}
