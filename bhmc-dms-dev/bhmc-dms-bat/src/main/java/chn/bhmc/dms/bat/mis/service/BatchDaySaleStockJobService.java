package chn.bhmc.dms.bat.mis.service;

/**
 * <pre>
 * [BatchJob] 판매재고(MS_1003T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleStockJobService.java
 * @Description : [BatchJob] 판매재고(MS_1003T_2016)
 * @author chibeom.song
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.   chibeom.song     최초 생성
 * </pre>
 */

public interface BatchDaySaleStockJobService {

    /**
     * [BatchJob] 판매재고(MS_1003T_2016)
     * @param null
     * @return Count
     */
    public int selectSaleStockJob() throws Exception;

}
