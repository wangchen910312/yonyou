package chn.bhmc.dms.mob.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * Todo
 *
 * @author Kim In
 * @since 2016. 3. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2016.03.18       Kim In          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/cmm/todo")
public class MobTodoController extends HController {

    /**
     * Todo
     */
    //서비스 확인 요망
    //@Resource(name="TodoService")
    //private TodoService TodoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    /**
     * Todo 목록
     * @return
     */
    @RequestMapping(value = "/__selectTodoInfoMain.do", method = RequestMethod.GET)
    public String __selectTodoMain(@RequestParam("mode") String mode, Model model) throws Exception{

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mode", mode);


        model.addAttribute("dt", DateUtil.getDate("yyyy年 MM月 dd日"));


        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);


        return "/mob/cmm/todo/selectTodoInfoMain";
    }

    @RequestMapping(value = "/selectTodoInfoMain.do", method = RequestMethod.GET)
    public String selectTodoMain(@RequestParam("mode") String mode, Model model) throws Exception{

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mode", mode);


        model.addAttribute("dt", DateUtil.getDate("yyyy年 MM月 dd日"));


        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/cmm/todo/baseJsp/selectTodoInfoMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * Todo 목록 리스트 조회
     * @return
     */
    @RequestMapping(value = "/selectTodoInfoList.do", method = RequestMethod.GET)
    public String selectTodoList(Model model) throws Exception{
        return "/mob/cmm/todo/selectTodoInfoList";
    }

    /**
     * 미확인 Todo 건수를 조회한다.
     * @return
     */
    @RequestMapping(value = "/selectUnconfirmedTodoCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUnconfirmedTodoCnt(/*@RequestBody NotificationMessageSearchVO searchVO*/)  throws Exception  {

        SearchResult result = new SearchResult();
        TodoInfoSearchVO searchVO = new TodoInfoSearchVO();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsUsrId(mobLoginVO.getUserId());
        searchVO.setsOpenYn("N");
        searchVO.setsActionTargetTp("03");

        result.setTotal(todoInfoService.selectTodoInfosByConditionCnt(searchVO));

        return result;
    }

    /**
     *  Todo를 조회한다.
     * @return
     */
    @RequestMapping(value = "/selectTodo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTodo(@RequestBody TodoInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsUsrId(mobLoginVO.getUserId());
        searchVO.setsActionTargetTp("03");

        result.setTotal(todoInfoService.selectTodoInfosByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(todoInfoService.selectTodoInfosByCondition(searchVO));
        }

        return result;

    }

    /**
     * 확인 Todo 건수를 조회한다.
     * @return
     */
    @RequestMapping(value = "/selectConfirmedTodoCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectConfirmedTodoCnt(@RequestBody TodoInfoSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsUsrId(mobLoginVO.getUserId());
        searchVO.setsOpenYn("Y");
        searchVO.setsActionTargetTp("03");


        /*//처리일자기준조회
        searchVO.setsStartHndlDt(new Date());
        searchVO.setsEndHndlDt(java.sql.Date.valueOf("2013-09-04"));

        //확인일자기준조회
        searchVO.setsStartOpenDt(Date);
        searchVO.setsEndOpenDt(Date);

        //등록일자기준조회
        searchVO.setsStartRegDt(Date);
        searchVO.setsEndRegDt(Date);*/


        //확인 목록수
        result.setTotal(todoInfoService.selectTodoInfosByConditionCnt(searchVO));


        return result;
    }
    /**
     * 미완료 Todo 건수를 조회한다.
     * @return
     */
    @RequestMapping(value = "/selectCompletedTodoCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCompletedTodoCnt(@RequestBody TodoInfoSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsUsrId(mobLoginVO.getUserId());
        searchVO.setsHndlYn("N");
        searchVO.setsActionTargetTp("03");

        //확인 목록수
        result.setTotal(todoInfoService.selectTodoInfosByConditionCnt(searchVO));


        return result;
    }

    /**
     * Todo 정보를 확인 처리한다.
     * @return
     */
    @RequestMapping(value = "/updateTodoInfoOpen.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateTodoInfoOpen(@RequestBody String todoNo) throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        return todoInfoService.updateTodoInfoOpen(Integer.parseInt(todoNo), mobLoginVO.getUserId());
    }

}
