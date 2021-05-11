package chn.bhmc.dms.cmm.ptl.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletChartController.java
 * @Description : 포틀릿 관리 서비스 구현 클래스
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
public class PortletChartController extends HController {

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectRetailMissionAnnualPtl.do", method = RequestMethod.GET)
    public String selectRetailMissionAnnualPtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectRetailMissionAnnualPtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectRetailMissionMonPtl.do", method = RequestMethod.GET)
    public String selectRetailMissionMonPtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectRetailMissionMonPtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectRetailStateMonPtl.do", method = RequestMethod.GET)
    public String selectRetailStateMonPtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectRetailStateMonPtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectRetailStatisticsAnnualPtl.do", method = RequestMethod.GET)
    public String selectRetailStatisticsAnnualPtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectRetailStatisticsAnnualPtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectTransMissionAnnualPtl.do", method = RequestMethod.GET)
    public String selectTransMissionAnnualPtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectTransMissionAnnualPtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectTransMissionMonPtl.do", method = RequestMethod.GET)
    public String selectTransMissionMonPtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectTransMissionMonPtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectVehicleInoutStatisticsLinePtl.do", method = RequestMethod.GET)
    public String selectVehicleInoutStatisticsLinePtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectVehicleInoutStatisticsLinePtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectVehicleInoutStatisticsPiePtl.do", method = RequestMethod.GET)
    public String selectVehicleInoutStatisticsPiePtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectVehicleInoutStatisticsPiePtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectAnnualContractMonPtl.do", method = RequestMethod.GET)
    public String selectAnnualContractMonPtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectAnnualContractMonPtl";
    }

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portletChart/selectSalesConsultantStatisticsRptPtl.do", method = RequestMethod.GET)
    public String selectSalesConsultantStatisticsRptPtl(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate    = DateUtil.getDate(dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/ptl/portletChart/selectSalesConsultantStatisticsRptPtl";
    }
}