package chn.bhmc.dms.bat.mgr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mgr.service.BatchOperService;
import chn.bhmc.dms.bat.mgr.service.BatchResultService;
import chn.bhmc.dms.bat.mgr.service.BatchScheduleService;
import chn.bhmc.dms.bat.mgr.service.BatchScheduler;
import chn.bhmc.dms.bat.mgr.service.dao.BatchScheduleDAO;
import chn.bhmc.dms.bat.mgr.vo.BatchOperVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleVO;
import chn.bhmc.dms.core.util.LoginUtil;




/**
 * <pre>
 * 배치스케쥴 관리
 * </pre>
 *
 * @ClassName   : BatchScheduleServiceImpl
 * @Description : 배치스케쥴 관리 서비스 구현 클래스
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
@Service("batchScheduleService")
public class BatchScheduleServiceImpl extends HService implements BatchScheduleService {

	/**
	 * 배치스케쥴 관리 DAO
	 */
    @Resource(name="batchScheduleDAO")
	BatchScheduleDAO batchScheduleDAO;

	/**
	 * 배치작업 관리 서비스
	 */
    @Resource(name="batchOperService")
	BatchOperService batchOperService;

	/**
	 * 배치결과 관리 서비스
	 */
    @Resource(name="batchResultService")
	BatchResultService batchResultService;

    /**
     * 배치스케쥴 ID 생성 서비스
     */
//    @Resource(name="batScheduleIdGenService")
//    EgovIdGnrService batScheduleIdGenService;

    /**
     * 배치실행 스케쥴러
     */
    @Resource(name="batchScheduler")
    BatchScheduler batchScheduler;

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchScheduleService#insertBatchSchedule(chn.bhmc.dms.cmm.bat.vo.BatchScheduleVO)
     */
    @Override
    public String insertBatchSchedule(BatchScheduleVO batchScheduleVO) throws Exception {
//        String batScheduleId = batScheduleIdGenService.getNextStringId();
//        batchScheduleVO.setBatScheduleId(batScheduleId);

        BatchScheduleVO obj = selectBatchScheduleByKey(batchScheduleVO.getBatScheduleId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        BatchOperVO batchOper = batchOperService.selectBatchOperByKey(batchScheduleVO.getBatOperId());

        batchScheduleVO.setBatTp(batchOper.getBatTp());
        batchScheduleVO.setBatPrgmNm(batchOper.getBatPrgmNm());
        batchScheduleVO.setBatParamVal(batchOper.getBatParamVal());
        batchScheduleVO.setBatEnabledYn(batchOper.getBatEnabledYn());

        //배치스케줄 정보 저장
        batchScheduleDAO.insertBatchSchedule(batchScheduleVO);

        //스케줄러 등록
        batchScheduler.insertBatchSchedule(batchScheduleVO);

        return batchScheduleVO.getBatScheduleId();
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchScheduleService#updateBatchSchedule(chn.bhmc.dms.cmm.bat.vo.BatchScheduleVO)
     */
    @Override
    public int updateBatchSchedule(BatchScheduleVO batchScheduleVO) throws Exception {
        int updateCount = 0;

        BatchOperVO batchOper = batchOperService.selectBatchOperByKey(batchScheduleVO.getBatOperId());

        batchScheduleVO.setBatTp(batchOper.getBatTp());
        batchScheduleVO.setBatPrgmNm(batchOper.getBatPrgmNm());
        batchScheduleVO.setBatParamVal(batchOper.getBatParamVal());
        batchScheduleVO.setBatEnabledYn(batchOper.getBatEnabledYn());

        //배치스케줄 정보 수정
        updateCount = batchScheduleDAO.updateBatchSchedule(batchScheduleVO);

        //스케줄러 갱신
        batchScheduler.updateBatchSchedule(batchScheduleVO);

        return updateCount;
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchScheduleService#deleteBatchSchedule(chn.bhmc.dms.cmm.bat.vo.BatchScheduleVO)
     */
    @Override
    public int deleteBatchSchedule(BatchScheduleVO batchScheduleVO) throws Exception {
        int deleteCount = 0;

        batchResultService.deleteBatchResultByBatScheduleId(batchScheduleVO.getBatScheduleId());
        deleteCount = batchScheduleDAO.deleteBatchSchedule(batchScheduleVO);

        //스케줄러 삭제
        batchScheduler.deleteBatchSchedule(batchScheduleVO);

        return deleteCount;
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchScheduleService#deleteBatchScheduleByBatOperId(java.lang.String)
     */
    @Override
    public int deleteBatchScheduleByBatOperId(String batOperId) throws Exception {
        int deleteCount = 0;

        BatchScheduleSearchVO searchVO = new BatchScheduleSearchVO();
        searchVO.setsBatOperId(batOperId);

        List<BatchScheduleVO> list = selectBatchSchedulesByCondition(searchVO);

        for(BatchScheduleVO batchScheduleVO : list){
            deleteCount += this.deleteBatchSchedule(batchScheduleVO);
        }

        return deleteCount;
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchScheduleService#multiBatchSchedules(chn.bhmc.dms.cmm.bat.vo.BatchScheduleSaveVO)
     */
    @Override
    public void multiBatchSchedules(BatchScheduleSaveVO batchScheduleSaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(BatchScheduleVO batchScheduleVO : batchScheduleSaveVO.getInsertList()){
            batchScheduleVO.setRegUsrId(userId);
            insertBatchSchedule(batchScheduleVO);
        }

        for(BatchScheduleVO batchScheduleVO : batchScheduleSaveVO.getUpdateList()){
            batchScheduleVO.setUpdtUsrId(userId);
            updateBatchSchedule(batchScheduleVO);
        }

        for(BatchScheduleVO batchScheduleVO : batchScheduleSaveVO.getDeleteList()){
            deleteBatchSchedule(batchScheduleVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String selectNextBatchScheduleId() throws Exception {
        String lastBatScheduleId = batchScheduleDAO.selectLastBatchScheduleId();

        if(StringUtils.isBlank(lastBatScheduleId)){
            return "BTS-00001";
        }

        int batScheduleId  = Integer.parseInt(lastBatScheduleId.substring(4));

        return String.format("BTS-%s", StringUtils.leftPad(String.valueOf(++batScheduleId), 5, "0"));
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchScheduleService#selectBatchScheduleByKey(java.lang.String)
     */
    @Override
    public BatchScheduleVO selectBatchScheduleByKey(String batScheduleId) throws Exception {
        return batchScheduleDAO.selectBatchScheduleByKey(batScheduleId);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchScheduleService#selectBatchSchedulesByCondition(chn.bhmc.dms.cmm.bat.vo.BatchScheduleSearchVO)
     */
    @Override
    public List<BatchScheduleVO> selectBatchSchedulesByCondition(BatchScheduleSearchVO searchVO) throws Exception {
        return batchScheduleDAO.selectBatchSchedulesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     * @see chn.bhmc.dms.cmm.bat.service.BatchScheduleService#selectBatchSchedulesByConditionCnt(chn.bhmc.dms.cmm.bat.vo.BatchScheduleSearchVO)
     */
    @Override
    public int selectBatchSchedulesByConditionCnt(BatchScheduleSearchVO searchVO) throws Exception {
        return batchScheduleDAO.selectBatchSchedulesByConditionCnt(searchVO);
    }
}
