package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecCarlineDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecCarlineServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kim yewon              최초 생성
 * </pre>
 */

@Service("vehicleSpecCarlineService")
public class VehicleSpecCarlineServiceImpl extends HService implements VehicleSpecCarlineService {

    /**
     * 차종 DAO 선언
     */
    @Resource(name="vehicleSpecCarlineDAO")
    VehicleSpecCarlineDAO vehicleSpecCarlineDAO;

    /**
     * 조회 조건에 해당하는 차종 정보를 조회한다.
     */
    @Override
    public List<VehicleVO> selectVehicleCarlineByCondition(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecCarlineDAO.selectVehicleCarlineByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 차종 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleCarlineByConditionCnt(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecCarlineDAO.selectVehicleCarlineByConditionCnt(searchVO);
    }

}
