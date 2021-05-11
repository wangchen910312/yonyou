package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.mob.api.crm.dao.CrmVehicleMasterDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmVehicleMasterService;
import chn.bhmc.dms.mob.api.crm.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.mob.api.crm.vo.VehicleMasterSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterServieceImpl.java
 * @Description : 차량마스터 관리
 * @author
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kim yewon              최초 생성
 * </pre>
 */

@Service("CrmvehicleMasterService")
public class CrmVehicleMasterServiceImpl extends HService implements CrmVehicleMasterService {

    /**
     * 차종 DAO 선언
     */
    @Resource(name="CrmvehicleMasterDAO")
    CrmVehicleMasterDAO CrmvehicleMasterDAO;

    /**
     * Camel Client Factory
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 고객 정보관리
     */
    @Resource(name="customerRelInfoService")
    CustomerRelInfoService customerRelInfoService;

    /**
     * 고객 필수정보
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * CRM : 차량 계약자 정보 조회
     */
    @Override
    public int selectVehicleCustomerInfoByConditionCnt(VehicleMasterSearchVO searchVO) throws Exception {
        return CrmvehicleMasterDAO.selectVehicleCustomerInfoByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleCustomerInfoVO> selectVehicleCustomerInfoByCondition(VehicleMasterSearchVO searchVO) throws Exception {
        return CrmvehicleMasterDAO.selectVehicleCustomerInfoByCondition(searchVO);
    }

}