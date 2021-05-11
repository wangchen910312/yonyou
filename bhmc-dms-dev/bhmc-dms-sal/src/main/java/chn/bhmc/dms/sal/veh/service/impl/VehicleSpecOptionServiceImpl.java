package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleSpecOptionService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecOptionDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleImageVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleVO;

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

    /**
     * 조회 조건에 해당하는 옵션 정보를 조회한다.
     */
    @Override
    public List<VehicleVO> selectVehicleOptionByCondition(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecOptionDAO.selectVehicleOptionByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 옵션 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleOptionByConditionCnt(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecOptionDAO.selectVehicleOptionByConditionCnt(searchVO);
    }
}
