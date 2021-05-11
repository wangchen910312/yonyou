package chn.bhmc.dms.sal.cnt.service;

import java.util.List;

import chn.bhmc.dms.sal.cnt.vo.ContractLocalOptionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractVO;



/**
 *  관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface ContractService {

    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<ContractVO> selectContractsByCondition(ContractSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    public int selectContractsByConditionCnt(ContractSearchVO searchVO) throws Exception;

    /**
     * 저장/수정 한다.
     */
    public String multiContracts(ContractSaveVO saveVO) throws Exception;

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public int deleteContract(ContractVO contVO) throws Exception;

    /**
     * 계약 승인요청 한다.
     */
    public String conRequestAppr(ContractVO contVO) throws Exception;

    /**
     * 계약 승인확정 한다.
     */
    public String approval(ContractVO contVO) throws Exception;

    /**
     * 계약 승인반려 한다.
     */
    public String approvalRollback(ContractVO contVO) throws Exception;

    /**
     * 계약별 로컬옵션 조회
     */
    public int selectLocalOptionListsByConditionCnt(ContractSearchVO searchVO) throws Exception;
    public List<ContractLocalOptionVO> selectLocalOptionListsByCondition(ContractSearchVO searchVO) throws Exception;


    /**
     * 계약별 프로모션 조회
     */
    public int selectPromotionListsByConditionCnt(ContractSearchVO searchVO) throws Exception;
    public List<ContractPromotionVO> selectPromotionListsByCondition(ContractSearchVO searchVO) throws Exception;

    /**
     * 계약 상태 조회 (출고 처리시 조회)
     */
    public String selectContractStatCd(ContractSearchVO searchVO) throws Exception;
}
