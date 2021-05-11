package chn.bhmc.dms.sal.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cmm.vo.UserInfoSearchVO;
import chn.bhmc.dms.sal.cmm.vo.UserInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserInfoDAO
 * @Description : 사용자 DAO
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("userInfoDAO")
public interface UserInfoDAO {

    /**
     * 판매사원정보를 조회한다.
     * @param 딜러코드, 직무코드
     * @return 조회 목록
     */
    public List<UserInfoVO> selectUserInfoListsByCndition(UserInfoSearchVO searchVO) throws Exception;

}
