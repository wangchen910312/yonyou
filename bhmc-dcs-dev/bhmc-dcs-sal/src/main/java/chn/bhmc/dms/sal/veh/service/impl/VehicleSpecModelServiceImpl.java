package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleSpecModelService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecModelDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecModelServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19      Kim yewon             최초 생성
 * </pre>
 */

@Service("vehicleSpecModelService")
public class VehicleSpecModelServiceImpl extends HService implements VehicleSpecModelService {

    /**
     * 모델 DAO 선언
     */
    @Resource(name="vehicleSpecModelDAO")
    VehicleSpecModelDAO vehicleSpecModelDAO;

    /**
     * 조회 조건에 해당하는 모델 정보를 조회한다.
     */
    @Override
    public List<VehicleVO> selectVehicleModelByCondition(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecModelDAO.selectVehicleModelByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 모델 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleModelByConditionCnt(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecModelDAO.selectVehicleModelByConditionCnt(searchVO);
    }


    /**
     * 차량모델 목록 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<VehicleVO> selectVehicleModelListByCondition(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecModelDAO.selectVehicleModelListByCondition(searchVO);
    }

}
