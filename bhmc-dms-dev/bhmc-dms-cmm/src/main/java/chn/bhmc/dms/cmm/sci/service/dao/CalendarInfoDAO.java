package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.CalendarInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CalendarInfoVO;
import chn.bhmc.dms.cmm.sci.vo.DeliveryDateSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DeliveryDateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalendarInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Mapper("calendarInfoDAO")
public interface CalendarInfoDAO {
    public int insertCalendarInfo(CalendarInfoVO calendarInfoVO);

    public int updateCalendarInfo(CalendarInfoVO calendarInfoVO);

    public int deleteCalendarInfo(CalendarInfoVO calendarInfoVO);

    public DeliveryDateVO selectDeliveryByKey(DeliveryDateSearchVO deliveryDateSearchVO);

    public List<CalendarInfoVO> selectCalendarInfoByCondition(CalendarInfoSearchVO calendarInfoSearchVO);

    public int selectCalendarInfoByConditionCnt(CalendarInfoSearchVO calendarInfoSearchVO);
}