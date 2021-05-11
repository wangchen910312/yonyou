package chn.bhmc.dms.sal.inc.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;

/**
 * 보험회사업무통계 컨트롤러
 *
 * @author Kim yewon
 * @since 2016. 5. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                           수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.19            Kim yewon          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inc/incCompSumm")
public class IncCompSummController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 보험가입정보관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;


    /**
     * 보험회사업무통계  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectIncCompSummMain.do", method = RequestMethod.GET)
    public String selectIncCompSummMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String toDay = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String[] toDayArry = toDay.split("-");
        String year = toDayArry[0];
        String month = toDayArry[1];
        String date = toDayArry[2];

        String nextYearDay = Integer.toString(Integer.parseInt(year)+1) + month + date;
        model.addAttribute("toDay", toDay);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("nextYearDay", nextYearDay);

        //보험회사코드 목록
        model.addAttribute("incCmpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));
        //보험종류코드 목록
        model.addAttribute("regTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL126", null, langCd));

        return "/sal/inc/incCompSumm/selectIncCompSummMain";
    }



    /**
     * 보험회사업무통계 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIncCompSumm.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncCompSumm(@RequestBody IncJoinInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = incJoinInfoService.selectIncJoinInfoByConditionCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(incJoinInfoService.selectIncJoinInfoByCondition(searchVO));
        }

        return result;

    }





}
