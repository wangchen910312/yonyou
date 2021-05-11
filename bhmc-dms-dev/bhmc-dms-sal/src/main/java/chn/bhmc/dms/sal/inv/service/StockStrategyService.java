package chn.bhmc.dms.sal.inv.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockStrategySearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStrategyVO;


/**
 * @ClassName   : StockStrategyService
 * @Description : 전략출고관리 서비스
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

public interface StockStrategyService {

    /**
     * 전략출고관리 조회
     */
    public int selectStockStrategysByConditionCnt(StockStrategySearchVO searchVO) throws Exception;
    public List<StockStrategyVO> selectStockStrategysByCondition(StockStrategySearchVO searchVO) throws Exception;
    
    /**
     * 전략출고 신청 
     **/
    public int cancelStockStrategy(BaseSaveVO<StockStrategyVO> saveVO) throws Exception;
    
    /**
     * 출고관리 - 전략출고상태만 관리. (출고전용) 
     */
    public int stockStrategyStr(StockStrategyVO saveVO) throws Exception;
    
}