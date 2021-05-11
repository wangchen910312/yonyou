package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.VehicleColorSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecModelColorDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("vehicleSpecModelColorDAO")
public interface VehicleSpecModelColorDAO {

    /**
      * 조회 조건에 해당하는 모델컬러 정보를 조회한다.
      */
    public List<VehicleColorVO> selectVehicleModelColorByCondition(VehicleColorSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 모델컬러 총 갯수를 조회한다.
     */
    public int selectVehicleModelColorByConditionCnt(VehicleColorSearchVO searchVO);
}
