package chn.bhmc.dms.sal.acc.service;

import java.util.List;

import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemPriceVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemStockSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemStockVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemStockService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface AccessoryItemStockService extends StockInOutService {
    /**
     * 용품재고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @param itemCd - 품목코드
     * @return
     */
    public AccessoryItemStockVO selectAccessoryItemStockByKey(String dlrCd, String pltCd, String strgeCd, String itemCd) throws Exception;

    /**
     * 용품재고 목록을 조회한다.
     * @param searchVO - 조회할 정보가 담긴 AccessoryItemStockSearchVO
     * @return 조회한 현재고  정보
     */
    public List<AccessoryItemStockVO> selectAccessoryItemStocksByCondition(AccessoryItemStockSearchVO searchVO) throws Exception;

    /**
     * 용품재고 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AccessoryItemStockSearchVO
     * @return 조회 목록 수
     */
    public int selectAccessoryItemStocksByConditionCnt(AccessoryItemStockSearchVO searchVO) throws Exception;

    /**
     * 용품가격 정보를 등록 또는 수정한다.
     * @param accessoryItemPriceVO
     * @return
     * @throws Exception
     */
    public int insertOrupdateAccessoryItemPrice(AccessoryItemPriceVO accessoryItemPriceVO) throws Exception;
}
