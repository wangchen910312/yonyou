package chn.bhmc.dms.crm.dmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipController.java
 * @Description : 블루멤버십 가입컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Controller
public class BlueMembershipJoinController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 블루멤버십 관리 서비스
     */
    @Resource(name="blueMembershipJoinService")
    BlueMembershipJoinService blueMembershipJoinService;

    /**
     * 블루멤버십 가입신청 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinMain.do", method = RequestMethod.GET)
    public String selectSatisFactionScoreMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //고객유형
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));       // 고객유형
        //신분증유형
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //우편번호 유형
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));

        return "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinMain";
    }

    /**
     * 블루멤버십 가입 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoins.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipCards(@RequestBody BlueMembershipJoinSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(blueMembershipJoinService.selectBlueMembershipJoinsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(blueMembershipJoinService.selectBlueMembershipJoinsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 블루멤버십 가입신청 정보를 등록/수정한다.
     * @param BlueMembershipJoinSearchVO - 등록/수정할 정보가 담긴 BlueMembershipJoinSearchVO
     * @return 등록된 목록수
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/insertBlueMembershipJoin.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertBlueMembershipJoin(@Validated @RequestBody BlueMembershipJoinVO blueMembershipJoinVO) throws Exception {
        blueMembershipJoinVO.setRegUsrId(LoginUtil.getUserId());
        //등록된 회원이 있을경우 주소만 수정가능하다.
        blueMembershipJoinService.insertBlueMembershipJoin(blueMembershipJoinVO);
        return true;
    }
}
