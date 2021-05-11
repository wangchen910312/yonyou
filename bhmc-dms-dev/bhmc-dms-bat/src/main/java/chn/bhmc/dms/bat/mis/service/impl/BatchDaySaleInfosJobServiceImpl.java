package chn.bhmc.dms.bat.mis.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mis.service.BatchDaySaleInfosJobService;
import chn.bhmc.dms.bat.mis.service.dao.BatchDaySaleInfosJobDAO;


/**
 * <pre>
 * [BatchJob] 판매정보(MS_1002T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleInfosJobServiceImpl.java
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
@Service("batchDaySaleInfosJobService")
public class BatchDaySaleInfosJobServiceImpl extends HService implements BatchDaySaleInfosJobService {

    /**
     * BatchDaySaleInfosJob DAO
     */
    @Resource(name="batchDaySaleInfosJobDAO")
    BatchDaySaleInfosJobDAO batchDaySaleInfosJobDAO;

    @Override
    public int insertSaleInfosJob() throws Exception {

        batchDaySaleInfosJobDAO.insertSaleInfosJob();

        return 0;
    }

}
