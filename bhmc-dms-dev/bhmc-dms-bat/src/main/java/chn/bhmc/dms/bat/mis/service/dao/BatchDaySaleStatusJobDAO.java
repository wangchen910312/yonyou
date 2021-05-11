package chn.bhmc.dms.bat.mis.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.mis.vo.BatchDaySaleStatusJobVO;

/**
 * <pre>
 * [BatchJob] 판매현황(MS_1001T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleStatusJobDAO.java
 * @Description : [BatchJob] 판매현황(MS_1001T_2016)
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
@Mapper("batchDaySaleStatusJobDAO")
public interface BatchDaySaleStatusJobDAO {

    /**
     * [BatchJob] 판매현황(MS_1001T_2016)
     * @param null
     * @return Count
     */
    public void insertSaleStatusJob(BatchDaySaleStatusJobVO searchVO) throws Exception;

}
