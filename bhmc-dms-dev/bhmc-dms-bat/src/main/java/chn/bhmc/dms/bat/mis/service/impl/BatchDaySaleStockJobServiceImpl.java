package chn.bhmc.dms.bat.mis.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mis.service.BatchDaySaleStockJobService;
import chn.bhmc.dms.bat.mis.service.dao.BatchDaySaleStockJobDAO;
import chn.bhmc.dms.bat.mis.vo.BatchDaySaleStockJobVO;

/**
 * <pre>
 * [BatchJob] 판매재고(MS_1003T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleStockJobServiceImpl.java
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
@Service("batchDaySaleStockJobServiceImpl")
public class BatchDaySaleStockJobServiceImpl extends HService implements BatchDaySaleStockJobService {

    /**
     * BatchDaySaleStockJob DAO
     */
    @Resource(name="batchDaySaleStockJobDAO")
    BatchDaySaleStockJobDAO batchDaySaleStockJobDAO;

    @Override
    public int selectSaleStockJob() throws Exception {

        BatchDaySaleStockJobVO searchVO = new BatchDaySaleStockJobVO();

        batchDaySaleStockJobDAO.selectSaleStockJob(searchVO);


        return 0;
    }

}
