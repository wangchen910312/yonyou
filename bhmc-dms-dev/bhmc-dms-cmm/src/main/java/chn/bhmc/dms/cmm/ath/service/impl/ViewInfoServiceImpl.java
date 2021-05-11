package chn.bhmc.dms.cmm.ath.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.service.dao.ViewInfoDAO;
import chn.bhmc.dms.cmm.ath.vo.FavoritesVO;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyUpdateVO;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSaveVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.security.vo.MenuVO;

/**
 * 화면정보 관리 서비스 구현 클래스 View Information Management Implementation class
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
@Service("viewInfoService")
public class ViewInfoServiceImpl extends HService implements ViewInfoService {

    /**
     * 화면정보 관리 DAO
     */
    @Resource(name="viewInfoDAO")
    ViewInfoDAO viewInfoDAO;

    /**
     * 화면-권한 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewInfoCache", allEntries=true)
    public int insertViewInfo(ViewInfoVO viewInfoVO) throws Exception {
        ViewInfoVO obj = selectViewInfoByKey(viewInfoVO.getViewId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        int result = viewInfoDAO.insertViewInfo(viewInfoVO);
        insertViewHierarchy(viewInfoVO);

        return result;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewInfoCache", allEntries=true)
    public int updateViewInfo(ViewInfoVO viewInfoVO) throws Exception {
        return viewInfoDAO.updateViewInfo(viewInfoVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewInfoCache", allEntries=true)
    public int deleteViewInfo(ViewInfoVO viewInfoVO) throws Exception {
        //화면-사용자/직무/부서 매핑 정보를 삭제한다.
        viewMappingService.deleteViewMappingByViewId(viewInfoVO.getSysCd(), viewInfoVO.getViewId());
        //화면계층 정보를 삭제한다.
        deleteViewHierarchy(viewInfoVO);
        //즐겨찾기 정보를 삭제한다.
        deleteFavoriteByViewId(viewInfoVO.getViewId());
        //화면정보를 삭제한다.
        return viewInfoDAO.deleteViewInfo(viewInfoVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewInfoCache", allEntries=true)
    public void deleteViewInfoWithChildren(ViewInfoVO viewInfoVO) throws Exception {
        ViewInfoSearchVO viewInfoSearchVO = new ViewInfoSearchVO();
        viewInfoSearchVO.setsSysCd(viewInfoVO.getSysCd());
        viewInfoSearchVO.setsWebMobileDstinCd(viewInfoVO.getWebMobileDstinCd());
        viewInfoSearchVO.setsParentViewId(viewInfoVO.getViewId());

        List<ViewInfoVO> childViewInfos = selectViewInfosByCondition(viewInfoSearchVO);
        for(ViewInfoVO childViewInfoVO : childViewInfos){
            childViewInfoVO.setUpdtUsrId(viewInfoVO.getUpdtUsrId());
            deleteViewInfoWithChildren(childViewInfoVO);
        }

        deleteViewInfo(viewInfoVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public ViewInfoVO selectViewInfoByKey(String viewId) throws Exception {
        return viewInfoDAO.selectViewInfoByKey(viewId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String selectNextViewId(String sysCd) throws Exception {
        String lastViewId = viewInfoDAO.selectLastViewId(sysCd);

        if(StringUtils.isBlank(lastViewId)){
            return String.format("VIEW-%s-00001", sysCd);
        }

        int viewNo  = Integer.parseInt(lastViewId.substring(7));

        return String.format("VIEW-%s-%s", sysCd, StringUtils.leftPad(String.valueOf(++viewNo), 5, "0"));
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="viewInfoCache", allEntries=true)
    public void multiViewInfos(ViewInfoSaveVO obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(ViewInfoVO viewInfoVO : obj.getInsertList()){
            viewInfoVO.setRegUsrId(userId);
            insertViewInfo(viewInfoVO);
        }

        for(ViewInfoVO viewInfoVO : obj.getUpdateList()){
            viewInfoVO.setUpdtUsrId(userId);
            updateViewInfo(viewInfoVO);
        }

        for(ViewInfoVO viewInfoVO : obj.getDeleteList()){
            viewInfoVO.setUpdtUsrId(userId);
            deleteViewInfoWithChildren(viewInfoVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="viewInfoCache")
    public Map<String, String> selectViewInfosBySysCd(String sysCd){
        Map<String, String> map = new HashMap<String, String>();
        List<ViewInfoVO> list = viewInfoDAO.selectViewInfosBySysCd(sysCd);

        for(ViewInfoVO viewInfoVO : list){

            String viewUrl = viewInfoVO.getViewUrl();

            if(viewUrl != null){
                int pos = viewUrl.indexOf("?");
                if(pos != -1){
                    viewUrl = viewUrl.substring(0, pos);
                    map.put(viewUrl+"_", viewInfoVO.getViewId());
                }

                map.put(viewInfoVO.getViewUrl(), viewInfoVO.getViewId());
            }
        }

        return map;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ViewInfoVO> selectViewInfosByCondition(ViewInfoSearchVO searchVO) throws Exception {
        return viewInfoDAO.selectViewInfosByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     *
    @Override
    public int selectViewInfosByConditionCnt(ViewInfoSearchVO searchVO) throws Exception {
        return viewInfoDAO.selectViewInfosByConditionCnt(searchVO);
    }
    */

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertFavorite(String viewId, String usrId) throws Exception {
        FavoritesVO obj = selectFavoriteByKey(viewId, usrId);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }
        return viewInfoDAO.insertFavorite(viewId, usrId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteFavorite(String viewId, String usrId) throws Exception {
        return viewInfoDAO.deleteFavorite(viewId, usrId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteFavoriteByViewId(String viewId) throws Exception {
        return viewInfoDAO.deleteFavoriteByViewId(viewId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public FavoritesVO selectFavoriteByKey(String viewId, String usrId) {
        return viewInfoDAO.selectFavoriteByKey(viewId, usrId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<FavoritesVO> selectFavorites(String webMobileDstinCd, String usrId, String langCd)  throws Exception {
        return viewInfoDAO.selectFavorites(webMobileDstinCd, usrId, langCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MenuVO> selectMenuListByUser(String sysCd, String webMobileDstinCd, String usrId) throws Exception {
        return viewInfoDAO.selectMenuListByUser(sysCd, webMobileDstinCd, usrId);
    }

    /**
     * {@inheritDoc}
     *
    @Override
    public List<MenuVO> selectMenuListByRole(String sysCd, String webMobileDstinCd, String roleId) throws Exception {
        return viewInfoDAO.selectMenuListByRole(sysCd, webMobileDstinCd, roleId);
    }
    */

    /**
     * {@inheritDoc}
     */
    @Override
    public ViewInfoVO selectViewInfoByTcd(String tCd) throws Exception {
        return viewInfoDAO.selectViewInfoByTcd(tCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertViewHierarchy(ViewInfoVO viewInfoVO) throws Exception {
        ViewInfoVO obj = selectViewHierarchyByKey(viewInfoVO.getViewId(), viewInfoVO.getParentViewId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }
        return viewInfoDAO.insertViewHierarchy(viewInfoVO);
    }

    /**
     * {@inheritDoc}
     * @throws Exception
     */
    @Override
    public void updateViewHierarchy(ViewHierarchyUpdateVO obj) throws Exception {
        String userId = LoginUtil.getUserId();
        ViewInfoVO oldViewInfoVO = new ViewInfoVO();
        oldViewInfoVO.setParentViewId(obj.getOldVO().getParentViewId());
        oldViewInfoVO.setViewId(obj.getOldVO().getChildViewId());

        ViewInfoVO newViewInfoVO = new ViewInfoVO();
        newViewInfoVO.setSysCd(obj.getNewVO().getSysCd());
        newViewInfoVO.setParentViewId(obj.getNewVO().getParentViewId());
        newViewInfoVO.setViewId(obj.getNewVO().getChildViewId());
        newViewInfoVO.setRegUsrId(userId);
        newViewInfoVO.setUpdtUsrId(userId);
        newViewInfoVO.setUseYn("Y");

        viewInfoDAO.deleteViewHierarchy(oldViewInfoVO);

        ViewInfoVO viewInfoVO = selectViewHierarchyByKey(newViewInfoVO.getViewId(), newViewInfoVO.getParentViewId());

        if(viewInfoVO != null) {
            viewInfoDAO.updateViewHierarchy(newViewInfoVO);
        }else{
            viewInfoDAO.insertViewHierarchy(newViewInfoVO);
        }
//        deleteViewHierarchy(oldViewInfoVO);
//        insertViewHierarchy(newViewInfoVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteViewHierarchy(ViewInfoVO viewInfoVO) throws Exception {
        return viewInfoDAO.deleteViewHierarchy(viewInfoVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public ViewInfoVO selectViewHierarchyByKey(String viewId, String parentViewId) throws Exception {
        return viewInfoDAO.selectViewHierarchyByKey(viewId, parentViewId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ViewHierarchyVO> selectViewInfoTreeAll(String sysCd, String webMobileDstinCd, String displayYn) {
        return selectViewInfoTreeAll(sysCd, webMobileDstinCd, displayYn, null);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ViewHierarchyVO> selectViewInfoTreeAll(String sysCd, String webMobileDstinCd, String displayYn, String viewTp) {
        return viewInfoDAO.selectViewInfoTreeAll(sysCd, webMobileDstinCd, displayYn, viewTp);
    }

    /**
     * {@inheritDoc}
     *
    @Override
    public List<ViewHierarchyVO> selectViewInfoTreeAllWithUser(String sysCd, String webMobileDstinCd, String displayYn, String viewTp, String usrId) {
        return viewInfoDAO.selectViewInfoTreeAllWithUser(sysCd, webMobileDstinCd, displayYn, viewTp, usrId);
    }
    */

    /**
     * {@inheritDoc}
     *
    @Override
    public List<ViewInfoVO> selectChildViewInfosWithUser(ViewInfoSearchVO searchVO) throws Exception {
        return viewInfoDAO.selectChildViewInfosWithUser(searchVO);
    }
    */

}
