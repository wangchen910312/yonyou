package chn.bhmc.dms.cmm.ath.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.cmm.ath.vo.FavoritesVO;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyUpdateVO;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSaveVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;
import chn.bhmc.dms.security.vo.MenuVO;

/**
 * 화면 관리 서비스
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

public interface ViewInfoService {

    /**
     * 화면 정보를 등록한다.
     * @param viewInfoVO
     * @return 등록된 목록수
     */
    public int insertViewInfo(ViewInfoVO viewInfoVO) throws Exception;

    /**
     * 화면 정보를 수정한다.
     * @param viewInfoVO
     * @return 수정된 목록수
     */
    public int updateViewInfo(ViewInfoVO viewInfoVO) throws Exception;

    /**
     * 화면 정보를 삭제한다.
     * @param viewInfoVO
     * @return 삭제된 목록수
     */
    public int deleteViewInfo(ViewInfoVO viewInfoVO) throws Exception;

    /**
     * 화면 정보를 삭제한다.
     * 하위 화면도 함께 삭제한다.
     *
     * @param viewInfoVO
     * @throws Exception
     */
    public void deleteViewInfoWithChildren(ViewInfoVO viewInfoVO) throws Exception;

    /**
     * 신규화면 ID를 생성한다.
     * @param sysCd 시스템구분
     * @return
     * @throws Exception
     */
    public String selectNextViewId(String sysCd) throws Exception;

    /**
     * 화면정보를 조회한다.
     * @param viewId 화면ID
     * @return
     * @throws Exception
     */
    public ViewInfoVO selectViewInfoByKey(String viewId) throws Exception;

    /**
     * 화면 정보를 등록/수정/삭제 처리한다.
     * @param countrySaveVO
     */
	public void multiViewInfos(ViewInfoSaveVO saveVO) throws Exception;

	/**
     * 시스템구분에 해당하는 화면 목록을 조회한다.
     * 단) 화면유형이 화면(01)이고, 출력여부가 'Y' 인 화면 목록만 조회한다.
     * @param sysCd 시스템구분
     * @return
     */
    public Map<String, String> selectViewInfosBySysCd(String sysCd);

	/**
     * 화면 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ViewInfoSearchVO
     * @return 조회 목록
     */
    public List<ViewInfoVO> selectViewInfosByCondition(ViewInfoSearchVO searchVO) throws Exception;

	/**
     * 즐겨찾기 정보를 등록한다.
     * @param viewId 화면ID
     * @param usrId 사용자계정
     * @return 등록된 목록수
     */
    public int insertFavorite(String viewId, String usrId) throws Exception;

    /**
     * 즐겨찾기 정보를 삭제한다.
     * @param viewId 화면ID
     * @param usrId 사용자계정
     * @return 삭제된 목록수
     */
    public int deleteFavorite(String viewId, String usrId) throws Exception;

    /**
     * 즐겨찾기 정보를 삭제한다.
     * @param viewId 화면ID
     * @return 삭제된 목록수
     */
    public int deleteFavoriteByViewId(String viewId) throws Exception;

    /**
     * 즐겨찾기 정보를 조회한다.
     * @param viewId 화면ID
     * @param usrId 사용자ID
     * @return
     * @throws Exception
     */
    public FavoritesVO selectFavoriteByKey(String viewId, String usrId) throws Exception;

    /**
     * 즐겨찾기 목록을 조회한다.
     * @param webMobileDstinCd 웹/모바일 구분 'W':웹, 'M':모바일
     * @param usrId 사용자 ID
     * @param langCd 언어코드
     * @return
     * @throws Exception
     */
    public List<FavoritesVO> selectFavorites(String webMobileDstinCd, String usrId, String langCd)   throws Exception;

    /**
     * 사용자 메뉴목록을 조회한다.
     * @param sysCd 시스템구분 'I':법인, 'D':딜러
     * @param webMobileDstinCd 웹모바일 구분 'W':웹, 'M':모바일
     * @param usrId 사용자 ID
     * @return
     * @throws Exception
     */
    public  List<MenuVO> selectMenuListByUser(String sysCd, String webMobileDstinCd, String usrId) throws Exception;

    /**
     * T코드에 해당하는 화면정보를 조회한다.
     * @param tCd T코드
     * @return
     * @throws Exception
     */
    public  ViewInfoVO selectViewInfoByTcd(String tCd) throws Exception;

    /**
     * 화면계층 정보를 등록한다.
     * @param viewInfoVO
     * @return
     * @throws Exception
     */
    int insertViewHierarchy(ViewInfoVO viewInfoVO) throws Exception;

    /**
     * 화면계층 정보를 수정한다.
     * @param obj
     * @throws Exception
     */
    public void updateViewHierarchy(ViewHierarchyUpdateVO obj) throws Exception;

    /**
     * 화면계층 정보를 삭제한다.
     * @param viewInfoVO
     * @return
     * @throws Exception
     */
    int deleteViewHierarchy(ViewInfoVO viewInfoVO) throws Exception;

    /**
     * 화면계층 정보를 조회한다.
     * @param viewId 화면ID
     * @param parentViewId 상위화면ID
     * @return
     * @throws Exception
     */
    ViewInfoVO selectViewHierarchyByKey(String viewId, String parentViewId) throws Exception;

    /**
     * 화면계층 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':법인
     * @param webMobileDstinCd 웹/모바일 구분 'W':웹, 'M':모바일
     * @param displayYn 출력여부(Y/N)
     * @return
     */
    public List<ViewHierarchyVO> selectViewInfoTreeAll(String sysCd, String webMobileDstinCd, String displayYn);

    /**
     * 화면계층 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':법인
     * @param webMobileDstinCd 웹/모바일 구분 'W':웹, 'M':모바일
     * @param displayYn 출력여부(Y/N)
     * @param viewTp 화면유형
     * @return
     */
    public List<ViewHierarchyVO> selectViewInfoTreeAll(String sysCd, String webMobileDstinCd, String displayYn, String viewTp);
}
