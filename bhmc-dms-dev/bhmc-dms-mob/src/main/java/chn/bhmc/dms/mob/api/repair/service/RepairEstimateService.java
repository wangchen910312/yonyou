package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;

import chn.bhmc.dms.mob.api.repair.vo.EstimateSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.EstimateVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface RepairEstimateService {

    public EstimateVO selectEstimateManageByKey(EstimateSearchVO searchVO) throws Exception;

    public int selectEstimateListByConditionCnt(EstimateSearchVO searchVO)throws Exception;

    public List<EstimateVO> selectEstimateListByCondition(EstimateSearchVO searchVO)throws Exception;
   
}
