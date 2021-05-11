package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.TaskSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskVO;

/**
 * 직무 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface TaskService {

    /**
     * 직무 정보를 등록한다.
     * @param taskVO - 등록할 정보가 담긴 TaskVO
     * @return 등록된 목록수
     */
    public int insertTask(TaskVO taskVO) throws Exception;

    /**
     * 직무 정보를 수정한다.
     * @param taskVO - 수정할 정보가 담긴 TaskVO
     * @return 수정된 목록수
     */
    public int updateTask(TaskVO taskVO) throws Exception;

    /**
     * 직무 정보를 삭제한다.
     * @param taskVO - 삭제할 정보가 담긴 TaskVO
     * @return 삭제된 목록수
     */
    public int deleteTask(TaskVO taskVO) throws Exception;

    /**
     * 직무 정보를 등록/수정/삭제 처리한다.
     * @param taskSaveVO
     */
    public void multiTasks(TaskSaveVO taskSaveVO) throws Exception;

    /**
     * Key에 해당하는 직무 정보를 조회한다.
     * @param cmpTp 회사구분 '10':DCS(본사), '20':DMS(딜러)
     * @param tskCd 직무코드
     * @return 조회한 직무 정보
     */
    public TaskVO selectTaskByKey(String cmpTp, String tskCd) throws Exception;

    /**
     * 조회 조건에 해당하는 직무 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 TaskSearchVO
     * @return 조회 목록
     */
    public List<TaskVO> selectTasksByCondition(TaskSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 직무 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 TaskSearchVO
     * @return
     */
    public int selectTasksByConditionCnt(TaskSearchVO searchVO) throws Exception;
}
