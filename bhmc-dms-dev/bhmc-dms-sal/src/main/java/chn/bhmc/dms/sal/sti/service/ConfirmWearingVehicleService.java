package chn.bhmc.dms.sal.sti.service;

import java.util.List;

import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehiclePopupVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSaveVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSearchVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleVO;

/**
 * 완성차 입고확정 서비스
 *
 * @author Bong
 * @since 2016. 3. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.14         Bong            최초 생성
 * </pre>
 */

public interface ConfirmWearingVehicleService {

	/**
     * 조회 조건에 해당하는 완성차 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ConfirmWearingVehicleSearchVO
     * @return 조회 목록
     */
	public List<ConfirmWearingVehicleVO> selectConfirmWearingVehicleByCondition(ConfirmWearingVehicleSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 완성차 입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ConfirmWearingVehicleSearchVO
     * @return
     */
	public int selectConfirmWearingVehicleByConditionCnt(ConfirmWearingVehicleSearchVO searchVO) throws Exception;

	/**
     * 완성차 입고확정 및 확정취소 처리한다
     * @param ConfirmWearingVehicleSaveVO- 조회 조건을 포함하는 ConfirmWearingVehicleVO
     * @return
     */
	public void updateConfirmWearingVehicle(ConfirmWearingVehicleVO vehicleVO, ConfirmWearingVehicleSaveVO saveVO) throws Exception;

	/**
     * 입고확정 팝업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ConfirmWearingVehicleSearchVO
     * @return 조회 목록
     */
	public List<ConfirmWearingVehiclePopupVO> selectConfirmWearingVehiclePopup(ConfirmWearingVehicleSearchVO searchVO) throws Exception;


    /**
     * 완성차 입고 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     */
	public int retVehicleInfosByConditionCnt(ConfirmWearingVehicleSearchVO SearchVO) throws Exception;
	public List<ConfirmWearingVehicleVO> retVehicleInfosByCondition(ConfirmWearingVehicleSearchVO SearchVO) throws Exception;

}
