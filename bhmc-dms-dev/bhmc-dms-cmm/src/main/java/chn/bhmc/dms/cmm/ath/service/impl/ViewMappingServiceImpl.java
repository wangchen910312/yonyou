package chn.bhmc.dms.cmm.ath.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.security.vo.MenuAccessSaveVO;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.service.dao.ViewMappingDAO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSaveVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingUserVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingVO;
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
@Service("viewMappingService")
public class ViewMappingServiceImpl extends HService implements ViewMappingService {

    /**
     * 역할-사용자 매핑 관리 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 화면-사용자/직무/부서 매핑 관리 DAO
     */
    @Resource(name="viewMappingDAO")
    ViewMappingDAO viewMappingDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewMappingCache", allEntries=true)
    public int insertViewMapping(ViewMappingVO viewMappingVO) throws Exception {
        viewMappingVO.setMask(ExtBasePermission.getPermissionMask(viewMappingVO.getPermissions()));
        return viewMappingDAO.insertViewMapping(viewMappingVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewMappingCache", allEntries=true)
    public void deleteAndInsertViewMapping(ViewMappingSaveVO viewMappingSaveVO) throws Exception {
        //화면-사용자/직무/부서 매핑 정보를 삭제한다.
        viewMappingDAO.deleteViewMappingAll(
                viewMappingSaveVO.getSysCd()
                ,viewMappingSaveVO.getWebMobileDstinCd()
                ,viewMappingSaveVO.getRefTp()
                ,viewMappingSaveVO.getRefId()
                ,viewMappingSaveVO.getViewTp());

        //화면-사용자/직무/부서 매핑 정보를 등록한다.
        for(ViewMappingVO viewMappingVO : viewMappingSaveVO.getViewMappings()){
            viewMappingVO.setSysCd(viewMappingSaveVO.getSysCd());
            viewMappingVO.setWebMobileDstinCd(viewMappingSaveVO.getWebMobileDstinCd());
            viewMappingVO.setRefTp(viewMappingSaveVO.getRefTp());
            viewMappingVO.setRefId(viewMappingSaveVO.getRefId());
            viewMappingVO.setUseYn("Y");
            viewMappingVO.setRegUsrId(viewMappingSaveVO.getRegUsrId());
            viewMappingVO.setMask(ExtBasePermission.getPermissionMask(viewMappingVO.getPermissions()));

            //화면 하위버튼의 권한이 초기화 된 경우 화면 하위의 모든 버튼에 권한을 부여한다.
            if(viewMappingVO.isDirty()){
            	viewMappingDAO.mergeChildViewMappingInit(viewMappingVO);
            }

            viewMappingDAO.insertViewMapping(viewMappingVO);
        }

        //화면권한이 없는 하위 버튼 권한을 삭제한다.
        viewMappingDAO.deleteViewMappingWithoutViewPermission(viewMappingSaveVO.getRefTp(), viewMappingSaveVO.getRefId(), viewMappingSaveVO.getWebMobileDstinCd());
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewMappingCache", allEntries=true)
    public int deleteViewMappingByViewId(String sysCd, String viewId) throws Exception {
        return viewMappingDAO.deleteViewMappingByViewId(sysCd, viewId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewMappingCache", allEntries=true)
    public void selectAndInsertViewMapping(String sysCd, String refTp, String srcRefId, String destRefId, String regUsrId) throws Exception {
        //화면-사용자 매핑 정보 삭제
        viewMappingDAO.deleteViewMappingByRefTpAndRefId(sysCd, refTp, destRefId);

        //화면-사용자 매핑정보 복사
        viewMappingDAO.selectAndInsertViewMapping(sysCd, refTp, srcRefId, destRefId, regUsrId);

        //역할-사용자/직무/부서 매핑정보 삭제
        roleMappingService.delateRoleMappingByRefTpAndRefId(sysCd, refTp, destRefId);

        //역할-사용자/직무/부서 매핑정보 복사
        roleMappingService.selectAndInsertRoleMapping(sysCd, refTp, srcRefId, destRefId, regUsrId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="viewMappingCache")
    public List<ViewMappingVO> selectViewMappingsWithPermission(ViewMappingSearchVO viewMappingSearchVO)
            throws Exception {
        return viewMappingDAO.selectViewMappingsWithPermission(viewMappingSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="viewMappingCache")
    public List<ViewMappingVO> selectViewMappingsByCondition(ViewMappingSearchVO viewMappingSearchVO) throws Exception {
        return viewMappingDAO.selectViewMappingsByCondition(viewMappingSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Cacheable(value="viewMappingCache")
    public List<UserVO> selectViewMappingUsersByViewId(String sysCd, String viewId, String dlrCd, String permissionNames) throws Exception {
        List<UserVO> users = new ArrayList<UserVO>();
        int presentMask = ExtBasePermission.getPermissionMask(permissionNames);

        List<ViewMappingUserVO> list = viewMappingDAO.selectViewMappingUsersByViewId(sysCd, viewId, dlrCd);

        for(ViewMappingUserVO viewMappingUserVO : list){
            int mask = viewMappingUserVO.getMask();
            if (mask == presentMask || ((mask & presentMask) > 0 && (mask & ~presentMask) > 0)) {
                users.add(viewMappingUserVO);
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

        List<ViewMappingUserVO> list = viewMappingDAO.selectViewMappingUsersByViewId(sysCd, viewId, dlrCd);

        for(ViewMappingUserVO viewMappingUserVO : list){
            int mask = viewMappingUserVO.getMask();

            for(String permissionName : permissionNames){
                int presentMask = ExtBasePermission.getPermissionMask(permissionName);
                if (mask == presentMask || ((mask & presentMask) > 0 && (mask & ~presentMask) > 0)) {
                    users.add(viewMappingUserVO);
                }
            }
        }

        return users;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="viewMappingCache")
    public boolean hasPermission(String sysCd, String viewId, String refTp, String refId, String permissionNames) throws Exception {
        ViewMappingVO viewMappingVO = viewMappingDAO.selectViewMappingByKey(new ViewMappingVO(sysCd, viewId, refTp, refId));

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
    @CacheEvict(value="viewMappingCache", allEntries=true)
    public void multiViewMappings(ViewMappingSaveVO viewMappingSaveVO) throws Exception {
        for(ViewMappingVO viewMappingVO : viewMappingSaveVO.getInsertList()){
            viewMappingVO.setRegUsrId(viewMappingSaveVO.getRegUsrId());
            viewMappingVO.setMask(ExtBasePermission.getPermissionMask(viewMappingVO.getPermissions()));
            viewMappingDAO.insertViewMapping(viewMappingVO);
        }

        for(ViewMappingVO viewMappingVO : viewMappingSaveVO.getDeleteList()){
            viewMappingDAO.deleteViewMapping(viewMappingVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int multiMenuAccessInfo(MenuAccessSaveVO menuAccessSaveVO) throws Exception {
        return viewMappingDAO.multiMenuAccessInfo(menuAccessSaveVO);
    }
}
