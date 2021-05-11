package chn.bhmc.dms.crm.cif.service.dao;
import java.util.List;

import chn.bhmc.dms.crm.cif.vo.VehicleBaseInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.VehicleBaseInfoVO;
import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : VehicleBaseInfoDAO.java
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

@Mapper("vehicleBaseInfoDAO")
public interface VehicleBaseInfoDAO {
      
	/**
	 * 
	 * @param searchVO
	 * @return
	 */
	public int selectVehicleBaseinfoConditionCnt(VehicleBaseInfoSearchVO searchVO);
	
	/**
	 * 
	 * @param searchVO
	 * @return
	 */
	public List<VehicleBaseInfoVO> selectVehicleBaseinfoCondition(VehicleBaseInfoSearchVO searchVO);
	
}
