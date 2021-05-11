package chn.bhmc.dms.sal.veh.service;

import java.util.List;

import chn.bhmc.dms.sal.veh.vo.VehicleImageVO;

/**
 * 옵션 관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                수정내용
 *  -------------- ------------    ---------------------------
 *   2016.01.18      Kim yewon            최초 생성
 * </pre>
 */

public interface VehicleSpecOptionService {
	
	/**
    * 차량ID에 해당하는 차량의 이미지 목록을 조회한다. 
    * 차량등록증 등 차량에 관한 모든 이미지 목록을 반환한다.
    * @param carId - 차량ID
    * @return 조회 목록
    */
	public List<VehicleImageVO> selectVehicleImagesWithDocument(String carId) throws Exception;
		
	
	/**
    * 차량ID에 해당하는 차량의 이미지 목록을 조회한다.
    * @param carId - 차량ID
    * @return 조회 목록
    */
	public List<VehicleImageVO> selectVehicleImages(String carId) throws Exception;
}
