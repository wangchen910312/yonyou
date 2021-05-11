package chn.bhmc.dms.cmm.ptl.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;
import chn.bhmc.dms.cmm.ptl.service.PortletLayoutService;
import chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletLayoutSaveVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletLayoutSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletLayoutVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletLayoutController.java
 * @Description : 포틀릿 레이아웃 관리 컨트롤러
 * @author Kang Seok Han
 * @since 2016. 4. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 9.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class PortletLayoutController extends HController {

    /**
     * 포틀릿 레이아웃 관리 서비스
     */
    @Resource(name="portletLayoutService")
    PortletLayoutService portletLayoutService;

    /**
     * 화면정보 관리 서비스
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;

    /**
     * 포틀릿 레이아웃 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletLayout/selectPortletLayoutMain.do", method = RequestMethod.GET)
    public String selectPortletLayoutMain() throws Exception {
        return "/cmm/ptl/portletLayout/selectPortletLayoutMain";
    }

    /**
     * 포틀릿 레이아웃 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletLayoutSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletLayout/selectPortletLayouts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPortletLayouts(@RequestBody PortletLayoutSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(portletLayoutService.selectPortletLayoutsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(portletLayoutService.selectPortletLayoutsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 포틀릿 레이아웃 정보를 등록한다.
     * @param saveVO - 포틀릿 레이아웃정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletLayout/multiPortletLayouts.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPortletLayouts(@Validated @RequestBody PortletLayoutSaveVO saveVO) throws Exception {
        portletLayoutService.multiPortletLayouts(saveVO);
        return true;

    }


    /**
     * 포틀릿 레이아웃의 디폴트포틀릿 설정 화면을 출력한다.
     * @param portletLayoutId
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ptl/portletLayout/selectDefaultPortletDeployMain.do", method = RequestMethod.GET)
    public String selectDefaultPortletDeployMain(@RequestParam("portletLayoutId") String portletLayoutId, Model model) throws Exception {

        PortletLayoutVO portletLayout = portletLayoutService.selectPortletLayoutByKey(portletLayoutId);
        List<PortletDeployVO> portletList = portletLayoutService.selectDefaultPortletDeploies(portletLayoutId);

        for(PortletDeployVO portletDeployVO : portletList){
            if(StringUtils.isNotEmpty(portletDeployVO.getMesgKey())){
                portletDeployVO.setPortletNm(messageSource.getMessage(portletDeployVO.getMesgKey(), null, LocaleContextHolder.getLocale()));
            }
        }

        model.addAttribute("portletLayout", portletLayout);
        model.addAttribute("portletList", portletList);
        model.addAttribute("isDefaultPortletDeploy", "true");

        return "/cmm/ptl/portletLayout/" + portletLayout.getPortletLayoutUrl();
    }

    /**
     * 포틀릿 레이아웃의 디폴트포틀릿 설정을 변경한다.
     * @param portletLayoutId
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ptl/portletLayout/updateDefaultPortletDeploy.do", method = RequestMethod.POST)
    @ResponseBody
    public PortletDeployVO updateDefaultPortletDeploy(@RequestBody PortletDeployVO newPortletDeployVO) throws Exception {

        PortletDeployVO oldPortletDeployVO = portletLayoutService.selectDefaultPortletDeploy(newPortletDeployVO);

        if(oldPortletDeployVO == null){
            portletLayoutService.insertDefaultPortletDeploy(newPortletDeployVO);
        }else{
            portletLayoutService.updateDefaultPortletDeploy(newPortletDeployVO);
        }

        PortletDeployVO portletDeployVO = portletLayoutService.selectDefaultPortletDeploy(newPortletDeployVO);
        if(StringUtils.isNotEmpty(portletDeployVO.getMesgKey())){
            portletDeployVO.setPortletNm(messageSource.getMessage(portletDeployVO.getMesgKey(), null, LocaleContextHolder.getLocale()));
        }

        return portletDeployVO;
    }

    /**
     * 사용자정의 포틀릿 레이아웃 정보를 변경한다
     * @param saveVO - 포틀릿 레이아웃정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletLayout/updateUserPortletLayout.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateUserPortletLayout(@Validated @RequestBody PortletLayoutVO portletLayoutVO) throws Exception {

        String usrId = LoginUtil.getUserId();
        PortletLayoutVO portletLayout = portletLayoutService.selectUserPortletLayout(usrId);

        if(portletLayout == null){
            portletLayoutService.insertUserPortletLayout(portletLayoutVO);
        }else{
            portletLayoutService.updateUserPortletLayout(portletLayoutVO);
        }

        return true;
    }

    /**
     * 사용자정의 포틀릿 레이아웃의 포틀릿 설정을 변경한다.
     * @param portletLayoutId
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/ptl/portletLayout/updateUserPortletDeploy.do", method = RequestMethod.POST)
    @ResponseBody
    public PortletDeployVO updateUserPortletDeploy(@RequestBody PortletDeployVO newPortletDeployVO) throws Exception {

        PortletDeployVO oldPortletDeployVO = portletLayoutService.selectUserPortletDeploy(newPortletDeployVO);

        if(oldPortletDeployVO == null || oldPortletDeployVO.getUsrId() == null){
            portletLayoutService.insertUserPortletDeploy(newPortletDeployVO);
        }else{
            portletLayoutService.updateUserPortletDeploy(newPortletDeployVO);
        }

        PortletDeployVO portletDeployVO = portletLayoutService.selectUserPortletDeploy(newPortletDeployVO);
        if(StringUtils.isNotEmpty(portletDeployVO.getMesgKey())){
            portletDeployVO.setPortletNm(messageSource.getMessage(portletDeployVO.getMesgKey(), null, LocaleContextHolder.getLocale()));
        }

        return portletDeployVO;
    }

    /**
     * 화면정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ViewInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletLayout/selectViewInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public ViewInfoVO selectViewInfo(@RequestBody ViewInfoSearchVO searchVO) throws Exception {
        ViewInfoVO viewInfoVO = viewInfoService.selectViewInfoByTcd(searchVO.getsTCd());

        if(viewInfoVO == null) {
            throw new BizException(messageSource.getMessage("global.err.invalid", new String[]{
                    messageSource.getMessage("global.lbl.viewInfo", null, LocaleContextHolder.getLocale())
            }, LocaleContextHolder.getLocale()));
        }

        if(viewInfoVO != null && StringUtils.isNotEmpty(viewInfoVO.getMesgKey())) {
            try{
                String viewNm = messageSource.getMessage(viewInfoVO.getMesgKey(), null, LocaleContextHolder.getLocale());
                viewInfoVO.setViewNm(viewNm);
            }catch(NoSuchMessageException e){
                log.warn(e.getMessage());
            }

        }

        return viewInfoVO;
    }
}
