package chn.bhmc.dms.sal.btc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.btc.service.VehicleSettlementOrderService;
import chn.bhmc.dms.sal.btc.service.dao.VehicleSettlementOrderDAO;
import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderSaveVO;
import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderSearchVO;
import chn.bhmc.dms.sal.btc.vo.VehicleSettlementOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSettlementOrderServiceImpl
 * @Description : 완성차 정산순위
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

@Service("vehicleSettlementOrderService")
public class VehicleSettlementOrderServiceImpl extends HService implements VehicleSettlementOrderService {

    /**
     * 로컬옵션 DAO 선언
     */
    @Resource(name="vehicleSettlementOrderDAO")
    VehicleSettlementOrderDAO vehicleSettlementOrderDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<VehicleSettlementOrderVO> selectVehicleSettlementOrderByCondition(VehicleSettlementOrderSearchVO searchVO) throws Exception {
        return vehicleSettlementOrderDAO.selectVehicleSettlementOrderByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleSettlementOrderByConditionCnt(VehicleSettlementOrderSearchVO searchVO)  throws Exception {
        return vehicleSettlementOrderDAO.selectVehicleSettlementOrderByConditionCnt(searchVO);
    }

    /**
     * 해당 키의 값을 조회한다.
     */
    @Override
    public List<VehicleSettlementOrderVO> selectVehicleSettlementOrderByKey(VehicleSettlementOrderVO searchVO) throws Exception {
        return vehicleSettlementOrderDAO.selectVehicleSettlementOrderByKey(searchVO);
    }

    @Override
    public void multiVehicleSettlementOrder(VehicleSettlementOrderSaveVO obj) throws Exception {


        for(VehicleSettlementOrderVO vehicleSttlOrdVO : obj.getInsertList()){
            vehicleSttlOrdVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            vehicleSttlOrdVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            if( vehicleSettlementOrderDAO.selectVehicleSettlementOrderByKey(vehicleSttlOrdVO).size() > 0){

                throw processException("global.err.duplicate");
            }
            vehicleSettlementOrderDAO.insertVehicleSettlementOrder(vehicleSttlOrdVO);
        }

        for(VehicleSettlementOrderVO vehicleSttlOrdVO : obj.getUpdateList()){
            vehicleSttlOrdVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            vehicleSettlementOrderDAO.updateVehicleSettlementOrder(vehicleSttlOrdVO);
        }

        for(VehicleSettlementOrderVO vehicleSttlOrdVO : obj.getDeleteList()){

            vehicleSettlementOrderDAO.deleteVehicleSettlementOrder(vehicleSttlOrdVO);
        }
    }

}
