package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;


import chn.bhmc.dms.mob.api.crm.vo.UserSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.UserVO;


/**
 * 사용자계정에 관한 데이터처리 매퍼 클래스
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

@Mapper("CrmuserDAO")
public interface CrmUserDAO {

    /**
     * 조회 조건에 해당하는 사용자계정 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return 조회 목록
     */
    public List<UserVO> selectUsersByCondition(UserSearchVO searchVO);

    /**
     * 역할에 해당하는 사용자 목록을 조회한다.
     * @param dlrCd 딜러코드
     * @param roleId 역할ID
     * @param sysCd 시스템구분 'D':딜러, 'I':법인
     * @return
     * @throws Exception
     */
    //public List<UserVO> selectUsersByRoleId(@Param("dlrCd") String dlrCd, @Param("roleId") String roleId, @Param("sysCd") String sysCd);

}
