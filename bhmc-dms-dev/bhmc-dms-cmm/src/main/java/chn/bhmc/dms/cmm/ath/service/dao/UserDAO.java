package chn.bhmc.dms.cmm.ath.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;


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

@Mapper("userDAO")
public interface UserDAO {

    /**
     * 사용자 비밀번호가 유효한지 여부를 반환한다.
     *
     * @param usrId 사용자 ID
     * @param usrPw 사용자 비밀번호
     * @return 비밀번호를 확인하여 비밀번호가 맞다면 true 그렇지 않다면 false를 반환한다.
     * @throws Exception
     */
    public boolean isValidPassword(@Param("usrId") String usrId, @Param("usrPw") String usrPw) throws Exception;

    /**
     * Key에 해당하는 사용자계정 정보를 조회한다.
     * @param cntryCd - 사용자계정(2자리)
     * @param langCd - 언어코드
     * @return 조회한 사용자계정 정보
     */
    public UserVO selectUserByKey(String usrId);

    /**
     * 조회 조건에 해당하는 사용자계정 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return 조회 목록
     */
    public List<UserVO> selectUsersByCondition(UserSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 사용자계정 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return
     */
    public int selectUsersByConditionCnt(UserSearchVO searchVO);

    /**
     * 역할에 해당하는 사용자 목록을 조회한다.
     * @param dlrCd 딜러코드
     * @param roleId 역할ID
     * @param sysCd 시스템구분 'D':딜러, 'I':법인
     * @return
     * @throws Exception
     */
    //public List<UserVO> selectUsersByRoleId(@Param("dlrCd") String dlrCd, @Param("roleId") String roleId, @Param("sysCd") String sysCd);

    /**
     * 직무코드에 해당하는 사용자 목록을 조회한다.
     *
     * @param dlrCd 딜러코드
     * @param tskCd 직무코드
     * @return
     * @throws Exception
     */
    public List<UserVO> selectUsersByTskCd(@Param("dlrCd") String dlrCd, @Param("tskCd") String tskCd);

    /**
     * Suggest 사용자 목록을 조회한다.
     *
     * @param dlrCd 딜러코드
     * @param query 검색어
     * @param maxRows 최대 조회목록수
     * @return
     */
    public List<UserVO> selectUsersForSuggest(@Param("dlrCd") String dlrCd, @Param("query") String query, @Param("maxRows") int maxRows);
}
