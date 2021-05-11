package chn.bhmc.dms.sal.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.cmm.service.UserInfoService;
import chn.bhmc.dms.sal.cmm.service.dao.UserInfoDAO;
import chn.bhmc.dms.sal.cmm.vo.UserInfoSearchVO;
import chn.bhmc.dms.sal.cmm.vo.UserInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserInfoServiceImpl
 * @Description : 사용자 정보를 받아온다.
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("userInfoService")
public class UserInfoServiceImpl extends HService implements UserInfoService {

    /**
     * 사용자 DAO 선언
     */
    @Resource(name="userInfoDAO")
    UserInfoDAO userInfoDAO;

    /**
     * 판매사원정보를 조회한다.
     * @param 딜러코드, 직무코드
     * @return 조회 목록
     */
    @Override
    public List<UserInfoVO> selectUserInfoListsByCndition(String dlrCd, String dutyCd) throws Exception{

        UserInfoSearchVO searchVO = new UserInfoSearchVO();
        //String langCd = LocaleContextHolder.getLocale().getLanguage();
        //searchVO.setsLangCd(langCd);

        searchVO.setsEnabledYn("Y");
        searchVO.setsDelYn("N");
        searchVO.setsSaleYn("Y");

        searchVO.setsDlrCd(dlrCd);
        searchVO.setsDutyCd(dutyCd);

        return userInfoDAO.selectUserInfoListsByCndition(searchVO);
    }


}
