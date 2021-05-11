package chn.bhmc.dms.sal.mst.service;

import java.util.List;

import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleDetVO;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleSearchVO;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WeeklyScheduleService
 * @Description : 직책별 할인금액 관리 서비스
 * @author Bong
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.       Bong                최초 생성
 * </pre>
 */

public interface WeeklyScheduleService {

    public List<WeeklyScheduleVO> selectWeeklyScheduleCondition(WeeklyScheduleSearchVO searchVO) throws Exception;

    public int selectWeeklyScheduleConditionCnt(WeeklyScheduleSearchVO searchVO)  throws Exception;

    public List<WeeklyScheduleDetVO> selectWeeklyScheduleDetCondition(WeeklyScheduleVO searchVO) throws Exception;

    public int selectWeeklyScheduleDetConditionCnt(WeeklyScheduleVO searchVO)  throws Exception;

}
