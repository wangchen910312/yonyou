package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.VehicleColorVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecModelOcnPriceDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 1. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 22      Kim yewon             최초 생성
 * </pre>
 */

@Mapper("vehicleSpecModelOcnPriceDAO")
public interface VehicleSpecModelOcnPriceDAO {

    /**
      * 조회 조건에 해당하는 모델 정보를 조회한다.
      */
    public List<VehicleVO> selectVehicleModelOcnPrice(VehicleSearchVO searchVO) throws Exception;

    /**
     *  조회 조건에 해당하는 모델 총 갯수를 조회한다.
     */
    public int selectVehicleModelOcnPriceCnt(VehicleSearchVO searchVO) throws Exception;


    /**
     * 차량 OCN의 외색 데이터 총 갯수를 조회한다.
     */
    public int selectVehicleSpecModelOcnExtColorCnt(VehicleSearchVO searchVO) throws Exception;

    /**
     * 차량 OCN의 외색 데이터를 조회한다.
     */
    public List<VehicleColorVO> selectVehicleSpecModelOcnExtColor(VehicleSearchVO searchVO) throws Exception;

    /**
     * 차량 OCN의 내색 데이터 총 갯수를 조회한다.
     */
    public int selectVehicleSpecModelOcnIntColorCnt(VehicleSearchVO searchVO) throws Exception;

    /**
     * 차량 OCN의 내색 데이터를 조회한다.
     */
    public List<VehicleColorVO> selectVehicleSpecModelOcnIntColor(VehicleSearchVO searchVO) throws Exception;

}