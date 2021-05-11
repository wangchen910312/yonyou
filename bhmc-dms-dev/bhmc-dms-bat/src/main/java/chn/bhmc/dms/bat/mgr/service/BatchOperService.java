package chn.bhmc.dms.bat.mgr.service;

import java.util.List;

import chn.bhmc.dms.bat.mgr.vo.BatchOperSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchOperSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchOperVO;



public interface BatchOperService {

    /**
     * 배치작업 정보를 등록한다.
     * @param batchOperVO - 등록할 정보가 담긴 BatchOperVO
     * @return 등록된 배치 작업 ID
     */
    public String insertBatchOper(BatchOperVO batchOperVO) throws Exception;

    /**
     * 배치작업 정보를 수정한다.
     * @param batchOperVO - 수정할 정보가 담긴 BatchOperVO
     * @return 수정된 목록수
     */
    public int updateBatchOper(BatchOperVO batchOperVO) throws Exception;

    /**
     * 배치작업 정보를 삭제한다.
     * @param batchOperVO - 삭제할 정보가 담긴 BatchOperVO
     * @return 삭제된 목록수
     */
    public int deleteBatchOper(BatchOperVO batchOperVO) throws Exception;

    /**
     * 배치작업 정보를 등록/수정/삭제 처리한다.
     * @param batchOperSaveVO
     */
    public void multiBatchOpers(BatchOperSaveVO batchOperSaveVO) throws Exception;

    /**
     * 신규배치작업 ID를 생성한다.
     * @return
     * @throws Exception
     */
    public String selectNextBatchOperId() throws Exception;

    /**
     * Key에 해당하는 배치작업 정보를 조회한다.
     * @param batchOperId - 배치작업 ID
     * @return 조회한 배치작업 정보
     */
    public BatchOperVO selectBatchOperByKey(String batOperId) throws Exception;

    /**
     * 조회 조건에 해당하는 배치작업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchOperSearchVO
     * @return 조회 목록
     */
    public List<BatchOperVO> selectBatchOpersByCondition(BatchOperSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 배치작업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatchOperSearchVO
     * @return
     */
    public int selectBatchOpersByConditionCnt(BatchOperSearchVO searchVO) throws Exception;

}
