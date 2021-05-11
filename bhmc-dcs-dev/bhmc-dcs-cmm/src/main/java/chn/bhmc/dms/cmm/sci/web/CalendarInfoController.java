package chn.bhmc.dms.cmm.sci.web;

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

import chn.bhmc.dms.cmm.sci.service.CalendarInfoService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.HolidayService;
import chn.bhmc.dms.cmm.sci.service.LangCdService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.WorkingService;
import chn.bhmc.dms.cmm.sci.vo.CalendarInfoSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CalendarInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.HolidaySaveVO;
import chn.bhmc.dms.cmm.sci.vo.HolidaySearchVO;
import chn.bhmc.dms.cmm.sci.vo.LangCdSaveVO;
import chn.bhmc.dms.cmm.sci.vo.LangCdSearchVO;
import chn.bhmc.dms.cmm.sci.vo.WorkingVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalendarInfoController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class CalendarInfoController extends HController {
    /**
     * 달력 정보 관리 서비스
     */
    @Resource(name="calendarInfoService")
    CalendarInfoService calendarInfoService;

    /**
     * 근무일 정보 관리 서비스
     */
    @Resource(name="workingService")
    WorkingService workingService;

    /**
     * 휴일 정보 관리 서비스
     */
    @Resource(name="holidayService")
    HolidayService holidayService;

    /**
     * 언어 설정 관리 서비스
     */
    @Resource(name="langCdService")
    LangCdService langCdService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 달력 정보 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/calendarInfo/selectCalendarInfoMain.do", method = RequestMethod.GET)
    public String selectCalendarInfoMain(Model model) throws Exception {
        // 달력 유형
        List<CommonCodeVO> arrCalendarTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM030", null, LocaleContextHolder.getLocale().getLanguage());

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("arrCalendarTp", arrCalendarTp);
        model.addAttribute("startDt", DateUtil.getDate("yyyyMMdd"));

        return "/cmm/sci/calendarInfo/selectCalendarInfoMain";
    }

    @RequestMapping(value = "/cmm/sci/calendarInfo/selectCalendarInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCalendarInfo(@RequestBody CalendarInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(calendarInfoService.selectCalendarInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(calendarInfoService.selectCalendarInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 달력 언어 설정 Popup
     * @return
     */
    @RequestMapping(value = "/cmm/sci/calendarInfo/selectCalendarLangCdPopup.do", method = RequestMethod.GET)
    public String selectCalendarLangCdPopup(Model model) throws Exception {
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));

        return "/cmm/sci/calendarInfo/selectCalendarLangCdPopup";
    }

    @RequestMapping(value = "/cmm/sci/calendarInfo/selectLangCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLangCd(@RequestBody LangCdSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(langCdService.selectLangCdByCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(langCdService.selectLangCdByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/calendarInfo/multiCalendarInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCalendarInfo(@Validated @RequestBody CalendarInfoSaveVO calendarInfoSaveVO) throws Exception {
        calendarInfoService.multiCalendarInfo(calendarInfoSaveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/sci/calendarInfo/multiLangCd.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLangCd(@Validated @RequestBody LangCdSaveVO langCdSaveVO) throws Exception {
        langCdService.multiLangCd(langCdSaveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/sci/calendarInfo/selectWorking.do", method = RequestMethod.POST)
    @ResponseBody
    public List<WorkingVO> selectWorking(@Validated @RequestBody WorkingVO workingVO) throws Exception {
        List<WorkingVO> result =  (List<WorkingVO>)workingService.selectWorkingByCondition(workingVO);

        return result;
    }

    @RequestMapping(value = "/cmm/sci/calendarInfo/insertWorking.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertWorking(@Validated @RequestBody WorkingVO saveVO) throws Exception {
        workingService.deleteWorking(saveVO);
        workingService.insertWorking(saveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/sci/calendarInfo/selectHoliday.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectHoliday(@RequestBody HolidaySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(holidayService.selectHolidayByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(holidayService.selectHolidayByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/calendarInfo/multiHoliday.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiHoliday(@Validated @RequestBody HolidaySaveVO saveVO) throws Exception {
        holidayService.multiHoliday(saveVO);

        return true;
    }
}