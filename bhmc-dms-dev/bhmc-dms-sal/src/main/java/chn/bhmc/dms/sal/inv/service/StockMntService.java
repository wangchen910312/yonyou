package chn.bhmc.dms.sal.inv.service;

import java.util.List;

import chn.bhmc.dms.sal.inv.vo.StockMntSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockMntSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockMntVO;


/**
 * @ClassName   : StockMntService
 * @Description : 재고관리 서비스
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

public interface StockMntService {

    /**
     * 재고관리 조회
     */
    public int selectStockMntsByConditionCnt(StockMntSearchVO searchVO) throws Exception;
    public List<StockMntVO> selectStockMntsByCondition(StockMntSearchVO searchVO) throws Exception;

    /**
     * 재무관리 유형 저장 저장
     */
    public int multiStockMnt(StockMntSaveVO saveVO) throws Exception;
    
    /**
     * 전략출고 신청 
     **/
    public int insertStockStrategyAsk(StockMntSaveVO saveVO) throws Exception;
    
    /**
     * 모바일 APP 그룹 재고관리 목록 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAppStockMntGroupsByConditionCnt(StockMntSearchVO searchVO) throws Exception;
    public List<StockMntVO> selectAppStockMntGroupsByCondition(StockMntSearchVO searchVO) throws Exception;
}