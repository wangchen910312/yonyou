package chn.bhmc.dms.dply.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.dply.cmm.vo.JobScheduleExecHistVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleSearchVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JobScheduleDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     Cheol Man Oh     최초 생성
 * </pre>
 */

@Mapper("jobScheduleDAO")
public interface JobScheduleDAO {

    /**
     * 조회 조건에 해당하는 Job Schedule 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 JobScheduleSearchVO
     * @return 조회 목록
     */
    public List<JobScheduleVO> selectJobScheduleByCondition(JobScheduleSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 Job Schedule 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 JobScheduleSearchVO
     * @return
     */
    public int selectJobScheduleByConditionCnt(JobScheduleSearchVO searchVO);

    /**
     * Job Schedule 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertJobSchedule(JobScheduleVO saveVO) throws Exception;

    /**
     * Job Schedule 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateJobSchedule(JobScheduleVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Job Schedule 실행이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 JobScheduleSearchVO
     * @return 조회 목록
     */
    public List<JobScheduleExecHistVO> selectJobScheduleExecHistByCondition(JobScheduleSearchVO searchVO);



}
