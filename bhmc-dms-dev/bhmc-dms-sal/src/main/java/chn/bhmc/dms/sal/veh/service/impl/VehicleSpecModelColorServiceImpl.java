package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleSpecModelColorService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecModelColorDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecModelColorServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18      Kim yewon             최초 생성
 * </pre>
 */

@Service("vehicleSpecModelColorService")
public class VehicleSpecModelColorServiceImpl extends HService implements VehicleSpecModelColorService {

    /**
     * 모델컬러 DAO 선언
     */
    @Resource(name="vehicleSpecModelColorDAO")
    VehicleSpecModelColorDAO vehicleSpecModelColorDAO;

    /**
     * 조회 조건에 해당하는 모델컬러 정보를 조회한다.
     */
    @Override
    public List<VehicleColorVO> selectVehicleModelColorByCondition(VehicleColorSearchVO searchVO) throws Exception {
        return vehicleSpecModelColorDAO.selectVehicleModelColorByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 모델컬러 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleModelColorByConditionCnt(VehicleColorSearchVO searchVO) throws Exception {
        return vehicleSpecModelColorDAO.selectVehicleModelColorByConditionCnt(searchVO);
    }

}
