package chn.bhmc.dms.bat.mis.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mis.service.BatchMonthCrmStatusJobService;
import chn.bhmc.dms.bat.mis.service.dao.BatchMonthCrmStatusJobDAO;
import chn.bhmc.dms.bat.mis.vo.BatchMonthCrmStatusJobVO;

/**
 * <pre>
 * [BatchJob] 고객정보(MS_1005T_2016)
 * </pre>
 *
 * @ClassName   : BatchMonthCrmStatusJobServiceImpl.java
 * @Description : [BatchJob] 고객정보(MS_1005T_2016)
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
@Service("batchMonthCrmStatusJobServiceImpl")
public class BatchMonthCrmStatusJobServiceImpl extends HService implements BatchMonthCrmStatusJobService {

    /**
     * BatchMonthCrmStatusJob DAO
     */
    @Resource(name="batchMonthCrmStatusJobDAO")
    BatchMonthCrmStatusJobDAO batchMonthCrmStatusJobDAO;

    @Override
    public int selectMonthCrmStatusJob() throws Exception {

        BatchMonthCrmStatusJobVO searchVO = new BatchMonthCrmStatusJobVO();

        batchMonthCrmStatusJobDAO.selectMonthCrmStatusJob(searchVO);


        return 0;
    }

}
