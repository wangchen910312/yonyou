package chn.bhmc.dms.par.stm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageDetailVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageSaveVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO;

/**
 * 재고이동 헤더 서비스
 *
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim      최초 생성
 * </pre>
 */

public interface StockMovStorageHeaderService {

    /**
     * 재고이동 헤더 정보를 등록한다.
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int insertStockMovStorageHeader(StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception;

    /**
     * 재고이동 헤더,재고이동 상세 정보를 등록한다.
     * @param stockMovStorageSaveVO 등록할 정보가 담긴 StockMovStorageSaveVO
     * @return 등록된 IssuePartsOutSaveVO
     */
    public StockMovStorageSaveVO insertStockMovStorageSave(StockMovStorageSaveVO stockMovStorageSaveVO) throws Exception;

    /**
     *재고이동 헤더,상세정보를 등록한다.(수불발생(X)
     * @param issueEtcVO - 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public StockMovStorageHeaderVO createStockMovStorageReg(List<StockMovStorageDetailVO> list, StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception;


    /**
     *재고이동 헤더,상세정보를  확정한다.
     * @param issueEtcVO - 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public StockMovStorageHeaderVO createStockMovStorageCnfm(List<StockMovStorageDetailVO> list, StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception;


    /**
     *재고이동 헤더,상세정보를 수정한다.
     * @param issueEtcVO - 수정할 정보가 담긴 StockMovStorageHeaderVO
     * @return 수정된 목록수
     */
    public void multiStockMovStorages(BaseSaveVO<StockMovStorageDetailVO> saveVO, StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception;

    /**
     * 재고이동 헤더,상세정보를 취소한다.
     * @param issueEtcVO - 취소할 정보가 담긴 StockMovStorageHeaderVO
     * @return 취소된 목록수
     */
    public int cancelStockMovStorage(List<StockMovStorageDetailVO> list, StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception;



    /**
     * Key에 해당하는 재고이동 헤더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param etcGiDocNo - 출고문서번호
     * @return 조회한 재고이동 헤더 헤더 정보
     */
    public StockMovStorageHeaderVO selectStockMovStorageHeaderByKey(StockMovStorageSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고이동 부품 정보를 조회한다.
     * @param StockMovStorageSearchVO - 조회할 정보가 담긴 StockMovStorageSearchVO
     * @return 조회한 재고이동  정의 정보
     */
    public List<StockMovStorageDetailVO> selectStockMovStorageItemByKey(StockMovStorageSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 재고이동 헤더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록
     */
    public List<StockMovStorageHeaderVO> selectStockMovStorageHeadersByCondition(StockMovStorageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고이동 헤더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록 수
     */
    public int selectStockMovStorageHeadersByConditionCnt(StockMovStorageSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 재고이동 헤더 집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록
     */
    public List<StockMovStorageHeaderVO> selectStockMovStorageListSummaryByCondition(StockMovStorageSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 재고이동 집계 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록 수
     */
    public int selectStockMovStorageListSummaryByConditionCnt(StockMovStorageSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 재고이동 헤더 명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록
     */
    public List<StockMovStorageDetailVO> selectStockMovStorageDetailSummaryListByCondition(StockMovStorageSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 재고이동 명세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록 수
     */
    public int selectStockMovStorageDetailSummaryListByConditionCnt(StockMovStorageSearchVO searchVO) throws Exception;
    

    /**
     * Key에 해당하는 업로드 등록용 재고이동 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdItemVO
     * @return 조회한 판매 부품정보
     */
    public StockMovStorageDetailVO selectStockMovStorageItemExcelUploadByKey(StockMovStorageDetailVO stockMovStorageDetailVO) throws Exception;
    
}
