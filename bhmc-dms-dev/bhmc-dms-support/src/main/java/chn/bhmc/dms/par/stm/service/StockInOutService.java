package chn.bhmc.dms.par.stm.service;

import java.util.List;

import chn.bhmc.dms.par.stm.vo.StockInOutCalcVO;

import chn.bhmc.dms.par.stm.vo.StockInOutExcelVO;
import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceDlrInfoVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceVO;

/**
 * 수불유형 서비스
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

public interface StockInOutService {

    /**
     * Key에 해당하는 현재고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @param itemCd - 품목코드
     * @return 조회한 현재고 정보
     */
    public StockInOutVO selectStockInOutByKey(String dlrCd, String pltCd, String strgeCd, String itemCd) throws Exception;

    /**
     * Key에 해당하는 현재고를 처리한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @param itemCd - 품목코드
     * @param stockSt - 재고상태(가용, 예약, 보류)
     * @param qty - 처리수량
     * @param mvtGrGiTp - 입출고여부
     * @param calcTp - 재고계산구분자(+,-)
     * @return 처리한 현재고 정보
     */
    //public int multiSaveStockInOut(String dlrCd, String pltCd, String strgeCd, String itemCd, String currGrGiTp,String mvtGrGiTp, String cnclMvtYn, String stockSt, double qty, double stockAmt, String calcTp, String rentType, String grtePrcChkYn) throws Exception;
    public int multiSaveStockInOut(StockInOutCalcVO stockInOutCalcVO) throws Exception;

    /**
     * 현재고 정보를 추가한다.
     * @param stockInOutVO - 추가할 정보가 담긴 StockInOutVO
     * @return 추가된 목록수
     */
    public int insertStockInOut(StockInOutVO stockInOutInsertVO);

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
    public int updateStockInOutByStockLockInfo(StockInOutVO stockInOutVO) throws Exception;

    /**
     * 현재고 정보를 삭제한다.(부품마스터 정보 삭제 시)
     * @param stockInOutVO - 수정할 정보가 담긴 StockInOutVO
     * @return 수정된 목록수
     */
    public int deleteStockInfo(StockInOutVO stockInOutVO) throws Exception;

    /**
     * 조회조건에 해당하는 현재고  정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 StockInOutSearchVO
     * @return 조회한 현재고  정보
     */
    public List<StockInOutVO> selectStockInOutItemsByCondition(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 현재고  액셀다운 정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 StockInOutSearchVO
     * @return 조회한 현재고  정보
     */
    public List<StockInOutExcelVO> selectStockInOutItemsExcelByCondition(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 현재고  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록 수
     */
    public int selectStockInOutItemsByConditionCnt(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고실사대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록
     */
    public List<StockInOutVO> selectInvestigationTargetItemsByCondition(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고실사대상 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationTargetItemsByConditionCnt(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 품목마스터 정보를 수정한다.
     * @param StockInOutVO - 수정할 정보가 담긴 StockInOutVO
     * @return 수정된 목록수
     */
    public int updateItemMasterByKey(StockInOutVO stockInOutVO)throws Exception;

    /**
     * 부품별 재고정보를 조회한다.
     * @param stockInterfaceVO - 현재고 인터페이스 VO
     * @return 현재고 인터페이스 VO
     */
    public StockInterfaceVO selectStockInterfaceInfoByItemCd(StockInterfaceVO stockInterfaceVO) throws Exception;

    /**
     * 실시간 부품 재고정보 인터페이스 전달.
     * @param stockInterfaceVO - 현재고 인터페이스 VO
     * @return 현재고 인터페이스 VO
     */
    public StockInterfaceVO selectStockInterfaceRealTimeInfoByItemCd(StockInterfaceVO stockInterfaceVO) throws Exception;

    /**
     * 실시간 딜러별 부품 재고정보 인터페이스 전달.
     * @param StockInterfaceDlrInfoVO - 딜러별 재고인터페이스 VO
     * @return 딜러별 재고인터페이스 리스트
     */
    public List<StockInterfaceDlrInfoVO> selectDlrStockInterfaceRealTimeInfoByItemCd(StockInterfaceDlrInfoVO stockInterfaceVO) throws Exception;

    /**
     * 부품번호 별 딜러 재고정보를 조회.
     * @param StockInterfaceDlrInfoVO - 딜러별 재고인터페이스 VO
     * @return 딜러별 재고인터페이스 VO
     */
    public StockInterfaceDlrInfoVO selectStockInterfaceDlrInfoByItemCd(StockInterfaceDlrInfoVO stockInterfaceDlrInfoVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고분석 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록
     */
    public List<StockInOutVO> selectStockAnalysisByCondition(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고분석 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockInOutSearchVO
     * @return 조회 목록 수
     */
    public int selectStockAnalysisByConditionCnt(StockInOutSearchVO searchVO) throws Exception;

    /**
     * 딜러에 해당하는 모바일 재고,구매 및 판매 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 수불유형 정보
     */
    public StockInOutVO selectMobileStockInoByDlrCd(StockInOutVO stockInOutVO) throws Exception;

    /**
     * 파일업로드시 추가 Validation check
     * @param
     * @return
     */
    public List<StockInOutVO> selectStockInOutExcelValidate(List<StockInOutVO> list) throws Exception;


    /**
     * 부품재고 파일업로드(문건도입) 재고정보 저장.
     * @param 현재고 VO 리스트
     * @return void
     */
    public void updateStockInOutUpload(List<StockInOutVO> list) throws Exception;

    /**
     * 부품별 창고/로케이션 리스트 정보 조회.
     * @param StockInOutSearchVO searchVO
     * @return 조회한 재고정보
     */
    public StockInOutVO selectStockInStrgeNmListAndLocNmListOutByItemCd(StockInOutSearchVO searchVO) throws Exception;


    /**
     * 현재고 정보를 추가한다.(빈창고)
     * @param stockInOutVO - 추가할 정보가 담긴 StockInOutVO
     * @return 추가된 목록수
     */
    public int insertEmptyStockInOut(StockInOutVO stockInOutInsertVO);

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
