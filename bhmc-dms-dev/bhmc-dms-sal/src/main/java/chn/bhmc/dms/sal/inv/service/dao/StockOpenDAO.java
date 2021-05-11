package chn.bhmc.dms.sal.inv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inv.vo.StockMntVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenVO;

/**
 *
 * @ClassName   : StockOpenDAO
 * @Description : 공개재고관리 DAO
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

@Mapper("stockOpenDAO")
public interface StockOpenDAO {

    /**
     * 공개재고설정 팝업 딜러 목록 갯수 정보를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectStockOpenDlrsByConditionCnt(StockOpenSearchVO searchVO) throws Exception;
    
    /**
     * 공개재고설정 팝업 딜러 목록 정보를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<StockOpenVO> selectStockOpenDlrsByCondition(StockOpenSearchVO searchVO) throws Exception;
    
    /**
     * 공개재고설정 딜러 유무 파악  
     * @param serchVO
     * @return
     * @throws Exception
     */
    public int selectStockOpenDlrCnt(StockOpenVO serchVO) throws Exception;
    
    /**
     * 공개재고 설정 저장 
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertStockOpen(StockOpenVO saveVO) throws Exception;
    public int updateStockOpen(StockOpenVO saveVO) throws Exception;
    public int updateCarOpen(StockMntVO saveVO) throws Exception;
    
    /**
     * 공개재고관리 조회 
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectStockOpensByConditionCnt(StockOpenSearchVO searchVO) throws Exception;
    public List<StockOpenVO> selectStockOpensByCondition(StockOpenSearchVO searchVO) throws Exception;
    
    /**
     * 공개재고 설정 취소 
     * @param deleteVO
     * @return
     * @throws Exception
     */
    public int deleteStockOpen(StockOpenVO deleteVO) throws Exception;
    
    /**
     * 공개재고 취소를 위한 딜러정보 조회 
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<StockOpenVO> selectDeleteStockOpenDlrSearch(StockOpenSearchVO searchVO) throws Exception;
    
    /**
     * 공개재고 딜러별 팝업 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectStockOpenDlrPopupsByConditionCnt(StockOpenSearchVO searchVO) throws Exception;
    public List<StockOpenVO> selectStockOpenDlrPopupsByCondition(StockOpenSearchVO searchVO) throws Exception;
    
}