package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.CalendarInfoSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CalendarInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CalendarInfoVO;
import chn.bhmc.dms.cmm.sci.vo.DeliveryDateSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DeliveryDateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalendarInfoService.java
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

public interface CalendarInfoService {
    int insertCalendarInfo(CalendarInfoVO calendarInfoVO) throws Exception;

    int updateCalendarInfo(CalendarInfoVO calendarInfoVO) throws Exception;

    int deleteCalendarInfo(CalendarInfoVO calendarInfoVO) throws Exception;

    DeliveryDateVO selectDeliveryByKey(DeliveryDateSearchVO deliveryDateSearchVO) throws Exception;

    List<CalendarInfoVO> selectCalendarInfoByCondition(CalendarInfoSearchVO calendarInfoSearchVO) throws Exception;

    int selectCalendarInfoByConditionCnt(CalendarInfoSearchVO calendarInfoSearchVO) throws Exception;

    /**
     * 달력 정보를 등록/수정/삭제 처리한다.
     * @param calendarInfoSaveVO
     */
    void multiCalendarInfo(CalendarInfoSaveVO calendarInfoSaveVO) throws Exception;
}