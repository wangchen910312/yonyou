package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;

import chn.bhmc.dms.mob.api.repair.vo.WorkAssignSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.WorkAssignVO;



/**
 * <pre>
 * 작업배정 관리 Service
 * </pre>
 * @ClassName   : WorkAssignService.java
 * @Description : 작업배정 관리 Service
 * @author Yin Xueyuan
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.   Yin Xueyuan      최초 생성
 * </pre>
 */

public interface RepairWorkAssignService {

    public List<WorkAssignVO> selectWorkAssignByCondition(WorkAssignSearchVO searchVO) throws Exception;

    public int selectWorkAssignByConditionCnt(WorkAssignSearchVO searchVO) throws Exception;

    
}
