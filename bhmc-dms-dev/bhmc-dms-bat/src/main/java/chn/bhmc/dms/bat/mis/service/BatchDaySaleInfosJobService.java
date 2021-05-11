package chn.bhmc.dms.bat.mis.service;

/**
 * <pre>
 * [BatchJob] 판매정보(MS_1002T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleInfosJobService.java
 * @Description : [BatchJob] 판매정보(MS_1002T_2016)
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

public interface BatchDaySaleInfosJobService {

    /**
     * [BatchJob] 판매정보(MS_1002T_2016)
     * @param null
     * @return Count
     */
    public int insertSaleInfosJob() throws Exception;

}
