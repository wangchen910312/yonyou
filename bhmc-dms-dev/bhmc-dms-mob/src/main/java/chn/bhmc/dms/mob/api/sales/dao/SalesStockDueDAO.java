package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.StockDueSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StockDueVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockDueDAO
 * @Description : 재고실사 DAO
 * @author Jin Suk Kim
 * @since 2016. 08. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.08.04     Jin Suk Kim          최초 생성
 * </pre>
 */

@Mapper("SalesStockDueDAO")
public interface SalesStockDueDAO {

    /**
     * 재고실사 내역 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectStockDueDetailListsByConditionCnt(StockDueSearchVO searchVO) throws Exception;

    /**
     * 재고실사 내역 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<StockDueVO> selectStockDueDetailListsByCondition(StockDueSearchVO searchVO) throws Exception;


}