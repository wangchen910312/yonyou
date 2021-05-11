package chn.bhmc.dms.bat.mgr.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleVO;



@Mapper("batchScheduleDAO")
public interface BatchScheduleDAO {

    /**
     * 배치스케쥴 정보를 등록한다.
     * @param batchScheduleVO - 등록할 정보가 담긴 BatchScheduleVO
     * @return 등록된 목록수
     */
    public int insertBatchSchedule(BatchScheduleVO batchScheduleVO);

    /**
     * 배치스케쥴 정보를 수정한다.
     * @param batchScheduleVO - 수정할 정보가 담긴 BatchScheduleVO
     * @return 수정된 목록수
     */
    public int updateBatchSchedule(BatchScheduleVO batchScheduleVO);

    /**
     * 배치스케쥴 정보를 삭제한다.
     * @param batchScheduleVO - 삭제할 정보가 담긴 BatchScheduleVO
     * @return 삭제된 목록수
     */
    public int deleteBatchSchedule(BatchScheduleVO batchScheduleVO);

    /**
     * 배치스케쥴 ID에 해당하는 배치스케쥴 정보를 모두 삭제한다.
     * @param batScheduleId 배치스케쥴 IDs
     * @return
     */
    public int deleteBatchScheduleByBatOperId(String batScheduleId);

    /**
     * 최근입력된 배치스케쥴ID를 조회한다.
     * @return
     * @throws Exception
     */
    public String selectLastBatchScheduleId();

    /**
     * Key에 해당하는 배치스케쥴 정보를 조회한다.
     * @param batScheduleId - 배치스케쥴 ID
     * @return 조회한 배치스케쥴 정보
     */
    public BatchScheduleVO selectBatchScheduleByKey(String batScheduleId);

    /**
     * 조회 조건에 해당하는 배치스케쥴 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchScheduleSearchVO
     * @return 조회 목록
     */
    public List<BatchScheduleVO> selectBatchSchedulesByCondition(BatchScheduleSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 배치스케쥴 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchScheduleSearchVO
     * @return
     */
    public int selectBatchSchedulesByConditionCnt(BatchScheduleSearchVO searchVO);


}
