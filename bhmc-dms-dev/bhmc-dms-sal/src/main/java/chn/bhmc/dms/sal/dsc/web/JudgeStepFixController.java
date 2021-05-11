package chn.bhmc.dms.sal.dsc.web;

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
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.dsc.service.JudgeStepFixService;
import chn.bhmc.dms.sal.dsc.vo.JudgeStepFixVO;

/**
 *
 * 일상업무등급관리(심사단계설정)
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.21         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dsc/judgeStepFix")
public class JudgeStepFixController extends HController {

    /**
     * 구원차/대부차 서비스
     */
    @Resource(name="judgeStepFixService")
    JudgeStepFixService judgeStepFixService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 일상업무등급관리(심사단계설정) 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectJudgeStepFixMain.do", method = RequestMethod.GET)
    public String selectJudgeStepFixMain(Model model) throws Exception{

        //대상업무 SAL008
        model.addAttribute("gradeCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL008", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/dsc/judgeStepFix/selectJudgeStepFixMain";
    }

    /**
     * 일상업무등급관리(심사단계설정) 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectJudgeStepFixs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectJudgeStepFixs() throws Exception {

        SearchResult result = new SearchResult();
        result.setData(judgeStepFixService.selectJudgeStepFixsByCondition());
        return result;
    }

    /**
     *  적용
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/multiJudgeStepFixs.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiJudgeStepFixs(@Validated @RequestBody BaseSaveVO<JudgeStepFixVO> saveVO) throws Exception {
        return judgeStepFixService.multiJudgeStepFixs(saveVO);
    }


}
