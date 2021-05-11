package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecOptionService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecOptionDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleImageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecOptionServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18      Kim yewon             최초 생성
 * </pre>
 */

@Service("vehicleSpecOptionService")
public class VehicleSpecOptionServiceImpl extends HService implements VehicleSpecOptionService {

    /**
     * 옵션 DAO 선언
     */
    @Resource(name="vehicleSpecOptionDAO")
    VehicleSpecOptionDAO vehicleSpecOptionDAO;
    
    @Override
	public List<VehicleImageVO> selectVehicleImagesWithDocument(String carId) throws Exception {
		return vehicleSpecOptionDAO.selectVehicleImagesWithDocument(carId);
	}

	@Override
	public List<VehicleImageVO> selectVehicleImages(String carId) throws Exception {
		return vehicleSpecOptionDAO.selectVehicleImages(carId);
	}
}
