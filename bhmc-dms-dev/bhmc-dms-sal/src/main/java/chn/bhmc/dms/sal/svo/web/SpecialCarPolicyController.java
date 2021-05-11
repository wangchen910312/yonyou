package chn.bhmc.dms.sal.svo.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.SpecialCarPolicyService;
import chn.bhmc.dms.sal.svo.vo.PolicySearchVO;

/**
 * 특수차 정책 이력조회
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.09.30         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/svo/specialCarPolicy")
public class SpecialCarPolicyController extends HController {

    /**
     * 구원차/대부차 서비스
     */
    @Resource(name="specialCarPolicyService")
    SpecialCarPolicyService specialCarPolicyService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 특수차 정책이력 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSpecialCarPolicyMain.do", method = RequestMethod.GET)
    public String selectSpecialCarPolicyMain(Model model,
            @RequestParam(value="sTpCd",    required = false, defaultValue="") String sTpCd
    ) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sTpCd", sTpCd);

        // 차량유형 SAL142
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/svo/specialCarPolicy/selectPolicyHistoryMain";
    }

    /**
     * 구원차/대부차신청 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPolicyHistorySearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPolicyHistorySearch(@RequestBody PolicySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(specialCarPolicyService.selectPolicyHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(specialCarPolicyService.selectPolicyHistorysByCondition(searchVO));
        }

        return result;
    }

}
