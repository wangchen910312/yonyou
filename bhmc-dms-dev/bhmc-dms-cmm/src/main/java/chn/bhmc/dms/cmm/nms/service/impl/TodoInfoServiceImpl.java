package chn.bhmc.dms.cmm.nms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.TodoPolicyService;
import chn.bhmc.dms.cmm.nms.service.dao.TodoInfoDAO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoSearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicyVO;

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
@Service("todoInfoService")
public class TodoInfoServiceImpl extends HService implements TodoInfoService {
	
	@Resource(name="todoPolicyService")
	TodoPolicyService todoPolicyService;

    @Resource(name="todoInfoDAO")
    TodoInfoDAO todoInfoDAO;

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoInfoService#insertTodoInfo(chn.bhmc.dms.cmm.nms.vo.TodoInfoVO)
     */
    @Override
    public int insertTodoInfo(TodoInfoVO todoInfoVO) throws Exception {
    	TodoPolicyVO todoPolicyVO = todoPolicyService.selectTodoPolicyByKey(todoInfoVO.getTodoPolicyId());
    	
    	//To-do 정책 정보가 없다면 예외를 발생한다.
        if(todoPolicyVO == null){
            throw processException("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.todoPolicyId", null, LocaleContextHolder.getLocale())});
        }
        
        //To-do 정책 사용여부가 'Y'가 아닌경우
        if(!"Y".equals(todoPolicyVO.getUseYn())){
        	return 0;
        }
    	
    	
        //Todo 정보를 등록한다.
        int cnt = todoInfoDAO.insertTodoInfo(todoInfoVO);

        //Todo 추가 사용자를 등록한다.
        if(todoInfoVO.getAppendUsers() != null && todoInfoVO.getAppendUsers().size() > 0){
            int todoNo = todoInfoVO.getTodoNo();
            for(TodoInfoAppendUserVO vo : todoInfoVO.getAppendUsers()){
                vo.setTodoNo(todoNo);
                todoInfoDAO.insertTodoInfoAppendUser(vo);
            }
        }

        return cnt;
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoInfoService#deleteTodoInfo(int)
     */
    @Override
    public int deleteTodoInfo(int todoNo) throws Exception {

        //Todo 추가 사용자를 삭제한다.
        todoInfoDAO.deleteTodoInfoAppendUser(todoNo);

        //Todo 정보를 삭제한다.
        return todoInfoDAO.deleteTodoInfo(todoNo);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoInfoService#updateTodoInfoOpen(int, java.lang.String)
     */
    @Override
    public int updateTodoInfoOpen(int todoNo, String openUsrId) throws Exception {
        return todoInfoDAO.updateTodoInfoOpen(todoNo, openUsrId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoInfoService#updateTodoInfoHndl(int, java.lang.String)
     */
    @Override
    public int updateTodoInfoHndl(int todoNo, String hndlUsrId) throws Exception {
        //처리완료 시 미확인 Todo인 경우 확인 으로 변경 처리 한다.
        todoInfoDAO.updateTodoInfoOpen(todoNo, hndlUsrId);
        return todoInfoDAO.updateTodoInfoHndl(todoNo, hndlUsrId);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoInfoService#updateTodoInfoHndl(List<Integer>, java.lang.String)
     */
    @Override
    public int updateTodoInfoHndl(List<Integer> todoNos, String hndlUsrId) throws Exception {
        int result = 0;
        for(int todoNo : todoNos){
            result += updateTodoInfoHndl(todoNo, hndlUsrId);
        }
        return result;
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoInfoService#selectTodoInfoByKey(int)
     */
    @Override
    public TodoInfoVO selectTodoInfoByKey(int todoNo) throws Exception {
        return todoInfoDAO.selectTodoInfoByKey(todoNo);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoInfoService#selectTodoInfosByCondition(chn.bhmc.dms.cmm.nms.vo.TodoInfoSearchVO)
     */
    @Override
    public List<TodoInfoVO> selectTodoInfosByCondition(TodoInfoSearchVO searchVO) throws Exception {
        return todoInfoDAO.selectTodoInfosByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.nms.service.TodoInfoService#selectTodoInfosByConditionCnt(chn.bhmc.dms.cmm.nms.vo.TodoInfoSearchVO)
     */
    @Override
    public int selectTodoInfosByConditionCnt(TodoInfoSearchVO searchVO) throws Exception {
        return todoInfoDAO.selectTodoInfosByConditionCnt(searchVO);
    }

}
