package chn.bhmc.dms.sal.inv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.inv.service.StockViewService;
import chn.bhmc.dms.sal.inv.service.dao.StockViewDAO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStateVO;
import chn.bhmc.dms.sal.inv.vo.StockViewVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockViewServiceImpl
 * @Description : 재고조회
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.24          최초 생성
 * </pre>
 */

@Service("stockViewService")
public class StockViewServiceImpl extends HService implements StockViewService {

    /**
     * 재고조회 DAO 선언
     */
    @Resource(name="stockViewDAO")
    StockViewDAO stockViewDAO;

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    @Override
    public int selectStockViewsByConditionCnt(StockStateSearchVO searchVO) throws Exception{
        return stockViewDAO.selectStockViewsByConditionCnt(searchVO);
    }
    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockViewVO> selectStockViewsByCondition(StockStateSearchVO searchVO) throws Exception{
        return stockViewDAO.selectStockViewsByCondition(searchVO);
    }


    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    @Override
    public int selectStockViewSubsByConditionCnt(StockStateSearchVO searchVO) throws Exception{
        return stockViewDAO.selectStockViewSubsByConditionCnt(searchVO);
    }
    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockStateVO> selectStockViewSubsByCondition(StockStateSearchVO searchVO) throws Exception{
        return stockViewDAO.selectStockViewSubsByCondition(searchVO);
    }

}
