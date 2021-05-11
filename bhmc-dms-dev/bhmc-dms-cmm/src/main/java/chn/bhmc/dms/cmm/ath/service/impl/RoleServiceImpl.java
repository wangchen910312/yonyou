package chn.bhmc.dms.cmm.ath.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.RoleService;
import chn.bhmc.dms.cmm.ath.service.dao.RoleDAO;
import chn.bhmc.dms.cmm.ath.vo.RoleHirarchyVO;
import chn.bhmc.dms.cmm.ath.vo.RoleSaveVO;
import chn.bhmc.dms.cmm.ath.vo.RoleSearchVO;
import chn.bhmc.dms.cmm.ath.vo.RoleVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 역할 관리 서비스 구현 클래스 Role Management Service Implementation class
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("roleService")
public class RoleServiceImpl extends HService implements RoleService {

    /**
     * 역할 관리 DAO
     */
	@Resource(name="roleDAO")
	RoleDAO roleDAO;

	/**
	 * 역할-직무/사용자 매핑 관리 서비스
	 */
	@Resource(name="roleMappingService")
	RoleMappingService roleMappingService;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertRole(RoleVO roleVO) throws Exception {
        RoleVO obj = selectRoleByKey(roleVO.getRoleId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        //ROLE_ADMIN-신규역할 계층 추가
        RoleHirarchyVO roleHirarchyVO1 = new RoleHirarchyVO();
        roleHirarchyVO1.setSysCd(roleVO.getSysCd());
        roleHirarchyVO1.setParentRoleId("ROLE_ADMIN");
        roleHirarchyVO1.setChildRoleId(roleVO.getRoleId());
        roleHirarchyVO1.setRegUsrId(roleVO.getRegUsrId());
        roleDAO.insertRoleHirarchy(roleHirarchyVO1);

        //신규역할-ROLE_USER 계층 추가
        RoleHirarchyVO roleHirarchyVO2 = new RoleHirarchyVO();
        roleHirarchyVO2.setSysCd(roleVO.getSysCd());
        roleHirarchyVO2.setParentRoleId(roleVO.getRoleId());
        roleHirarchyVO2.setChildRoleId("ROLE_USER");
        roleHirarchyVO2.setRegUsrId(roleVO.getRegUsrId());
        roleDAO.insertRoleHirarchy(roleHirarchyVO2);

        return roleDAO.insertRole(roleVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateRole(RoleVO roleVO) throws Exception {
        return roleDAO.updateRole(roleVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteRole(RoleVO roleVO) throws Exception {
        roleMappingService.deleteRoleMappingByRoleId(roleVO.getSysCd(), roleVO.getRoleId());

        //ROLE_ADMIN-신규역할 계층 삭제
        RoleHirarchyVO roleHirarchyVO1 = new RoleHirarchyVO();
        roleHirarchyVO1.setSysCd(roleVO.getSysCd());
        roleHirarchyVO1.setParentRoleId("ROLE_ADMIN");
        roleHirarchyVO1.setChildRoleId(roleVO.getRoleId());
        roleDAO.deleteRoleHirarchy(roleHirarchyVO1);

        //신규역할-ROLE_USER 계층 삭제
        RoleHirarchyVO roleHirarchyVO2 = new RoleHirarchyVO();
        roleHirarchyVO2.setSysCd(roleVO.getSysCd());
        roleHirarchyVO2.setParentRoleId(roleVO.getRoleId());
        roleHirarchyVO2.setChildRoleId("ROLE_USER");
        roleDAO.deleteRoleHirarchy(roleHirarchyVO2);

        return roleDAO.deleteRole(roleVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public RoleVO selectRoleByKey(String roleId) throws Exception {
        return roleDAO.selectRoleByKey(roleId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiRoles(RoleSaveVO obj) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(RoleVO roleVO : obj.getInsertList()){
            roleVO.setRegUsrId(usrId);
            insertRole(roleVO);
        }

        for(RoleVO roleVO : obj.getUpdateList()){
            roleVO.setUpdtUsrId(usrId);
            updateRole(roleVO);
        }

        for(RoleVO roleVO : obj.getDeleteList()){
            deleteRole(roleVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<RoleVO> selectRolesByCondition(RoleSearchVO searchVO) throws Exception {
        return roleDAO.selectRolesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectRolesByConditionCnt(RoleSearchVO searchVO) throws Exception {
        return roleDAO.selectRolesByConditionCnt(searchVO);
    }
}
