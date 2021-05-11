package chn.bhmc.dms.ser.est.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.est.vo.EstimateDetailVO;
import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateDetailDAO.java
 * @Description : 견적 디테일 DAO
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

@Mapper("estimateDetailDAO")
public interface EstimateDetailDAO {

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
     * 견적 디테일 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 EstimateDetailVO
     * @return 등록된 목록수
     */
    public void insertEstimateDetail(EstimateDetailVO obj);

    /**
     * 견적 디테일 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 EstimateDetailVO
     * @return 수정된 목록수
     */
    public void updateEstimateDetail(EstimateDetailVO obj);

    /**
     * 견적 디테일 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 EstimateDetailVO
     * @return 삭제된 목록수
     */
    public void deleteEstimateDetail(EstimateDetailVO obj);

}