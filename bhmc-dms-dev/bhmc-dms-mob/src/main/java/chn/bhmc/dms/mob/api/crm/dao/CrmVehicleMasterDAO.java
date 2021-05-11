package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.mob.api.crm.vo.VehicleMasterSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterDAO.java
 * @Description : 차량마스터 관리
 * @author Kim yewon
 * @since 2016. 1. 29
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("CrmvehicleMasterDAO")
public interface CrmVehicleMasterDAO {


    /**
     * CRM : 차량 계약자 정보 조회
     */
    public int selectVehicleCustomerInfoByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception;
    public List<VehicleCustomerInfoVO> selectVehicleCustomerInfoByCondition(VehicleMasterSearchVO searchVO) throws Exception;

}
