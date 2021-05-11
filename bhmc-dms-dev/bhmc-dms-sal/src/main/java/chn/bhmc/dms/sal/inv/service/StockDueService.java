package chn.bhmc.dms.sal.inv.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockDueSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockDueVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockDueService
 * @Description : 재고실사 서비스
 * @author Jin Suk Kim
 * @since 2016. 08. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface StockDueService {

    /**
     * 실사 자료생성
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int CreateStockDueInfo(StockDueVO saveVO) throws Exception;

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
     * 재고실사 내역 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<StockDueVO> selectStockDueDetailListsByCondition(StockDueSearchVO searchVO) throws Exception;

    /**
     * 재고실사 모바일 바코드로 상세 내역 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectStockDueDetailMobsByConditionCnt(StockDueSearchVO searchVO) throws Exception;

    /**
     * 재고실사 모바일 바코드로 상세 내역 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<StockDueVO> selectStockDueDetailMobsByCondition(StockDueSearchVO searchVO) throws Exception;


    /**
     * 재고실사 내역 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int multiStockDue(BaseSaveVO<StockDueVO> saveVO) throws Exception;

    /**
     * 재고실사 일괄저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int saveAllStockDue(StockDueVO saveVO) throws Exception;
    
    /**
     * 재고실사 선택저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int saveSelectStockDue(List<StockDueVO> saveList) throws Exception;
    
    /**
     * 모바일 - 재고실사 내역 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int multiMobStockDue(BaseSaveVO<StockDueVO> saveVO) throws Exception;

}