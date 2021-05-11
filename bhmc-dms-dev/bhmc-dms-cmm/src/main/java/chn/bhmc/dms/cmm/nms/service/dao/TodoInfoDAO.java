package chn.bhmc.dms.cmm.nms.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoSearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;

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
@Mapper("todoInfoDAO")
public interface TodoInfoDAO {

    /**
     * Todo 정보를 등록한다.
     * @param todoInfoVO 등록할 Todo 정보
     * @throws Exception
     */
    public int insertTodoInfo(TodoInfoVO todoInfoVO);

    /**
     * Todo 추가 사용자를 등록한다.
     * @param todoInfoAppendUserVO 사용자 정보
     * @return
     */
    public int insertTodoInfoAppendUser(TodoInfoAppendUserVO todoInfoAppendUserVO);

    /**
     * Todo 번호에 해당하는 정보를 삭제한다.
     * @param todoNo Todo 번호
     * @return
     */
    public int deleteTodoInfo(int todoNo);

    /**
     * Todo번호에 해당하는 Todo 추가 사용자를 삭제한다.
     * @param todoNo
     * @return
     */
    public int deleteTodoInfoAppendUser(int todoNo);

    /**
     * Todo 확인여부를 확인 상태로 변경한다.
     * @param todoNo Todo 번호
     * @param openUsrId 확인자 ID
     * @return
     */
    public int updateTodoInfoOpen(@Param("todoNo") int todoNo, @Param("openUsrId") String openUsrId);

    /**
     * Todo 처리여부를 처리 상태로 변경한다.
     * @param todoNo Todo 번호
     * @param openUsrId 처리자 ID
     * @return
     */
    public int updateTodoInfoHndl(@Param("todoNo") int todoNo, @Param("hndlUsrId") String hndlUsrId);


    /**
     * Todo 번호에 해당하는 정보를 조회한다.
     * @param todoNo Todo 번호
     * @return
     */
    public TodoInfoVO selectTodoInfoByKey(int todoNo);

    /**
     * 조회 조건에 해당하는 Todo 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoInfoSearchVO
     * @return 조회 목록
     */
    public List<TodoInfoVO> selectTodoInfosByCondition(TodoInfoSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 Todo메세지 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoInfoSearchVO
     * @return
     */
    public int selectTodoInfosByConditionCnt(TodoInfoSearchVO searchVO);
}
