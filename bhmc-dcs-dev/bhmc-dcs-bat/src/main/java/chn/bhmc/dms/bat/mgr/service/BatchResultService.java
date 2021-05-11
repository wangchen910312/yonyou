package chn.bhmc.dms.bat.mgr.service;

import java.util.List;

import chn.bhmc.dms.bat.mgr.vo.BatchResultSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchResultSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchResultVO;



public interface BatchResultService {

    /**
     * 배치작업 정보를 등록한다.
     * @param batchResultVO - 등록할 정보가 담긴 BatchResultVO
     * @return 등록된 목록수
     */
    public int insertBatchResult(BatchResultVO batchResultVO) throws Exception;

    /**
     * 배치작업 정보를 수정한다.
     * @param batchResultVO - 수정할 정보가 담긴 BatchResultVO
     * @return 수정된 목록수
     */
    public int updateBatchResult(BatchResultVO batchResultVO) throws Exception;

    /**
     * 배치작업 정보를 삭제한다.
     * @param batchResultVO - 삭제할 정보가 담긴 BatchResultVO
     * @return 삭제된 목록수
     */
    public int deleteBatchResult(BatchResultVO batchResultVO) throws Exception;

    /**
     * 배치작업 ID에 해당하는 배치결과를 모두 삭제한다.
     * @param batchOperId 배치작업 ID
     * @return
     */
    public int deleteBatchResultByBatOperId(String batOperId) throws Exception;

    /**
     * 배치스케쥴 ID에 해당하는 배치결과를 모두 삭제한다.
     * @param batchScheduleId 배치스케쥴 ID
     * @return
     */
    public int deleteBatchResultByBatScheduleId(String batScheduleId) throws Exception;

    /**
     * 배치결과 정보를 등록/수정/삭제 처리한다.
     * @param batchResultSaveVO
     */
    public void multiBatchResults(BatchResultSaveVO batchResultSaveVO) throws Exception;

    /**
     * Key에 해당하는 배치작업 정보를 조회한다.
     * @param batchResultId - 배치작업 ID
     * @return 조회한 배치작업 정보
     */
    public BatchResultVO selectBatchResultByKey(String batRsltId) throws Exception;

    /**
     * 조회 조건에 해당하는 배치작업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchResultSearchVO
     * @return 조회 목록
     */
    public List<BatchResultVO> selectBatchResultsByCondition(BatchResultSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 배치작업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchResultSearchVO
     * @return
     */
    public int selectBatchResultsByConditionCnt(BatchResultSearchVO searchVO) throws Exception;

}
