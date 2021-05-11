package chn.bhmc.dms.ser.svi.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.BayCalendarService;
import chn.bhmc.dms.ser.svi.service.dao.BayCalendarDAO;
import chn.bhmc.dms.ser.svi.vo.BayCalendarSaveVO;
import chn.bhmc.dms.ser.svi.vo.BayCalendarSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayCalendarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayCalendarServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("bayCalendarService")
public class BayCalendarServiceImpl extends HService implements BayCalendarService{

    @Resource(name="bayCalendarDAO")
    BayCalendarDAO bayCalendarDAO;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectBayCalendarMainsByConditionCnt(BayCalendarSearchVO searchVO) throws Exception {

        return bayCalendarDAO.selectBayCalendarMainsByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BayCalendarVO> selectBayCalendarMainsByCondition(BayCalendarSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return bayCalendarDAO.selectBayCalendarMainsByCondition(searchVO);
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public int selectBayCalendarByKeyCnt(BayCalendarVO bayVO) throws Exception {

        return bayCalendarDAO.selectBayCalendarByKeyCnt(bayVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void multiBayCalendars(BayCalendarSaveVO saveVO) throws Exception {

        String user_id = LoginUtil.getUserId();

        for(BayCalendarVO bayVO : saveVO.getInsertList()){

            // 예외시작과 종료시간에 예외일자  SET
            HashMap<String, Date> dateValue = setExcpDate(bayVO);
            bayVO.setExcpStartDt(dateValue.get("excpStartDt"));
            bayVO.setExcpEndDt(dateValue.get("excpEndDt"));

            bayVO.setRegUsrId(user_id);

            insertBayCalendar(bayVO);
        }

        for(BayCalendarVO bayVO : saveVO.getUpdateList()){

            // 예외일자에 시작시간과 종료시간을 더한후 SET
            HashMap<String, Date> dateValue = setExcpDate(bayVO);
            bayVO.setExcpStartDt(dateValue.get("excpStartDt"));
            bayVO.setExcpEndDt(dateValue.get("excpEndDt"));

            bayVO.setRegUsrId(user_id);

            updateBayCalendar(bayVO);
        }

        for(BayCalendarVO bayVO : saveVO.getDeleteList()){
            bayVO.setRegUsrId(user_id);
            deleteBayCalendar(bayVO);
        }

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int insertBayCalendar(BayCalendarVO bayVO) throws Exception {

        int resultCnt = selectBayCalendarByKeyCnt(bayVO);

        if( resultCnt > 0 ){

            throw processException("global.err.duplicate");
        }


        return bayCalendarDAO.insertBayCalendar(bayVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int updateBayCalendar(BayCalendarVO bayVO) throws Exception {
        
        int resultCnt = selectBayCalendarByKeyCnt(bayVO);

        if( resultCnt > 0 ){

            throw processException("global.err.duplicate");
        }

        return bayCalendarDAO.updateBayCalendar(bayVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int deleteBayCalendar(BayCalendarVO bayVO) throws Exception {

        return bayCalendarDAO.deleteBayCalendar(bayVO);
    }

    @SuppressWarnings("deprecation")
    public HashMap<String, Date> setExcpDate(BayCalendarVO bayVO) {

        HashMap<String, Date> map = new HashMap<String, Date>();

        Date excpStartDt = bayVO.getExcpStartDt();
        excpStartDt.setYear(bayVO.getMngDt().getYear());
        excpStartDt.setMonth(bayVO.getMngDt().getMonth());
        excpStartDt.setDate(bayVO.getMngDt().getDate());

        Date excpEndDt = bayVO.getExcpEndDt();
        excpEndDt.setYear(bayVO.getMngDt().getYear());
        excpEndDt.setMonth(bayVO.getMngDt().getMonth());
        excpEndDt.setDate(bayVO.getMngDt().getDate());

        map.put("excpStartDt", excpStartDt);
        map.put("excpEndDt", excpEndDt);

        return map;
    }

}
