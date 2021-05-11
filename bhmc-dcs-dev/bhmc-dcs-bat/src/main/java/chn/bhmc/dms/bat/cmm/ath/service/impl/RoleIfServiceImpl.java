package chn.bhmc.dms.bat.cmm.ath.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.ath.service.RoleIfService;
import chn.bhmc.dms.bat.cmm.ath.service.dao.RoleIfDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleIfServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 6.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("roleIfService")
public class RoleIfServiceImpl extends HService implements RoleIfService {

    @Resource(name="roleIfDAO")
    RoleIfDAO roleIfDAO;

    /**
     * {@inheritDoc}}
     */
    public int insertRoleIf(int day) throws Exception{
        return roleIfDAO.insertRoleIf(day);
    }

    /**
     * {@inheritDoc}}
     */
    public int insertRoleHierarchyIf(int day) throws Exception{
        return roleIfDAO.insertRoleHierarchyIf(day);
    }

    /**
     * {@inheritDoc}}
     */
    public int insertRoleAuthoritiesIf(int day) throws Exception{
        return roleIfDAO.insertRoleAuthoritiesIf(day);
    }

    /**
     * {@inheritDoc}}
     */
    public int insertViewHierarchyIf(int day) throws Exception{
        return roleIfDAO.insertViewHierarchyIf(day);
    }

    /**
     * {@inheritDoc}}
     */
    public int insertViewInfoIf(int day) throws Exception{
        return roleIfDAO.insertViewInfoIf(day);
    }

    /**
     * {@inheritDoc}}
     */
    public int insertViewAuthoritiesIf(int day) throws Exception{
        return roleIfDAO.insertViewAuthoritiesIf(day);
    }

}
