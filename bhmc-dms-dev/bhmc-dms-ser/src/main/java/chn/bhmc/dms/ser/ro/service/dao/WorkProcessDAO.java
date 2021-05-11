package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessVO;

/**
 * <pre>
 * 작업진도 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : WorkProcessDAO.java
 * @Description : 작업진도 DAO
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

@Mapper("workProcessDAO")
public interface WorkProcessDAO {

    /**
     * 작업진도 정보를 등록한다.
     * @param workProcessVO - 등록할 정보가 담긴 WorkProcessVO
     * @return 등록된 목록수
     */
    public int insertWorkProcess(WorkProcessVO workProcessVO);

    /**
     * 작업진도 정보를 수정한다.
     * @param workProcessVO - 수정할 정보가 담긴 WorkProcessVO
     * @return 수정된 목록수
     */
    public int updateWorkProcess(WorkProcessVO workProcessVO);

    /**
     * 작업진도 정보를 삭제한다.
     * @param workProcessVO - 삭제할 정보가 담긴 WorkProcessVO
     * @return 삭제된 목록수
     */
    public int deleteWorkProcess(WorkProcessVO workProcessVO);

    /**
     * 조회 조건에 해당하는 작업진도 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return 조회 목록
     */
    public List<WorkProcessVO> selectWorkProcessByCondition(WorkProcessSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 작업진도 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return
     */
    public int selectWorkProcessByConditionCnt(WorkProcessSearchVO searchVO);

     /**
     * 조회 조건에 해당하는 작업진도 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return 조회 목록
     */
    public WorkProcessVO selectWorkProcessByKey(WorkProcessSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 진도보드 리스트를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectWorkProcessBoardListByCondition(WorkProcessSearchVO searchVO);
   
    /**
     * 服务进度看版 贾明 2020-6-28
     * @param searchVO
     * @return
     */
    public List<RepairOrderVO> selectServiceProgressListByCondition(WorkProcessSearchVO searchVO);
    

    /**
     * 수리조작기록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkProcessSearchVO
     * @return 조회 목록
     */
    public List<WorkProcessVO> selectRepairHistory(WorkProcessSearchVO searchVO);


}
