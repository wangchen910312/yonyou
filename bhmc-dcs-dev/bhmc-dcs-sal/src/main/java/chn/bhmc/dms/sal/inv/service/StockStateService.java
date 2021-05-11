package chn.bhmc.dms.sal.inv.service;

import java.util.List;

import chn.bhmc.dms.sal.inv.vo.StockStateSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStateVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockStateService.java
 * @Description : 재고상태관리 서비스
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

public interface StockStateService {

    /**
     * 재고상태관리 조회
     */
    public int selectStockStatesByConditionCnt(StockStateSearchVO searchVO) throws Exception;
    public List<StockStateVO> selectStockStatesByCondition(StockStateSearchVO searchVO) throws Exception;

    /**
     * 재고상태관리 상세 조회
     */
    public int selectStockStateSubsByConditionCnt(StockStateSearchVO searchVO) throws Exception;
    public List<StockStateVO> selectStockStateSubsByCondition(StockStateSearchVO searchVO) throws Exception;

    /**
     * 재무상태관리 상세 유형들을 저장
     */
    public int multiStockStates(StockStateSaveVO saveVO) throws Exception;

}