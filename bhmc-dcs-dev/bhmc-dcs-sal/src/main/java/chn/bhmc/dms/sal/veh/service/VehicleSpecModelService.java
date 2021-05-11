package chn.bhmc.dms.sal.veh.service;

import java.util.List;

import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleVO;

/**
 * 모델 관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 1. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ------------    ------------    ---------------------------
 *   2016.01.19      Kim yewon             최초 생성
 * </pre>
 */

public interface VehicleSpecModelService {

	/**
     * 조회 조건에 해당하는 모델 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
	public List<VehicleVO> selectVehicleModelByCondition(VehicleSearchVO searchVO) throws Exception;


	/**
     * 조회 조건에 해당하는 모델 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
	public int selectVehicleModelByConditionCnt(VehicleSearchVO searchVO) throws Exception;


	/**
     * 차량모델 목록 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<VehicleVO> selectVehicleModelListByCondition(VehicleSearchVO searchVO) throws Exception;

}
