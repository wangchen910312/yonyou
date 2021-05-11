package chn.bhmc.dms.sal.mst.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.mst.service.WeeklyScheduleService;
import chn.bhmc.dms.sal.mst.service.dao.WeeklyScheduleDAO;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleDetVO;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleSearchVO;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WeeklyScheduleImpl.java
 * @Description : 주간계획 Impl
 * @author Bong
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.       Bong                최초 생성
 * </pre>
 */

@Service("weeklyScheduleService")
public class WeeklyScheduleServiceImpl extends HService implements WeeklyScheduleService{

    @Resource(name="weeklyScheduleDAO")
    WeeklyScheduleDAO weeklyScheduleDAO;

    @Override
    public List<WeeklyScheduleVO> selectWeeklyScheduleCondition(WeeklyScheduleSearchVO searchVO) throws Exception {
        return weeklyScheduleDAO.selectWeeklyScheduleCondition(searchVO);
    }

    @Override
    public int selectWeeklyScheduleConditionCnt(WeeklyScheduleSearchVO searchVO)  throws Exception {
        return weeklyScheduleDAO.selectWeeklyScheduleConditionCnt(searchVO);
    }


    @Override
    public List<WeeklyScheduleDetVO> selectWeeklyScheduleDetCondition(WeeklyScheduleVO searchVO) throws Exception {
        return weeklyScheduleDAO.selectWeeklyScheduleDetCondition(searchVO);
    }

    @Override
    public int selectWeeklyScheduleDetConditionCnt(WeeklyScheduleVO searchVO)  throws Exception {
        return weeklyScheduleDAO.selectWeeklyScheduleDetConditionCnt(searchVO);
    }


}
