package chn.bhmc.dms.sal.trm.service;

import java.util.List;

import chn.bhmc.dms.sal.trm.vo.DayFundStatusSearchVO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusVO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusViewVO;



/**
 * 일 자금현황
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface DayFundStatusService {

    //조회월의 마지막 일자를 구해옴
    public int selectDayFundStatusLastDaySearch(DayFundStatusVO searchVO) throws Exception;

    // 딜러자금현황의 일자 내역을 가져온다.
    public List<DayFundStatusVO> selectDayFundStatusDaysByCondition(DayFundStatusVO searchVO) throws Exception;

    /**
     * 일 자금현황을 불러온다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public DayFundStatusViewVO selectDayFundStatusByCondition(DayFundStatusSearchVO searchVO) throws Exception;
}
