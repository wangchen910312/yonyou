package chn.bhmc.dms.sal.cnt.service;

import java.util.List;

import chn.bhmc.dms.sal.cnt.vo.ContractReSupportSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;




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

public interface ContractReOutBoundService {

    /**
     * 판매기회로 넘어온 계약언을 임시저장한다.
     * @param saveVO
     * @throws Exception
     */
    public String saveOpptContracts(ContractReSupportVO saveVO) throws Exception;

    /**
     * 보험정보관리 내역을 계약에 반영하여 저장
     * @param saveVO
     * @throws Exception
     */
    public int contractIncSave(ContractReSupportVO saleVO, List<IncJoinInfoVO> incList) throws Exception;
    
    /**
     * 보험정보관리의 퇴보로 인한 계약내역 지움.  
     * @param saveVO
     * @throws Exception
     */
    public int contractIncDelete(IncJoinInfoVO saveVO) throws Exception;
    
    /**
     * [CRM 조회용]:계약자 - 중고차 치환을 통한 계약자의 최신 차량정보
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContractReSupportVO> selectCustContractUseCarInfoSearch(ContractReSupportSearchVO searchVO) throws Exception;
    
    /**
     * [CRM 호출]: 계약진행중인 고객정보 변경
     * @param custCd : 고객코드 , dlrCd : 딜러코드
     * @return
     * @throws Exception
     */
    public int updateContractCustInfo(String custCd, String dlrCd) throws Exception;

    
}
