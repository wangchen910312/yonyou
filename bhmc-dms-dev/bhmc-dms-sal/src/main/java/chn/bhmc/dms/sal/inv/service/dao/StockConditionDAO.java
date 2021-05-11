package chn.bhmc.dms.sal.inv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inv.vo.StockConditionVO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockConditionDAO
 * @Description : 재고현황 DAO
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

@Mapper("stockConditionDAO")
public interface StockConditionDAO {

    /**
     * 조회 조건에 해당하는 재고현황 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    public List<StockConditionVO> selectStockConditionsByCondition(StockStateSearchVO searchVO) throws Exception;

}