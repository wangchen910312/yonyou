package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.ContractReSupportSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContractReSupportVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReOutBoundDAO
 * @Description : 계약 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("CrmcontractReOutBoundDAO")
public interface CrmContractReOutBoundDAO {

    /**
     * [CRM 조회용] : 계약자 - 중고차 치환을 통한 계약자의 최신 차량정보
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContractReSupportVO> selectCustContractUseCarInfoSearch(ContractReSupportSearchVO searchVO) throws Exception;
    
}