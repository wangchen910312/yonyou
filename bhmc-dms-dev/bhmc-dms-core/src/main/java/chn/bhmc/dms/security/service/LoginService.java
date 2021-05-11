package chn.bhmc.dms.security.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chn.bhmc.dms.security.vo.SessionSaveVO;

import chn.bhmc.dms.security.vo.CustomUserVO;

public interface LoginService {

	/**
	 * 로그인을 위한 사용자 젇보를 조회하고 반환한다.
	 * 아이디/비밀번호로 로그인이 가능한 유효한 사용자가 있다면 사용자정보를 반환한다.
	 * 유효한 사용자가 없다면 null을 반환한다.
	 * @param userVO
	 * @return
	 */
	public CustomUserVO actionLogin(CustomUserVO user);

	/**
	 * 로그인 후에 추가적인 정보를 세션에 저장하는 로직을 수행한다.
	 * @param request
	 * @param response
	 * @param user
	 */
	public void afterLogin(HttpServletRequest request, HttpServletResponse response, CustomUserVO user);

	/**
     * 로그인시 Session 정보를 DB에 저장한다.
     * @param request
     * @param response
     * @param user
     */
    public int insertSessionInfo(SessionSaveVO sessionSaveVO);

    /**
     * 로그아웃시 Session 정보를 DB에 저장한다.
     * @param request
     * @param response
     * @param user
     */
    public int updateSessionInfo(SessionSaveVO sessionSaveVO);

    /**
     * 세션ID로 세션정보를 조회한다.
     * @param sessionId
     * @return
     */
    public SessionSaveVO selectSessionInfoByKey(String sessionId);

}
