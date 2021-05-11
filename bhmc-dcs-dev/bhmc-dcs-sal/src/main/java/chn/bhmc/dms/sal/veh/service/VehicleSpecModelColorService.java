package chn.bhmc.dms.sal.veh.service;

import java.util.List;

import chn.bhmc.dms.sal.veh.vo.VehicleColorSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorVO;

/**
 * 모델컬러 관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  --------------  ------------    ---------------------------
 *   2016.01.18      Kim yewon            최초 생성
 * </pre>
 */

public interface VehicleSpecModelColorService {

	/**
     * 조회 조건에 해당하는 모델컬러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
	public List<VehicleColorVO> selectVehicleModelColorByCondition(VehicleColorSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 모델컬러 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
	public int selectVehicleModelColorByConditionCnt(VehicleColorSearchVO searchVO) throws Exception;
}
