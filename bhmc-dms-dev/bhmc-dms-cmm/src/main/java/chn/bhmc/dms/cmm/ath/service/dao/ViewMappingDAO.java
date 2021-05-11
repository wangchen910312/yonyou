package chn.bhmc.dms.cmm.ath.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.security.vo.MenuAccessSaveVO;

import chn.bhmc.dms.cmm.ath.vo.ViewMappingUserVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingVO;

/**
 * <pre>
 * 화면-사용자/직무/부서 매핑 DAO
 * </pre>
 *
 * @ClassName   : ViewMappingDAO.java
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
@Mapper("viewMappingDAO")
public interface ViewMappingDAO {

    /**
     * 화면-사용자/직무/부서 매핑 정보를 등록한다.
     * @param viewMappingVO 등록할 정보가 담긴 viewMappingVO
     * @return 등록된 목록수
     */
    public int insertViewMapping(ViewMappingVO viewMappingVO);

    /**
     * 화면-사용자/직무/부서 매핑 정보를 삭제한다.
     * @param viewMappingVO 삭제할 정보가 담긴 viewMappingVO
     * @return 등록된 목록수
     */
    public int deleteViewMapping(ViewMappingVO viewMappingVO);

    /**
     * 화면-사용자/직무/부서 매핑 정보를 삭제한다.
     * @param sysCd 시스템구분
     * @param webMobileDstinCd 웹/모바일구분
     * @param refTp 참조유형
     * @param refId 참조ID
     * @param viewTp 화면유형(Optional)
     * @return 삭제된 목록수
     */
    public int deleteViewMappingAll(@Param("sysCd") String sysCd, @Param("webMobileDstinCd") String webMobileDstinCd, @Param("refTp") String refTp, @Param("refId") String refId, @Param("viewTp") String viewTp);

    /**
     * 화면ID에 해당하는 화면-사용자/직무/부서 매핑 정보를 삭제한다.
     * @param sysCd 시스템구분
     * @param viewId 화면ID
     * @return 삭제된 목록수
     */
    public int deleteViewMappingByViewId(@Param("sysCd") String sysCd, @Param("viewId") String viewId);

    /**
     * 참조유형/참조ID에 해당하는 화면-사용자/직무/부서 매핑 정보를 삭제한다
     * @param sysCd 시스템구분
     * @param refTp 참조유형 사용자(U), 직무(T), 부서(D)
     * @param refId 참조ID 사용자/직무/부서
     * @return 삭제된 목록수
     */
    public int deleteViewMappingByRefTpAndRefId(@Param("sysCd") String sysCd, @Param("refTp") String refTp, @Param("refId") String refId);

    /**
     * 메뉴권한이 없는 버튼 권한 정보를 삭제한다.
     * @param refTp 참조유형
     * @param refId 참조ID
     * @param webMobileDstinCd 웹모바일구분
     * @return
     */
    public int deleteViewMappingWithoutViewPermission(@Param("refTp") String refTp, @Param("refId") String refId, @Param("webMobileDstinCd") String webMobileDstinCd);

    /**
     * 화면 하위의 모든 버튼에 권한을 부여한다.
     * @param viewMappingVO
     */
    public void mergeChildViewMappingInit(ViewMappingVO viewMappingVO);

    /**
     * 화면-사용자/직무/부서 매핑 정보를 복사한다.
     * @param sysCd 시스템 구분
     * @param refTp 참조유형 사용자(U), 직무(T), 부서(D)
     * @param srcRefId 참조ID 복사할 사용자/직무/부서
     * @param destUsrId 참조ID 복사될 사용자/직무/부서
     * @param regUsrId 등록자ID
     */
    public int selectAndInsertViewMapping(
            @Param("sysCd") String sysCd
            ,@Param("srcRefTp") String srcRefTp
            ,@Param("srcRefId") String srcRefId
            ,@Param("destRefId") String destRefId
            ,@Param("regUsrId") String regUsrId);

    /**
     * 화면-사용자/직무/부서 매핑 정보를 조회한다.
     * @param viewMappingVO 조회할 정보가 담긴 viewMappingVO
     * @return
     */
    public ViewMappingVO selectViewMappingByKey(ViewMappingVO viewMappingVO);

    /**
     * 화면-사용자/직무/부서 매핑 목록을 조회한다.
     * @param viewMappingSearchVO
     * @return
     */
    public List<ViewMappingVO> selectViewMappingsByCondition(ViewMappingSearchVO viewMappingSearchVO);

    /**
     * 퍼미션정보를 포함하는 화면-사용자/직무/부서 매핑 목록을 조회한다.
     * @param viewMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<ViewMappingVO> selectViewMappingsWithPermission(ViewMappingSearchVO viewMappingSearchVO);

    /**
     * 화면-사용자  매핑 목록에서 주어진 퍼미션이 있는 사용자 목록을 조회한다.
     * @param sysCd 시스템구분
     * @param viewId 화면ID
     * @param dlrCd 딜러코드
     * @return
     */
    public List<ViewMappingUserVO> selectViewMappingUsersByViewId(@Param("sysCd") String sysCd, @Param("viewId") String viewId, @Param("dlrCd") String dlrCd);

    /**
     * 메뉴 이동시 view ID/사용자별로 Count 증가한다.
     *
     * @param sysCd 시스템구분
     * @return
     * @throws Exception
     */
    public int multiMenuAccessInfo(MenuAccessSaveVO menuAccessSaveVO);
}
