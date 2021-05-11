package chn.bhmc.dms.bat.mis.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.mis.vo.BatchMonthCrmStatusJobVO;


/**
 * <pre>
 * [BatchJob] 고객정보(MS_1005T_2016)
 * </pre>
 *
 * @ClassName   : BatchMonthCrmStatusJobDAO.java
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
@Mapper("batchMonthCrmStatusJobDAO")
public interface BatchMonthCrmStatusJobDAO {

    /**
     * [BatchJob] 고객정보(MS_1005T_2016)
     * @param null
     * @return Count
     */
    public void selectMonthCrmStatusJob(BatchMonthCrmStatusJobVO searchVO) throws Exception;

}
