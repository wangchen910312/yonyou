package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleSpecOuterColorService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecOuterColorDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleColorVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecOuterColorServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18     Kim ye won              최초 생성
 * </pre>
 */

@Service("vehicleSpecOuterColorService")
public class VehicleSpecOuterColorServiceImpl extends HService implements VehicleSpecOuterColorService {

    /**
     * 외장색상 DAO 선언
     */
    @Resource(name="vehicleSpecOuterColorDAO")
    VehicleSpecOuterColorDAO vehicleSpecOuterColorDAO;

    /**
     * 조회 조건에 해당하는 외장색상 정보를 조회한다.
     */
    @Override
    public List<VehicleColorVO> selectOuterColorByCondition(VehicleColorSearchVO searchVO) throws Exception {
        return vehicleSpecOuterColorDAO.selectOuterColorByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 외장색상 총 갯수를 조회한다.
     */
    @Override
    public int selectOuterColorByConditionCnt(VehicleColorSearchVO searchVO) throws Exception {
        return vehicleSpecOuterColorDAO.selectOuterColorByConditionCnt(searchVO);
    }

}
