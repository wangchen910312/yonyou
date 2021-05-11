package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleSpecModelOcnPriceService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecModelOcnPriceDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecModelOcnPriceServiceImpl.java
 * @Description :
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

@Service("vehicleSpecModelOcnPriceService")
public class VehicleSpecModelOcnPriceServiceImpl extends HService implements VehicleSpecModelOcnPriceService {

    /**
     * 모델 DAO 선언
     */
    @Resource(name="vehicleSpecModelOcnPriceDAO")
    VehicleSpecModelOcnPriceDAO vehicleSpecModelOcnPriceDAO;

    /**
     * 조회 조건에 해당하는 모델 정보를 조회한다.
     */
    @Override
    public List<VehicleVO> selectVehicleModelOcnPrice(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecModelOcnPriceDAO.selectVehicleModelOcnPrice(searchVO);
    }

    /**
     * 조회 조건에 해당하는 모델 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleModelOcnPriceCnt(VehicleSearchVO searchVO) throws Exception {
        return vehicleSpecModelOcnPriceDAO.selectVehicleModelOcnPriceCnt(searchVO);
    }

    /**
     * 차량 OCN의 외색 데이터 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleSpecModelOcnExtColorCnt(VehicleSearchVO searchVO) throws Exception {
        searchVO.setUseYn("Y");
        return vehicleSpecModelOcnPriceDAO.selectVehicleSpecModelOcnExtColorCnt(searchVO);
    }
    /**
     * 차량 OCN의 외색 데이터를 조회한다.
     */
    @Override
    public List<VehicleColorVO> selectVehicleSpecModelOcnExtColor(VehicleSearchVO searchVO) throws Exception {
        searchVO.setUseYn("Y");
        return vehicleSpecModelOcnPriceDAO.selectVehicleSpecModelOcnExtColor(searchVO);
    }

    /**
     * 차량 OCN의 내색 데이터 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleSpecModelOcnIntColorCnt(VehicleSearchVO searchVO) throws Exception {
        searchVO.setUseYn("Y");
        return vehicleSpecModelOcnPriceDAO.selectVehicleSpecModelOcnIntColorCnt(searchVO);
    }
    /**
     * 차량 OCN의 내색 데이터를 조회한다.
     */
    @Override
    public List<VehicleColorVO> selectVehicleSpecModelOcnIntColor(VehicleSearchVO searchVO) throws Exception {
        searchVO.setUseYn("Y");
        return vehicleSpecModelOcnPriceDAO.selectVehicleSpecModelOcnIntColor(searchVO);
    }

}
