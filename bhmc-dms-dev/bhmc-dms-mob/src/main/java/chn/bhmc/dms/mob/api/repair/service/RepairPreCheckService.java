package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;
import chn.bhmc.dms.mob.api.repair.vo.PreCheckSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.PreCheckVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface RepairPreCheckService {

    public int selectPreCheckListByConditionCnt(PreCheckSearchVO searchVO) throws Exception;

    public List<PreCheckVO> selectPreCheckListByCondition(PreCheckSearchVO searchVO) throws Exception;

   
}
