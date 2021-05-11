package chn.bhmc.dms.cmm.nms.service;

import java.util.List;

import chn.bhmc.dms.cmm.nms.vo.TodoInfoSearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;

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
public interface TodoInfoService {

    /**
     * Todo 정보를 등록한다.
     * @param todoInfoVO 등록할 Todo 정보
     * @throws Exception
     */
    public int insertTodoInfo(TodoInfoVO todoInfoVO) throws Exception;

    /**
     * Todo 번호에 해당하는 정보를 삭제한다.
     * @param todoNo Todo 번호
     * @return
     */
    public int deleteTodoInfo(int todoNo) throws Exception;

    /**
     * Todo 확인여부를 확인 상태로 변경한다.
     * @param todoNo Todo 번호
     * @param openUsrId 확인자 ID
     * @return
     */
    public int updateTodoInfoOpen(int todoNo, String openUsrId) throws Exception;

    /**
     * Todo 처리여부를 처리 상태로 변경한다.
     * @param todoNo Todo 번호
     * @param openUsrId 처리자 ID
     * @return
     */
    public int updateTodoInfoHndl(int todoNo, String hndlUsrId) throws Exception;

    /**
     * Todo 처리여부를 처리 상태로 변경한다.
     * @param todoNos Todo 번호 목록
     * @param openUsrId 처리자 ID
     * @return
     */
    public int updateTodoInfoHndl(List<Integer> todoNos, String hndlUsrId) throws Exception;


    /**
     * Todo 번호에 해당하는 정보를 조회한다.
     * @param todoNo Todo 번호
     * @return
     */
    public TodoInfoVO selectTodoInfoByKey(int todoNo) throws Exception;

    /**
     * 조회 조건에 해당하는 Todo 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoInfoSearchVO
     * @return 조회 목록
     */
    public List<TodoInfoVO> selectTodoInfosByCondition(TodoInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Todo 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoInfoSearchVO
     * @return
     */
    public int selectTodoInfosByConditionCnt(TodoInfoSearchVO searchVO) throws Exception;
}
