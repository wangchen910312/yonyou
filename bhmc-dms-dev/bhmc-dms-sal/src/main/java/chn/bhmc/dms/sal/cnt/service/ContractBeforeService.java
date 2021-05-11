package chn.bhmc.dms.sal.cnt.service;

import java.util.List;

import chn.bhmc.dms.sal.cnt.vo.ContractBeforeItemVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeVO;


/**
 * 전략출고(선출고관리)
 * @author Kim Jin Suk
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

public interface ContractBeforeService {

    /**
     * 조회 조건에 해당하는 전략출고 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    public int selectcontractBeforesByConditionCnt(ContractBeforeSearchVO searchVO) throws Exception;
    /**
     * 조회 조건에 해당하는 전략출고 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<ContractBeforeVO> selectcontractBeforesByCondition(ContractBeforeSearchVO searchVO) throws Exception;

    /**
     * 전략출고 대상 목록 갯수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectcontractBeforeItemSearchCnt(ContractBeforeSearchVO searchVO) throws Exception;

    /**
     * 전략출고 대상 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContractBeforeItemVO> selectcontractBeforeItemSearch(ContractBeforeSearchVO searchVO) throws Exception;

    /**
     * 전략출고를 진행한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public String multiContractBefore(ContractBeforeSaveVO saveVO) throws Exception;
}