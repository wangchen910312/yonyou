package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CalendarInfoService;
import chn.bhmc.dms.cmm.sci.service.dao.CalendarInfoDAO;
import chn.bhmc.dms.cmm.sci.vo.CalendarInfoSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CalendarInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CalendarInfoVO;
import chn.bhmc.dms.cmm.sci.vo.DeliveryDateSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DeliveryDateVO;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalendarInfoServiceImpl.java
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

@Service("calendarInfoService")
public class CalendarInfoServiceImpl extends HService implements CalendarInfoService {
    /**
     * 달력 정보 DAO
     */
    @Resource(name = "calendarInfoDAO")
    CalendarInfoDAO calendarInfoDAO;

    @Resource(name="calendarIdgenService")
    EgovIdGnrService calendarIdgenService;

    @Override
    public int insertCalendarInfo(CalendarInfoVO calendarInfoVO) throws Exception {
        return calendarInfoDAO.insertCalendarInfo(calendarInfoVO);
    }

    @Override
    public int updateCalendarInfo(CalendarInfoVO calendarInfoVO) throws Exception {
        return calendarInfoDAO.updateCalendarInfo(calendarInfoVO);
    }

    @Override
    public int deleteCalendarInfo(CalendarInfoVO calendarInfoVO) throws Exception {
        return calendarInfoDAO.deleteCalendarInfo(calendarInfoVO);
    }

    @Override
    public DeliveryDateVO selectDeliveryByKey(DeliveryDateSearchVO deliveryDateSearchVO) throws Exception {
        deliveryDateSearchVO.setLastIndex(deliveryDateSearchVO.getsDelayDay());
        deliveryDateSearchVO.setFirstIndex(deliveryDateSearchVO.getsDelayDay() - 1);

        return calendarInfoDAO.selectDeliveryByKey(deliveryDateSearchVO);
    }

    @Override
    public List<CalendarInfoVO> selectCalendarInfoByCondition(CalendarInfoSearchVO calendarInfoSearchVO)
            throws Exception {
        return calendarInfoDAO.selectCalendarInfoByCondition(calendarInfoSearchVO);
    }

    @Override
    public int selectCalendarInfoByConditionCnt(CalendarInfoSearchVO calendarInfoSearchVO) throws Exception {
        return calendarInfoDAO.selectCalendarInfoByConditionCnt(calendarInfoSearchVO);
    }

    /**
     * 달력 정보를 등록/수정/삭제 처리한다.
     * @param calendarInfoSaveVO
     */
    @Override
    public void multiCalendarInfo(CalendarInfoSaveVO calendarInfoSaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CalendarInfoVO calendarInfoVO : calendarInfoSaveVO.getInsertList()){
            calendarInfoVO.setRegUsrId(userId);
            calendarInfoVO.setUpdtUsrId(userId);

            calendarInfoVO.setCalendarId(calendarIdgenService.getNextStringId());

            this.insertCalendarInfo(calendarInfoVO);
        }

        for(CalendarInfoVO calendarInfoVO : calendarInfoSaveVO.getUpdateList()){
            calendarInfoVO.setUpdtUsrId(userId);

            this.updateCalendarInfo(calendarInfoVO);
        }

        for(CalendarInfoVO calendarInfoVO : calendarInfoSaveVO.getDeleteList()){
            this.deleteCalendarInfo(calendarInfoVO);
        }
    }
}