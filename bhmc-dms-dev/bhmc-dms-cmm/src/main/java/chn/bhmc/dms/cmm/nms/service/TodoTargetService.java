package chn.bhmc.dms.cmm.nms.service;

import java.util.List;

import chn.bhmc.dms.cmm.nms.vo.TodoTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetVO;

/**
 * To-do 정책 수신대상 관리 서비스
 *
 * @ClassName   : TodoTargetService.java
 * @Description : To-do 정책 수신대상을 관리한다.
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

public interface TodoTargetService {

    /**
     * To-do 정책 수신대상 정보를 등록한다.
     * @param todoTargetVO - 등록할 정보가 담긴 TodoTargetVO
     * @return 등록된 목록수
     */
    public int insertTodoTarget(TodoTargetVO todoTargetVO) throws Exception;

    /**
     * To-do 정책 수신대상 정보를 삭제한다.
     * @param todoTargetVO - 삭제할 정보가 담긴 TodoTargetVO
     * @return 삭제된 목록수
     */
    public int deleteTodoTarget(TodoTargetVO todoTargetVO) throws Exception;

    /**
     * Key에 해당하는 To-do 정책 수신대상 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param todoPolicyId - To-do 정책 수신대상 ID
     * @param refTp - 참조유형 R:역할, U:사용자
     * @param refId - 참조ID
     * @return 조회한 To-do 정책 수신대상 정보
     */
    public TodoTargetVO selectTodoTargetByKey(
            String dlrCd,
            String todoPolicyId,
            String refTp,
            String refId) throws Exception;

    /**
     * To-do 정책 수신대상 정보를 등록/수정/삭제 처리한다.
     * @param todoTargetSaveVO
     */
    public void multiTodoTargets(TodoTargetSaveVO todoTargetSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 To-do 정책 수신대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoTargetSearchVO
     * @return 조회 목록
     */
    public List<TodoTargetVO> selectTodoTargetsByCondition(TodoTargetSearchVO searchVO) throws Exception;

}
