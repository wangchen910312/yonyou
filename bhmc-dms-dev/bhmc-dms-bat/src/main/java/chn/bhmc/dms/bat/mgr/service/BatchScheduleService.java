package chn.bhmc.dms.bat.mgr.service;

import java.util.List;

import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleVO;



public interface BatchScheduleService {

    /**
     * 배치스케쥴 정보를 등록하고 배치실행 스케쥴러에 배치스케쥴 정보를 등록한다.
     * @param batchScheduleVO - 등록할 정보가 담긴 BatchScheduleVO
     * @return 등록한 배치 스케쥴 ID
     */
    public String insertBatchSchedule(BatchScheduleVO batchScheduleVO) throws Exception;

    /**
     * 배치스케쥴 정보를 수정하고 배치실행 스케쥴러에 배치스케쥴 정보를 삭제하고 재등록 한다.
     * @param batchScheduleVO - 수정할 정보가 담긴 BatchScheduleVO
     * @return 수정된 목록수
     */
    public int updateBatchSchedule(BatchScheduleVO batchScheduleVO) throws Exception;

    /**
     * 배치스케쥴 정보 및 배치스케쥴 ID에 해당하는 배치작업 결과를 삭제하고 배치실행 스케쥴러에서 배치스케쥴 정보를 삭제한다.
     * @param batchScheduleVO - 삭제할 정보가 담긴 BatchScheduleVO
     * @return 삭제된 목록수
     */
    public int deleteBatchSchedule(BatchScheduleVO batchScheduleVO) throws Exception;

    /**
     * 배치작업 ID에 해당하는 배치스케쥴 정보를 삭제하고 배치실행 스케쥴러에서 배치스케쥴 정보를 삭제한다.
     * @param batOperId 배치스케쥴 IDs
     * @return
     */
    public int deleteBatchScheduleByBatOperId(String batOperId) throws Exception;

    /**
     * 배치스케쥴 정보를 등록/수정/삭제 처리한다.
     * @param batchScheduleSaveVO
     */
    public void multiBatchSchedules(BatchScheduleSaveVO batchScheduleSaveVO) throws Exception;

    /**
     * 신규배치스케쥴 ID를 생성한다.
     * @return
     * @throws Exception
     */
    public String selectNextBatchScheduleId() throws Exception;

    /**
     * Key에 해당하는 배치스케쥴 정보를 조회한다.
     * @param batScheduleId - 배치스케쥴 ID
     * @return 조회한 배치스케쥴 정보
     */
    public BatchScheduleVO selectBatchScheduleByKey(String batScheduleId) throws Exception;

    /**
     * 조회 조건에 해당하는 배치스케쥴 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchScheduleSearchVO
     * @return 조회 목록
     */
    public List<BatchScheduleVO> selectBatchSchedulesByCondition(BatchScheduleSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 배치스케쥴 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchScheduleSearchVO
     * @return
     */
    public int selectBatchSchedulesByConditionCnt(BatchScheduleSearchVO searchVO) throws Exception;

}
