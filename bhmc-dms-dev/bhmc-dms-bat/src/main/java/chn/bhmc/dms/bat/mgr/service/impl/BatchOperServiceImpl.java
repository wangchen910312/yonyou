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
import chn.bhmc.dms.bat.mgr.service.dao.BatchOperDAO;
import chn.bhmc.dms.bat.mgr.vo.BatchOperSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchOperSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchOperVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleVO;
import chn.bhmc.dms.core.util.LoginUtil;


/**
 * <pre>
 * 배치작업 관리
 * </pre>
 *
 * @ClassName   : BatchOperServiceImpl.java
 * @Description : 배치작업 관리 서비스 구현 클래스
 * @author Kang Seok Han
 * @since 2016. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 24.     Kang Seok Han     최초 생성
 * </pre>
 */

@Service("batchOperService")
public class BatchOperServiceImpl extends HService implements BatchOperService {

    /**
     * 배치작업 관리 DAO
     */
    @Resource(name="batchOperDAO")
    BatchOperDAO batchOperDAO;

    /**
     * 배치스케쥴러 관리 서비스
     */
    @Resource(name="batchScheduleService")
    BatchScheduleService batchScheduleService;

    /**
     * 배치결과 관리 서비스
     */
    @Resource(name="batchResultService")
    BatchResultService batchResultService;

    /**
     * 배치실행 스케쥴러
     */
    @Resource(name="batchScheduler")
    BatchScheduler batchScheduler;

    /**
     * {@inheritDoc}
     */
    @Override
    public String insertBatchOper(BatchOperVO batchOperVO) throws Exception {

        BatchOperVO obj = selectBatchOperByKey(batchOperVO.getBatOperId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        batchOperDAO.insertBatchOper(batchOperVO);

        return batchOperVO.getBatOperId();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateBatchOper(BatchOperVO batchOperVO) throws Exception {

        BatchOperVO obj = selectBatchOperByKey(batchOperVO.getBatOperId());

        //배치유형/배치프로그램/배치파라메터/배치활성여부가 변경된 경우
        if(!batchOperVO.getBatTp().equals(obj.getBatTp()) ||
                !batchOperVO.getBatPrgmNm().equals(obj.getBatPrgmNm()) ||
                !StringUtils.defaultString(batchOperVO.getBatParamVal(), "").equals(StringUtils.defaultString(obj.getBatParamVal(), "")) ||
                !batchOperVO.getBatEnabledYn().equals(obj.getBatEnabledYn())
        ){

            BatchScheduleSearchVO searchVO = new BatchScheduleSearchVO();
            searchVO.setsBatOperId(batchOperVO.getBatOperId());

            List<BatchScheduleVO> batchScheduleList = batchScheduleService.selectBatchSchedulesByCondition(searchVO);

            //배치활성여부가 N->Y로 변경되면 배치실행 스케쥴러에 등록한다.
            if(batchOperVO.getBatEnabledYn().equals("Y")){
                for(BatchScheduleVO batchScheduleVO : batchScheduleList){
                    batchScheduleVO.setBatEnabledYn("Y");
                    batchScheduler.updateBatchSchedule(batchScheduleVO);
                }

            //배치활성여부가 Y->N로 변경되면 배치실행 스케쥴러에서 삭제한다.
            }else{
                for(BatchScheduleVO batchScheduleVO : batchScheduleList){
                    batchScheduler.deleteBatchSchedule(batchScheduleVO);
                }
            }
        }

        return batchOperDAO.updateBatchOper(batchOperVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteBatchOper(BatchOperVO batchOperVO) throws Exception {
        //배치작업에 해당하는 스케쥴의 배치실행 결과를 삭제한다.
        batchResultService.deleteBatchResultByBatOperId(batchOperVO.getBatOperId());
        //배치작업에 해당하는 스케쥴 목록을 삭제하고 스케쥴러에서도 삭제한다.
        batchScheduleService.deleteBatchScheduleByBatOperId(batchOperVO.getBatOperId());

        //배치작업을 삭제한다.
        return batchOperDAO.deleteBatchOper(batchOperVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiBatchOpers(BatchOperSaveVO batchOperSaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(BatchOperVO batchOperVO : batchOperSaveVO.getInsertList()){
            batchOperVO.setRegUsrId(userId);
            insertBatchOper(batchOperVO);
        }

        for(BatchOperVO batchOperVO : batchOperSaveVO.getUpdateList()){
            batchOperVO.setUpdtUsrId(userId);
            updateBatchOper(batchOperVO);
        }

        for(BatchOperVO batchOperVO : batchOperSaveVO.getDeleteList()){
            deleteBatchOper(batchOperVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String selectNextBatchOperId() throws Exception {
        String lastBatOperId = batchOperDAO.selectLastBatchOperId();

        if(StringUtils.isBlank(lastBatOperId)){
            return "BTO-00001";
        }

        int batOperId  = Integer.parseInt(lastBatOperId.substring(4));

        return String.format("BTO-%s", StringUtils.leftPad(String.valueOf(++batOperId), 5, "0"));
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public BatchOperVO selectBatchOperByKey(String batOperId) throws Exception {
        return batchOperDAO.selectBatchOperByKey(batOperId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<BatchOperVO> selectBatchOpersByCondition(BatchOperSearchVO searchVO) throws Exception {
        return batchOperDAO.selectBatchOpersByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectBatchOpersByConditionCnt(BatchOperSearchVO searchVO) throws Exception {
        return batchOperDAO.selectBatchOpersByConditionCnt(searchVO);
    }
}
