package chn.bhmc.dms.cmm.ath.service;

import java.util.List;

import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 사용자 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 02. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.19         Kang Seok Han            최초 생성
 * </pre>
 */

public interface UserService {

    /**
     * 사용자계정 정보를 등록한다.
     * @param sysCd 시스템구분 법인(I), 딜러(D)
     * @param userVO
     * @return
     */
    public int insertUser(String sysCd, UserVO userVO) throws Exception;

    /**
     * 사용자 정보를 수정한다.
     * @param userVO - 수정할 정보가 담긴 UserVO
     * @return 수정된 목록수
     */
    public int updateUser(UserVO userVO) throws Exception;

    /**
     * 사용자 비밀번호가 유효한지 여부를 반환한다.
     *
     * @param usrId 사용자 ID
     * @param usrPw 사용자 비밀번호
     * @return 비밀번호를 확인하여 비밀번호가 맞다면 true 그렇지 않다면 false를 반환한다.
     * @throws Exception
     */
    public boolean isValidPassword(String usrId, String usrPw) throws Exception;

    /**
     * Key에 해당하는 사용자 정보를 조회한다.
     * @param usrId - 사용자 ID
     * @return 조회한 사용자 정보
     */
    public UserVO selectUserByKey(String usrId) throws Exception;

    /**
     * 사용자 정보를 등록/수정/삭제 처리한다.
     * @param userSaveVO
     */
	public void multiUsers(BaseSaveVO<UserVO> userSaveVO) throws Exception;

	/**
     * 조회 조건에 해당하는 사용자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return 조회 목록
     */
	public List<UserVO> selectUsersByCondition(UserSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 사용자 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return
     */
	public int selectUsersByConditionCnt(UserSearchVO searchVO) throws Exception;

    /**
     * 직무코드에 해당하는 사용자 목록을 조회한다.
     *
     * @param dlrCd 딜러코드
     * @param tskCd 직무코드
     * @return
     * @throws Exception
     */
    public List<UserVO> selectUsersByTskCd(String dlrCd, String tskCd) throws Exception;

	/**
     * Suggest 사용자 목록을 조회한다.
     *
     * @param dlrCd 딜러코드
     * @param query 검색어
     * @param maxRows 최대 조회목록수
     * @return
     */
    public List<UserVO> selectUsersForSuggest(String dlrCd, String query, int maxRows) throws Exception;

    /**
     *
     * @param sysCd 시스템구분
     * @param dlrCd 딜러코드
     * @param roleId 역할ID
     * @param viewId 화면ID
     * @param permissionNames 화면권한
     * @return
     * @throws Exception
     */
    public List<UserVO> selectUsersByRoleIdAndViewId(String sysCd, String dlrCd, String roleId, String viewId, String permissionNames) throws Exception;

    /**
     * bmp账号
     * @param searchVO
     * @return
     */
    public List<UserVO> selectBMPUsers()throws Exception;
}