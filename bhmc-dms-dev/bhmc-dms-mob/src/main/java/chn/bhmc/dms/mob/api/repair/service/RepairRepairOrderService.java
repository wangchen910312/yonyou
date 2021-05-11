package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;

import chn.bhmc.dms.mob.api.repair.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderVO;




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

public interface RepairRepairOrderService {
	
	public int selectRepairOrderInfoListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;
	
	public int selectRepairOrderListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;
	
	public int selectCarWashListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;
	
	public List<RepairOrderVO> selectCarWashListByCondition(RepairOrderSearchVO searchVO) throws Exception;
	
	public List<RepairOrderVO> selectRepairOrderInfoListByCondition(RepairOrderSearchVO searchVO) throws Exception;
	
	public List<RepairOrderVO> selectEtcHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;
	
	public List<RepairOrderVO> selectCustDmndHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;
	
	public List<RepairOrderVO> selectLbrHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;
	
	public List<RepairOrderVO> selectRepairOrderListByCondition(RepairOrderSearchVO searchVO) throws Exception;
	
	public List<RepairOrderVO> selectRepairOrderHistoryByCondition(RepairOrderSearchVO searchVO) throws Exception;

    public int selectRepairOrderByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    public List<RepairOrderVO> selectRepairOrderByCondition(RepairOrderSearchVO searchVO) throws Exception;

}