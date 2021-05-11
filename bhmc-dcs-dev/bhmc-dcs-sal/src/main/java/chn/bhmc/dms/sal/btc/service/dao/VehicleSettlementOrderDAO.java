package chn.bhmc.dms.sal.btc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderSearchVO;
import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSettlementOrderDAO
 * @Description : 완성차 정산순위 DAO
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

@Mapper("vehicleSettlementOrderDAO")
public interface VehicleSettlementOrderDAO {


    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<VehicleSettlementOrderVO> selectVehicleSettlementOrderByCondition(VehicleSettlementOrderSearchVO searchVO);

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectVehicleSettlementOrderByConditionCnt(VehicleSettlementOrderSearchVO searchVO);

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    public List<VehicleSettlementOrderVO> selectVehicleSettlementOrderByKey(VehicleSettlementOrderVO searchVO);

    /**
     * 로컬옵션을 저장한다.
     * @param LocalOptionVO
     * @return
     */
    public int insertVehicleSettlementOrder(VehicleSettlementOrderVO LocalVO);

    /**
     * 로컬옵션을 수정한다.
     * @param LocalOptionVO
     * @return
     */
    public int updateVehicleSettlementOrder(VehicleSettlementOrderVO LocalVO);

    /**
     * 로컬옵션 을 삭제한다.
     * @param LocalOptionVO
     * @return
     */
    public int deleteVehicleSettlementOrder(VehicleSettlementOrderVO LocalVO);

}
