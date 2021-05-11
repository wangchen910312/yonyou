package chn.bhmc.dms.par.stm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.stm.vo.StockDdlnItemVO;
import chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO;

/**
 * 월마감재고 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */

@Mapper("stockDdlnDAO")
public interface StockDdlnDAO {


    /**
     * 월마감 입고 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return 조회 목록 수
     */
    public int selectStockDdlnByConditionCnt(StockDdlnSearchVO searchVO);

    /**
     * 월마감 출고 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return 조회 목록 수
     */
    public int selectStockDdlnByConditionByItemDistCdCnt(StockDdlnSearchVO searchVO);

    /**
     * 월마감 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return 조회 목록
     */
    public List<StockDdlnItemVO> selectStockDdlnByCondition(StockDdlnSearchVO searchVO);

    /**
     * 월마감 출고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return 조회 목록
     */
    public List<StockDdlnItemVO> selectStockDdlnByConditionByItemDistCd(StockDdlnSearchVO searchVO);

    /**
     * 입고재고현황 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return 조회 목록
     */
    public List<StockDdlnItemVO> selectStockDdlnGrGiByCondition(StockDdlnSearchVO searchVO);

    /**
     * 입고재고현황 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockDdlnSearchVO
     * @return 조회 목록 수
     */
    public int selectStockDdlnGrGiByConditionCnt(StockDdlnSearchVO searchVO);

    /**
     * 딜러벌 월 마감 프로시져 호출
     * @param serviceId
     * @throws Exception
     */
    public int executeManualParMmDdlnLoopDlrCdProcedure(StockDdlnSearchVO searchVO);

}
