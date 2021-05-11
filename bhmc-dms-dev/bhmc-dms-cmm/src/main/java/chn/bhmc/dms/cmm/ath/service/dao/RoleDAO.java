package chn.bhmc.dms.cmm.ath.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.ath.vo.RoleHirarchyVO;
import chn.bhmc.dms.cmm.ath.vo.RoleSearchVO;
import chn.bhmc.dms.cmm.ath.vo.RoleVO;


/**
 * 역할 관리 DAO
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("roleDAO")
public interface RoleDAO {

    /**
     * 역할정보를 등록한다.
     * @param roleVO - 등록할 정보가 담긴 RoleVO
     * @return 등록된 목록수
     */
    public int insertRole(RoleVO roleVO);

    /**
     * 역할정보를 수정한다.
     * @param roleVO - 수정할 정보가 담긴 RoleVO
     * @return 수정된 목록수
     */
    public int updateRole(RoleVO roleVO);

    /**
     * 역할정보를 삭제한다.
     * @param roleVO - 삭제할 정보가 담긴 RoleVO
     * @return 삭제된 목록수
     */
    public int deleteRole(RoleVO roleVO);

    /**
     * 역할ID로 역할정보를 조회한다.
     *
     * @param roleId 역할ID
     * @return 역할ID에 해당하는 역할 정보를 반환한다.
     * @throws Exception
     */
    public RoleVO selectRoleByKey(String roleId);

    /**
     * 조회 조건에 해당하는 역할정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RoleSearchVO
     * @return 조회 목록
     */
    public List<RoleVO> selectRolesByCondition(RoleSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 역할총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RoleSearchVO
     * @return
     */
    public int selectRolesByConditionCnt(RoleSearchVO searchVO);

    /**
     * 역할 계층 정보를 등록한다.
     * @param roleHirarchyVO - 등록할 정보가 담긴 roleHirarchyVO
     * @return 등록된 목록수
     */
    public int insertRoleHirarchy(RoleHirarchyVO roleHirarchyVO);

    /**
     * 역할 계층 정보를 삭제한다.
     * @param roleHirarchyVO - 삭제할 정보가 담긴 roleHirarchyVO
     * @return 삭제된 목록수
     */
    public int deleteRoleHirarchy(RoleHirarchyVO roleHirarchyVO);
}
