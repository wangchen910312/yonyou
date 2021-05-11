package chn.bhmc.dms.par.stm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.stm.vo.StockMovStorageDetailVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO;

/**
 * 재고이동 헤더 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 5. 12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 12.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("stockMovStorageDAO")
public interface StockMovStorageDAO {

    /**
     * 재고이동 헤더 정보를 등록한다.
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int insertStockMovStorageHeader(StockMovStorageHeaderVO stockMovStorageHeaderVO);

    /**
     * 재고이동상세 정보를 추가한다.
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int insertStockMovStorageDetail(StockMovStorageDetailVO stockMovStorageDetailVO);

    /**
     * 재고이동 헤더 정보를 수정한다.
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int updateStockMovStorage(StockMovStorageHeaderVO stockMovStorageHeaderVO);

    /**
     * 재고이동 헤더 정보를 취소한다.
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int cancelStockMovStorage(StockMovStorageHeaderVO stockMovStorageHeaderVO);

    /**
     * 재고이동 부품 정보를 확정처리한다.
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int updateCnfmStockMovStorageItem(StockMovStorageDetailVO stockMovStorageDetailVO);

    /**
     * 재고이동 부품 정보를 수정한다.
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int updateStockMovStorageItem(StockMovStorageDetailVO stockMovStorageDetailVO);

    /**
     * 재고이동 부품 정보를 삭제한다.
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int deleteStockMovStorageItem(StockMovStorageDetailVO stockMovStorageDetailVO);

    /**
     * 재고이동 부품 정보를 삭제한다.(수불발생안한 등록 부품 삭제)
     * @param stockMovStorageHeaderVO 등록할 정보가 담긴 StockMovStorageHeaderVO
     * @return 등록된 목록수
     */
    public int deleteRegStockMovStorageItem(StockMovStorageDetailVO stockMovStorageDetailVO);

    /**
     * 재고이동 부품 정보의 수불 정보를 반영한다.
     * @param stockMovStorageHeaderVO - 수정할 정보가 담긴 StockMovStorageHeaderVO
     * @return 수정된 목록수
     */
    public int updateStockMovStorageItemMvtInfo(StockMovStorageDetailVO stockMovStorageDetailVO);

    /**
     * Key에 해당하는 재고이동 헤더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param etcGiDocNo - 출고문서번호
     * @return 조회한 재고이동 헤더 헤더 정보
     */
    public StockMovStorageHeaderVO selectStockMovStorageHeaderByKey(StockMovStorageSearchVO searchVO);

    /**
     * Key에 해당하는 재고이동 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록
     */
    public List<StockMovStorageDetailVO> selectStockMovStorageItemByKey(StockMovStorageSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 재고이동 헤더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록
     */
    public List<StockMovStorageHeaderVO> selectStockMovStorageByCondition(StockMovStorageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고이동 헤더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록 수
     */
    public int selectStockMovStorageByConditionCnt(StockMovStorageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고이동 헤더 집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록
     */
    public List<StockMovStorageHeaderVO> selectStockMovStorageListSummaryByCondition(StockMovStorageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고이동 집계 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록 수
     */
    public int selectStockMovStorageListSummaryByConditionCnt(StockMovStorageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고이동 헤더 명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록
     */
    public List<StockMovStorageDetailVO> selectStockMovStorageDetailSummaryListByCondition(StockMovStorageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고이동 명세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockMovStorageSearchVO
     * @return 조회 목록 수
     */
    public int selectStockMovStorageDetailSummaryListByConditionCnt(StockMovStorageSearchVO searchVO);

    /**
     * Key에 해당하는 업로드 등록용 재고이동 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdItemVO
     * @return 조회한 판매 부품정보
     */
    public StockMovStorageDetailVO selectStockMovStorageItemExcelUploadByKey(StockMovStorageDetailVO stockMovStorageDetailVO);


    /**
     * 재고이동 번호에 해당하는 라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectStockMovStorageMaxLineNo(StockMovStorageHeaderVO searchVO);


    /**
     * 재고이동Key에 해당하는 수정일자  정보를 조회한다.
     * @param issueEtcVO - 조회할 정보가 담긴 IssueEtcVO
     * @return 조회한 재고이동  정의 정보
     */
    public String selectStockMovStorageUpdtDtByKey(StockMovStorageHeaderVO stockMovStorageHeaderVO);



}
