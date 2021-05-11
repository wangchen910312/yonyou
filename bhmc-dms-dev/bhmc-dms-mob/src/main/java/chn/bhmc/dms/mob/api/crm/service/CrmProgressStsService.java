package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.ContractSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContractVO;


/**
 * 계약품의현황 서비스
 *
 * @author Kim yewon
 * @since 2016. 2. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  --------------  ------------    ---------------------------
 *   2016.02.18      Kim yewon            최초 생성
 * </pre>
 */

public interface CrmProgressStsService {

	/**
     * 조회 조건에 해당하는 계약품의현황을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
	public List<ContractVO> selectProgressStsByCondition(ContractSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 계약품의현황 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
	public int selectProgressStsByConditionCnt(ContractSearchVO searchVO) throws Exception;

}
