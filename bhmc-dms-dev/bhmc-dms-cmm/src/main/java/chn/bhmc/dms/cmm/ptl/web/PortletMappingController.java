package chn.bhmc.dms.cmm.ptl.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.cmp.service.TaskService;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;
import chn.bhmc.dms.cmm.cmp.vo.TaskSearchVO;
import chn.bhmc.dms.cmm.ptl.service.PortletMappingService;
import chn.bhmc.dms.cmm.ptl.service.PortletService;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSaveVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletMappingController.java
 * @Description : 포틀릿-직무/사용자 매핑 관리 서비스 구현 클래스
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
public class PortletMappingController extends HController {

    /**
     * 포틀릿-직무/사용자 매핑 관리 서비스
     */
    @Resource(name="portletMappingService")
    PortletMappingService portletMappingService;
    
    /**
     * 포틀릿 관리 서비스
     */
    @Resource(name="portletService")
    PortletService portletService;

    /**
     * 직무 관리 서비스
     */
    @Resource(name="taskService")
    TaskService taskService;
    
    /**
     * 부서관리 서비스
     */
    @Resource(name="departmentService")
    DepartmentService departmentService;
    
    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 포틀릿-직무/사용자 매핑 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletMapping/selectPortletMappingMain.do", method = RequestMethod.GET)
    public String selectPortletMappingMain(Model model, HttpServletRequest request) throws Exception {
    	//직무구분(딜러/제조사)
        String cmpTp = null;
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");

        if(Constants.SYS_CD_CORP.equals(sysCd)){
            cmpTp = Constants.CMP_TP_CORP;
        }else{
            cmpTp = Constants.CMP_TP_DLR;
        }
        
        //부서목록
        DepartmentSearchVO departmentSearchVO = new DepartmentSearchVO();
        departmentSearchVO.setsCmpTp(cmpTp);
        List<DepartmentVO> deptCdList = departmentService.selectDepartmentsByCondition(departmentSearchVO);
        model.addAttribute("deptCdList", deptCdList);

        //직무목록
        TaskSearchVO taskSearchVO = new TaskSearchVO();
        taskSearchVO.setsCmpTp(cmpTp);
        model.addAttribute("taskList", taskService.selectTasksByCondition(taskSearchVO));
        
        //회사구분
        model.addAttribute("cmpTp", cmpTp);
        //회사구분-법인
        model.addAttribute("cmpTpCorp", Constants.CMP_TP_CORP);
    	
        return "/cmm/ptl/portletMapping/selectPortletMappingMain";
    }

    /**
     * 직무 목록 데이터를 조회한다.
     * @param taskSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletMapping/selectTasks.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTasks(@RequestBody TaskSearchVO taskSearchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(taskService.selectTasksByConditionCnt(taskSearchVO));

        if(result.getTotal() > 0){
            result.setData(taskService.selectTasksByCondition(taskSearchVO));
        }

        return result;
    }
    
    /**
     * 사용자 목록 데이터를 조회한다.
     * @param userSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletMapping/selectUsers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsers(@RequestBody UserSearchVO userSearchVO) throws Exception {
        SearchResult result = new SearchResult();
        
        userSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        
        result.setTotal(userService.selectUsersByConditionCnt(userSearchVO));
        if(result.getTotal() > 0){
            result.setData(userService.selectUsersByCondition(userSearchVO));
        }

        return result;
    }

    /**
     * 포틀릿 목록 데이터를 조회한다.
     * @param portletSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletMapping/selectPortlets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPortlets(@RequestBody PortletSearchVO portletSearchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<PortletVO> list = portletService.selectPortletsByCondition(portletSearchVO);
        
        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 포틀릿-직무/사용자 매핑 목록 데이터를 조회한다.
     * @param portletMappingSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletMapping/selectPortletMappingsByTask.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPortletMappingsByTask(@RequestBody PortletMappingSearchVO portletMappingSearchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<PortletMappingVO> list = portletMappingService.selectPortletMappingByCondition(portletMappingSearchVO);
        
        result.setTotal(list.size());
        result.setData(list);

        return result;
    }  
    
    /**
     * 포틀릿 목록 데이터를 조회한다.
     * @param portletMappingSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletMapping/selectPortletMappingsByUser.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPortletMappingsByUser(@RequestBody PortletMappingSearchVO portletMappingSearchVO) throws Exception {
        SearchResult result = new SearchResult();
        
        List<PortletMappingVO> list = portletMappingService.selectPortletMappingByUser(portletMappingSearchVO);
        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 포틀릿-직무/사용자 매핑 정보를 일괄 저정한다.
     * @param portletMappingSaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletMapping/deleteAndInsertPortletMapping.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteAndInsertPortletMapping(@RequestBody PortletMappingSaveVO portletMappingSaveVO) throws Exception {
        portletMappingSaveVO.setUsrId(LoginUtil.getUserId());
        portletMappingService.deleteAndInsertPortletMapping(portletMappingSaveVO);
        return true;
    }
}
