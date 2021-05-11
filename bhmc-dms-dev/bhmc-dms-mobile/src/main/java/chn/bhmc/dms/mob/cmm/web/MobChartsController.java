package chn.bhmc.dms.mob.cmm.web;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobChartsController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class MobChartsController extends HController {
    // Bar Charts
    @RequestMapping(value = "/mob/cmm/charts/selectBarChartMain.do", method = RequestMethod.GET)
    public String selectBarChartMain(Model model) throws Exception {
        String[] categories = new String[6];

        categories[0] = "Jan";
        categories[1] = "Feb";
        categories[2] = "Mar";
        categories[3] = "Apr";
        categories[4] = "May";
        categories[5] = "Jun";

        return "/mob/cmm/charts/selectBarChartMain";
    }

    // Donut Charts
    @RequestMapping(value = "/mob/cmm/charts/selectDonutChartMain.do", method = RequestMethod.GET)
    public String selectDonutChartMain(Model model) throws Exception{
        return "/mob/cmm/charts/selectDonutChartMain";
    }

    // Line Charts
    @RequestMapping(value = "/mob/cmm/charts/selectLineChartMain.do", method = RequestMethod.GET)
    public String selectLineMain(Model model) throws Exception{
        return "/mob/cmm/charts/selectLineChartMain";
    }

    // Sparkline Charts
    @RequestMapping(value = "/mob/cmm/charts/selectSparklineChartMain.do", method = RequestMethod.GET)
    public String selectSparklineMain(Model model) throws Exception{
        return "/mob/cmm/charts/selectSparklineChartMain";
    }
}