package chn.bhmc.dms.bat.mgr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mgr.service.BatchResultService;
import chn.bhmc.dms.bat.mgr.service.dao.BatchResultDAO;
import chn.bhmc.dms.bat.mgr.vo.BatchResultSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchResultSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchResultVO;



/**
 * <pre>
 * 배치결과 관리
 * </pre>
 *
 * @ClassName   : BatchResultServiceImpl.java
 * @Description : 배치결과 관리 서비스 구현 클래스
 * @author Kang Seok Han
 * @since 2016. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 25.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("batchResultService")
public class BatchResultServiceImpl extends HService implements BatchResultService {

    @Resource(name="batchResultDAO")
    BatchResultDAO batchResultDAO;

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#insertBatchResult(chn.bhmc.dms.cmm.bat.vo.BatchResultVO)
     */
    @Override
    public int insertBatchResult(BatchResultVO batchResultVO) throws Exception {
        return batchResultDAO.insertBatchResult(batchResultVO);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#updateBatchResult(chn.bhmc.dms.cmm.bat.vo.BatchResultVO)
     */
    @Override
    public int updateBatchResult(BatchResultVO batchResultVO) throws Exception {
        return batchResultDAO.updateBatchResult(batchResultVO);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#deleteBatchResult(chn.bhmc.dms.cmm.bat.vo.BatchResultVO)
     */
    @Override
    public int deleteBatchResult(BatchResultVO batchResultVO) throws Exception {
        return batchResultDAO.deleteBatchResult(batchResultVO);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#deleteBatchResultByBatOperId(java.lang.String)
     */
    @Override
    public int deleteBatchResultByBatOperId(String batOperId) throws Exception {
        return batchResultDAO.deleteBatchResultByBatOperId(batOperId);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#deleteBatchResultByBatScheduleId(java.lang.String)
     */
    @Override
    public int deleteBatchResultByBatScheduleId(String batScheduleId) throws Exception {
        return batchResultDAO.deleteBatchResultByBatScheduleId(batScheduleId);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#multiBatchResults(chn.bhmc.dms.cmm.bat.vo.BatchResultSaveVO)
     */
    @Override
    public void multiBatchResults(BatchResultSaveVO batchResultSaveVO) throws Exception {

        for(BatchResultVO batchResultVO : batchResultSaveVO.getDeleteList()){
            deleteBatchResult(batchResultVO);
        }

    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#selectBatchResultByKey(java.lang.String)
     */
    @Override
    public BatchResultVO selectBatchResultByKey(String batRsltId) throws Exception {
        return batchResultDAO.selectBatchResultByKey(batRsltId);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#selectBatchResultsByCondition(chn.bhmc.dms.cmm.bat.vo.BatchResultSearchVO)
     */
    @Override
    public List<BatchResultVO> selectBatchResultsByCondition(BatchResultSearchVO searchVO) throws Exception {
        return batchResultDAO.selectBatchResultsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchResultService#selectBatchResultsByConditionCnt(chn.bhmc.dms.cmm.bat.vo.BatchResultSearchVO)
     */
    @Override
    public int selectBatchResultsByConditionCnt(BatchResultSearchVO searchVO) throws Exception {
        return batchResultDAO.selectBatchResultsByConditionCnt(searchVO);
    }

}
