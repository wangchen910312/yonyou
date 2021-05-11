package chn.bhmc.dms.bat.mgr.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.mgr.vo.BatchResultSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchResultVO;



@Mapper("batchResultDAO")
public interface BatchResultDAO {

    /**
     * 배치작업 정보를 등록한다.
     * @param batchResultVO - 등록할 정보가 담긴 BatchResultVO
     * @return 등록된 목록수
     */
    public int insertBatchResult(BatchResultVO batchResultVO);

    /**
     * 배치작업 정보를 수정한다.
     * @param batchResultVO - 수정할 정보가 담긴 BatchResultVO
     * @return 수정된 목록수
     */
    public int updateBatchResult(BatchResultVO batchResultVO);

    /**
     * 배치작업 정보를 삭제한다.
     * @param batchResultVO - 삭제할 정보가 담긴 BatchResultVO
     * @return 삭제된 목록수
     */
    public int deleteBatchResult(BatchResultVO batchResultVO);

    /**
     * 배치작업 ID에 해당하는 배치결과를 모두 삭제한다.
     * @param batchOperId 배치작업 ID
     * @return
     */
    public int deleteBatchResultByBatOperId(String batOperId);

    /**
     * 배치스케쥴 ID에 해당하는 배치결과를 모두 삭제한다.
     * @param batchScheduleId 배치스케쥴 ID
     * @return
     */
    public int deleteBatchResultByBatScheduleId(String batScheduleId);

    /**
     * Key에 해당하는 배치작업 정보를 조회한다.
     * @param batchResultId - 배치작업 ID
     * @return 조회한 배치작업 정보
     */
    public BatchResultVO selectBatchResultByKey(String batRsltId);

    /**
     * 조회 조건에 해당하는 배치작업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchResultSearchVO
     * @return 조회 목록
     */
    public List<BatchResultVO> selectBatchResultsByCondition(BatchResultSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 배치작업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchResultSearchVO
     * @return
     */
    public int selectBatchResultsByConditionCnt(BatchResultSearchVO searchVO);


}
