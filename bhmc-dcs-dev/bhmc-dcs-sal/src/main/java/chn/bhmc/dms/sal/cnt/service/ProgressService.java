package chn.bhmc.dms.sal.cnt.service;

import java.util.List;

import chn.bhmc.dms.sal.cnt.vo.ContractCntVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;

/**
 * 계약품의현황 서비스
 *
 * @author Kim yewon
 * @since 2016. 2. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  --------------  ------------    ---------------------------
 *   2016.02.19      Kim yewon            최초 생성
 * </pre>
 */

public interface ProgressService {

	/**
     * 조회 조건에 해당하는 계약품위진척을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
	public List<ContractReVO> selectProgressByCondition(ContractSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 계약품위진척 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
	public int selectProgressByConditionCnt(ContractSearchVO searchVO) throws Exception;


	/**
     * 각 유형별 갯수를 조회한다.
     * @param
     * @return
     */
    public List<ContractCntVO> selectPannelCnt() throws Exception;

}
