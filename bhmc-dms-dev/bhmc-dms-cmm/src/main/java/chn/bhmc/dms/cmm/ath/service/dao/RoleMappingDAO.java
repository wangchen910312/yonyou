package chn.bhmc.dms.cmm.ath.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.ath.vo.UserVO;

import chn.bhmc.dms.cmm.ath.vo.RoleMappingSaveVO;

import chn.bhmc.dms.cmm.ath.vo.RoleMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingVO;

/**
 * <pre>
 * 역할-사용자 매핑 DAO
 * </pre>
 *
 * @ClassName   : RoleMappingDAO.java
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
@Mapper("roleMappingDAO")
public interface RoleMappingDAO {

    /**
     * 역할-사용자 매핑 정보를 등록한다.
     * @param roleMappingVO - 등록할 정보가 담긴 RoleMappingVO
     * @return 등록된 목록수
     */
    public int insertRoleMapping(RoleMappingVO roleMappingVO);

    /**
     * 역할-사용자 매핑 정보를 수정한다.
     * @param roleMappingVO - 수정할 정보가 담긴 RoleMappingVO
     * @return 수정된 목록수
     */
    public int updateRoleMapping(RoleMappingVO roleMappingVO);

    /**
     * 역할ID에 해당하는 역할-사용자 매핑 정보를 삭제한다.
     * @param sysCd 시스템구분
     * @param roleId 역할ID
     * @return
     * @throws Exception
     */
    public int deleteRoleMappingByRoleId(@Param("sysCd") String sysCd, @Param("roleId") String roleId);

    /**
     * 화면-사용자 매핑 정보를 일괄 등록/삭제 처리한다.
     * @param roleMappingSaveVO
     * @throws Exception
     */
    public void multiRoleMappings(RoleMappingSaveVO roleMappingSaveVO);

    /**
     * 참조유형, 참조ID에 해당하는 역할-사용자 매핑 정보를 삭제한다.
     *
     * @param sysCd 시스템구분
     * @param refTp 참조유형 'U':사용자
     * @param refId 참조아이디
     * @return
     */
    public int delateRoleMappingByRefTpAndRefId(@Param("sysCd") String sysCd, @Param("refTp") String refTp, @Param("refId") String refId);

    /**
     * 역할-사용자 매핑 정보 목록을 조회한다.
     *
     * @param roleMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<RoleMappingVO> selectRoleMappings(RoleMappingSearchVO roleMappingSearchVO);

    /**
     * 역할-사용자 매핑 정보를 복사한다.
     * @param sysCd 시스템 구분
     * @param refTp 참조유형 사용자(U)
     * @param srcRefId 참조ID 복사할 사용자 ID
     * @param destUsrId 참조ID 복사될 사용자 ID
     * @param regUsrId 등록자ID
     * @throws Exception
     */
    public void selectAndInsertRoleMapping(@Param("sysCd") String sysCd, @Param("refTp") String refTp, @Param("srcRefId") String srcRefId, @Param("destRefId") String destRefId, @Param("regUsrId") String regUsrId);

    /**
     * 전체역할에 대한 사용자 역할 부여 여부 목록을 조회한다.
     * @param roleMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<RoleMappingVO> selectUserRoleMappings(RoleMappingSearchVO roleMappingSearchVO);

    /**
     * 역할이 있는 사용자 목록을 조회한다.
     * @param sysCd 시스템구분 'D':딜러, 'I':법인
     * @param dlrCd 딜러코드
     * @param roleIdList 역할ID 목록
     * @return
     * @throws Exception
     */
    public List<UserVO> selectUsersByRoleId(@Param("sysCd") String sysCd, @Param("dlrCd") String dlrCd, @Param("empNo") String empNo, @Param("usrNm") String usrNm , @Param("roleIdList") List<String> roleIdList);
}
