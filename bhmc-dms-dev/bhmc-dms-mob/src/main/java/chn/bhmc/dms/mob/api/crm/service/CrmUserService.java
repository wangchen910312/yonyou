package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.UserSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.UserVO;

/**
 * 사용자 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 02. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.19         Kang Seok Han            최초 생성
 * </pre>
 */

public interface CrmUserService {

    /**
     * 조회 조건에 해당하는 사용자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return 조회 목록
     */
	public List<UserVO> selectUsersByCondition(UserSearchVO searchVO) throws Exception;
    /**
     * 
     * @param sysCd 시스템구분
     * @param dlrCd 딜러코드
     * @param roleId 역할ID
     * @param viewId 화면ID
     * @param permissionNames 화면권한
     * @return
     * @throws Exception
     */
    public List<UserVO> selectUsersByRoleIdAndViewId(String sysCd, String dlrCd, String roleId, String viewId, String permissionNames) throws Exception;
}
