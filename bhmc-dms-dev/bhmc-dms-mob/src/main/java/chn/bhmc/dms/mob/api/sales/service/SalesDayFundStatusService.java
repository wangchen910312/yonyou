package chn.bhmc.dms.mob.api.sales.service;

import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusViewVO;





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

public interface SalesDayFundStatusService {

 
    /**
     * 일 자금현황을 불러온다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public DayFundStatusViewVO selectDayFundStatusByCondition(DayFundStatusSearchVO searchVO) throws Exception;
}
