package chn.bhmc.dms.crm.cso.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;

/**
 * 영업활동 시행내역 컨트롤러
 *
 * @author in moon lee
 * @since 2016.05.04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.04         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/salesActivePlan")
@Controller
public class SalesActivePlanController extends HController {

    /**
     * 영업활동 시행내역 서비스
     */
    @Resource(name="salesActiveMgmtService")
    SalesActiveMgmtService salesActiveMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 영업활동 시행내역 메인 화면을 출력한다.
     * @return
     */
//    @RequestMapping(value = "/selectSalesActivePlanMain.do", method = RequestMethod.GET)
//    public String selectSalesActivePlanMain(Model model ) throws Exception {
//
//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//
//        List<UserVO> users = userService.selectUsersByRoleId(LoginUtil.getDlrCd(), "ROLE_CRM", Constants.SYS_CD_DLR);
//        model.addAttribute("users", users);     // 판매고문
//
//        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));           // 연락방식코드
//        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
//        model.addAttribute("salesActiveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM323", null, langCd));   // 영업활동상태코드
//
//        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd)); // 고객유형 ( 보유 : 01 / 잠재 : 02 )
//
//        return "/crm/cso/salesActivePlan/selectSalesActivePlanMain";
//    }

    /**
     * 영업활동 시행내역 방문 목록 데이터를 조회한다.
     * @param SalesActiveSearchVO - 판매고문, 시행일, 고객명
     * @return
     */
    @RequestMapping(value = "/selectSalesActivePlans.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesActivePlans(@RequestBody SalesActiveSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesActiveMgmtService.selectSalesActiveMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesActiveMgmtService.selectSalesActiveMgmtsByCondition(searchVO));
        }

        return result;

    }

}