package chn.bhmc.dms.sal.inv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inv.vo.StockDueSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockDueVO;

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

@Mapper("stockDueDAO")
public interface StockDueDAO {

    /**
     * 재고실사 생성여부 조회
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectStockDueInfoCnt(StockDueVO saveVO) throws Exception;


    /**
     * 재고실사 자료 생성
     */
    public int insertStockDueInfo(StockDueVO saveVO) throws Exception;

    /**
     * 재고실사 헤더 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectStockDueListsByConditionCnt(StockDueSearchVO searchVO) throws Exception;


    /**
     * 재고실사 헤더 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<StockDueVO> selectStockDueListsByCondition(StockDueSearchVO searchVO) throws Exception;

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

    /**
     * 재고실사 내역 갯수 조회
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateStockDue(StockDueVO saveVO) throws Exception;



}