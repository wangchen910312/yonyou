package chn.bhmc.dms.cmm.nms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.service.TodoPolicyService;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoSearchVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.cmm.nms.vo.TodoPolicyVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * To-do 리스트 관리 컨트롤러
 *
 * @ClassName   : TodoInfoController.java
 * @Description : To-do 리스트 관리 컨트롤러
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
public class TodoInfoController extends HController {

    /**
     * Todo 정책 관리 서비스
     */
    @Resource(name="todoPolicyService")
    TodoPolicyService todoPolicyService;

    /**
     * Todo 정보 관리 서비스
     */
    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    /**
     * 화면정보 관리 서비스
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * Todo 정보 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/nms/todoInfo/selectTodoInfoMain.do", method = RequestMethod.GET)
    public String selectTodoInfoMain(Model model, HttpServletRequest request)  throws Exception {
    	//직무구분(딜러/제조사)
        String cmpTp = null;
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");

        if(Constants.SYS_CD_CORP.equals(sysCd)){
            cmpTp = Constants.CMP_TP_CORP;
        }else{
            cmpTp = Constants.CMP_TP_DLR;
        }
        
        //회사구분
        model.addAttribute("cmpTp", cmpTp);
        
        return "/cmm/nms/todoInfo/selectTodoInfoMain";
    }


    /**
     * Todo 정보 목록을 조회한다.
     * @param searchVO 조회 조건을 포함하는 TodoInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/todoInfo/selectTodoInfos.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTodoInfos(@RequestBody TodoInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsUsrId(LoginUtil.getUserId());

        result.setTotal(todoInfoService.selectTodoInfosByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(todoInfoService.selectTodoInfosByCondition(searchVO));
        }

        return result;
    }

    /**
     * Todo 정보를 완료 처리한다.
     * @param list 완료 처리할 Todo 리스트 목록
     * @return
     */
    @RequestMapping(value = "/cmm/nms/todoInfo/updateTodoInfoHndl.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateTodoInfoHndl(@RequestBody List<Integer> list) throws Exception {
        return todoInfoService.updateTodoInfoHndl(list, LoginUtil.getUserId());
    }

    /**
     * Todo
     * @param todoNo Todo 번호
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/nms/todoInfo/updateActionTodoInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateTodoInfoOpenAndHndl(@RequestParam(value="todoNo", required=true) int todoNo, HttpServletRequest request) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("needReload", false);
        result.put("needPostAction", false);
        Device device = DeviceUtils.getCurrentDevice(request);

        TodoInfoVO todoInfoVO = todoInfoService.selectTodoInfoByKey(todoNo);

        //확인여부가 'N'인 경우 확인여부를 'Y'로 변경한다.
        if("N".equals(todoInfoVO.getOpenYn())){
            todoInfoService.updateTodoInfoOpen(todoNo, LoginUtil.getUserId());
        }

        TodoPolicyVO todoPolicyVO = todoPolicyService.selectTodoPolicyByKey(todoInfoVO.getTodoPolicyId());

        //처리여부가 'N'이고 자동확인여부가 'Y'인 경우 처리여부를 'Y'로 변경한다.
        if("N".equals(todoInfoVO.getHndlYn()) && "Y".equals(todoPolicyVO.getAutoChkYn())){
            todoInfoService.updateTodoInfoHndl(todoNo, LoginUtil.getUserId());
            result.put("needReload", true);
        }

        /*khs 수정 문제시 삭제*/
        if(device.isMobile()){
            if(StringUtils.isNotBlank(todoPolicyVO.getActionUrlMob())){
                ViewInfoVO viewInfoVO = viewInfoService.selectViewInfoByTcd(todoPolicyVO.getActionUrlMob());
                if(viewInfoVO != null){
                    result.put("needPostAction", true);
                    result.put("viewUrl", viewInfoVO.getViewUrl());
                    result.put("viewId", viewInfoVO.getViewId());
                    result.put("viewParams", todoInfoVO.getActionParams());
                    result.put("tCd", StringUtils.defaultIfBlank(viewInfoVO.gettCd(), ""));

                    String viewNm = "";

                    if(!StringUtils.isBlank(viewInfoVO.getMesgKey())){
                        viewNm = messageSource.getMessage(viewInfoVO.getMesgKey(), null, viewInfoVO.getViewNm(), LocaleContextHolder.getLocale());
                    }else{
                        viewNm = viewInfoVO.getViewNm();
                    }

                    if(!StringUtils.isBlank(viewInfoVO.gettCd())){
                        viewNm = "<span title=\""+viewInfoVO.gettCd()+"\">"+viewNm+"</span>";
                    }

                    result.put("viewNm", viewNm);
                }
            }
        }else{
            if(StringUtils.isNotBlank(todoPolicyVO.getActionUrlWeb())){
                ViewInfoVO viewInfoVO = viewInfoService.selectViewInfoByTcd(todoPolicyVO.getActionUrlWeb());
                if(viewInfoVO != null){
                    result.put("needPostAction", true);
                    result.put("viewUrl", viewInfoVO.getViewUrl());
                    result.put("viewId", viewInfoVO.getViewId());
                    result.put("viewParams", todoInfoVO.getActionParams());
                    result.put("tCd", StringUtils.defaultIfBlank(viewInfoVO.gettCd(), ""));

                    String viewNm = "";

                    if(!StringUtils.isBlank(viewInfoVO.getMesgKey())){
                        viewNm = messageSource.getMessage(viewInfoVO.getMesgKey(), null, viewInfoVO.getViewNm(), LocaleContextHolder.getLocale());
                    }else{
                        viewNm = viewInfoVO.getViewNm();
                    }

                    if(!StringUtils.isBlank(viewInfoVO.gettCd())){
                        viewNm = "<span title=\""+viewInfoVO.gettCd()+"\">"+viewNm+"</span>";
                    }

                    result.put("viewNm", viewNm);
                }
            }
        }
        return result;

    }

    @RequestMapping(value = "/cmm/nms/todoInfo/selectTodoInfoPortlet.do", method = RequestMethod.GET)
    public String selectNotificationInfoPortlet(){
        return "/cmm/nms/todoInfo/selectTodoInfoPortlet";
    }


}
