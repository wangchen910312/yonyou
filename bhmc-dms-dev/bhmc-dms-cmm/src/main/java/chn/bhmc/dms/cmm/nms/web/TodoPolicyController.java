package chn.bhmc.dms.cmm.nms.web;

import java.util.List;

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

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.nms.service.TodoPolicyService;
import chn.bhmc.dms.cmm.nms.service.TodoTargetService;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicySaveVO;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicySearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoTargetVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * To-do 정책 관리 컨트롤러
 *
 * @ClassName   : TodoPolicyController.java
 * @Description : To-do 정책 관리 컨트롤러
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class TodoPolicyController extends HController {

    /**
     * To-do 정책 서비스
     */
    @Resource(name="todoPolicyService")
    TodoPolicyService todoPolicyService;

    /**
     * To-do 수신대상 서비스
     */
    @Resource(name="todoTargetService")
    TodoTargetService todoTargetService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * To-do 정책 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/nms/todoPolicy/selectTodoPolicyMain.do", method = RequestMethod.GET)
    public String selectTodoPolicyMain(Model model)  throws Exception {
        //To-do 정책 유형 목록
        model.addAttribute("actionTargetTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM057", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/nms/todoPolicy/selectTodoPolicyMain";
    }


    /**
     * To-do 정책 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoPolicySearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/todoPolicy/selectTodoPolicies.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTodoPolicies(@RequestBody TodoPolicySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(todoPolicyService.selectTodoPoliciesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(todoPolicyService.selectTodoPoliciesByCondition(searchVO));
        }

        return result;
    }

    /**
     * To-do 정책을 저장한다.
     * @param saveVO - To-do 정책 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/todoPolicy/multiTodoPolicies.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiTodoPolicies(@Validated @RequestBody TodoPolicySaveVO saveVO) throws Exception {
        todoPolicyService.multiTodoPolicies(saveVO);
        return true;
    }

    /**
     * To-do 정책 수신대상 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TodoTargetSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/todoPolicy/selectTodoTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTodoTargets(@RequestBody TodoTargetSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<TodoTargetVO> list = todoTargetService.selectTodoTargetsByCondition(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;

    }

    /**
     * To-do 정책 수신대상을 저장한다.
     * @param saveVO - To-do 정책 수신대상 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/todoPolicy/multiTodoTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiTodoTargets(@Validated @RequestBody TodoTargetSaveVO saveVO) throws Exception {
        todoTargetService.multiTodoTargets(saveVO);
        return true;
    }
}
