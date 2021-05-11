package chn.bhmc.dms.sal.dsc.service;

import java.util.List;

import chn.bhmc.dms.sal.dsc.vo.AuthorityFixSaveVO;
import chn.bhmc.dms.sal.dsc.vo.AuthorityFixSearchVO;
import chn.bhmc.dms.sal.dsc.vo.AuthorityFixVO;




/**
 *  Sales Allowance 현황 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.26         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface AuthorityFixService {


    /**
     *  메인 조회
     */
    public int selectAuthorityFixMainsByConditionCnt(AuthorityFixSearchVO searchVO) throws Exception;
    public List<AuthorityFixVO> selectAuthorityFixMainsByCondition(AuthorityFixSearchVO searchVO) throws Exception;


    /**
     *  서브 조회
     */
    public int selectAuthorityFixSubsByConditionCnt(AuthorityFixSearchVO searchVO) throws Exception;
    public List<AuthorityFixVO> selectAuthorityFixSubsByCondition(AuthorityFixSearchVO searchVO) throws Exception;

    /**
     * User 리스트 조회
     */
    public List<AuthorityFixVO> selectAuthorityFixUsrIdList(AuthorityFixSearchVO searchVO) throws Exception;

    /**
     * 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int multiAuthorityFixs(AuthorityFixSaveVO saveVO) throws Exception;

}
