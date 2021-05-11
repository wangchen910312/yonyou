package chn.bhmc.dms.cmm.nms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.TodoPolicyService;
import chn.bhmc.dms.cmm.nms.service.dao.TodoPolicyDAO;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicySaveVO;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicySearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicyVO;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoPolicyServiceImpl.java
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
@Service("todoPolicyService")
public class TodoPolicyServiceImpl extends HService implements TodoPolicyService {

    @Resource(name="todoPolicyDAO")
    TodoPolicyDAO todoPolicyDAO;

    @Resource(name="todoPolicyIdGenService")
    EgovIdGnrService todoPolicyIdGenService;


    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoPolicyService#insertTodoPolicy(chn.bhmc.dms.cmm.nms.vo.TodoPolicyVO)
     */
    @Override
    public int insertTodoPolicy(TodoPolicyVO todoPolicyVO) throws Exception {
        todoPolicyVO.setTodoPolicyId(todoPolicyIdGenService.getNextStringId());
        return todoPolicyDAO.insertTodoPolicy(todoPolicyVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoPolicyService#updateTodoPolicy(chn.bhmc.dms.cmm.nms.vo.TodoPolicyVO)
     */
    @Override
    public int updateTodoPolicy(TodoPolicyVO todoPolicyVO) throws Exception {
        return todoPolicyDAO.updateTodoPolicy(todoPolicyVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoPolicyService#deleteTodoPolicy(chn.bhmc.dms.cmm.nms.vo.TodoPolicyVO)
     */
    @Override
    public int deleteTodoPolicy(TodoPolicyVO todoPolicyVO) throws Exception {
        return todoPolicyDAO.deleteTodoPolicy(todoPolicyVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoPolicyService#selectTodoPolicyByKey(java.lang.String, java.lang.String)
     */
    @Override
    public TodoPolicyVO selectTodoPolicyByKey(String todoPolicyId)
            throws Exception {
        return todoPolicyDAO.selectTodoPolicyByKey(todoPolicyId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoPolicyService#multiTodoPolicys(chn.bhmc.dms.cmm.nms.vo.TodoPolicySaveVO)
     */
    @Override
    public void multiTodoPolicies(TodoPolicySaveVO todoPolicySaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(TodoPolicyVO todoPolicyVO : todoPolicySaveVO.getInsertList()){
            todoPolicyVO.setRegUsrId(userId);
            insertTodoPolicy(todoPolicyVO);
        }

        for(TodoPolicyVO todoPolicyVO : todoPolicySaveVO.getUpdateList()){
            todoPolicyVO.setUpdtUsrId(userId);
            updateTodoPolicy(todoPolicyVO);
        }

        for(TodoPolicyVO todoPolicyVO : todoPolicySaveVO.getDeleteList()){
            deleteTodoPolicy(todoPolicyVO);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoPolicyService#selectTodoPoliciesByCondition(chn.bhmc.dms.cmm.nms.vo.TodoPolicySearchVO)
     */
    @Override
    public List<TodoPolicyVO> selectTodoPoliciesByCondition(TodoPolicySearchVO searchVO)
            throws Exception {
        return todoPolicyDAO.selectTodoPoliciesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoPolicyService#selectTodoPoliciesByConditionCnt(chn.bhmc.dms.cmm.nms.vo.TodoPolicySearchVO)
     */
    @Override
    public int selectTodoPoliciesByConditionCnt(TodoPolicySearchVO searchVO) throws Exception {
        return todoPolicyDAO.selectTodoPoliciesByConditionCnt(searchVO);
    }

}
