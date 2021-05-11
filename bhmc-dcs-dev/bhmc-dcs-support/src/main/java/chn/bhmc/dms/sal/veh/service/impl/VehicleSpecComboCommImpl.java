package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleSpecComboCommDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecComboCommImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 4. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 15.     Lee Seungmin     최초 생성
 * </pre>
 */

@Service("vehicleSpecComboCommService")
public class VehicleSpecComboCommImpl extends HService implements VehicleSpecComboCommService {

    @Resource(name = "vehicleSpecComboCommDAO")
    VehicleSpecComboCommDAO vehicleSpecComboCommDAO;

    /**
     * 차종콤보에 넣을 데이터를 검색한다.
     */
    @Override
    public List<VehicleSpecVO> selectCarlineCombo(VehicleSpecSearchVO searchVO) throws Exception {
        return vehicleSpecComboCommDAO.selectCarlineCombo(searchVO);
    }

    /**
     * 차관콤보에 넣을 데이터를 검색한다.
     */
    @Override
    public List<VehicleSpecVO> selectModelTypeCombo(VehicleSpecSearchVO searchVO) throws Exception {
        return vehicleSpecComboCommDAO.selectModelTypeCombo(searchVO);
    }

    /**
     * OCN콤보에 넣을 데이터를 검색한다.
     */
    @Override
    public List<VehicleSpecVO> selectOcnCombo(VehicleSpecSearchVO searchVO) throws Exception {
        return vehicleSpecComboCommDAO.selectOcnCombo(searchVO);
    }

    /**
     * 외색콤보에 넣을 데이터를 검색한다.
     */
    @Override
    public List<VehicleSpecVO> selectExtColorCombo(VehicleSpecSearchVO searchVO) throws Exception {
        return vehicleSpecComboCommDAO.selectExtColorCombo(searchVO);
    }

    /**
     * 내색콤보에 넣을 데이터를 검색한다.
     */
    @Override
    public List<VehicleSpecVO> selectIntColorCombo(VehicleSpecSearchVO searchVO) throws Exception {
        return vehicleSpecComboCommDAO.selectIntColorCombo(searchVO);
    }
}
