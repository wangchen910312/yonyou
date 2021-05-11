package chn.bhmc.dms.sal.btc.service;

import java.util.List;

import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderSaveVO;
import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderSearchVO;
import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderVO;

/**
 * 완성차 정산순서 관리 서비스
 *
 * @author Bong
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Bong            최초 생성
 * </pre>
 */

public interface VehicleSettlementOrderService {

	/**
     * 조회 조건에 해당하는 완성차 정산순위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSettlementOrderSearchVO
     * @return 조회 목록
     */
	public List<VehicleSettlementOrderVO> selectVehicleSettlementOrderByCondition(VehicleSettlementOrderSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 완성차 정산순위 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSettlementOrderSearchVO
     * @return
     */
	public int selectVehicleSettlementOrderByConditionCnt(VehicleSettlementOrderSearchVO searchVO) throws Exception;

	/**
     * 해당 키값 정보를 조회한다.
     * @param searchVO - 키를 포함하는 VehicleSettlementOrderVO
     * @return 조회 목록
     */
    public List<VehicleSettlementOrderVO> selectVehicleSettlementOrderByKey(VehicleSettlementOrderVO searchVO) throws Exception;

	/**
     * 완성차 정산순위를 등록/수정/삭제 처리한다
     * @param VehicleSettlementOrderSaveVO- 조회 조건을 포함하는 VehicleSettlementOrderVO
     * @return
     */
	public void multiVehicleSettlementOrder(VehicleSettlementOrderSaveVO vehicleSettlementOrderSaveVO) throws Exception;



}
