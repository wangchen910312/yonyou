package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.VehicleImageVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecOptionDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18      Kim yewon            최초 생성
 * </pre>
 */

@Mapper("vehicleSpecOptionDAO")
public interface VehicleSpecOptionDAO {
	/**
    * 차량ID에 해당하는 차량의 이미지 목록을 조회한다.
    * 차량등록증 등 차량에 관한 모든 이미지 목록을 반환한다.
    * @param carId - 차량ID
    * @return 조회 목록
    */
	public List<VehicleImageVO> selectVehicleImagesWithDocument(String carId);

	/**
    * 차량ID에 해당하는 차량의 이미지 목록을 조회한다.
    * @param carId - 차량ID
    * @return 조회 목록
    */
	public List<VehicleImageVO> selectVehicleImages(String carId);

    /**
     * 조회 조건에 해당하는 옵션 정보를 조회한다.
     */
   public List<VehicleVO> selectVehicleOptionByCondition(VehicleSearchVO searchVO);

   /**
    *  조회 조건에 해당하는 옵션 총 갯수를 조회한다.
    */
   public int selectVehicleOptionByConditionCnt(VehicleSearchVO searchVO);
}
