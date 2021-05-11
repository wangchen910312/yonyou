package chn.bhmc.dms.par.stm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;
import chn.bhmc.dms.par.stm.vo.StockInOutExcelVO;
import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceDlrInfoVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceVO;

/**
 * 현재고 데이타 매퍼 클래스
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

@Mapper("stockInOutDAO")
public interface StockInOutDAO {


    /**
     * Key에 해당하는 현재고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형 코드
     * @return 조회한 수불유형 정보
     */
    public StockInOutVO selectStockInOutByKey(@Param("dlrCd") String dlrCd, @Param("pltCd")  String pltCd, @Param("strgeCd") String strgeCd, @Param("itemCd") String itemCd);
    
    public StockInOutVO selectStockAmtByKey(@Param("dlrCd") String dlrCd, @Param("pltCd")  String pltCd, @Param("strgeCd") String strgeCd, @Param("itemCd") String itemCd);
    
    /**
     * 현재고 정보를 등록한다.
     * @param stockInOutVO - 등록할 정보가 담긴 StockInOutVO
     * @return 등록된 목록수
     */
    public int insertStockInOut(StockInOutVO stockInOutVO);

    /**
     * 현재고 정보를 수정한다.
     * @param stockInOutVO - 수정할 정보가 담긴 StockInOutVO
     * @return 수정된 목록수
     */
    public int updateStockInOut(StockInOutVO stockInOutVO);

    /**
     * 현재고 정보(재고통제 정보)를 수정한다.
     * @param stockInOutVO - 수정할 정보가 담긴 StockInOutVO
     * @return 수정된 목록수
     */
    public int updateStockInOutByStockLockInfo(StockInOutVO stockInOutVO);

    /**
     * 현재고 정보를 수정한다.(입고예정정보)
     * @param grGiScheduleVO - 수정할 정보가 담긴 GrGiScheduleVO
     * @return 수정된 목록수
     */
    public int updateStockInOutByGrSchedule(GrGiScheduleVO grGiScheduleVO);

    /**
     * 현재고 정보를 수정한다.(출고예정정보)
     * @param grGiScheduleVO - 수정할 정보가 담긴 GrGiScheduleVO
     * @return 수정된 목록수
     */
    public int updateStockInOutByGiSchedule(GrGiScheduleVO grGiScheduleVO);

    /**
     * 현재고 정보를 삭제한다.(부품마스터 정보 삭제 시)
     * @param stockInOutVO - 수정할 정보가 담긴 StockInOutVO
     * @return 수정된 목록수
     */
    public int deleteStockInfo(StockInOutVO stockInOutVO);

    /**
     * 조회 조건에 해당하는 현재고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록
     */
    public List<StockInOutVO> selectStockInOutItemsByCondition(StockInOutSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 현재고 액셀 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록
     */
    public List<StockInOutExcelVO> selectStockInOutItemsExcelByCondition(StockInOutSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 현재고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록 수
     */
    public int selectStockInOutItemsByConditionCnt(StockInOutSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고실사대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록
     */
    public List<StockInOutVO> selectInvestigationTargetItemsByCondition(StockInOutSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고실사대상 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationTargetItemsByConditionCnt(StockInOutSearchVO searchVO);

    /**
     * 품목마스터 정보를 수정한다.
     * @param StockInOutVO - 수정할 정보가 담긴 StockInOutVO
     * @return 수정된 목록수
     */
    public int updateItemMasterByKey(StockInOutVO stockInOutVO);

    /**
     * Key에 해당하는 재고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형 코드
     * @return 조회한 수불유형 정보
     */
    public StockInterfaceVO selectStockInterfaceInfoByItemCd(StockInterfaceVO stockInterfaceVO);

    /**
     * 딜러에 해당하는 모바일 재고,구매 및 판매 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 수불유형 정보
     */
    public StockInOutVO selectMobileStockInoByDlrCd(StockInOutVO stockInOutVO);

    /**
     * Key에 해당하는 딜러 재고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형 코드
     * @return 조회한 수불유형 정보
     */
    public StockInterfaceDlrInfoVO selectStockInterfaceDlrInfoByItemCd(StockInterfaceDlrInfoVO stockInterfaceDlrInfoVO);

    /**
     * 조회 조건에 해당하는 재고분석 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록
     */
    public List<StockInOutVO> selectStockAnalysisByCondition(StockInOutSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고분석 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록 수
     */
    public int selectStockAnalysisByConditionCnt(StockInOutSearchVO searchVO);

    /**
     * 엑셀업로드(INSERT/UPDATE)
     * @param stockInOutVO - 수정할 정보가 담긴 stockInOutVO
     * @return 수정된 목록수
     */
    public int updateStockInOutUpload(StockInOutVO stockInOutVO);

    /**
     * 부품별 창고/로케이션 리스트 정보 조회.
     * @param StockInOutSearchVO searchVO
     * @return 조회한 재고정보
     */
    public StockInOutVO selectStockInStrgeNmListAndLocNmListOutByItemCd(StockInOutSearchVO searchVO);

    /**
     * 조회조건에 해당하는 현재고 금액 소계 정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 StockInOutSearchVO
     * @return 조회한 현재고  정보
     */
    public StockInOutVO selectStockInOutSummaryByCondition(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 현재고 정보 최대 가용수량 부품정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 StockInOutSearchVO
     * @return 조회한 현재고  정보
     */
    public StockInOutVO selectStockInOutMaxStrgeCdByItemCd(StockInOutSearchVO searchVO) throws Exception;



}
