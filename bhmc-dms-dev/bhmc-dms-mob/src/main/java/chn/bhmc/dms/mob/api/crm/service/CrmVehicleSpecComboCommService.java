package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.VehicleSpecVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecComboCommService.java
 * @Description : 차량스펙콤보용데이터를 가져온다.
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

public interface CrmVehicleSpecComboCommService {

    /**
     * 차관콤보에 넣을 데이터를 검색한다.
     */
    public List<VehicleSpecVO> selectModelTypeCombo(VehicleSpecSearchVO searchVO) throws Exception;
}
