package chn.bhmc.dms.sal.lom.service;

import java.util.List;

import chn.bhmc.dms.sal.lom.vo.DistributorAbnormalInventorySearchVO;
import chn.bhmc.dms.sal.lom.vo.DistributorAbnormalInventoryVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionSearchVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleMonitoringDlrDetailPopupVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TpVehicleMonitoringService
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

public interface DistributorAbnormalInventoryService {
	public List<TpVehicleConditionVO> selectDistributorAbnormalInventory(DistributorAbnormalInventorySearchVO searchVO) throws Exception;
}
