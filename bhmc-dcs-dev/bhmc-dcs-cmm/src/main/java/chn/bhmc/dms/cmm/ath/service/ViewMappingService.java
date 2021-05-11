package chn.bhmc.dms.cmm.ath.service;

import java.util.List;

import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSaveVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingVO;

/**
 * <pre>
 * 화면-사용자/직무/부서 매핑 서비스
 * </pre>
 *
 * @ClassName   : ViewMappingService.java
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

public interface ViewMappingService {

    /**
     * 화면-사용자/직무/부서 매핑 정보를 등록한다.
     * @param viewMappingVO 등록할 정보가 담긴 viewMappingVO
     * @return 등록된 목록수
     */
    public int insertViewMapping(ViewMappingVO viewMappingVO) throws Exception;

    /**
     * 화면-사용자/직무/부서 매핑 정보를 삭제후 등록한다.
     * @param viewMappingSaveVO
     * @throws Exception
     */
    public void deleteAndInsertViewMapping(ViewMappingSaveVO viewMappingSaveVO) throws Exception;

    /**
     * 화면ID에 해당하는 화면-사용자/직무/부서 매핑 정보를 삭제한다.
     * @param sysCd 시스템구분
     * @param viewId 화면ID
     * @return 삭제된 목록수
     */
    public int deleteViewMappingByViewId(String sysCd, String viewId) throws Exception;

    /**
     * 화면-사용자/직무/부서 매핑 정보를 일괄 등록/삭제 처리한다.
     * @param viewMappingSaveVO
     * @throws Exception
     */
    public void multiViewMappings(ViewMappingSaveVO viewMappingSaveVO) throws Exception;

    /**
     * 화면-사용자/직무/부서 매핑 정보를 복사한다.
     * @param sysCd 시스템 구분
     * @param refTp 참조유형 사용자(U), 직무(T), 부서(D)
     * @param srcRefId 참조ID 복사할 사용자/직무/부서
     * @param destUsrId 참조ID 복사될 사용자/직무/부서
     * @param regUsrId 등록자ID
     * @throws Exception
     */
    public void selectAndInsertViewMapping(String sysCd, String refTp, String srcRefId, String destRefId, String regUsrId) throws Exception;

    /**
     * 화면-사용자/직무/부서 매핑 목록을 조회한다.
     * @param viewMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<ViewMappingVO> selectViewMappingsByCondition(ViewMappingSearchVO viewMappingSearchVO) throws Exception;

    /**
     * 퍼미션정보를 포함하는 화면-사용자/직무/부서 매핑 목록을 조회한다.
     * @param viewMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<ViewMappingVO> selectViewMappingsWithPermission(ViewMappingSearchVO viewMappingSearchVO) throws Exception;

    /**
     * 화면-사용자  매핑 목록에서 주어진 퍼미션이 있는 사용자 목록을 조회한다.
     * @param sysCd 시스템구분
     * @param viewId 화면ID
     * @param dlrCd 딜러코드
     * @param permissionNames 퍼미션 ex) "READ,SEARCHIND,SEARCHALL"
     * @return
     */
    public List<UserVO> selectViewMappingUsersByViewId(String sysCd, String viewId, String dlrCd, String permissionNames) throws Exception;

    /**
     * 화면-사용자  매핑 목록에서 주어진 퍼미션중 한개라도 있는 사용자 목록을 조회한다.
     * @param sysCd 시스템구분
     * @param viewId 화면ID
     * @param dlrCd 딜러코드
     * @param permissionNames 퍼미션
     * @return
     */
    public List<UserVO> selectViewMappingUsersByViewId(String sysCd, String viewId, String dlrCd, String[] permissionNames) throws Exception;

    /**
     * 화면-사용자/직무/부서 매핑 목록에서 주어진 조건을 만족하는 권한이 있는지 여부를 조회한다.
     * @param sysCd 시스템구분
     * @param viewId 화면ID
     * @param refTp 참조유형 사용자(U), 직무(T), 부서(D)
     * @param refId 참조값 사용자/직무/부서
     * @param permissionNames 퍼미션 ex) "READ,SEARCHIND,SEARCHALL"
     * @return
     * @throws Exception
     */
    public boolean hasPermission(String sysCd, String viewId, String refTp, String refId, String permissionNames) throws Exception;
}