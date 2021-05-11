package chn.bhmc.dms.mob.api.sales.service;


import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.StockMntSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StockMntVO;




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

public interface SalesStockMntService {

    /**
     * 재고관리 조회
     */
    public int selectStockMntsByConditionCnt(StockMntSearchVO searchVO) throws Exception;
    public List<StockMntVO> selectStockMntsByCondition(StockMntSearchVO searchVO) throws Exception;

    /**
     * 모바일 APP 그룹 재고관리 목록 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAppStockMntGroupsByConditionCnt(StockMntSearchVO searchVO) throws Exception;
    public List<StockMntVO> selectAppStockMntGroupsByCondition(StockMntSearchVO searchVO) throws Exception;
}