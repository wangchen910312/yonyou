package chn.bhmc.dms.mob.api.crm.service.impl;

import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmUserDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmRoleMappingService;
import chn.bhmc.dms.mob.api.crm.service.CrmUserService;
import chn.bhmc.dms.mob.api.crm.service.CrmViewMappingService;
import chn.bhmc.dms.mob.api.crm.vo.UserSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.UserVO;

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

@Service("CrmuserService")
public class CrmUserServiceImpl extends HService implements CrmUserService {

    /**
     * 사용자 관리 DAO
     */
	@Resource(name="CrmuserDAO")
	CrmUserDAO CrmuserDAO;

	/**
	 * 역할-사용자 매핑 서비스
	 */
	@Resource(name="CrmroleMappingService")
	CrmRoleMappingService CrmroleMappingService;

	/**
	 * 화면-직무/부서/사용자 매핑 서비스
	 */
	@Resource(name="CrmviewMappingService")
	CrmViewMappingService CrmviewMappingService;

    /**
     * {@inheritDoc}
     */
    @Override
    public List<UserVO> selectUsersByCondition(UserSearchVO searchVO) throws Exception {
        return CrmuserDAO.selectUsersByCondition(searchVO);
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
    /**
     * {@inheritDoc}
     */
	@SuppressWarnings("unchecked")
	@Override
	public List<UserVO> selectUsersByRoleIdAndViewId(String sysCd, String dlrCd, String roleId, String viewId,
			String permissionNames) throws Exception {
		List<UserVO> list = new ArrayList<UserVO>();

		list.addAll(CrmroleMappingService.selectUsersByRoleId(sysCd, dlrCd, null, null, roleId));
		list.addAll(CrmviewMappingService.selectViewMappingUsersByViewId(sysCd, viewId, dlrCd, permissionNames));

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
}