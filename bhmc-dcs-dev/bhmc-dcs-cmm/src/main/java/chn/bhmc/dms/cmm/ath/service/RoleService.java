package chn.bhmc.dms.cmm.ath.service;

import java.util.List;

import chn.bhmc.dms.cmm.ath.vo.RoleSaveVO;
import chn.bhmc.dms.cmm.ath.vo.RoleSearchVO;
import chn.bhmc.dms.cmm.ath.vo.RoleVO;

/**
 * 역할 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                                  수정자                                 수정내용
 *  (Modification Date)   Developer            Contents
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

public interface RoleService {

    /**
     * 역할 정보를 등록한다.
     * @param roleVO - 등록할 정보가 담긴 RoleVO
     * @return 등록된 목록수
     */
    public int insertRole(RoleVO roleVO) throws Exception;

    /**
     * 역할 정보를 수정한다.
     * @param roleVO - 수정할 정보가 담긴 RoleVO
     * @return 수정된 목록수
     */
    public int updateRole(RoleVO roleVO) throws Exception;

    /**
     * 역할 정보를 삭제한다.
     * @param roleVO - 삭제할 정보가 담긴 RoleVO
     * @return 삭제된 목록수
     */
    public int deleteRole(RoleVO roleVO) throws Exception;

    /**
     * 역할ID로 역할정보를 조회한다.
     *
     * @param roleId 역할ID
     * @return 역할ID에 해당하는 역할 정보를 반환한다.
     * @throws Exception
     */
    public RoleVO selectRoleByKey(String roleId) throws Exception;

    /**
     * 역할 정보를 등록/수정/삭제 처리한다.
     * @param roleSaveVO
     */
	public void multiRoles(RoleSaveVO roleSaveVO) throws Exception;

	/**
     * 조회 조건에 해당하는 역할 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RoleSearchVO
     * @return
     */
    public List<RoleVO> selectRolesByCondition(RoleSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 역할 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SearchVO
     * @return
     */
    public int selectRolesByConditionCnt(RoleSearchVO searchVO) throws Exception;
}