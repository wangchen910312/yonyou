package chn.bhmc.dms.sal.acu.service;

import chn.bhmc.dms.sal.acu.vo.ContBeforeMngOutBoundVO;




/**
 *  ContBeforeMngOutBoundService 계약관련 out Bound
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

public interface ContBeforeMngOutBoundService {

    /**
     * 판매기회로 넘어온 예판계약을 임시저장한다.
     * @param saveVO
     * @throws Exception
     */
    public String saveOpptContBefore(ContBeforeMngOutBoundVO saveVO) throws Exception;

    
    /**
     * [CRM 호출]: 계약진행중인 고객정보 변경
     * @param custCd : 고객코드 , dlrCd : 딜러코드
     * @return
     * @throws Exception
     */
    public int updateContBeforeCustInfo(String custCd, String dlrCd) throws Exception;
}
