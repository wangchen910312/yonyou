package chn.bhmc.dms.cmm.ath.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.ath.vo.FavoritesVO;
import chn.bhmc.dms.cmm.ath.vo.ViewHierarchyVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;
import chn.bhmc.dms.security.vo.MenuVO;


/**
 * 화면정보에 관한 데이터처리 매퍼 클래스
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

@Mapper("viewInfoDAO")
public interface ViewInfoDAO {

    /**
     * 화면 정보를 등록한다.
     * @param viewInfoVO
     * @return 등록된 목록수
     */
    public int insertViewInfo(ViewInfoVO viewInfoVO);

    /**
     * 화면 정보를 수정한다.
     * @param viewInfoVO
     * @return 수정된 목록수
     */
    public int updateViewInfo(ViewInfoVO viewInfoVO);

    /**
     * 화면 정보를 삭제한다.
     * @param viewInfoVO
     * @return 삭제된 목록수
     */
    public int deleteViewInfo(ViewInfoVO viewInfoVO);

    /**
     * 화면정보를 조회한다.
     * @param viewId 화면ID
     * @return
     * @throws Exception
     */
    public ViewInfoVO selectViewInfoByKey(String viewId);

    /**
     * 최근입력된 화면ID를 조회한다.
     * @param sysCd 시스템구분
     * @return
     * @throws Exception
     */
    public String selectLastViewId(String sysCd);

    /**
     * 시스템구분에 해당하는 화면 목록을 조회한다.
     * 단) 화면유형이 화면(01)이고, 출력여부가 'Y' 인 화면 목록만 조회한다.
     * @param sysCd 시스템구분
     * @return
     */
    public List<ViewInfoVO> selectViewInfosBySysCd(String sysCd);

    /**
     * 화면 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ViewInfoSearchVO
     * @return 조회 목록
     */
    public List<ViewInfoVO> selectViewInfosByCondition(ViewInfoSearchVO searchVO);

    /**
     * 사용자 버튼권한 설정을 위한 하위 화면 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ViewInfoSearchVO
     * @return 조회 목록
     */
    public List<ViewInfoVO> selectChildViewInfosWithUser(ViewInfoSearchVO searchVO);

    /**
     * 즐겨찾기 정보를 등록한다.
     * @param viewId 화면ID
     * @param usrId 사용자계정
     * @return 등록된 목록수
     */
    public int insertFavorite(@Param("viewId") String viewId, @Param("usrId") String usrId);

    /**
     * 즐겨찾기 정보를 삭제한다.
     * @param viewId 화면ID
     * @param usrId 사용자계정
     * @return 등록된 목록수
     */
    public int deleteFavorite(@Param("viewId") String viewId, @Param("usrId") String usrId);

    /**
     * 즐겨찾기 정보를 삭제한다.
     * @param viewId 화면ID
     * @return 삭제된 목록수
     */
    public int deleteFavoriteByViewId(String viewId);

    /**
     * 즐겨찾기 정보를 조회한다.
     * @param viewId 화면ID
     * @param usrId 사용자ID
     * @return
     * @throws Exception
     */
    public FavoritesVO selectFavoriteByKey(@Param("viewId") String viewId, @Param("usrId") String usrId);

    /**
     * 즐겨찾기 목록을 조회한다.
     * @param webMobileDstinCd 웹/모바일 구분 'W':웹, 'M':모바일
     * @param usrId 사용자 ID
     * @param langCd 언어코드
     * @return
     * @throws Exception
     */
    public List<FavoritesVO> selectFavorites(@Param("webMobileDstinCd") String webMobileDstinCd, @Param("usrId") String usrId, @Param("langCd") String langCd);

    /**
     * 사용자 메뉴목록을 조회한다.
     * @param sysCd 시스템구분 'I':법인, 'D':딜러
     * @param webMobileDstinCd 웹모바일 구분 'W':웹, 'M':모바일
     * @param usrId 사용자 ID
     * @return
     * @throws Exception
     */
    public  List<MenuVO> selectMenuListByUser(@Param("sysCd") String sysCd, @Param("webMobileDstinCd") String webMobileDstinCd, @Param("usrId") String usrId);

    /**
     * T코드에 해당하는 화면정보를 조회한다.
     * @param tCd T코드
     * @return
     * @throws Exception
     */
    public ViewInfoVO selectViewInfoByTcd(String tCd);

    /**
     * 화면계층 정보를 등록한다.
     * @param viewInfoVO
     * @return
     * @throws Exception
     */
    public int insertViewHierarchy(ViewInfoVO viewInfoVO);

    /**
     * 화면계층 정보를 수정한다.
     * @param viewInfoVO
     * @return
     * @throws Exception
     */
    public int updateViewHierarchy(ViewInfoVO viewInfoVO);

    /**
     * 화면계층 정보를 삭제한다.
     * @param viewInfoVO
     * @return
     * @throws Exception
     */
    public int deleteViewHierarchy(ViewInfoVO viewInfoVO);

    /**
     * 화면계층 정보를 조회한다.
     * @param viewId 화면ID
     * @param parentViewId 상위화면ID
     * @return
     * @throws Exception
     */
    public ViewInfoVO selectViewHierarchyByKey(@Param("viewId") String viewId, @Param("parentViewId") String parentViewId);

    /**
     * 화면계층 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':법인
     * @param webMobileDstinCd 웹/모바일 구분 'W':웹, 'M':모바일
     * @param displayYn 출력여부(Y/N)
     * @param viewTp 화면유형
     * @return
     */
    public List<ViewHierarchyVO> selectViewInfoTreeAll(@Param("sysCd") String sysCd, @Param("webMobileDstinCd") String webMobileDstinCd, @Param("displayYn") String displayYn, @Param("viewTp") String viewTp);
}