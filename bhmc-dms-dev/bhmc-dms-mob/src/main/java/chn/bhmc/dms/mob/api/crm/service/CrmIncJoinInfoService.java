package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.IncJoinInfoVO;

/**
 * 보험가입정보관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 5. 03.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.05.03         Kim yewon            최초 생성
 * </pre>
 */

public interface CrmIncJoinInfoService {


	/**
     * 조회 조건에 해당하는 보험가입정보관리를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return 조회 목록
     */
	public List<IncJoinInfoVO> selectIncJoinInfoByCondition(IncJoinInfoSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 보험가입정보관리를 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
	public int selectIncJoinInfoByConditionCnt(IncJoinInfoSearchVO searchVO) throws Exception;
	
	//도시코드
    public List<IncJoinInfoVO> selectCityCd(IncJoinInfoVO vo) throws Exception;
    
    //지역코드
    public List<IncJoinInfoVO> selectDistCd(IncJoinInfoVO vo) throws Exception;
}
