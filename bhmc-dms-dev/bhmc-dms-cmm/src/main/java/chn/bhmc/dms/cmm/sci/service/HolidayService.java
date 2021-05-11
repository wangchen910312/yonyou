package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.HolidaySaveVO;
import chn.bhmc.dms.cmm.sci.vo.HolidaySearchVO;
import chn.bhmc.dms.cmm.sci.vo.HolidayVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : HolidayService.java
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

public interface HolidayService {
    int insertHoliday(HolidayVO holidayVO) throws Exception;

    int updateHoliday(HolidayVO holidayVO) throws Exception;

    int deleteHoliday(HolidayVO holidayVO) throws Exception;

    List<HolidayVO> selectHolidayByCondition(HolidaySearchVO holidaySearchVO) throws Exception;

    int selectHolidayByConditionCnt(HolidaySearchVO holidaySearchVO) throws Exception;

    /**
     * 달력 정보를 등록/수정/삭제 처리한다.
     * @param calendarInfoSaveVO
     */
    void multiHoliday(HolidaySaveVO holidaySaveVO) throws Exception;
}