package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.StockMntSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StockMntVO;



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

@Mapper("SalesStockMntDAO")
public interface SalesStockMntDAO {

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
     * 모바일 APP 그룹 재고관리 목록 조회
     */
    public int selectAppStockMntGroupsByConditionCnt(StockMntSearchVO searchVO) throws Exception;
    public List<StockMntVO> selectAppStockMntGroupsByCondition(StockMntSearchVO searchVO) throws Exception;
    
}