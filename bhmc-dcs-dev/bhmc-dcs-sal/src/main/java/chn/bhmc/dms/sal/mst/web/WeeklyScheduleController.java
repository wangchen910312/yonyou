package chn.bhmc.dms.sal.mst.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.sal.mst.service.WeeklyScheduleService;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleSearchVO;
import chn.bhmc.dms.sal.mst.vo.WeeklyScheduleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WeeklyScheduleController
 * @Description : 주간계획 Controller
 * @author Bong
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.       Bong                최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/mst/weeklySchedule")
public class WeeklyScheduleController extends HController {
    /**
     * 주간계획 서비스
     */
    @Resource(name="weeklyScheduleService")
    WeeklyScheduleService weeklyScheduleService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 주간계획 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectWeeklyScheduleMain.do", method = RequestMethod.GET)
    public String selectWeeklyScheduleConditionMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy/MM");
        //String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("sysDate", sysDate);
        //model.addAttribute("oneDay", oneDay);

        //업무구분(SAL133)
        model.addAttribute("btoWrkTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL133", null, langCd));

        //작업상태(SAL038)
        model.addAttribute("operStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL038", null, langCd));

        return "/sal/mst/weeklySchedule/selectWeeklyScheduleMain";
    }

    /**
     * 주간계획 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WeeklyScheduleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectWeeklySchedule.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWeeklyScheduleCondition(@RequestBody WeeklyScheduleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(weeklyScheduleService.selectWeeklyScheduleConditionCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(weeklyScheduleService.selectWeeklyScheduleCondition(searchVO));  //Result, Search
        }

        return result;
    }

    /**
     * 주간계획 업무 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WeeklyScheduleVO
     * @return
     */
    @RequestMapping(value = "/selectWeeklyScheduleDet.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWeeklyScheduleDetCondition(@RequestBody WeeklyScheduleVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(weeklyScheduleService.selectWeeklyScheduleDetConditionCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(weeklyScheduleService.selectWeeklyScheduleDetCondition(searchVO));  //Result, Search
        }

        return result;
    }

}
