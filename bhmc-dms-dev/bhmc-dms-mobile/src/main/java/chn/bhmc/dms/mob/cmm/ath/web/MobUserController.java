package chn.bhmc.dms.mob.cmm.ath.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 사용자 관리 컨트롤러
 *
 * @author Sung sin Park
 * @since 2016. 2. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.022         Sung sin Park            최초 생성
 * </pre>
 */

@Controller
public class MobUserController extends HController {
    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 사용자 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UserSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/cmm/sci/user/selectUsers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsers(@RequestBody UserSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(userService.selectUsersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(userService.selectUsersByCondition(searchVO));
        }

        return result;

    }

}
