package chn.bhmc.dms.bat.mgr.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.mgr.vo.BatchOperSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchOperVO;



@Mapper("batchOperDAO")
public interface BatchOperDAO {

    /**
     * 배치작업 정보를 등록한다.
     * @param batchOperVO - 등록할 정보가 담긴 BatchOperVO
     * @return 등록된 목록수
     */
    public int insertBatchOper(BatchOperVO batchOperVO);

    /**
     * 배치작업 정보를 수정한다.
     * @param batchOperVO - 수정할 정보가 담긴 BatchOperVO
     * @return 수정된 목록수
     */
    public int updateBatchOper(BatchOperVO batchOperVO);

    /**
     * 배치작업 정보를 삭제한다.
     * @param batchOperVO - 삭제할 정보가 담긴 BatchOperVO
     * @return 삭제된 목록수
     */
    public int deleteBatchOper(BatchOperVO batchOperVO);

    /**
     * 최근입력된 배치작업ID를 조회한다.
     * @return
     * @throws Exception
     */
    public String selectLastBatchOperId();

    /**
     * Key에 해당하는 배치작업 정보를 조회한다.
     * @param batchOperId - 배치작업 ID
     * @return 조회한 배치작업 정보
     */
    public BatchOperVO selectBatchOperByKey(String batOperId);

    /**
     * 조회 조건에 해당하는 배치작업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchOperSearchVO
     * @return 조회 목록
     */
    public List<BatchOperVO> selectBatchOpersByCondition(BatchOperSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 배치작업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchOperSearchVO
     * @return
     */
    public int selectBatchOpersByConditionCnt(BatchOperSearchVO searchVO);
}
