package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.RepairOrderVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderService.java
 * @Description : Ro Service
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface CrmRepairOrderService {

    /**
     * 정비 이력 조회
     *
     * @param searchVO
     * @return
     */
    public List<RepairOrderVO> selectRepairOrdersHistory(RepairOrderSearchVO searchVO)throws Exception;
}