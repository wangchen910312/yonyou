package chn.bhmc.dms.bat.mis.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mis.service.BatchDaySaleStatusJobService;
import chn.bhmc.dms.bat.mis.service.dao.BatchDaySaleInfosJobDAO;
import chn.bhmc.dms.bat.mis.service.dao.BatchDaySaleStatusJobDAO;
import chn.bhmc.dms.bat.mis.vo.BatchDaySaleStatusJobVO;
import chn.bhmc.dms.bat.mis.vo.BatchSystemDlrVO;
/**
 * <pre>
 * [BatchJob] 판매현황(MS_1001T_2016)
 * </pre>
 *
 * @ClassName   : BatchDaySaleStatusJobServiceImpl.java
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
@Service("batchDaySaleStatusJobService")
public class BatchDaySaleStatusJobServiceImpl extends HService implements BatchDaySaleStatusJobService {

    /**
     * BatchDaySaleStatusJob DAO
     */
    @Resource(name="batchDaySaleStatusJobDAO")
    BatchDaySaleStatusJobDAO batchDaySaleStatusJobDAO;

    /**
     * BatchDaySaleInfosJob DAO
     */
    @Resource(name="batchDaySaleInfosJobDAO")
    BatchDaySaleInfosJobDAO batchDaySaleInfosJobDAO;

    @Override
    public int insertSaleStatusJob() throws Exception {

        List<BatchSystemDlrVO> batchSystemDlrVOList = new ArrayList<BatchSystemDlrVO>();

        batchSystemDlrVOList = batchDaySaleInfosJobDAO.selectSystemUseDlrList();

        for (int i = 0 ; i < batchSystemDlrVOList.size() ; i++) {

            BatchDaySaleStatusJobVO batchDaySaleStatusJobVO = new BatchDaySaleStatusJobVO();

            batchDaySaleStatusJobVO.setDlrCd(batchSystemDlrVOList.get(i).getDlrCd());

            batchDaySaleStatusJobDAO.insertSaleStatusJob(batchDaySaleStatusJobVO);

        }

        return 0;
    }

}
