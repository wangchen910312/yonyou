package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesVehicleSpecComboCommDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesVehicleSpecComboCommService;
import chn.bhmc.dms.mob.api.sales.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.VehicleSpecVO;


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

@Service("SalesVehicleSpecComboCommService")
public class SalesVehicleSpecComboCommImpl extends HService implements SalesVehicleSpecComboCommService {

    @Resource(name = "SalesVehicleSpecComboCommDAO")
    SalesVehicleSpecComboCommDAO SalesVehicleSpecComboCommDAO;

    /**
     * 차관콤보에 넣을 데이터를 검색한다.
     */
    @Override
    public List<VehicleSpecVO> selectModelTypeCombo(VehicleSpecSearchVO searchVO) throws Exception {
        return SalesVehicleSpecComboCommDAO.selectModelTypeCombo(searchVO);
    }
}
