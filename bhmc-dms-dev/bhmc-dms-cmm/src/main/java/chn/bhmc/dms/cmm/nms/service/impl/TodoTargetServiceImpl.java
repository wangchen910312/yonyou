package chn.bhmc.dms.cmm.nms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.TodoTargetService;
import chn.bhmc.dms.cmm.nms.service.dao.TodoTargetDAO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoTargetServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("todoTargetService")
public class TodoTargetServiceImpl extends HService implements TodoTargetService {

    @Resource(name="todoTargetDAO")
    TodoTargetDAO todoTargetDAO;

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoTargetService#insertTodoTarget(chn.bhmc.dms.cmm.nms.vo.TodoTargetVO)
     */
    @Override
    public int insertTodoTarget(TodoTargetVO todoTargetVO) throws Exception {

        TodoTargetVO obj = selectTodoTargetByKey(
                todoTargetVO.getDlrCd(),
                todoTargetVO.getTodoPolicyId(),
                todoTargetVO.getRefTp(),
                todoTargetVO.getRefId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return todoTargetDAO.insertTodoTarget(todoTargetVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoTargetService#deleteTodoTarget(chn.bhmc.dms.cmm.nms.vo.TodoTargetVO)
     */
    @Override
    public int deleteTodoTarget(TodoTargetVO todoTargetVO) throws Exception {
        return todoTargetDAO.deleteTodoTarget(todoTargetVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoTargetService#selectTodoTargetByKey(java.lang.String, java.lang.String)
     */
    @Override
    public TodoTargetVO selectTodoTargetByKey(
            String dlrCd,
            String todoPolicyId,
            String refTp,
            String refId)
            throws Exception {
        return todoTargetDAO.selectTodoTargetByKey(dlrCd, todoPolicyId, refTp, refId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoTargetService#multiTodoTargets(chn.bhmc.dms.cmm.nms.vo.TodoTargetSaveVO)
     */
    @Override
    public void multiTodoTargets(TodoTargetSaveVO todoTargetSaveVO) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(TodoTargetVO todoTargetVO : todoTargetSaveVO.getInsertList()){
            todoTargetVO.setDlrCd(dlrCd);
            todoTargetVO.setRegUsrId(userId);
            insertTodoTarget(todoTargetVO);
        }

        for(TodoTargetVO todoTargetVO : todoTargetSaveVO.getDeleteList()){
            todoTargetVO.setDlrCd(dlrCd);
            deleteTodoTarget(todoTargetVO);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoTargetService#selectTodoTargetsByCondition(chn.bhmc.dms.cmm.nms.vo.TodoTargetSearchVO)
     */
    @Override
    public List<TodoTargetVO> selectTodoTargetsByCondition(TodoTargetSearchVO searchVO)
            throws Exception {
        return todoTargetDAO.selectTodoTargetsByCondition(searchVO);
    }
}
