package chn.bhmc.dms.sal.inv.service;

import java.util.List;

import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStateVO;
import chn.bhmc.dms.sal.inv.vo.StockViewVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockViewService.java
 * @Description : 재고조회 서비스
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

public interface StockViewService {

    /**
     * 재고조회 조회
     */
    public int selectStockViewsByConditionCnt(StockStateSearchVO searchVO) throws Exception;
    public List<StockViewVO> selectStockViewsByCondition(StockStateSearchVO searchVO) throws Exception;

    /**
     * 재고조회 상세 조회
     */
    public int selectStockViewSubsByConditionCnt(StockStateSearchVO searchVO) throws Exception;
    public List<StockStateVO> selectStockViewSubsByCondition(StockStateSearchVO searchVO) throws Exception;

}