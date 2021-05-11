package chn.bhmc.dms.sal.inv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inv.vo.StockStrategySearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStrategyVO;

/**
 *
 * @ClassName   : StockStrategyDAO
 * @Description : 전략출고관리 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("stockStrategyDAO")
public interface StockStrategyDAO {

    /**
     * 조회 조건에 해당하는 재고상태관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStrategySearchVO
     * @return
     */
    public int selectStockStrategysByConditionCnt(StockStrategySearchVO searchVO) throws Exception;
    /**
     * 조회 조건에 해당하는 재고상태관리 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStrategySearchVO
     * @return 조회 목록
     */
    public List<StockStrategyVO> selectStockStrategysByCondition(StockStrategySearchVO searchVO) throws Exception;
    

    /**
     * 전략출고 취소
     * @param saveVO
     * @return
     */
    public int updateCarStrStat(StockStrategyVO saveVO) throws Exception;
    public int cancelStockStrategy(StockStrategyVO saveVO) throws Exception;

}