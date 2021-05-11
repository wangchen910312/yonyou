package chn.bhmc.dms.sal.mst.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleDetVO;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleSearchVO;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WeeklyScheduleDAO.java
 * @Description : 주간계획 DAO
 * @author 유승봉
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.       Bong                최초 생성
 * </pre>
 */

@Mapper("weeklyScheduleDAO")
public interface WeeklyScheduleDAO {

   /**
    * Searching Order Grade Condition.
    */
   public List<WeeklyScheduleVO> selectWeeklyScheduleCondition(WeeklyScheduleSearchVO searchVO);

   /**
    *  Counting of Order Grade Condition.
    */
   public int selectWeeklyScheduleConditionCnt(WeeklyScheduleSearchVO searchVO);

   /**
    * Searching Order Grade Condition.
    */
   public List<WeeklyScheduleDetVO> selectWeeklyScheduleDetCondition(WeeklyScheduleVO searchVO);

   /**
    *  Counting of Order Grade Condition.
    */
   public int selectWeeklyScheduleDetConditionCnt(WeeklyScheduleVO searchVO);

}
