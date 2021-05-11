package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;

import chn.bhmc.dms.mob.api.repair.vo.ServicePartVO;
import chn.bhmc.dms.mob.api.repair.vo.TabInfoSearchVO;




/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServicePartService.java
 * @Description : 공통 부품 Service
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface RepairServicePartService {

    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception;

    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception;

    
}