package chn.bhmc.dms.cmm.nms.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.nms.vo.TodoTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoTargetDAO.java
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
@Mapper("todoTargetDAO")
public interface TodoTargetDAO {

    /**
     * To-do 정책 수신대상 정보를 등록한다.
     * @param todoTargetVO - 등록할 정보가 담긴 TodoTargetVO
     * @return 등록된 목록수
     */
    public int insertTodoTarget(TodoTargetVO todoTargetVO);

    /**
     * To-do 정책 수신대상 정보를 삭제한다.
     * @param todoTargetVO - 삭제할 정보가 담긴 TodoTargetVO
     * @return 삭제된 목록수
     */
    public int deleteTodoTarget(TodoTargetVO todoTargetVO);

    /**
     * Key에 해당하는 To-do 정책 수신대상 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param todoPolicyId - To-do 정책 수신대상 ID
     * @param refTp - 참조유형 R:역할, U:사용자
     * @param refId - 참조ID
     * @return 조회한 To-do 정책 수신대상 정보
     */
    public TodoTargetVO selectTodoTargetByKey(
            @Param("dlrCd") String dlrCd,
            @Param("todoPolicyId") String todoPolicyId,
            @Param("refTp") String refTp,
            @Param("refId") String refId);

    /**
     * 조회 조건에 해당하는 To-do 정책 수신대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoTargetSearchVO
     * @return 조회 목록
     */
    public List<TodoTargetVO> selectTodoTargetsByCondition(TodoTargetSearchVO searchVO);
}
