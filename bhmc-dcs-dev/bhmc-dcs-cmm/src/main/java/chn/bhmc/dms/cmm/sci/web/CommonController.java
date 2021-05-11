package chn.bhmc.dms.cmm.sci.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.vo.FavoritesVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;
import chn.bhmc.dms.cmm.ptl.service.PortletLayoutService;
import chn.bhmc.dms.cmm.sci.service.CurrencyService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CurrencySearchVO;
import chn.bhmc.dms.cmm.sci.vo.CurrencyVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 공통 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class CommonController extends HController {

    /**
     * 통화정보 관리 서비스
     */
    @Resource(name="currencyService")
    CurrencyService currencyService;

    /**
     * 화면정보 관리 서비스
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;

    /**
     * 포틀릿 레이아웃 관리 서비스
     */
    @Resource(name="portletLayoutService")
    PortletLayoutService portletLayoutService;

    /**
     * 시스템설정 정보 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 메인페이지를 출력한다.
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectHome.do", method = RequestMethod.GET)
    public String selectHome(@RequestParam(name="viewId", required=false, defaultValue="") String viewId, Model model, HttpServletRequest request) throws Exception {
//        PortletLayoutSearchVO portletLayoutSearchVO = new PortletLayoutSearchVO();
//        List<PortletLayoutVO> portletLayoutList = portletLayoutService.selectPortletLayoutsByCondition(portletLayoutSearchVO);
//        model.addAttribute("portletLayoutList", portletLayoutList);

        //시스템구분
        model.addAttribute("sysCd", request.getServletContext().getInitParameter("SYS_CD"));
        //웹/모바일구분
        model.addAttribute("webMobileDstinCd", Constants.WEB_MOBILE_DSTIN_CD_WEB);
        //JMS IP
        model.addAttribute("jmsIp", systemConfigInfoService.selectStrValueByKey(Constants.SYS_PREF_JMS_IP));
        //JMS Port
        model.addAttribute("jmsPort", systemConfigInfoService.selectStrValueByKey(Constants.SYS_PREF_JMS_PORT));

        //탭메뉴 오픈 체크
        if(StringUtils.isNotBlank(viewId)){
            ViewInfoVO viewInfoVO = viewInfoService.selectViewInfoByKey(viewId);

            if(StringUtils.isNotBlank(viewInfoVO.getMesgKey())){
                viewInfoVO.setViewNm(messageSource.getMessage(viewInfoVO.getMesgKey(), null, viewInfoVO.getViewNm(), LocaleContextHolder.getLocale()));
            }

            model.addAttribute("defaultOpenViewInfo", viewInfoVO);
        }

        return "/home";
    }

    /**
     * 메인탭 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectMain.do", method = RequestMethod.GET)
    public String selectMain(Model model) throws Exception {
        //TODO[한강석] 포틀릿 메인화면은 파트별 포틀릿 개발이 완료 될때까지 임시로 주석처리
        /*
        String usrId = LoginUtil.getUserId();
        PortletLayoutVO portletLayout = null;

        portletLayout = portletLayoutService.selectUserPortletLayout(usrId);

        if(portletLayout == null){
            portletLayout = portletLayoutService.selectDefaultPortletLayout();
        }

        List<PortletDeployVO> portletList = portletLayoutService.selectUserPortletDeploies(portletLayout.getPortletLayoutId(), usrId);

        for(PortletDeployVO portletDeployVO : portletList){
            if(StringUtils.isNotEmpty(portletDeployVO.getMesgKey())){
                portletDeployVO.setPortletNm(messageSource.getMessage(portletDeployVO.getMesgKey(), null, LocaleContextHolder.getLocale()));
            }
        }

        model.addAttribute("portletLayout", portletLayout);
        model.addAttribute("portletList", portletList);
        model.addAttribute("isDefaultPortletDeploy", "false");

        return "/portletLayout/" + portletLayout.getPortletLayoutUrl();
        */

        return "/selectMain";
    }

    /**
     * 소스배포 서버에서 체크하기 위한 URL
     *
     * @return
     */
    @RequestMapping(value = "/selectPingTest.do", method = RequestMethod.GET)
    @ResponseBody
    public Boolean selectPingTest(){
        return true;
    }

    /**
     * 즐겨찾기 정보를 등록한다.
     * @param favoriteVO - 즐겨찾기 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/insertFavorite.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertFavorite(@RequestParam("viewId") String viewId) throws Exception {
        viewInfoService.insertFavorite(viewId, LoginUtil.getUserId());
        return true;
    }

    /**
     * 즐겨찾기 정보를 삭제한다.
     * @param favoritesVO - 즐겨찾기 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/deleteFavorite.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteFavorite(@RequestParam("viewId") String viewId) throws Exception {
        viewInfoService.deleteFavorite(viewId, LoginUtil.getUserId());
        return true;
    }

    /**
     * 즐겨찾기 목록 데이터를 조회한다.
     * @param viewInfoVO - 조회 조건을 포함하는 ViewInfoVO
     * @return
     */
    @RequestMapping(value = "/selectFavorites.do", method = RequestMethod.POST)
    @ResponseBody
    public List<FavoritesVO> selectFavorites(@RequestParam(value="webMobileDstinCd", defaultValue=Constants.WEB_MOBILE_DSTIN_CD_WEB) String webMobileDstinCd) throws Exception {
        List<FavoritesVO> list = viewInfoService.selectFavorites(webMobileDstinCd, LoginUtil.getUserId(), LocaleContextHolder.getLocale().getLanguage());

        for(FavoritesVO favoritesVO : list){
            if(!StringUtils.isBlank(favoritesVO.getMesgKey())){
                favoritesVO.setViewNm(messageSource.getMessage(favoritesVO.getMesgKey(), null, favoritesVO.getViewNm(), LocaleContextHolder.getLocale()));
            }
        }

        return list;
    }

    /**
     * 통화정보 활용을 위한 자바스크립트 데이터를 생성한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/js/selectCultureSettings.do", method = RequestMethod.GET)
    public ModelAndView selectCultureSettings(Model model) throws Exception {

        CurrencySearchVO searchVO = new CurrencySearchVO();

        List<CurrencyVO> currencyList = (List<CurrencyVO>)currencyService.selectCurrenciesByCondition(searchVO);

        StringBuffer sb = new StringBuffer(10240);
        sb.append("(function(window, document, $){\n");
        sb.append(" var dms = window.dms? window.dms:{};\n");
        sb.append(" dms.settings = {\n");
        sb.append("\t\tdefaultCurrency:\"").append(systemConfigInfoService.selectStrValueByKey("defaultCurrency")).append("\"\n");
        sb.append("\t\t,currency:{\n");

        int idx = 0;
        for(CurrencyVO obj : currencyList){

            if(idx != 0){
                sb.append("\t\t,");
            }

            sb.append("\t\t\t\"").append(obj.getCurrencyCd()).append("\":{\n")
            .append("\t\t\t\t\t\"decimals\":").append(obj.getFractionCnt()).append("\n")
            .append("\t\t\t\t\t,\"numberSymbol\":\"").append(obj.getNumberSym()).append("\"\n")
            .append("\t\t\t\t\t,\"decimalSymbol\":\"").append(obj.getDecimalSym()).append("\"\n")
            .append("\t\t\t\t\t,\"symbol\":\"").append(obj.getCurrencySym()).append("\"\n")
            .append("\t\t\t\t\t,\"position\":\"").append(obj.getSymbolPosTp()).append("\"\n")
            .append("\t\t\t}\n");

            idx++;

        }

        sb.append("\t\t}").append("\n");

        sb.append("\t\t,validationMessage : {").append("\n");
        sb.append("\t\t\t\"required\":\"").append(messageSource.getMessage("global.info.validation.required", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"pattern\":\"").append(messageSource.getMessage("global.info.validation.pattern", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"max\":\"").append(messageSource.getMessage("global.info.validation.max", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"min\":\"").append(messageSource.getMessage("global.info.validation.min", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"step\":\"").append(messageSource.getMessage("global.info.validation.step", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"email\":\"").append(messageSource.getMessage("global.info.validation.email", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"url\":\"").append(messageSource.getMessage("global.info.validation.url", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"date\":\"").append(messageSource.getMessage("global.info.validation.date", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"select\":\"").append(messageSource.getMessage("global.info.validation.select", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t}\n");

        sb.append("\t\t,defaultMessage : {").append("\n");
        sb.append("\t\t\t\"portletSearch\":\"").append(messageSource.getMessage("cmm.title.portlet.search", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"gridIndividualization\":\"").append(messageSource.getMessage("global.lbl.gridIndividualization", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"btnGridColumnHideInit\":\"").append(messageSource.getMessage("global.btn.gridColumnHideInit", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"btnGridColumnSortInit\":\"").append(messageSource.getMessage("global.btn.gridColumnSortInit", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"invalidDateFormat\":\"").append(messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.date", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"confirmWindowTitle\":\"").append(messageSource.getMessage("global.title.confirmWindowTitle", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"confirmBtnText\":\"").append(messageSource.getMessage("global.btn.confirm", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"cancelBtnText\":\"").append(messageSource.getMessage("global.btn.cancel", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"preview\":\"").append(messageSource.getMessage("global.title.preview", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"fileNotFound\":\"").append(messageSource.getMessage("global.error.fileNotFound", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t\t,\"aready\":\"").append(messageSource.getMessage("global.info.already", null, LocaleContextHolder.getLocale())).append("\"\n");
        sb.append("\t\t}\n");

        sb.append("\t\t,callCenterMessage : {").append("\n");
        sb.append("\t\t\t\"vocMng\":\"").append(messageSource.getMessage("crm.menu.vocMng", null, LocaleContextHolder.getLocale())).append("\"\n");     //고객 요청 관리
        sb.append("\t\t\t,\"obMng\":\"").append(messageSource.getMessage("crm.menu.callCenter", null, LocaleContextHolder.getLocale())).append("\"\n");     //OB 실행
        sb.append("\t\t\t,\"opportunityMng\":\"").append(messageSource.getMessage("crm.menu.opportunityMng", null, LocaleContextHolder.getLocale())).append("\"\n");     //판매기회관리
        sb.append("\t\t\t,\"hpNo\":\"").append(messageSource.getMessage("crm.lbl.hpNo", null, LocaleContextHolder.getLocale())).append("\"\n");          //고객이동전화번호
        sb.append("\t\t\t,\"phoneCall\":\"").append(messageSource.getMessage("crm.lbl.phoneCall", null, LocaleContextHolder.getLocale())).append("\"\n");     //전화왔습니다.
        sb.append("\t\t\t,\"phoneMissCall\":\"").append(messageSource.getMessage("crm.lbl.phoneMissCall", null, LocaleContextHolder.getLocale())).append("\"\n");     //건의 부재중 전화가 있습니다.
        sb.append("\t\t\t,\"confirmCallStatCd\":\"").append(messageSource.getMessage("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.callStatCd", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale())).append("\"\n");  //{콜센터 장비 상태}을(를) 확인하여 주세요.
        sb.append("\t\t}\n");

        sb.append("\t};\n");
        sb.append("window.dms = dms;\n");
        sb.append("})(window, document, jQuery);\n");

        ModelAndView mav = new ModelAndView("javascriptView");
        mav.addObject("script", sb.toString());

        return mav;
    }
}
