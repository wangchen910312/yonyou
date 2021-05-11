package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.ContractReSupportSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContractReSupportVO;




/**
 *  ContractReOutBoundService 계약관련 out Bound
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.08.16         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface CrmContractReOutBoundService {

    /**
     * [CRM 조회용]:계약자 - 중고차 치환을 통한 계약자의 최신 차량정보
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContractReSupportVO> selectCustContractUseCarInfoSearch(ContractReSupportSearchVO searchVO) throws Exception;

    
}
