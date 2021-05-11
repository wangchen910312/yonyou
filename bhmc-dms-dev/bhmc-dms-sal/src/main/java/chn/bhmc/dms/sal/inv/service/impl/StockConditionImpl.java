package chn.bhmc.dms.sal.inv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.inv.service.StockConditionService;
import chn.bhmc.dms.sal.inv.service.dao.StockConditionDAO;
import chn.bhmc.dms.sal.inv.vo.StockConditionVO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockConditionServiceImpl
 * @Description : 재고현황
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.28          최초 생성
 * </pre>
 */

@Service("stockConditionService")
public class StockConditionImpl extends HService implements StockConditionService {

    /**
     * 재고조회 DAO 선언
     */
    @Resource(name="stockConditionDAO")
    StockConditionDAO stockConditionDAO;

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    //@Override
    //public int selectStockConditionsByConditionCnt(StockStateSearchVO searchVO) throws Exception{
    //    return stockConditionDAO.selectStockConditionsByConditionCnt(searchVO);
   //}
    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockConditionVO> selectStockConditionsByCondition(StockStateSearchVO searchVO) throws Exception{
        return stockConditionDAO.selectStockConditionsByCondition(searchVO);
    }

}
