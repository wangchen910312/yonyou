package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.UserVO;


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
@Mapper("SalesRoleMappingDAO")
public interface SalesRoleMappingDAO {

  
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
