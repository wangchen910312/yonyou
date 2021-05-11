package chn.bhmc.dms.cmm.ath.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ath.vo.UserVO;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.dao.RoleMappingDAO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingSaveVO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleMappingServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 9.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("roleMappingService")
public class RoleMappingServiceImpl extends HService implements RoleMappingService {

    @Resource(name="roleMappingDAO")
    RoleMappingDAO roleMappingDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertRoleMapping(RoleMappingVO authoritiesVO) throws Exception {
        return roleMappingDAO.insertRoleMapping(authoritiesVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateRoleMapping(RoleMappingVO authoritiesVO) throws Exception {
        return roleMappingDAO.updateRoleMapping(authoritiesVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteRoleMappingByRoleId(String sysCd, String roleId) throws Exception {
        return roleMappingDAO.deleteRoleMappingByRoleId(sysCd, roleId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int delateRoleMappingByRefTpAndRefId(String sysCd, String refTp, String refId) throws Exception {
        return roleMappingDAO.delateRoleMappingByRefTpAndRefId(sysCd, refTp, refId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void deleteAndInsertRoleMapping(RoleMappingSaveVO roleUserMappingSaveVO) throws Exception {
        //역할-사용자 매핑 정보를 모두 삭제한다.
        delateRoleMappingByRefTpAndRefId(roleUserMappingSaveVO.getSysCd(), roleUserMappingSaveVO.getRefTp(), roleUserMappingSaveVO.getRefId());

        //역할-사용자 매핑 정보를 등록 한다.
        for(String roleId : roleUserMappingSaveVO.getRoles()){
            RoleMappingVO roleMappingVO = new RoleMappingVO();
            roleMappingVO.setSysCd(roleUserMappingSaveVO.getSysCd());
            roleMappingVO.setRefTp(roleUserMappingSaveVO.getRefTp());
            roleMappingVO.setRefId(roleUserMappingSaveVO.getRefId());
            roleMappingVO.setRoleId(roleId);
            roleMappingVO.setUseYn("Y");
            roleMappingVO.setRegUsrId(roleUserMappingSaveVO.getRegUsrId());

            roleMappingDAO.insertRoleMapping(roleMappingVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void selectAndInsertRoleMapping(String sysCd, String refTp, String srcRefId, String destRefId,
            String regUsrId) throws Exception {
        roleMappingDAO.selectAndInsertRoleMapping(sysCd, refTp, srcRefId, destRefId, regUsrId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<RoleMappingVO> selectRoleMappings(RoleMappingSearchVO roleMappingSearchVO) throws Exception {
        return roleMappingDAO.selectRoleMappings(roleMappingSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<RoleMappingVO> selectUserRoleMappings(RoleMappingSearchVO roleMappingSearchVO) throws Exception {
        return roleMappingDAO.selectUserRoleMappings(roleMappingSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<UserVO> selectUsersByRoleId(String sysCd, String dlrCd, String... roleIdList) throws Exception {
    	List<String> roles = new ArrayList<String>();

    	for(String roleId: roleIdList){
    		roles.add(roleId);
    	}

        return roleMappingDAO.selectUsersByRoleId(sysCd, dlrCd, roles);
    }
}
