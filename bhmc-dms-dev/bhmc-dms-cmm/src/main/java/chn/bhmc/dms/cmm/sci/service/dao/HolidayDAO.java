package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.HolidaySearchVO;
import chn.bhmc.dms.cmm.sci.vo.HolidayVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : HolidayDAO.java
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

@Mapper("holidayDAO")
public interface HolidayDAO {
    public int insertHoliday(HolidayVO holidayVO);

    public int updateHoliday(HolidayVO holidayVO);

    public int deleteHoliday(HolidayVO holidayVO);

    public List<HolidayVO> selectHolidayByCondition(HolidaySearchVO holidaySearchVO);

    public int selectHolidayByConditionCnt(HolidaySearchVO holidaySearchVO);
}