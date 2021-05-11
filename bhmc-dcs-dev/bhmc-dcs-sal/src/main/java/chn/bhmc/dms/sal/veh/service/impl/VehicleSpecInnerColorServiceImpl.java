package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleSpecInnerColorService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecInnerColorDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecInnerColorServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.      Kim yewon             최초 생성
 * </pre>
 */

@Service("vehicleSpecInnerColorService")
public class VehicleSpecInnerColorServiceImpl extends HService implements VehicleSpecInnerColorService {

    /**
     * 내장색 DAO 선언
     */
    @Resource(name="vehicleSpecInnerColorDAO")
    VehicleSpecInnerColorDAO vehicleSpecInnerColorDAO;

    /**
     * 조회 조건에 해당하는 내장색 정보를 조회한다.
     */
    @Override
    public List<VehicleColorVO> selectVehicleInnerColorByCondition(VehicleColorSearchVO searchVO) throws Exception {
        return vehicleSpecInnerColorDAO.selectVehicleInnerColorByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 내장색 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleInnerColorByConditionCnt(VehicleColorSearchVO searchVO) throws Exception {
        return vehicleSpecInnerColorDAO.selectVehicleInnerColorByConditionCnt(searchVO);
    }

}
