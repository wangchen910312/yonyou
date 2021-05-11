package chn.bhmc.dms.cmm.cmp.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 직무 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class TaskController extends HController {

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 직무 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/task/selectTaskMain.do", method = RequestMethod.GET)
    public String selectTaskMain(Model model) throws Exception {
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM051", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/cmp/task/selectTaskMain";
    }

    /**
     * 직무 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TaskSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/task/selectTasks.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTasks(@RequestBody TaskSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(taskService.selectTasksByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(taskService.selectTasksByCondition(searchVO));
        }

        return result;
    }
}
