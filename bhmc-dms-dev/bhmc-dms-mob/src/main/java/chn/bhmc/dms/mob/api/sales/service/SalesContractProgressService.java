package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.ContractReSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.ContractReVO;



/**
 *  계약종합조회 서비스
 *
 * @author Kim Jin Suk
 * @since 2016. 10. 24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.10.24         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface SalesContractProgressService {

    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<ContractReVO> selectContractProgressByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    public int selectContractProgressByConditionCnt(ContractReSearchVO searchVO) throws Exception;

}