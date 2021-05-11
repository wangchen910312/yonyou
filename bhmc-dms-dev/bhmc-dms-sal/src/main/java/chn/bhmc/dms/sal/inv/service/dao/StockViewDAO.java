package chn.bhmc.dms.sal.inv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStateVO;
import chn.bhmc.dms.sal.inv.vo.StockViewVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockViewDAO
 * @Description : 재고조회 DAO
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

@Mapper("stockViewDAO")
public interface StockViewDAO {

    /**
     * 조회 조건에 해당하는 재고조회 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    public int selectStockViewsByConditionCnt(StockStateSearchVO searchVO) throws Exception;
    /**
     * 조회 조건에 해당하는 재고조회 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    public List<StockViewVO> selectStockViewsByCondition(StockStateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고조회 상세 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    public int selectStockViewSubsByConditionCnt(StockStateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고조회 상세 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    public List<StockStateVO> selectStockViewSubsByCondition(StockStateSearchVO searchVO) throws Exception;

}