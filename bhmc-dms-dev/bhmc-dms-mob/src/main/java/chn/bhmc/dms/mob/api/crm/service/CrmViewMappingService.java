package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.UserVO;
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

public interface CrmViewMappingService {

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

}
