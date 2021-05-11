package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.UnitInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoVO;

/**
 * 단위 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.17         Kang Seok Han            최초 생성
 * </pre>
 */

public interface PartUnitInfoService {

   
	/**
     * 조회 조건에 해당하는 단위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UnitInfoSearchVO
     * @return 조회 목록
     */
	public List<UnitInfoVO> selectUnitInfosByCondition(UnitInfoSearchVO searchVO) throws Exception;

//	/**
//     * 조회 조건에 해당하는 단위 총 갯수를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 UnitInfoSearchVO
//     * @return
//     */
//	public int selectUnitInfosByConditionCnt(UnitInfoSearchVO searchVO) throws Exception;
}
