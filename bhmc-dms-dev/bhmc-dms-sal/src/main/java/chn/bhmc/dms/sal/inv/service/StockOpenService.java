package chn.bhmc.dms.sal.inv.service;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.sal.inv.vo.StockOpenSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenVO;



/**
 * @ClassName   : StockOpenService
 * @Description : 공개재고관리 서비스
 * @author Jin Suk Kim
 * @since 2016. 3. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface StockOpenService {
    
    // 공개재고설정 팝업 딜러 조회
    public int selectStockOpenDlrsByConditionCnt(StockOpenSearchVO searchVO) throws Exception;
    public List<StockOpenVO> selectStockOpenDlrsByCondition(StockOpenSearchVO searchVO) throws Exception;
    
    // 공개재고설정 저장
    public int insertStockOpenDlr(StockOpenSaveVO saveVO) throws Exception;
    
    // 공개재고관리 조회
    public int selectStockOpensByConditionCnt(StockOpenSearchVO searchVO) throws Exception;
    public List<StockOpenVO> selectStockOpensByCondition(StockOpenSearchVO searchVO) throws Exception;
    
    // 타딜러재고 조회
    public ArrayList<StockOpenVO> selectStockEtcOpensByCondition(StockOpenSearchVO searchVO) throws Exception;
    
    // 공개재고 취소
    public int cancelStockOpenDlr(StockOpenSaveVO saveVO) throws Exception;
    
    // 공개재고 딜러별 팝업 조회
    public int selectStockOpenDlrPopupsByConditionCnt(StockOpenSearchVO searchVO) throws Exception;
    public List<StockOpenVO> selectStockOpenDlrPopupsByCondition(StockOpenSearchVO searchVO) throws Exception;
    
}