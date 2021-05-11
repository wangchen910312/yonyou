package chn.bhmc.dms.sal.inv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockStateDAO
 * @Description : 재고상태관리 DAO
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

@Mapper("stockStateDAO")
public interface StockStateDAO {

    /**
     * 조회 조건에 해당하는 재고상태관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    public int selectStockStatesByConditionCnt(StockStateSearchVO searchVO) throws Exception;
    /**
     * 조회 조건에 해당하는 재고상태관리 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    public List<StockStateVO> selectStockStatesByCondition(StockStateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고상태관리 상세 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    public int selectStockStateSubsByConditionCnt(StockStateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고상태관리 상세 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    public List<StockStateVO> selectStockStateSubsByCondition(StockStateSearchVO searchVO) throws Exception;

    /**
     * 재고상태관리 저장
     * @param saveVO
     * @return
     */
    public int updateStockStates(StockStateVO saveVO) throws Exception;

    /**
     * 재고상태변동정보에 이력저장
     * @param saveVO
     * @return
     */
    public int insertStockStateHis(StockStateVO saveVO) throws Exception;
}