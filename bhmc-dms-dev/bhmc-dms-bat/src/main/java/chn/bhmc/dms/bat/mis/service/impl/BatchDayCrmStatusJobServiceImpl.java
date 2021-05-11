package chn.bhmc.dms.bat.mis.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mis.service.BatchDayCrmStatusJobService;
import chn.bhmc.dms.bat.mis.service.dao.BatchDayCrmStatusJobDAO;
import chn.bhmc.dms.bat.mis.vo.BatchDayCrmStatusJobVO;

/**
 * <pre>
 * [BatchJob] 고객정보(MS_1004T_2016)
 * </pre>
 *
 * @ClassName   : BatchDayCrmStatusJobServiceImpl.java
 * @Description : [BatchJob] 고객정보(MS_1004T_2016)
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
@Service("batchDayCrmStatusJobServiceImpl")
public class BatchDayCrmStatusJobServiceImpl extends HService implements BatchDayCrmStatusJobService {

    /**
     * BatchDayCrmStatusJob DAO
     */
    @Resource(name="batchDayCrmStatusJobDAO")
    BatchDayCrmStatusJobDAO batchDayCrmStatusJobDAO;

    @Override
    public int selectCrmStatusJob() throws Exception {

        BatchDayCrmStatusJobVO searchVO = new BatchDayCrmStatusJobVO();

        batchDayCrmStatusJobDAO.selectCrmStatusJob(searchVO);


        return 0;
    }

}
