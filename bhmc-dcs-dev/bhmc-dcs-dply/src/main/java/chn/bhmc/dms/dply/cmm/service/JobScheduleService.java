package chn.bhmc.dms.dply.cmm.service;

import java.util.List;

import chn.bhmc.dms.dply.cmm.vo.JobScheduleExecHistVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleSaveVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleSearchVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JobScheduleService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheolman Man Oh
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     Cheolman Man Oh     최초 생성
 * </pre>
 */

public interface JobScheduleService {

    /**
     * 조회 조건에 해당하는 Job Schedule 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 JobScheduleSearchVO
     * @return 조회 목록
     */
    public List<JobScheduleVO> selectJobScheduleByCondition(JobScheduleSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Job Schedule 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 JobScheduleSearchVO
     * @return
     */
    public int selectJobScheduleByConditionCnt(JobScheduleSearchVO searchVO) throws Exception;

    /**
     * Job Schedule 신규 등록, 수정
     */
    public String multiJobSchedule(JobScheduleSaveVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Job Schedule 실행이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 JobScheduleSearchVO
     * @return 조회 목록
     */
    public List<JobScheduleExecHistVO> selectJobScheduleExecHistByCondition(JobScheduleSearchVO searchVO) throws Exception;


}
