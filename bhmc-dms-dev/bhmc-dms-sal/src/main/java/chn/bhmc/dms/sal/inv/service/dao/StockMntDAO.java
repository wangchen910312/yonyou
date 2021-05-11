package chn.bhmc.dms.sal.inv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inv.vo.StockMntSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockMntVO;

/**
 *
 * @ClassName   : StockMntDAO
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

@Mapper("stockMntDAO")
public interface StockMntDAO {

    /**
     * 조회 조건에 해당하는 재고상태관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    public int selectStockMntsByConditionCnt(StockMntSearchVO searchVO) throws Exception;
    /**
     * 조회 조건에 해당하는 재고상태관리 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    public List<StockMntVO> selectStockMntsByCondition(StockMntSearchVO searchVO) throws Exception;
    
    /**
     * 재고관리 저장
     * @param saveVO
     * @return
     */
    public int updateStockMntStates(StockMntVO saveVO) throws Exception;

    /**
     * 재고 변동정보에 이력저장
     * @param saveVO
     * @return
     */
    public int insertStockMntHis(StockMntVO saveVO) throws Exception;
    
    /**
     * 전략출고 신청
     * @param saveVO
     * @return
     */
    public int updateCarStrStat(StockMntVO saveVO) throws Exception;
    public int insertStockStrategyAsk(StockMntVO saveVO) throws Exception;

    /**
     * 모바일 APP 그룹 재고관리 목록 조회
     */
    public int selectAppStockMntGroupsByConditionCnt(StockMntSearchVO searchVO) throws Exception;
    public List<StockMntVO> selectAppStockMntGroupsByCondition(StockMntSearchVO searchVO) throws Exception;
    
}