package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.ro.vo.WorkPauseSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkPauseVO;

/**
 * <pre>
 * 작업중지 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : WorkPauseDAO.java
 * @Description : 작업중지 DAO
 * @author Yin Xueyuan
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("workPauseDAO")
public interface WorkPauseDAO {

    /**
     * 작업중지 정보를 등록한다.
     * @param workPauseVO - 등록할 정보가 담긴 WorkPauseVO
     * @return 등록된 목록수
     */
    public int insertWorkPause(WorkPauseVO workPauseVO);

    /**
     * 작업중지 정보를 수정한다.
     * @param workPauseVO - 수정할 정보가 담긴 WorkPauseVO
     * @return 수정된 목록수
     */
    public int updateWorkPause(WorkPauseVO workPauseVO);

    /**
     * 작업중지 정보를 삭제한다.
     * @param workPauseVO - 삭제할 정보가 담긴 WorkPauseVO
     * @return 삭제된 목록수
     */
    public int deleteWorkPause(WorkPauseVO workPauseVO);

    /**
     * 조회 조건에 해당하는 작업중지 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkPauseSearchVO
     * @return 조회 목록
     */
    public List<WorkPauseVO> selectWorkPauseByCondition(WorkPauseSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 작업중지 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkPauseSearchVO
     * @return 조회 목록
     */
    public List<WorkPauseVO> selectWorkPauseHistByCondition(WorkPauseSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 작업중지 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkPauseSearchVO
     * @return
     */
    public int selectWorkPauseByConditionCnt(WorkPauseSearchVO searchVO);

     /**
     * 조회 조건에 해당하는 작업중지 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkPauseSearchVO
     * @return 조회 목록
     */
    public WorkPauseVO selectWorkPauseByKey(WorkPauseSearchVO searchVO);


    /**
     * 임률 코드 별 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<WorkPauseVO> selectRates(WorkPauseSearchVO searchVO)throws Exception;

}
