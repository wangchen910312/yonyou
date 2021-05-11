package chn.bhmc.dms.sal.usc.web;


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
import chn.bhmc.dms.sal.usc.service.TopSelectionService;
import chn.bhmc.dms.sal.usc.vo.TopSelectionSearchVO;



/**
 * 중고차 수선시스템 - 인증리스트
 *
 * @author Kim yewon
 * @since 2016.06.03
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                    수정자                               수정내용
 *  -------------    ------------    ---------------------------
 *   2016.06.03       Kim yewon             최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/topSelection")
public class UsedCarTopSelectionController extends HController {


    /**
     * 중고차 수선시스템 서비스
     */
    @Resource(name="topSelectionService")
    TopSelectionService topSelectionService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 중고차수선시스템 - 인증리스트  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCreditListMain.do", method = RequestMethod.GET)
    public String selectCreditListMain(Model model) throws Exception {

        //인증정보상태 SAL040
        model.addAttribute("shenheStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL040", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/usc/topSelection/selectCreditListMain";
    }


    /**
     * 중고차수선시스템 - 인증리스트  데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCreditList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCreditList(@RequestBody TopSelectionSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        SearchResult result = new SearchResult();

        result.setTotal(topSelectionService.selectCreditListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(topSelectionService.selectCreditListByCondition(searchVO));
        }

        return result;
    }




}
