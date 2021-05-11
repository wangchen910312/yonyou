package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.crm.cif.vo.VehicleBaseInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.VehicleBaseInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : VehicleBaseInfoService.java
 * @Description :车辆基础画面查询
 * @author Jia Ming
 * @since 2019. 1. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since     author             description
 *  ===========    =============    ===========================
 *  2019. 1. 9.     Jia Ming        车辆基础画面查询
 * </pre>
 */

public interface VehicleBaseInfoService {

	/**
	 * 
	 * @param searchVO
	 * @return
	 */
	public int selectVehicleBaseinfoConditionCnt(VehicleBaseInfoSearchVO searchVO) throws Exception;
	
	/**
	 * 
	 * @param searchVO
	 * @return
	 */
	public List<VehicleBaseInfoVO> selectVehicleBaseinfoCondition(VehicleBaseInfoSearchVO searchVO) throws Exception;
}
