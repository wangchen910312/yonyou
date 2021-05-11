package chn.bhmc.dms.cmm.ptl.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.ptl.service.PortletTaskMappingService;
import chn.bhmc.dms.cmm.ptl.vo.PortletSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingSaveVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletTaskMappingController.java
 * @Description : 포틀릿-직무매핑 관리 서비스 구현 클래스
 * @author Kang Seok Han
 * @since 2017. 3. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 8.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class PortletTaskMappingController extends HController {

    /**
     * 포틀릿-직무 매핑 관리 서비스
     */
    @Resource(name="portletTaskMappingService")
    PortletTaskMappingService portletTaskMappingService;

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;

    /**
     * 포틀릿-직무 매핑 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletTaskMapping/selectPortletTaskMappingMain.do", method = RequestMethod.GET)
    public String selectPortletTaskMappingMain() throws Exception {
        return "/cmm/ptl/portletTaskMapping/selectPortletTaskMappingMain";
    }

    /**
     * 직무 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TaskSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletTaskMapping/selectTasks.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTasks(@RequestBody TaskSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(taskService.selectTasksByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(taskService.selectTasksByCondition(searchVO));
        }

        return result;
    }

    /**
     * 포틀릿 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TaskSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletTaskMapping/selectPortlets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPortlets(@RequestBody PortletSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<PortletTaskMappingVO> list = portletTaskMappingService.selectPortlets();
        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 포틀릿-직무 매핑 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TaskSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletTaskMapping/selectPortletTaskMappingsByTskCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPortletTaskMappingsByTskCd(@RequestParam(value="tskCd", required=true) String tskCd) throws Exception {
        SearchResult result = new SearchResult();

        List<PortletTaskMappingVO> list = portletTaskMappingService.selectPortletTaskMappingsByTskCd(tskCd);
        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 포틀릿에 매핑된 태스크 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletTaskMapping/deleteAndInsertPortletTaskMapping.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteAndInsertPortletTaskMapping(@RequestBody PortletTaskMappingSaveVO portletTaskMappingSaveVO) throws Exception {
        portletTaskMappingSaveVO.setUsrId(LoginUtil.getUserId());
        portletTaskMappingService.deleteAndInsertPortletTaskMapping(portletTaskMappingSaveVO);
        return true;
    }

}
