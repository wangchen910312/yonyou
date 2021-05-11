package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.BayCalendarSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayCalendarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayCalendarDAO.java
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
@Mapper("bayCalendarDAO")
public interface BayCalendarDAO {

    /**
     * Bay Calendar 관리 목록 데이터 갯수를 조회한다.
     *
     * @param searchVO - 조회조건이 포함된 BayCalendarSearchVO
     * @return 관리 목록 데이터 갯수
     * @throws Exception
     */
    public int selectBayCalendarMainsByConditionCnt(BayCalendarSearchVO searchVO) throws Exception;

    /**
     * Bay Calendar 관리 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포함된 BayCalendarSearchVO
     * @return 관리 목록 데이터
     * @throws Exception
     */
    public List<BayCalendarVO> selectBayCalendarMainsByCondition(BayCalendarSearchVO searchVO) throws Exception;

    /**
     * Bay Calendar 정보를 등록한다. 
     *
     * @param saveVO - 등록목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    public int insertBayCalendar(BayCalendarVO bayVO)throws Exception;

    /**
     * Bay Calendar  수정 한다. 
     *
     * @param saveVO - 수정 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    public int updateBayCalendar(BayCalendarVO bayVO) throws Exception;

    /**
     * 
     * Bay Calendar 등록시 중복 체크한다.
     *
     * @param bayVO
     * @return
     * @throws Exception
     */
    public int selectBayCalendarByKeyCnt(BayCalendarVO bayVO)throws Exception;

    /**
     * Bay Calendar 정보를 삭제한다. 
     *
     * @param saveVO - 삭제 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    public int deleteBayCalendar(BayCalendarVO bayVO) throws Exception;

}
