package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecComboCommDAO.java
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

@Mapper("vehicleSpecComboCommDAO")
public interface VehicleSpecComboCommDAO {

    /**
     * 차종콤보에 넣을 데이터를 검색한다.
     */
    public List<VehicleSpecVO> selectCarlineCombo(VehicleSpecSearchVO searchVO) throws Exception;

    /**
     * 차관콤보에 넣을 데이터를 검색한다.
     */
    public List<VehicleSpecVO> selectModelTypeCombo(VehicleSpecSearchVO searchVO) throws Exception;

    /**
     * OCN콤보에 넣을 데이터를 검색한다.
     */
    public List<VehicleSpecVO> selectOcnCombo(VehicleSpecSearchVO searchVO) throws Exception;

    /**
     * 외색콤보에 넣을 데이터를 검색한다.
     */
    public List<VehicleSpecVO> selectExtColorCombo(VehicleSpecSearchVO searchVO) throws Exception;

    /**
     * 내색콤보에 넣을 데이터를 검색한다.
     */
    public List<VehicleSpecVO> selectIntColorCombo(VehicleSpecSearchVO searchVO) throws Exception;
}
