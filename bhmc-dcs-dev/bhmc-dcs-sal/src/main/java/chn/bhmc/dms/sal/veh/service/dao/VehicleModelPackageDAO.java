package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.VehicleModelPackageSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleModelPackageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleModelPackageDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Bong
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Bong     최초 생성
 * </pre>
 */

@Mapper("vehicleModelPackageDAO")
public interface VehicleModelPackageDAO {

    /**
      * 조회 조건에 해당하는 차량 OCN구성 정보를 조회한다.
      */
    public List<VehicleModelPackageVO> selectVehicleOcn(VehicleModelPackageSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 차량 OCN의 상세 옵션 정보를 조회한다.
     */
    public List<VehicleModelPackageVO> selectVehicleOcnOption(VehicleModelPackageSearchVO searchVO);
}
