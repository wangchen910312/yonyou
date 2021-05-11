package chn.bhmc.dms.ser.ro.service;

import java.util.List;

import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSaveVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessVO;

/**
 * <pre>
 * 작업진도관리 관리 Service
 * </pre>
 *
 * @ClassName   : WorkProcessService.java
 * @Description : 작업진도관리 관리 Service
 * @author Yin Xueyuan
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.   Yin Xueyuan      최초 생성
 * </pre>
 */

public interface WorkProcessService {

    /**
     * 작업진도관리 정보를 등록한다.
     * @param workProcessVO - 등록할 정보가 담긴 WorkProcessVO
     * @return 등록된 목록수
     */
    public String insertWorkProcess(WorkProcessVO workProcessVO) throws Exception;

    /**
     * 작업진도관리 정보리스트를 등록한다.
     * @param workProcessVO - 등록할 정보가 담긴 WorkProcessVO
     * @return 등록된 목록수
     */
    public int insertWorkProcesss(List<WorkProcessVO> list) throws Exception;

    /**
     * 작업진도관리 정보를 수정한다.
     * @param workProcessVO - 수정할 정보가 담긴 WorkProcessVO
     * @return 수정된 목록수
     */
    public int updateWorkProcess(WorkProcessVO workProcessVO) throws Exception;

    /**
     * 작업진도관리 정보를 삭제한다.
     * @param workProcessVO - 삭제할 정보가 담긴 WorkProcessVO
     * @return 삭제된 목록수
     */
    public int deleteWorkProcesss(List<WorkProcessVO> workProcessVO) throws Exception;

    /**
     * 조회 조건에 해당하는 작업진도관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return 조회 목록
     */
    public List<WorkProcessVO> selectWorkProcessByCondition(WorkProcessSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 작업진도관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return
     */
    public int selectWorkProcessByConditionCnt(WorkProcessSearchVO searchVO) throws Exception;

    /**
     * 정비 중지 관련 수정
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return
     */
    public void updatePauseWorkProcess(WorkProcessSaveVO saveVO) throws Exception;

     /**
     * 조회 조건에 해당하는 임률관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return 조회 목록
     */
    public WorkProcessVO selectWorkProcessByKey(WorkProcessSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 진도보드 리스트를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectWorkProcessBoardListByCondition(WorkProcessSearchVO searchVO) throws Exception;
    
    /**
     * 服务进度看版 贾明 2020-6-28
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RepairOrderVO> selectServiceProgressListByCondition(WorkProcessSearchVO searchVO) throws Exception;

    /**
     * 작업진도관리 정보를 수정한다.
     * @param workProcessVO - 수정할 정보가 담긴 WorkProcessVO
     * @return 수정된 목록수
     */
    public int insertRework(WorkProcessVO workProcessVO) throws Exception;

    /**
     * 수리조작기록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return 조회 목록
     */
    public List<WorkProcessVO> selectRepairHistory(WorkProcessSearchVO searchVO) throws Exception;
    /**
     * 根据工位号查询是否存在通道地址
     * @param bayNo
     * @return
     */
     public String selectFlagForExistChanel(String bayNo)throws Exception;
}
