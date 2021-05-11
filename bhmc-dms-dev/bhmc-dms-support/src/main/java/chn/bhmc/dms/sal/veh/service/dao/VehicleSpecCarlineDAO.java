package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecCarlineDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 1. 20
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("vehicleSpecCarlineDAO")
public interface VehicleSpecCarlineDAO {

    /**
      * 조회 조건에 해당하는 차종 정보를 조회한다.
      */
    public List<VehicleVO> selectVehicleCarlineByCondition(VehicleSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 차종 총 갯수를 조회한다.
     */
    public int selectVehicleCarlineByConditionCnt(VehicleSearchVO searchVO);
}
