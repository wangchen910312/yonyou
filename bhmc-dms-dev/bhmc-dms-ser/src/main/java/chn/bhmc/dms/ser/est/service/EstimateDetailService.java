package chn.bhmc.dms.ser.est.service;

import java.util.List;

import chn.bhmc.dms.ser.est.vo.EstimateDetailVO;
import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateDetailService.java
 * @Description : 정산 디테일 Service
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface EstimateDetailService {

    /**
     * 조회 조건에 해당하는 디테일 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 EstimateSearchVO
     * @return 조회 목록
     */
    public int selectEstimateDetailsByConditionCnt(EstimateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 디테일을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 EstimateSearchVO
     * @return 조회 목록
     */
    public List<EstimateDetailVO> selectEstimateDetailsByCondition(EstimateSearchVO searchVO) throws Exception;

    /**
     * 견적 디테일을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteEstimateDetail(EstimateDetailVO estimateDetailVO) throws Exception;

    /**
     * 견적 디테일을 추가한다.
     * @param resvDocNo
     * @return
     */
    public void insertEstimateDetail(EstimateDetailVO estimateDetailVO) throws Exception;


}