package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.WorkGroupDetailVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkGroupManageDAO.java
 * @Description : 소조관리 DAO
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("workGroupManageDAO")
public interface WorkGroupManageDAO {

    /**
     * 조회 조건에 해당하는 소조관리 마스터 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public int selectWorkGroupMastersByConditionCnt(WorkGroupManageSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 소조관리 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public List<WorkGroupMasterVO> selectWorkGroupMastersByCondition(WorkGroupManageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 소조관리 마스터 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public WorkGroupMasterVO selectWorkGroupMasterByKey(WorkGroupManageSearchVO searchVO);

    /**
     * 소조관리 마스터 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 WorkGroupMasterVO
     * @return 등록된 목록수
     */
    public void insertWorkGroupMaster(WorkGroupMasterVO obj);

    /**
     * WorkGroup마스터 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 WorkGroupMasterVO
     * @return 수정된 목록수
     */
    public void updateWorkGroupMaster(WorkGroupMasterVO obj);

    /**
     * 소조관리 마스터 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 WorkGroupMasterVO
     * @return 삭제된 목록수
     */
    public void deleteWorkGroupMaster(WorkGroupMasterVO obj);

        /**
     * 조회 조건에 해당하는 소조관리 상세 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public int selectWorkGroupDetailsByConditionCnt(WorkGroupManageSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 소조관리 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkGroupManageSearchVO
     * @return 조회 목록
     */
    public List<WorkGroupDetailVO> selectWorkGroupDetailsByCondition(WorkGroupManageSearchVO searchVO);

    /**
     * 소조관리 상세 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 WorkGroupDetailVO
     * @return 조회 목록
     */
    public void insertWorkGroupDetail(WorkGroupDetailVO obj);

    /**
     * 소조관리 상세 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 WorkGroupDetailVO
     * @return 조회 목록
     */
    public void updateWorkGroupDetail(WorkGroupDetailVO obj);

    /**
     * 소조관리 상세 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 WorkGroupDetailVO
     * @return 조회 목록
     */
    public void deleteWorkGroupDetail(WorkGroupDetailVO obj);

}
