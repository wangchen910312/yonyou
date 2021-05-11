package chn.bhmc.dms.sal.svo.service;

import java.util.List;

import chn.bhmc.dms.sal.svo.vo.PolicySearchVO;
import chn.bhmc.dms.sal.svo.vo.PolicyVO;

/**
 *  특수차 정책 이력 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.09.30         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface SpecialCarPolicyService {

    /**
     * 특수차 정책 이력 메인 조회
     */
    public int selectPolicyHistorysByConditionCnt(PolicySearchVO searchVO) throws Exception;
    public List<PolicyVO> selectPolicyHistorysByCondition(PolicySearchVO searchVO) throws Exception;

}
