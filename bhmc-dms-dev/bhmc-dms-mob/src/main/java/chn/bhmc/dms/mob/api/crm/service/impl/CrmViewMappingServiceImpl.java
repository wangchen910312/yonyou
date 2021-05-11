package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.mob.api.crm.vo.UserVO;
import chn.bhmc.dms.mob.api.crm.vo.ViewMappingUserVO;
import chn.bhmc.dms.mob.api.crm.vo.ViewMappingVO;
import chn.bhmc.dms.mob.api.crm.dao.CrmViewMappingDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmViewMappingService;
import chn.bhmc.dms.security.config.ExtBasePermission;

/**
 * <pre>
 * 화면-사용자/부서/직무 매핑 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : ViewAuthoritiesServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 15.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("CrmviewMappingService")
public class CrmViewMappingServiceImpl extends HService implements CrmViewMappingService {

    /**
     * 역할-사용자 매핑 관리 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 화면-사용자/직무/부서 매핑 관리 DAO
     */
    @Resource(name="CrmviewMappingDAO")
    CrmViewMappingDAO CrmviewMappingDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="viewMappingCache")
    public boolean hasPermission(String sysCd, String viewId, String refTp, String refId, String permissionNames) throws Exception {
        ViewMappingVO viewMappingVO = CrmviewMappingDAO.selectViewMappingByKey(new ViewMappingVO(sysCd, viewId, refTp, refId));

        if(viewMappingVO != null){
            int presentMask = ExtBasePermission.getPermissionMask(permissionNames);
            int mask = viewMappingVO.getMask();

            if (mask == presentMask || ((mask & presentMask) > 0 && (mask & ~presentMask) > 0)) {
                return true;
            }
        }

        return false;
    }
    
    /**
     * {@inheritDoc}
     */
    @Cacheable(value="viewMappingCache")
    public List<UserVO> selectViewMappingUsersByViewId(String sysCd, String viewId, String dlrCd, String permissionNames) throws Exception {
        List<UserVO> users = new ArrayList<UserVO>();
        int presentMask = ExtBasePermission.getPermissionMask(permissionNames);

        List<ViewMappingUserVO> list = CrmviewMappingDAO.selectViewMappingUsersByViewId(sysCd, viewId, dlrCd);

        for(ViewMappingUserVO viewMappingUserVO : list){
            int mask = viewMappingUserVO.getMask();
            if (mask == presentMask || ((mask & presentMask) > 0 && (mask & ~presentMask) > 0)) {
            	if ( "N".equals(viewMappingUserVO.getSysUserYn()) ) {
                	users.add(viewMappingUserVO);
                }
            }
        }

        return users;
    }

    /**
     * {@inheritDoc}
     */
    @Cacheable(value="viewMappingCache")
    public List<UserVO> selectViewMappingUsersByViewId(String sysCd, String viewId, String dlrCd, String[] permissionNames) throws Exception {
        List<UserVO> users = new ArrayList<UserVO>();

        List<ViewMappingUserVO> list = CrmviewMappingDAO.selectViewMappingUsersByViewId(sysCd, viewId, dlrCd);

        for(ViewMappingUserVO viewMappingUserVO : list){
            int mask = viewMappingUserVO.getMask();

            for(String permissionName : permissionNames){
                int presentMask = ExtBasePermission.getPermissionMask(permissionName);
                if (mask == presentMask || ((mask & presentMask) > 0 && (mask & ~presentMask) > 0)) {
                	if ( "N".equals(viewMappingUserVO.getSysUserYn()) ) {
                    	users.add(viewMappingUserVO);
                    }
                }
            }
        }

        return users;
    }

}
