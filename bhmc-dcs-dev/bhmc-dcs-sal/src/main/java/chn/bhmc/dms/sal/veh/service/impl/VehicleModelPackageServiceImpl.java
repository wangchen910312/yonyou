package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleModelPackageService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleModelPackageDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleModelPackageSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleModelPackageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleModelPackageServiceImpl.java
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

@Service("vehicleModelPackageService")
public class VehicleModelPackageServiceImpl extends HService implements VehicleModelPackageService {

    /**
     * 차량 OCN DAO 선언
     */
    @Resource(name="vehicleModelPackageDAO")
    VehicleModelPackageDAO vehicleModelPackageDAO;

    /**
     * 조회 조건에 해당하는 차량 OCN 구성 정보를 조회한다.
     */
    @Override
    public List<VehicleModelPackageVO> selectVehicleOcn(VehicleModelPackageSearchVO searchVO) throws Exception {
        return vehicleModelPackageDAO.selectVehicleOcn(searchVO);
    }

    /**
     * 조회 조건에 해당하는 차량 OCN 옵션 정보를 조회한다.
     */
    @Override
    public List<VehicleModelPackageVO> selectVehicleOcnOption(VehicleModelPackageSearchVO searchVO) throws Exception {
        return vehicleModelPackageDAO.selectVehicleOcnOption(searchVO);
    }

}
