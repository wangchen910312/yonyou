package chn.bhmc.dms.ser.ro.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.ro.vo.*;

/**
 * <pre>
 * 작업배정 관리 Service
 * </pre>
 *
 * @ClassName   : WorkAssignService.java
 * @Description : 작업배정 관리 Service
 * @author Yin Xueyuan
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.   Yin Xueyuan      최초 생성
 * </pre>
 */

public interface WorkAssignService {

    /**
     * 작업배정 정보를 등록한다.
     * @param workAssignVO - 등록할 정보가 담긴 WorkAssignVO
     * @return 등록된 목록수
     */
    public int insertWorkAssign(WorkAssignVO workAssignVO) throws Exception;

    /**
     * 작업배정 정보리스트를 등록한다.
     * @param saveVO - 등록할 정보가 담긴 saveVO
     * @return 등록된 목록수
     */
    public int insertWorkAssigns(List<WorkAssignVO> list) throws Exception;

    /**
     * 작업배정 정보를 수정한다.
     * @param workAssignVO - 수정할 정보가 담긴 WorkAssignVO
     * @return 수정된 목록수
     */
    public int updateWorkAssign(WorkAssignVO workAssignVO) throws Exception;

    /**
     * 작업배정 정보를 취소한다.
     * @param workAssignVO - 수정할 정보가 담긴 WorkAssignVO
     * @return 수정된 목록수
     */
    public int cancelWorkAssign(List<WorkAssignVO> list) throws Exception;

    /**
     * 작업배정 정보를 삭제한다. - 단건
     * @param workAssignVO - 삭제할 정보가 담긴 WorkAssignVO
     * @return 삭제된 목록수
     */
    public int deleteWorkAssign(WorkAssignVO vo) throws Exception;

    /**
     * 조회 조건에 해당하는 작업배정 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
     * @return 조회 목록
     */
    public List<WorkAssignVO> selectWorkAssignByCondition(WorkAssignSearchVO searchVO) throws Exception;

    /**
     * 배정 작업 체크 로직 정보
     * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
     * @return 조회 목록
     */
    public WorkAssignVO selectWorkAssignChkStatByKey(WorkAssignSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 작업배정 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
     * @return
     */
    public int selectWorkAssignByConditionCnt(WorkAssignSearchVO searchVO) throws Exception;

     /**
     * 조회 조건에 해당하는 임률관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
     * @return 조회 목록
     */
    public WorkAssignVO selectWorkAssignByKey(WorkAssignSearchVO searchVO) throws Exception;

    /**
     * 임률코드 정보를 등록/수정/삭제 처리한다.
     * @param rateMasterSaveVO
     */
    public void multiWorkAssigns(BaseSaveVO<WorkAssignVO> workAssignVO) throws Exception;

}
