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
 * @ClassName   : VehicleSpecInnerColorDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Kim yewon              최초 생성
 * </pre>
 */

@Mapper("vehicleSpecInnerColorDAO")
public interface VehicleSpecInnerColorDAO {

    /**
      * 조회 조건에 해당하는 차량 정보를 조회한다.
      */
    public List<VehicleColorVO> selectVehicleInnerColorByCondition(VehicleColorSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 차량 총 갯수를 조회한다.
     */
    public int selectVehicleInnerColorByConditionCnt(VehicleColorSearchVO searchVO);
}
