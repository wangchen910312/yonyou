package chn.bhmc.dms.par.stm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockMovStorageListVO.java
 * @Description : StockMovStorageListVO.java
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

public class StockMovStorageListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6365204091143435598L;

    private  StockMovStorageHeaderVO              stockMovStorageHeaderVO;

    private  List<StockMovStorageDetailVO>        stockMovStorageDetailList;

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

    /**
     * @return the stockMovStorageDetailList
     */
    public List<StockMovStorageDetailVO> getStockMovStorageDetailList() {
        return stockMovStorageDetailList;
    }

    /**
     * @param stockMovStorageDetailList the stockMovStorageDetailList to set
     */
    public void setStockMovStorageDetailList(List<StockMovStorageDetailVO> stockMovStorageDetailList) {
        this.stockMovStorageDetailList = stockMovStorageDetailList;
    }

}
