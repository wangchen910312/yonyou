package chn.bhmc.dms.sal.dsc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dsc.vo.AuthorityFixSearchVO;
import chn.bhmc.dms.sal.dsc.vo.AuthorityFixVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AuthorityFixDAO
 * @Description : AuthorityFixDAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.27      Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("authorityFixDAO")
public interface AuthorityFixDAO {

    /**
     *  메인 조회
     */
    public int selectAuthorityFixMainsByConditionCnt(AuthorityFixSearchVO searchVO) throws Exception;
    public List<AuthorityFixVO> selectAuthorityFixMainsByCondition(AuthorityFixSearchVO searchVO) throws Exception;


    /**
     *  서브 조회
     */
    public int selectAuthorityFixSubsByConditionCnt(AuthorityFixSearchVO searchVO) throws Exception;
    public List<AuthorityFixVO> selectAuthorityFixSubsByCondition(AuthorityFixSearchVO searchVO) throws Exception;

    /**
     * User 리스트 조회
     */
    public List<AuthorityFixVO> selectAuthorityFixUsrIdList(AuthorityFixSearchVO searchVO) throws Exception;

    /**
     * 권한설정이 있는지 유무 확인
     * @return 조회 목록
     */
    public int selectAuthorityFixCnt(AuthorityFixVO vo) throws Exception;

    /**
     * 권한설정 저장한다.
     * @return 조회 목록
     */
    public int insertAuthorityFix(AuthorityFixVO vo) throws Exception;

    /**
     * 권한설정 수정한다.
     * @return 조회 목록
     */
    public int updateAuthorityFix(AuthorityFixVO vo) throws Exception;



}