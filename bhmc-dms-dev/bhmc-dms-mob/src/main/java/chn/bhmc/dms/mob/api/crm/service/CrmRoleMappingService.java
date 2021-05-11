package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.UserVO;

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

public interface CrmRoleMappingService {

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
