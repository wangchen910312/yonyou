package chn.bhmc.dms.cmm.ath.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.security.vo.CustomUserVO;
import chn.bhmc.dms.security.vo.SessionSaveVO;

/**
 * 로그인 관리 DAO
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

@Mapper("loginDAO")
public interface LoginDAO {

    /**
     * 로그인 정보 조회
     * @param CustomUserVO
     * @return CustomUserVO
     */
    public CustomUserVO actionLogin(CustomUserVO usr);

    /**
     * 지원언어 목록
     *
     * @return
     */
    public List<String> supportLangs();

    /**
     * 기본언어
     *
     * @return
     */
    public String defaultLang();

	/**
     * 로그인시 Session 정보를 DB에 저장한다.
     * @param SessionSaveVO
     * @return int
     */
    public int insertSessionInfo(SessionSaveVO sessionSaveVO);

    /**
     * 로그아웃시 Session 정보를 DB에 저장한다.
     * @param SessionSaveVO
     * @return int
     */
    public int updateSessionInfo(SessionSaveVO sessionSaveVO);
}
