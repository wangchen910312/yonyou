package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.mob.api.crm.vo.VehicleMasterSearchVO;


/**
 * 차량마스터 관리
 *
 * @author Kim yewon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.01.29         Kim yewon            최초 생성
 * </pre>
 */

public interface CrmVehicleMasterService {


	/**
	 * CRM : 차량 계약자 정보 조회
	 */
	public int selectVehicleCustomerInfoByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
	public List<VehicleCustomerInfoVO> selectVehicleCustomerInfoByCondition(VehicleMasterSearchVO searchVO) throws Exception;
}