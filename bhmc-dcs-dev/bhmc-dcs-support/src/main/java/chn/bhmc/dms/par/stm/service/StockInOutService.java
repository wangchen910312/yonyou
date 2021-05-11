package chn.bhmc.dms.par.stm.service;

import java.util.List;

import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;

/**
 * 구매요청 헤더 서비스
 *
 * @author Ju Won Lee
 * @since 2018. 2. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2018. 2. 08.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface StockInOutService {

    /**
     * 조회 조건에 해당하는 재고분석 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록
     */
    public List<StockInOutVO> selectStockAnalysisByCondition(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고분석정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록 수
     */
    public int selectStockAnalysisByConditionCnt(StockInOutSearchVO searchVO) throws Exception;
}
