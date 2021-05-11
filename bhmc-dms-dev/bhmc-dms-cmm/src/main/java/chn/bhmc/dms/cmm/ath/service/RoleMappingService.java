package chn.bhmc.dms.cmm.ath.service;

import java.util.List;

import chn.bhmc.dms.cmm.ath.vo.RoleMappingSaveVO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;

/**
 * <pre>
 * 역할-사용자 매핑 서비스
 * </pre>
 *
 * @ClassName   : RoleMappingService.java
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

public interface RoleMappingService {

    /**
     * 역할-사용자 매핑 정보를 등록한다.
     * @param roleMappingVO 등록할 정보가 담긴 RoleMappingVO
     * @return 등록된 목록수
     */
    public int insertRoleMapping(RoleMappingVO roleMappingVO) throws Exception;

    /**
     * 역할-사용자 매핑 정보를 수정한다.
     * @param roleMappingVO 수정할 정보가 담긴 RoleMappingVO
     * @return 수정된 목록수
     */
    public int updateRoleMapping(RoleMappingVO roleMappingVO) throws Exception;

    /**
     * 역할ID에 해당하는 역할-사용자 매핑 정보를 삭제한다.
     * @param sysCd 시스템구분
     * @param roleId 역할ID
     * @return
     * @throws Exception
     */
    public int deleteRoleMappingByRoleId(String sysCd, String roleId) throws Exception;

    /**
     * 역할-사용자 매핑 정보를 삭제후 등록한다.
     * @param roleMappingSaveVO
     * @throws Exception
     */
    public void deleteAndInsertRoleMapping(RoleMappingSaveVO roleMappingSaveVO) throws Exception;

    /**
     * 참조유형, 참조ID에 해당하는 역할-사용자 매핑 정보를 삭제한다.
     *
     * @param sysCd 시스템구분
     * @param refTp 참조유형 'U':사용자
     * @param refId 참조아이디
     * @return
     */
    public int delateRoleMappingByRefTpAndRefId(String sysCd, String refTp, String refId) throws Exception;

    /**
     * 역할-사용자 매핑 정보를 복사한다.
     * @param sysCd 시스템 구분
     * @param refTp 참조유형 사용자(U)
     * @param srcRefId 참조ID 복사할 사용자 ID
     * @param destUsrId 참조ID 복사될 사용자 ID
     * @param regUsrId 등록자ID
     * @throws Exception
     */
    public void selectAndInsertRoleMapping(String sysCd, String refTp, String srcRefId, String destRefId, String regUsrId) throws Exception;

    /**
     * 역할-사용자 매핑 정보 목록을 조회한다.
     * @param roleMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<RoleMappingVO> selectRoleMappings(RoleMappingSearchVO roleMappingSearchVO) throws Exception;

    /**
    * 전체역할에 대한 사용자 역할 부여 여부 목록을 조회한다.
    * @param roleMappingSearchVO
    * @return
    * @throws Exception
    */
   public List<RoleMappingVO> selectUserRoleMappings(RoleMappingSearchVO roleMappingSearchVO) throws Exception;

   /**
    * 역할이 있는 사용자 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':법인
    * @param dlrCd 딜러코드
    * @param roleIdList 역할ID 목록
    * @return
    * @throws Exception
    */
   public List<UserVO> selectUsersByRoleId(String sysCd, String dlrCd, String empNo, String usrNm, String... roleIdList) throws Exception;
}
