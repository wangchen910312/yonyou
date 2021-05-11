package chn.bhmc.dms.sal.inv.service;

import java.util.List;

import chn.bhmc.dms.sal.inv.vo.StockConditionVO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockConditionService
 * @Description : 재고현황 서비스
 * @author Jin Suk Kim
 * @since 2016. 3. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface StockConditionService {

    /**
     * 재고조회 조회
     */
    //public int selectStockConditionsByConditionCnt(StockStateSearchVO searchVO) throws Exception;
    public List<StockConditionVO> selectStockConditionsByCondition(StockStateSearchVO searchVO) throws Exception;

}