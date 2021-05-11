package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.FundStatusSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusVO;






/**
 * 자금현황
 *
 * @author Kim Jin Suk
 * @since 2016. 8. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.08.22         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface SalesFundStatusService {

    /**
     * 자금현황 월별 내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectFundStatusByConditionCnt(FundStatusSearchVO searchVO) throws Exception;
    public List<FundStatusVO> selectFundStatusByCondition(FundStatusSearchVO searchVO) throws Exception;

    /**
     * 자금현황 일자별 내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
   
    public List<FundStatusVO> selectFundStatusDaysByCondition(FundStatusSearchVO searchVO) throws Exception;

    /**
     * 금일 날짜 자금현황을 eai에서 불러온다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<FundStatusVO> selectNowDayFundStatusEaiSearch(FundStatusSearchVO searchVO) throws Exception;
}
