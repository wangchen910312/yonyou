package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.StockDueSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StockDueVO;




/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockDueService
 * @Description : 재고실사 서비스
 * @author Jin Suk Kim
 * @since 2016. 08. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface SalesStockDueService {

  
    /**
     * 재고실사 모바일 바코드로 상세 내역 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectStockDueDetailMobsByConditionCnt(StockDueSearchVO searchVO) throws Exception;

    /**
     * 재고실사 모바일 바코드로 상세 내역 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<StockDueVO> selectStockDueDetailMobsByCondition(StockDueSearchVO searchVO) throws Exception;


   
}