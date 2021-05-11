package chn.bhmc.dms.sal.veh.service;

import java.util.List;

import chn.bhmc.dms.sal.veh.vo.VehicleOcnSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleOcnVO;

/**
 * 차량 OCN 구성정보 조회
 *
 * @author Bong
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                     수정자                       수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18          Bong            최초 생성
 * </pre>
 */

public interface VehicleOcnService {

	/**
     * 조회 조건에 해당하는 차량 OCN 구성정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleOcnSearchVO
     * @return 조회 목록
     */
	public List<VehicleOcnVO> selectVehicleOcn(VehicleOcnSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 차량 OCN 옵션 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleOcnSearchVO
     * @return
     */
	public List<VehicleOcnVO> selectVehicleOcnOption(VehicleOcnSearchVO searchVO) throws Exception;
}
