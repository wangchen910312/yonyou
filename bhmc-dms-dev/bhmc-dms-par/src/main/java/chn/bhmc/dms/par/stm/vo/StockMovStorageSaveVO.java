package chn.bhmc.dms.par.stm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockMovStorageSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     In Bo Shim     최초 생성
 * </pre>
 */

public class StockMovStorageSaveVO extends BaseSaveVO<StockMovStorageDetailVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2716161521463579098L;
    /**
     * 재고이동 헤더 VO
     **/
    private StockMovStorageHeaderVO stockMovStorageHeaderVO;

    /**
     * @return the stockMovStorageHeaderVO
     */
    public StockMovStorageHeaderVO getStockMovStorageHeaderVO() {
        return stockMovStorageHeaderVO;
    }

    /**
     * @param stockMovStorageHeaderVO the stockMovStorageHeaderVO to set
     */
    public void setStockMovStorageHeaderVO(StockMovStorageHeaderVO stockMovStorageHeaderVO) {
        this.stockMovStorageHeaderVO = stockMovStorageHeaderVO;
    }

}
