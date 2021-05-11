package chn.bhmc.dms.cmm.ath.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.security.vo.CustomUserVO;
import chn.bhmc.dms.security.vo.SessionSaveVO;

@Mapper("loginDAO")
public interface LoginDAO {

    /**
     * 로그인 정보 조회
     * @param CustomUserVO
     * @return CustomUserVO
     */
    public CustomUserVO actionLogin(CustomUserVO usr);

    public List<String> supportLangs();

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

    /**
     * 세션ID에 해당하는 Session 정보를 조회한다.
     *
     * @param sessionId
     * @return
     */
    public SessionSaveVO selectSessionInfoByKey(String sessionId);

}
