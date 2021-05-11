package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.HolidayService;
import chn.bhmc.dms.cmm.sci.service.dao.HolidayDAO;
import chn.bhmc.dms.cmm.sci.vo.HolidaySaveVO;
import chn.bhmc.dms.cmm.sci.vo.HolidaySearchVO;
import chn.bhmc.dms.cmm.sci.vo.HolidayVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : HolidayServiceImpl.java
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

@Service("holidayService")
public class HolidayServiceImpl extends HService implements HolidayService {
    /**
     * 휴일 정보 DAO
     */
    @Resource(name = "holidayDAO")
    HolidayDAO holidayDAO;

    @Override
    public int insertHoliday(HolidayVO holidayVO) throws Exception {
        return holidayDAO.insertHoliday(holidayVO);
    }

    @Override
    public int updateHoliday(HolidayVO holidayVO) throws Exception {
        return holidayDAO.updateHoliday(holidayVO);
    }

    @Override
    public int deleteHoliday(HolidayVO holidayVO) throws Exception {
        return holidayDAO.deleteHoliday(holidayVO);
    }

    @Override
    public List<HolidayVO> selectHolidayByCondition(HolidaySearchVO holidaySearchVO) throws Exception {
        return holidayDAO.selectHolidayByCondition(holidaySearchVO);
    }

    @Override
    public int selectHolidayByConditionCnt(HolidaySearchVO holidaySearchVO) throws Exception {
        return holidayDAO.selectHolidayByConditionCnt(holidaySearchVO);
    }

    /**
     * 휴일 정보를 등록/수정/삭제 처리한다.
     * @param calendarInfoSaveVO
     */
    @Override
    public void multiHoliday(HolidaySaveVO holidaySaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(HolidayVO holidayVO : holidaySaveVO.getInsertList()){
            holidayVO.setRegUsrId(userId);
            holidayVO.setUpdtUsrId(userId);

            this.insertHoliday(holidayVO);
        }

        for(HolidayVO holidayVO : holidaySaveVO.getUpdateList()){
            holidayVO.setUpdtUsrId(userId);

            this.updateHoliday(holidayVO);
        }

        for(HolidayVO holidayVO : holidaySaveVO.getDeleteList()){
            this.deleteHoliday(holidayVO);
        }
    }
}