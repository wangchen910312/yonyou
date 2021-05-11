package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.WorkGroupDetailVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkGroupManageService.java
 * @Description : 소조관리 Service
 * @author KyungMok Kim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface WorkGroupManageService {

    /**
     * 조회 조건에 해당하는 소조관리 마스터 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public int selectWorkGroupMastersByConditionCnt(WorkGroupManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 소조관리 마스터 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public WorkGroupMasterVO selectWorkGroupMasterByKey(WorkGroupManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 소조관리 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public List<WorkGroupMasterVO> selectWorkGroupMastersByCondition(WorkGroupManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 소조관리 상세 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public int selectWorkGroupDetailsByConditionCnt(WorkGroupManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 소조관리 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public List<WorkGroupDetailVO> selectWorkGroupDetailsByCondition(WorkGroupManageSearchVO searchVO) throws Exception;

    /**
     * 소조마스터 정보를 등록/수정/삭제한다.
     * @param obj - 조회 조건을 포함하는 WorkGroupManageVO
     * @return 조회 목록
     */
    public void multiWorkGroupMasters(WorkGroupManageSaveVO saveVO) throws Exception;

    /**
     * 소조상세 정보를 등록/수정/삭제한다.
     * @param obj - 조회 조건을 포함하는 WorkGroupDetailVO
     * @return 조회 목록
     */
    public void multiWorkGroupDetails(WorkGroupManageSaveVO saveVO) throws Exception;
    
    /**
     * 소조상세 정보를 삭제한다.
     * @param obj - 조회 조건을 포함하는 WorkGroupDetailVO
     * @return 조회 목록
     */
    public void deleteWorkGroups(WorkGroupMasterVO workGroupMasterVO) throws Exception;

}
