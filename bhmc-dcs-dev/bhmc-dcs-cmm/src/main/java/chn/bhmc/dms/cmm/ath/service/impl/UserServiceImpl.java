package chn.bhmc.dms.cmm.ath.service.impl;

import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import able.com.service.HService;
import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.service.dao.UserDAO;
import chn.bhmc.dms.cmm.ath.vo.RoleMappingVO;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 사용자 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 2. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.19         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("userService")
public class UserServiceImpl extends HService implements UserService {

    /**
     * 사용자 관리 DAO
     */
	@Resource(name="userDAO")
	UserDAO userDAO;

	/**
	 * 역할-사용자 매핑 서비스
	 */
	@Resource(name="roleMappingService")
	RoleMappingService roleMappingService;

	/**
	 * 화면-직무/부서/사용자 매핑 서비스
	 */
	@Resource(name="viewMappingService")
	ViewMappingService viewMappingService;

	/**
     * {@inheritDoc}
     */
    @Override
    public int insertUser(String sysCd, UserVO userVO) throws Exception {
        int cnt = 0;
        UserVO obj = selectUserByKey(userVO.getUsrId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        //사용자 정보를 등록한다.
        cnt = userDAO.insertUser(userVO);

        //ROLE_USER 권한을 부여한다.
        RoleMappingVO roleMappingVO = new RoleMappingVO();
        roleMappingVO.setRefTp("U");
        roleMappingVO.setRefId(userVO.getUsrId());
        roleMappingVO.setRoleId("ROLE_USER");
        roleMappingVO.setSysCd(sysCd);
        roleMappingVO.setUseYn("Y");
        roleMappingVO.setRegUsrId(userVO.getRegUsrId());
        roleMappingService.insertRoleMapping(roleMappingVO);

        return cnt;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateUser(UserVO userVO) throws Exception {
        userDAO.updateUserIF(userVO);
        return userDAO.updateUser(userVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean isValidPassword(String usrId, String usrPw) throws Exception {
        return userDAO.isValidPassword(usrId, usrPw);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public UserVO selectUserByKey(String usrId) throws Exception {
        return userDAO.selectUserByKey(usrId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiUsers(BaseSaveVO<UserVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();
        for(UserVO newUserVO : obj.getUpdateList()){
            UserVO userVO = selectUserByKey(newUserVO.getUsrId());
            userVO.setClaimReqPermYn(newUserVO.getClaimReqPermYn());
            userVO.setUpdtUsrId(userId);

            updateUser(userVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<UserVO> selectUsersByCondition(UserSearchVO searchVO) throws Exception {
        return userDAO.selectUsersByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectUsersByConditionCnt(UserSearchVO searchVO) throws Exception {
        return userDAO.selectUsersByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<UserVO> selectUsersByTskCd(String dlrCd, String tskCd) throws Exception {
        return userDAO.selectUsersByTskCd(dlrCd, tskCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<UserVO> selectUsersForSuggest(String dlrCd, String query, int maxRows) throws Exception {
        if(StringUtils.isBlank(query)){
            return new ArrayList<UserVO>();
        }
        return userDAO.selectUsersForSuggest(dlrCd, query, maxRows);
    }

    /**
     * {@inheritDoc}
     */
	@SuppressWarnings("unchecked")
	@Override
	public List<UserVO> selectUsersByRoleIdAndViewId(String sysCd, String dlrCd, String roleId, String viewId,
			String permissionNames) throws Exception {
		List<UserVO> list = new ArrayList<UserVO>();

		list.addAll(roleMappingService.selectUsersByRoleId(sysCd, dlrCd, roleId));
		list.addAll(viewMappingService.selectViewMappingUsersByViewId(sysCd, viewId, dlrCd, permissionNames));

		Map<String, UserVO> map = new HashMap<String, UserVO>();

		for(UserVO user : list){
			if(!map.containsKey(user.getUsrId())){
				map.put(user.getUsrId(), user);
			}
		}

		List<UserVO> results = (List<UserVO>)CollectionUtils.arrayToList(map.values().toArray());

		Collections.sort(results, new UserComparator());

		return results;
	}

	public class UserComparator implements Comparator<UserVO> {
		Collator collator;

		public UserComparator(){
			collator = Collator.getInstance(java.util.Locale.SIMPLIFIED_CHINESE);
			//collator = (RuleBasedCollator)Collator.getInstance(new Locale("zh", "CN", "PINYIN"));
			//collator.setStrength(Collator.PRIMARY);
		}

		@Override
		public int compare(UserVO o1, UserVO o2) {
			return collator.compare(o1.getUsrNm(), o2.getUsrNm());
		}
	}

	@Override
	public List<UserVO> selectBMPUsers() throws Exception {
		UserSearchVO searchVO = new UserSearchVO();
		searchVO.setsDeptCd("BMP");
		return userDAO.selectUsersByTskCdAndUsrId(searchVO);
	}
}
