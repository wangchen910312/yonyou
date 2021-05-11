package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleOcnService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleOcnDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleOcnSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleOcnVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleOcnServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.      Bong               최초 생성
 * </pre>
 */

@Service("vehicleOcnService")
public class VehicleOcnServiceImpl extends HService implements VehicleOcnService {

    /**
     * 차량 OCN DAO 선언
     */
    @Resource(name="vehicleOcnDAO")
    VehicleOcnDAO vehicleOcnDAO;

    /**
     * 조회 조건에 해당하는 차량 OCN 구성 정보를 조회한다.
     */
    @Override
    public List<VehicleOcnVO> selectVehicleOcn(VehicleOcnSearchVO searchVO) throws Exception {
        return vehicleOcnDAO.selectVehicleOcn(searchVO);
    }

    /**
     * 조회 조건에 해당하는 차량 OCN 옵션 정보를 조회한다.
     */
    @Override
    public List<VehicleOcnVO> selectVehicleOcnOption(VehicleOcnSearchVO searchVO) throws Exception {
        return vehicleOcnDAO.selectVehicleOcnOption(searchVO);
    }

}
