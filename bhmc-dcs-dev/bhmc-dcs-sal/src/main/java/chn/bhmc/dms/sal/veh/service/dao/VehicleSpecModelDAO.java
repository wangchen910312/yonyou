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
 * @ClassName   : VehicleSpecModelDAO.java
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

@Mapper("vehicleSpecModelDAO")
public interface VehicleSpecModelDAO {

    /**
      * 조회 조건에 해당하는 모델 정보를 조회한다.
      */
    public List<VehicleVO> selectVehicleModelByCondition(VehicleSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 모델 총 갯수를 조회한다.
     */
    public int selectVehicleModelByConditionCnt(VehicleSearchVO searchVO);

    /**
     * 차량모델 목록 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<VehicleVO> selectVehicleModelListByCondition(VehicleSearchVO searchVO);



}
